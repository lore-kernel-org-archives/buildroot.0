From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 3 Jan 2018 11:03:57 +0200
Subject: [Buildroot] [PATCH v3 1/1] opentracing-cpp: new package
In-Reply-To: <1514969543-20452-2-git-send-email-heyleke@gmail.com>
References: <1514014802-23736-2-git-send-email-heyleke@gmail.com>
 <1514969543-20452-1-git-send-email-heyleke@gmail.com>
 <1514969543-20452-2-git-send-email-heyleke@gmail.com>
Message-ID: <20180103090357.4mgwa6xeo2iw25hi@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

On Wed, Jan 03, 2018 at 09:52:23AM +0100, Jan Heylen wrote:
> From: Jan Heylen <jan.heylen@nokia.com>
> 
> Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
> ---

[...]

> diff --git a/package/opentracing-cpp/opentracing-cpp.mk b/package/opentracing-cpp/opentracing-cpp.mk
> new file mode 100644
> index 0000000..9b2d473
> --- /dev/null
> +++ b/package/opentracing-cpp/opentracing-cpp.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# opentracing-cpp
> +#
> +################################################################################
> +
> +OPENTRACING_CPP_VERSION = v1.2.0
> +OPENTRACING_CPP_SITE = $(call github,opentracing,opentracing-cpp,$(OPENTRACING_CPP_VERSION))
> +OPENTRACING_CPP_LICENSE = MIT
> +OPENTRACING_CPP_LICENSE_FILES = COPYING
> +
> +OPENTRACING_CPP_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +OPENTRACING_CPP_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +OPENTRACING_CPP_CONF_OPTS += -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=ON
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +OPENTRACING_CPP_CONF_OPTS += -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=OFF
> +endif

The -DBUILD_SHARED_LIBS setting should be handled correctly by the Buildroot 
cmake infrastructure at package/pkg-cmake.mk. Doesn't that work for you?

baruch

> +
> +$(eval $(cmake-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
