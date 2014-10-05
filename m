From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 23:16:30 +0200
Subject: [Buildroot] [PATCH v4] netcat-openbsd: new package
In-Reply-To: <1412538482-5116-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1412538482-5116-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141005231630.3f24195b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun,  5 Oct 2014 21:48:02 +0200, Maxime Hadjinlian wrote:
> The OpenBSD implementations of netcat.
> The main difference from netcat is the support for IPv6, proxies, and
> Unix sockets.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> v3 -> v4:
>     - Propagage libbsd dependencies
>     - Add host-pkgconf as dependencies
> v2 -> v3:
>     - Use the debian git tree
>     - Remove the patch and uses a hook to apply them
>     - Set the license_file
> v1 -> v2:
>     - Add missing license
> ---
>  package/Config.in                        |  1 +
>  package/netcat-openbsd/Config.in         | 24 ++++++++++++++++++++++++
>  package/netcat-openbsd/netcat-openbsd.mk | 29 +++++++++++++++++++++++++++++
>  3 files changed, 54 insertions(+)
>  create mode 100644 package/netcat-openbsd/Config.in
>  create mode 100644 package/netcat-openbsd/netcat-openbsd.mk

Applied, after doing two changes:

 * Use tabs in the command applying Debian patches

 * Add an optional dependency on Busybox when Busybox is enabled. This
   ensures we overwrite the Busybox nc with netcat-openbsd nc.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
