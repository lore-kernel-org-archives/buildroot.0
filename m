From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 5 Jun 2012 21:44:32 +0200
Subject: [Buildroot] [PATCH 07/10] toolchain-external: remove Sourcery
 CodeBench ARM 2009q3
In-Reply-To: <9581e65d32e1d11ae26b44db2f7e748341f9b904.1338732273.git.thomas.petazzoni@free-electrons.com>
References: <cover.1338732273.git.thomas.petazzoni@free-electrons.com>
 <9581e65d32e1d11ae26b44db2f7e748341f9b904.1338732273.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LU-uVW=s9rV=8z589jut1Fas9J5JkAk2cZ_g2AZfSjrug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 3, 2012 at 4:04 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> ?toolchain/toolchain-external/Config.in ? | ? 22 ----------------------
> ?toolchain/toolchain-external/ext-tool.mk | ? ?5 +----
> ?2 files changed, 1 insertion(+), 26 deletions(-)
>
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 1452cad..d17fc9b 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -159,27 +159,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
> ? ? ? ? ? ? ? ?Select BR2_SOFT_FLOAT
> ? ? ? ? ? ? ? ?Set BR2_TARGET_OPTIMIZATION to -mthumb
>
> -config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3
> - ? ? ? bool "Sourcery CodeBench ARM 2009q3"
> - ? ? ? depends on BR2_arm
> - ? ? ? select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> - ? ? ? select BR2_INSTALL_LIBSTDCPP
> - ? ? ? help
> - ? ? ? ? Sourcery CodeBench toolchain for the ARM architecture, from
> - ? ? ? ? Mentor Graphics. It uses gcc 4.4.1, binutils 2.19, glibc
> - ? ? ? ? 2.10 and gdb 6.8 and kernel headers 2.6.30. It has support
> - ? ? ? ? for the following variants:
> - ? ? ? ? ? ?- ARMv5T, little endian, soft-float, glibc
> - ? ? ? ? ? ? ?Select ARM926T, ARM10T, XScale or another ARMv5 core
> - ? ? ? ? ? ? ?Select BR2_SOFT_FLOAT
> - ? ? ? ? ? ?- ARMv4T, little endian, soft-float, glibc
> - ? ? ? ? ? ? ?Select ARM720T, ARM920T, ARM922T or another ARMv4 core
> - ? ? ? ? ? ? ?Select BR2_SOFT_FLOAT
> - ? ? ? ? ? ?- ARMv7-A, Thumb 2, little endian, soft-float, glibc
> - ? ? ? ? ? ? ?Select Cortex-A8, Cortex-A9 or another ARMv7-A core
> - ? ? ? ? ? ? ?Select BR2_SOFT_FLOAT
> - ? ? ? ? ? ? ?Set BR2_TARGET_OPTIMIZATION to -mthumb
> -

Same indentation remark as for mips.

> ?config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
> ? ? ? ?bool "Sourcery CodeBench MIPS 2011.09"
> ? ? ? ?depends on BR2_mips || BR2_mipsel
> @@ -662,7 +641,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
> ? ? ? ?default "arm-linux-gnueabi" ? ? ?if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_03
> ? ? ? ?default "arm-linux-gnueabi" ? ? ?if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_04
> ? ? ? ?default "arm-linux-gnueabihf" ? ?if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_05
> - ? ? ? default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3
> ? ? ? ?default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
> ? ? ? ?default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
> ? ? ? ?default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
> diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
> index 867480a..fce7412 100644
> --- a/toolchain/toolchain-external/ext-tool.mk
> +++ b/toolchain/toolchain-external/ext-tool.mk
> @@ -176,10 +176,7 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
> ?TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(TOOLCHAIN_EXTERNAL_DIR)/.extracted
> ?endif
>
> -ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3),y)
> -TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/arm/portal/package5383/public/arm-none-linux-gnueabi/
> -TOOLCHAIN_EXTERNAL_SOURCE=arm-2009q3-67-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
> -else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1),y)
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1),y)
> ?TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/arm/portal/package6488/public/arm-none-linux-gnueabi/
> ?TOOLCHAIN_EXTERNAL_SOURCE=arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
> ?else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009),y)
> --
> 1.7.9.5
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
