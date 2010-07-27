From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 27 Jul 2010 22:45:35 +0200
Subject: [Buildroot] [PATCH 2/4] target-gcc: fix build
In-Reply-To: <f43054d841c82c121c4fd8c1e6604888233b6d10.1280254559.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280254559.git.thomas.petazzoni@free-electrons.com>
	<f43054d841c82c121c4fd8c1e6604888233b6d10.1280254559.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201007272245.35920.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 27 July 2010 20:18:59 Thomas Petazzoni wrote:
> 
> Now that $(STAGING_DIR)/usr/bin is no longer in the PATH, we need to
> pass the absolute paths to $(TARGET_CC) when building the target gcc
> compiler.
> 
> This commit fixes the target gcc build problem reported on the list. I
> have successfully been able to build a target gcc for ARM, use it to
> compile a hello world application on the target and run this
> application.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

> ---
>  toolchain/gcc/gcc-uclibc-4.x.mk |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
> index cfbe616..52b20e9 100644
> --- a/toolchain/gcc/gcc-uclibc-4.x.mk
> +++ b/toolchain/gcc/gcc-uclibc-4.x.mk
> @@ -397,6 +397,8 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_BUILD_DIR3)/.prepared
>  		CXXFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
>  		CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
>  		BOOT_CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
> +		GCC_FOR_TARGET="$(TARGET_CC)" \
> +		CC_FOR_TARGET="$(TARGET_CC)" \
>  		$(GCC_SRC_DIR)/configure $(QUIET) \
>  		--prefix=/usr \
>  		--build=$(GNU_HOST_NAME) \



-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
