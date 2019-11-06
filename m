From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Nov 2019 23:18:36 +0100
Subject: [Buildroot] [PATCH 2/2] package/qt5/qt5base: add support for
 gcnano-binaries
In-Reply-To: <20191106155611.31575-3-scooby22@web.de>
References: <20191106155611.31575-1-scooby22@web.de>
 <20191106155611.31575-3-scooby22@web.de>
Message-ID: <20191106231836.404b2cf5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jens,

On Wed,  6 Nov 2019 16:56:11 +0100
Jens Kleintje <scooby22@web.de> wrote:

We need your Signed-off-by line in the commit log.

> ---
>  package/qt5/qt5base/qt5base.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 15c9650391..1a152be94b 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -78,6 +78,9 @@ endif
>  ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
>  QT5BASE_CONFIGURE_OPTS += -gbm
>  QT5BASE_DEPENDENCIES += mesa3d
> +else ifeq ($(BR2_PACKAGE_GCNANO_BINARIES),y)
> +QT5BASE_CONFIGURE_OPTS += -gbm
> +QT5BASE_DEPENDENCIES += gcnano-binaries

I think at some point, we will have to get rid of this, using a libgbm
virtual package. I tried at
https://github.com/tpetazzoni/buildroot/commits/gbm, but it was not
very convincing as the existing gbm implementation we have were not
really compatible with each other. But perhaps this will make more
sense now.

Anyway, don't worry about this: we won't make this a requirement to
merge the gcnano-binaries support. We can for now do it like you're
proposing.

But we do need your Signed-off-by line in the commit log.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
