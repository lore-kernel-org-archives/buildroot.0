From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 17:25:20 +0200
Subject: [Buildroot] [PATCH] package/cegui: fix selecting the default
 OpenGL renderer
In-Reply-To: <20200623191907.385318-1-b.bilas@grinn-global.com>
References: <20200623191907.385318-1-b.bilas@grinn-global.com>
Message-ID: <20200727172520.15414fdb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Jun 2020 21:19:07 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> According to the cegui requirements select explicit the default
> OpenGL renderer based on available possibilities.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

Applied, with one change. See below.

> diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
> index 6158ef129c..505d67656a 100644
> --- a/package/cegui/cegui.mk
> +++ b/package/cegui/cegui.mk
> @@ -16,15 +16,25 @@ CEGUI_DEPENDENCIES = glm \
>  		$(if $(BR2_PACKAGE_LIBGLFW),libglfw) \

We have this here...

>  		$(if $(BR2_PACKAGE_HAS_LIBGL),libgl) \
>  		$(if $(BR2_PACKAGE_HAS_LIBGLES),libgles) \
> -		$(if $(BR2_PACKAGE_LIBGLEW),libglew) \
> +		$(if $(BR2_PACKAGE_LIBGLFW),libglfw) \

and you're adding it again here. So I dropped this new addition.

I also made a few indentation fixes.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
