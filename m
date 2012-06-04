From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Jun 2012 09:44:25 +0200
Subject: [Buildroot] [PATCH 03/10] toolchain-external: add Sourcery
	CodeBench SuperH 2012.03
In-Reply-To: <b7c10a694ccefce0047adc8e5e6d7ca2954663e3.1338732273.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 Jun 2012 16:04:37 +0200")
References: <cover.1338732273.git.thomas.petazzoni@free-electrons.com>
 <cover.1338732273.git.thomas.petazzoni@free-electrons.com>
 <b7c10a694ccefce0047adc8e5e6d7ca2954663e3.1338732273.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87obozsequ.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  toolchain/toolchain-external/Config.in   |   20 ++++++++++++++++++++
 Thomas>  toolchain/toolchain-external/ext-tool.mk |    3 +++
 Thomas>  2 files changed, 23 insertions(+)

 Thomas> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
 Thomas> index 2bf9c3e..be24659 100644
 Thomas> --- a/toolchain/toolchain-external/Config.in
 Thomas> +++ b/toolchain/toolchain-external/Config.in
 Thomas> @@ -332,6 +332,25 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 Thomas>              - 970 glibc hard-float, 64 bits
 Thomas>                Set BR2_TARGET_OPTIMIZATION to -m64
 
 Thomas> +config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
 Thomas> +	bool "Sourcery CodeBench SH 2012.03"
 Thomas> +	depends on BR2_sh4a || BR2_sh4aeb
 Thomas> +	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 Thomas> +	select BR2_INSTALL_LIBSTDCPP
 Thomas> +	help
 Thomas> +	  Sourcery CodeBench toolchain for the SuperH architecture,
 Thomas> +	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20,
 Thomas> +	  glibc 2.13, uClibc 0.9.30, gdb 7.2.50 and kernel headers

How does this fit with patch 10/10 where you state it uses glibc 2.15?

-- 
Bye, Peter Korsgaard
