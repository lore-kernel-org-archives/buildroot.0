From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Sep 2013 23:32:10 +0200
Subject: [Buildroot] [PATCHv2 13/14] toolchain: update Linaro ARM
	external toolchains
In-Reply-To: <1378138000-12739-14-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 2 Sep 2013 18:06:39 +0200")
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378138000-12739-14-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bo3tixet.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  toolchain/toolchain-external/Config.in   | 49 +++++++++++++++++---------------
 Thomas>  toolchain/toolchain-external/ext-tool.mk | 12 ++++----
 Thomas>  2 files changed, 32 insertions(+), 29 deletions(-)

 Thomas> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
 Thomas> index 11edc98..9c5d93c 100644
 Thomas> --- a/toolchain/toolchain-external/Config.in
 Thomas> +++ b/toolchain/toolchain-external/Config.in
 Thomas> @@ -3,8 +3,8 @@ if BR2_TOOLCHAIN_EXTERNAL
 Thomas>  choice
 Thomas>  	prompt "Toolchain"
 
 Thomas> -config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06
 Thomas> -	bool "Linaro 2013.06"
 Thomas> +config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08
 Thomas> +	bool "Linaro 2013.08"
 Thomas>  	depends on BR2_arm
 Thomas>  	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 Thomas>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 Thomas> @@ -15,16 +15,17 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06
 Thomas>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 Thomas>  	help
 Thomas>  	  Linaro toolchain for the ARM architecture. It uses Linaro
 Thomas> -	  GCC 2013.06 (based on gcc 4.8), Linaro GDB 2013.06 (based on
 Thomas> -	  GDB 7.6), eglibc 2.15. It generates code that runs on all
 Thomas> -	  Cortex-A profile devices, but tuned for the Cortex-A9. The
 Thomas> -	  code generated is Thumb 2, with the hard floating point
 Thomas> -	  calling convention, and uses the VFPv3-D16 FPU instructions.
 Thomas> +	  GCC 2013.08 (based on gcc 4.8), Linaro GDB 2013.05 (based on
 Thomas> +	  GDB 7.6), eglibc 2.17, Binutils 2013.06 (based on 2.23). It
 Thomas> +	  generates code that runs on all Cortex-A profile devices,
 Thomas> +	  but tuned for the Cortex-A9. The code generated is Thumb 2,
 Thomas> +	  with the hard floating point calling convention, and uses
 Thomas> +	  the VFPv3-D16 FPU instructions.

Not a problem with this change - But hmm, did 2013.06 reall use a newer
gdb version than 2013.08? Not as far as I can see on:

http://www.linaro.org/downloads/1306

Committed, thanks.

-- 
Bye, Peter Korsgaard
