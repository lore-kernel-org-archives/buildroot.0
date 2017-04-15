From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 12:01:29 +0200
Subject: [Buildroot] [PATCH 2/2] package/xenomai: disable obstack support
In-Reply-To: <20170331202604.18153-2-romain.naour@gmail.com>
References: <20170331202604.18153-1-romain.naour@gmail.com>
 <20170331202604.18153-2-romain.naour@gmail.com>
Message-ID: <20170415120129.5f0cb6c4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Mar 2017 22:26:04 +0200, Romain Naour wrote:
> Obstack support in Xenomai is broken when the libc doesn't support
> obstack support itself. Make sure we disable obstack support for all
> libc since it was removed in uClibc-ng since 1.0.21 release and it's
> always disabled with Glibc.
> 
> Fixes:
> http://autobuild.buildroot.net/results/555/555d9cb9cb59fad6353516bed206e1117974e8cd/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Pawel Sikora <sikor6@gmail.com>
> ---
>  package/xenomai/xenomai.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Since nobody proposed a better solution, I applied your patch. However,
could you report the issue upstream? Hopefully they will have a look
and propose a better solution.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
