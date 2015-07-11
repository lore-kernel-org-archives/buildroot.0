From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 00:55:41 +0200
Subject: [Buildroot] [PATCH 2/2] package/libinput: bump version to
 0.19.0, add locale dependency
In-Reply-To: <1436629800-15097-2-git-send-email-bernd.kuhls@t-online.de>
References: <1436629800-15097-1-git-send-email-bernd.kuhls@t-online.de>
 <1436629800-15097-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150712005541.2d99fea3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 11 Jul 2015 17:50:00 +0200, Bernd Kuhls wrote:
> Since 2015-04-22 libinput needs locale support:
> http://cgit.freedesktop.org/wayland/libinput/commit/src/libinput-util.c?id=5c671e0375cc03032fcac26efe4a7835a74c8bfc

One might wonder why they are using strtod_l() instead of just
strtod(), but anyway...

> diff --git a/package/libinput/Config.in b/package/libinput/Config.in
> index 14e4e70..f7793df 100644
> --- a/package/libinput/Config.in
> +++ b/package/libinput/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBINPUT
>  	bool "libinput"
> +	depends on BR2_ENABLE_LOCALE

You need to propagate this new dependency to all reverse dependencies
of libinput. You handled xdriver_xf86-input-libinput but I think you
missed the weston package. Can you respin?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
