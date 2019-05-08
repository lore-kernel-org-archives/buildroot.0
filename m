From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 8 May 2019 19:03:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/bullet: extras needs NPTL
In-Reply-To: <20190429164844.21247-1-fontaine.fabrice@gmail.com>
References: <20190429164844.21247-1-fontaine.fabrice@gmail.com>
Message-ID: <47845397-197b-72d6-aacf-3ab090b5eb21@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 29/04/2019 18:48, Fabrice Fontaine ha scritto:
> Fixes:
>   - http://autobuild.buildroot.org/results/9c6325e6cc86116d1e8c940e0fcfe94243faa6de
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Tested-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

> ---
>   package/bullet/bullet.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
> index 7ff8195c85..36aaa157e1 100644
> --- a/package/bullet/bullet.mk
> +++ b/package/bullet/bullet.mk
> @@ -16,8 +16,8 @@ BULLET_CONF_OPTS = -DBUILD_UNIT_TESTS=OFF \
>   	-DBUILD_BULLET2_DEMOS=OFF \
>   	-DBUILD_BULLET3=OFF
>   
> -# extras needs dlfcn.h and threads
> -ifeq ($(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_HAS_THREADS),:y)
> +# extras needs dlfcn.h and NPTL (pthread_barrier_init)
> +ifeq ($(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_HAS_THREADS_NPTL),:y)
>   BULLET_CONF_OPTS += -DBUILD_EXTRAS=ON
>   else
>   BULLET_CONF_OPTS += -DBUILD_EXTRAS=OFF
> 

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
