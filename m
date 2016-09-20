From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 21:05:35 +0200
Subject: [Buildroot] [PATCH] package/socat: fix build issue
In-Reply-To: <1472415533-19764-1-git-send-email-romain.naour@gmail.com>
References: <1472415533-19764-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160920210535.7376eef5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Aug 2016 22:18:53 +0200, Romain Naour wrote:
> Fix two build issue when socat is build with musl:
>   - Set NETDB_INTERNAL locally since it's not provided by musl
>   - remove if_tun.h kernel header
> 
> Fixes:
> http://autobuild.buildroot.net/results/029/02977d3844ef62b1e9cbfbab244593632757c5e2
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/socat/0003-compat-set-NETDB_INTERNAL.patch | 35 +++++++++
>  ...004-xio-tun-remove-if_tun.h-kernel-header.patch | 91 ++++++++++++++++++++++
>  2 files changed, 126 insertions(+)
>  create mode 100644 package/socat/0003-compat-set-NETDB_INTERNAL.patch
>  create mode 100644 package/socat/0004-xio-tun-remove-if_tun.h-kernel-header.patch

Even though I am not too happy with the solutions, it's probably the
simplest we can do, so I've applied. Could you try to submit them
upstream?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
