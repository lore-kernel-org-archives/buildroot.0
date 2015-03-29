From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 13:41:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXpm: Add
 gettext/iconv support
In-Reply-To: <1427628199-21758-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427628199-21758-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150329134114.7d71836b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 29 Mar 2015 13:23:19 +0200, Bernd Kuhls wrote:

> diff --git a/package/x11r7/xlib_libXpm/Config.in b/package/x11r7/xlib_libXpm/Config.in
> index 528498c..73da0c2 100644
> --- a/package/x11r7/xlib_libXpm/Config.in
> +++ b/package/x11r7/xlib_libXpm/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_XLIB_LIBXPM
>  	bool "libXpm"
> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE

Maybe this also needs a:

	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

But it would be to check if gettext and libiconv support is actually
mandatory, or only optional.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
