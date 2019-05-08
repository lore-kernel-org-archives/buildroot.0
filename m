From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 8 May 2019 19:01:45 +0200
Subject: [Buildroot] [PATCH] package/bullet: needs NPTL to build extras
In-Reply-To: <20190508165945.22057-1-giulio.benetti@micronovasrl.com>
References: <20190508165945.22057-1-giulio.benetti@micronovasrl.com>
Message-ID: <b0238f95-292f-2916-e6aa-a38fdbd42d51@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oops, Fabrice already provided a patch for this:
https://patchwork.ozlabs.org/patch/1092686/

Sorry for the noise

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

Il 08/05/2019 18:59, Giulio Benetti ha scritto:
> At the moment HAS_THREADS=y only is needed to build extras but this
> results in build failure due to function calls to pthread_barrier_*.
> 
> Modify BR2_TOOLCHAIN_HAS_THREADS=y check to
> BR2_TOOLCHAIN_HAS_THREADS_NPTL=y.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e96/e96cacd185f14479433f91ccd47d76058cf5b345/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>   package/bullet/bullet.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
> index 7ff8195c85..f234335890 100644
> --- a/package/bullet/bullet.mk
> +++ b/package/bullet/bullet.mk
> @@ -17,7 +17,7 @@ BULLET_CONF_OPTS = -DBUILD_UNIT_TESTS=OFF \
>   	-DBUILD_BULLET3=OFF
>   
>   # extras needs dlfcn.h and threads
> -ifeq ($(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_HAS_THREADS),:y)
> +ifeq ($(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_HAS_THREADS_NPTL),:y)
>   BULLET_CONF_OPTS += -DBUILD_EXTRAS=ON
>   else
>   BULLET_CONF_OPTS += -DBUILD_EXTRAS=OFF
> 
