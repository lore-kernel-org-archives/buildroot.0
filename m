From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Dec 2012 13:32:55 +0100
Subject: [Buildroot] [PATCH 5/9] toolchain-external: simplify many
 Sourcery CodeBench download URLs
In-Reply-To: <52c867bd188adb54eee07275a4c36809a4bc8c93.1356045729.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356045729.git.thomas.petazzoni@free-electrons.com>
 <52c867bd188adb54eee07275a4c36809a4bc8c93.1356045729.git.thomas.petazzoni@free-electrons.com>
Message-ID: <50D456F7.20806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/12/12 00:23, Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> ---
>   toolchain/toolchain-external/ext-tool.mk |   16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
> index 0724cb6..d4278a4 100644
> --- a/toolchain/toolchain-external/ext-tool.mk
> +++ b/toolchain/toolchain-external/ext-tool.mk
> @@ -176,7 +176,7 @@ TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(TOOLCHAIN_EXTERNAL_DIR)/.extracted
>   endif
> 
>   ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103),y)
> -TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/arm/portal/package8739/public/arm-none-linux-gnueabi/
> +TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
>   TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.03-41-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
>   else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109),y)
>   TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
> @@ -194,7 +194,7 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_11),y)
>   TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.11/+download/
>   TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2012.11-20121123_linux.tar.bz2
>   else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109),y)
> -TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/GNUToolchain/package9761/public/mips-linux-gnu/
> +TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/

 It looks like for sourcery toolchains, the SITE is always

http://sourcery.mentor.com/public/gnu_toolchain/$(BR2_TOOLCHAIN_EXTERNAL_PREFIX)

and I guess a similar refactoring would be possible for the SOURCE...

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
