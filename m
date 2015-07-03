From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jul 2015 09:43:04 +0200
Subject: [Buildroot] [PATCH 3/3] qt5quick1, qt5script,
 qt5webkit: tag as deprecated
In-Reply-To: <4fef60e5-fbfb-4595-8c48-646c3d00a3d0@MAIL-SINTERS-01.sinters-int.fr>
References: <1435908049-11930-1-git-send-email-corjon.j@ecagroup.com>
 <4fef60e5-fbfb-4595-8c48-646c3d00a3d0@MAIL-SINTERS-01.sinters-int.fr>
Message-ID: <20150703094304.663cee42@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien,

On Fri, 3 Jul 2015 07:20:54 +0000, Julien CORJON wrote:

> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index e8ec7d9..49e3450 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -36,15 +36,16 @@ source "package/qt5/qt5enginio/Config.in"
>  source "package/qt5/qt5graphicaleffects/Config.in"
>  source "package/qt5/qt5imageformats/Config.in"
>  source "package/qt5/qt5multimedia/Config.in"
> -source "package/qt5/qt5quick1/Config.in"
>  source "package/qt5/qt5quickcontrols/Config.in"
> -source "package/qt5/qt5script/Config.in"
>  source "package/qt5/qt5sensors/Config.in"
>  source "package/qt5/qt5serialport/Config.in"
>  source "package/qt5/qt5svg/Config.in"
> -source "package/qt5/qt5webkit/Config.in"
> -source "package/qt5/qt5webkit-examples/Config.in"
>  source "package/qt5/qt5websockets/Config.in"
>  source "package/qt5/qt5x11extras/Config.in"
>  source "package/qt5/qt5xmlpatterns/Config.in"
> +comment "Depracated Qt modules"

Deprecated

but I don't think it's really worth to have them in a separate part of
the menu, since all of them already have a "(deprecated)" indication in
their prompt.

However, I'm wondering if we should not simply make them depend on
BR2_DEPRECATED_SINCE_2015_08. But that will make them disappear
completely by default, unless the user enables BR2_DEPRECATED.

Actually, our deprecation/removal process is a bit weird: deprecated
should be a smoother thing than removal. But in practice, when we
deprecate something by making it 'depends on
BR2_DEPRECATED_SINCE_YYYY_MM', it gets automatically removed from your
configuration without any notification (unless you enable manually
BR2_DEPRECATED, of course). While if we remove it entirely, we add it
to Config.in.legacy, and the users upgrading get a clear notification.

So users are better notified of removals than deprecations.

Arnout, what do you think about this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
