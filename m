From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Oct 2017 22:14:34 +0200
Subject: [Buildroot] [PATCH] extern-toolchain: Bump ARC tools to
 arc-2017.09-rc1
In-Reply-To: <20171011091703.32495-1-didin@synopsys.com>
References: <20171011091703.32495-1-didin@synopsys.com>
Message-ID: <275d998b-73cf-ebd0-2047-a48704eeda36@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-10-17 11:17, Evgeniy Didin wrote:
> This commit bumps ARC prebuild toolchain to arc-2017.09-rc1
> 
> There might be subtle differences between uClibc configuration
> compared to Buildroot's one. Native RPC now is disabled 
> because uClinc-ng has removed it.

 These two sentences are unrelated, right? I mean, Buildroot's uClibc hasn't had
RPC since April... So better make that two paragraphs.

 Could you describe the subtle differences?

> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: arc-buildroot at synopsys.com
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
>  .../toolchain-external/toolchain-external-synopsys-arc/Config.in  | 8 ++++----
>  .../toolchain-external-synopsys-arc.hash                          | 8 ++++----
>  .../toolchain-external-synopsys-arc.mk                            | 4 ++--
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> index f438ea765d..cdf36d08e6 100644
> --- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> @@ -1,18 +1,18 @@
>  config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
> -	bool "Synopsys ARC 2016.09 toolchain"
> +	bool "Synopsys ARC 2017.09-rc1 toolchain"

 Do we really want the -rc1 toolchain? Shouldn't we wait for the release? It
can't be because you want additional testing in the autobuilders, since this
toolchain doesn't appear in support/config-fragments/autobuild.

>  	depends on BR2_arc
>  	depends on BR2_HOSTARCH = "x86_64"
>  	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
>  	select BR2_INSTALL_LIBSTDCPP
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	#select BR2_TOOLCHAIN_HAS_NATIVE_RPC

 You shouldn't comment this line, just remove it.

 Regards,
 Arnout

>  	select BR2_ENABLE_LOCALE
>  	select BR2_USE_WCHAR
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>  	select BR2_TOOLCHAIN_HAS_SSP
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
>  	help
>  	  Toolchain for the ARC cores, from
>  	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
> diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
> index c96f53b1f6..4e6d71205a 100644
> --- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
> +++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256 9123e35510cc9105e5f9468d5154e0093770d7c11ed771c1a595ecf813692baf  arc_gnu_2016.09_prebuilt_uclibc_le_arc700_linux_install.tar.gz
> -sha256 3140066cdbda2df7ed0fb60424bbd9db740fb25393928e733234b0bf65508df2  arc_gnu_2016.09_prebuilt_uclibc_be_arc700_linux_install.tar.gz
> -sha256 aa6edb2101b13df3ac59f8d8ccbcfba37a6f7882f0e03baa9d9883480dbed4e7  arc_gnu_2016.09_prebuilt_uclibc_le_archs_linux_install.tar.gz
> -sha256 4de227bf73536a87784d88e5f10085b91ede62c76ef8fedf53b4bf2e215054cf  arc_gnu_2016.09_prebuilt_uclibc_be_archs_linux_install.tar.gz
> +sha256 db48969f433a69c1598208bbd4263341ccc75fb54004776e7030c29a12ab26c6  arc_gnu_2017.09-rc1_prebuilt_uclibc_le_arc700_linux_install.tar.gz
> +sha256 cc1d0e2391d6a3856610aa4ca56fc4c1bc8a43252a28a924385ba2bdbe3025da  arc_gnu_2017.09-rc1_prebuilt_uclibc_be_arc700_linux_install.tar.gz
> +sha256 86f1b736e8ead5fba31fed74b620c5f951d30a1903ca95dccd80889612d324bd  arc_gnu_2017.09-rc1_prebuilt_uclibc_le_archs_linux_install.tar.gz
> +sha256 e655beef55bd3d1ced5326ceab499b6b694d71a4d3f9c6e5a48364eb486d52f3  arc_gnu_2017.09-rc1_prebuilt_uclibc_be_archs_linux_install.tar.gz
> diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
> index f4cb7b73a1..cb19f9bd14 100644
> --- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
> +++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2016.09
> -TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)-release
> +TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2017.09-rc1
> +TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)
>  
>  ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
>  TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE = arc700
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
