From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 09:49:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_oclock: bump version
 to 1.0.3, add hash
In-Reply-To: <1429380501-14759-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429380501-14759-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150419094940.6c9523b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 18 Apr 2015 20:08:21 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xapp_oclock/Config.in        |    2 ++
>  package/x11r7/xapp_oclock/xapp_oclock.hash |    2 ++
>  package/x11r7/xapp_oclock/xapp_oclock.mk   |    4 ++--
>  3 files changed, 6 insertions(+), 2 deletions(-)
>  create mode 100644 package/x11r7/xapp_oclock/xapp_oclock.hash
> 
> diff --git a/package/x11r7/xapp_oclock/Config.in b/package/x11r7/xapp_oclock/Config.in
> index 00cd413..d461910 100644
> --- a/package/x11r7/xapp_oclock/Config.in
> +++ b/package/x11r7/xapp_oclock/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_XAPP_OCLOCK
>  	bool "oclock"
>  	select BR2_PACKAGE_XLIB_LIBX11
>  	select BR2_PACKAGE_XLIB_LIBXEXT
> +	select BR2_PACKAGE_XLIB_LIBXKBFILE

This dependency is actually optional apparently, there is a
--without-xkb.

>  	select BR2_PACKAGE_XLIB_LIBXMU
> +	select BR2_PACKAGE_XPROTO_KBPROTO

Why? It doesn't seem like the package is checking for xproto-kbproto,
and you're not adding it to XAPP_OCLOCK_DEPENDENCIES.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
