From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Oct 2014 16:21:50 +0200
Subject: [Buildroot] [PATCH v2 1/2] xlib_libpciaccess: Rename package to
 libpciaccess
In-Reply-To: <1413557257-25254-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413557257-25254-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <5442777E.9060606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/10/14 16:47, Bernd Kuhls wrote:
> While libpciaccess is part of the X libraries, it does not
> depend upon X11 or any other X library.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: fixed stupid typo in package/Config.in

 One more stupid mistake...

[snip]
> diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
> index e191dce..4b90f3c 100644
> --- a/package/x11r7/xserver_xorg-server/Config.in
> +++ b/package/x11r7/xserver_xorg-server/Config.in
> @@ -4,12 +4,12 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
>  	# We need a SHA1 implementation. If either openssl or
>  	# libgcrypt are already part of the build, we'll use one of
>  	# them, otherwise, use the small libsha1 library.
> +	select BR2_PACKAGE_LIBPCIACCESS if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
>  	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)

 You put the libpciaccess between the comment about libsha1 and its select
line... Probably better to put it above the comment.

 With that, it gets my

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

>  	select BR2_PACKAGE_PIXMAN
>  	select BR2_PACKAGE_XFONT_FONT_ALIAS if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
>  	select BR2_PACKAGE_XFONT_FONT_MISC_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
>  	select BR2_PACKAGE_XFONT_FONT_CURSOR_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
> -	select BR2_PACKAGE_XLIB_LIBPCIACCESS if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
>  	select BR2_PACKAGE_XLIB_LIBX11
>  	select BR2_PACKAGE_XLIB_LIBXAU
>  	select BR2_PACKAGE_XLIB_LIBXCURSOR
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
