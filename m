From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 23:47:36 +0200
Subject: [Buildroot] [PATCH v2 1/1] qt5wayland: add fix from upstream to
 compile without QtQuick
In-Reply-To: <1533515813-11533-1-git-send-email-bos@je-eigen-domein.nl>
References: <1533515813-11533-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20180809234736.010b22fc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Floris,

On Mon,  6 Aug 2018 02:36:53 +0200, Floris Bos wrote:

> diff --git a/package/qt5/qt5wayland/Config.in b/package/qt5/qt5wayland/Config.in
> index 0182d3c..9f144ac 100644
> --- a/package/qt5/qt5wayland/Config.in
> +++ b/package/qt5/qt5wayland/Config.in
> @@ -5,8 +5,6 @@ comment "qt5wayland needs an OpenGL-capable backend"

You forgot to drop the "depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE"
dependency from this comment, which only existed because of the
qt5declarative dependency. I've fixed that before applying.

>  config BR2_PACKAGE_QT5WAYLAND
>  	bool "qt5wayland"
>  	depends on BR2_PACKAGE_QT5_GL_AVAILABLE

Is this OpenGL support dependency needed because of qt5wayland itself,
or was it needed only because of the qt5declarative dependency ?

BR2_PACKAGE_WAYLAND doesn't require OpenGL support, so I'm wondering if
qt5wayland needs it or not. If it doesn't, could you send a follow-up
patch fixing this ?

In the mean time, I've applied your patch to next, after fixing the
issue mentioned above regarding the removal of the
BR2_PACKAGE_QT5_JSCORE_AVAILABLE dependency.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
