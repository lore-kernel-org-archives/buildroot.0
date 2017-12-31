From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 17:56:21 +0100
Subject: [Buildroot] [PATCH 1/1] cjson: build shared and static library
In-Reply-To: <20171231162933.19446-1-fontaine.fabrice@gmail.com>
References: <20171231162933.19446-1-fontaine.fabrice@gmail.com>
Message-ID: <20171231175621.44c67b85@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Dec 2017 17:29:33 +0100, Fabrice Fontaine wrote:
> cjson 1.6.0 added the BUILD_SHARED_AND_STATIC_LIBS option which is OFF
> by default so set it depending on BR2_SHARED_STATIC_LIBS value
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cjson/cjson.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
> index f3ef7fd2ac..aabf3677ea 100644
> --- a/package/cjson/cjson.mk
> +++ b/package/cjson/cjson.mk
> @@ -15,4 +15,10 @@ CJSON_CONF_OPTS += \
>  	-DENABLE_CJSON_TEST=OFF \
>  	-DENABLE_CUSTOM_COMPILER_FLAGS=OFF
>  
> +ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +CJSON_CONF_OPTS += -DBUILD_SHARED_AND_STATIC_LIBS=ON
> +else
> +CJSON_CONF_OPTS += -DBUILD_SHARED_AND_STATIC_LIBS=OFF
> +endif
> +
>  $(eval $(cmake-package))

How is BR2_STATIC_LIBS=y handled ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
