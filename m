From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Wed, 8 Jan 2020 20:59:19 +0100
Subject: [Buildroot] [PATCH] package/c-periphery: Bump version to 2.1.0
In-Reply-To: <20200108192721.19685-1-offougajoris@gmail.com>
References: <20200108192721.19685-1-offougajoris@gmail.com>
Message-ID: <1aa46d96-7b36-8d82-dce8-65f3b24f7939@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joris,

Le 08/01/2020 ? 20:27, Joris Offouga a ?crit?:
> Signed-off-by: Joris Offouga <offougajoris@gmail.com>
> ---
>   package/c-periphery/c-periphery.hash | 4 ++--
>   package/c-periphery/c-periphery.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/c-periphery/c-periphery.hash b/package/c-periphery/c-periphery.hash
> index 8f3bd8a3da..244f8f60f1 100644
> --- a/package/c-periphery/c-periphery.hash
> +++ b/package/c-periphery/c-periphery.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256 50665a4f298b30e4cc8f7dbd38362fd860cc3746803d00325cb04806674e3166  c-periphery-1.1.3.tar.gz
> -sha256 6b5669a90260126f0600aae98cb10fb5e219269dc9cbd0137f63927b96d5c31d  LICENSE
> +sha256 1c455c42b26818d199ac227cd19714f265623e15d363fdfdf47a2416a4165654  c-periphery-2.1.0.tar.gz
> +sha256 e7b9464cb8511f19ddb40f9cf52fe86b3dfe38b2faed9d7bbc3d5707677ffbe3  LICENSE
> diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
> index e62d3e05ca..bb50434efa 100644
> --- a/package/c-periphery/c-periphery.mk
> +++ b/package/c-periphery/c-periphery.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -C_PERIPHERY_VERSION = 1.1.3
> +C_PERIPHERY_VERSION = 2.1.0
>   C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,v$(C_PERIPHERY_VERSION))
>   C_PERIPHERY_INSTALL_STAGING = YES
>   # only a static library
> 

I just tested your patch and I have the following
issues:

                              br-arm-full [1/6]: OK
                   br-arm-cortex-a9-glibc [2/6]: OK
                    br-arm-cortex-m4-full [3/6]: OK
                           br-x86-64-musl [4/6]: OK
                       br-arm-full-static [5/6]: FAILED
                             sourcery-arm [6/6]: FAILED
6 builds, 0 skipped, 2 build failed, 0 legal-info failed

The output log is:

src/gpio.c:21:24: fatal error: linux/gpio.h: No such file or directory
  #include <linux/gpio.h>

Thanks!
-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io
