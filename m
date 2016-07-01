From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 23:20:44 +0200
Subject: [Buildroot] [PATCH v2 10/15] toolchain/toolchain-external:
 enable fortran check when it is selected
In-Reply-To: <20160701162920.19632-11-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
 <20160701162920.19632-11-s.martin49@gmail.com>
Message-ID: <20160701232044.19aa733c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 18:29:15 +0200, Samuel Martin wrote:

>  ifeq ($(filter $(HOST_DIR)/%,$(TOOLCHAIN_EXTERNAL_BIN)),)
> @@ -529,6 +530,10 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
>  	if test "$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
>  		$(call check_cplusplus,$(TOOLCHAIN_EXTERNAL_CXX)) ; \
>  	fi ; \
> +	if test "$(BR2_TOOLCHAIN_HAS_FORTRAN)" = "y" ; then \
> +		$(call check_fortran,\
> +			"$(TOOLCHAIN_EXTERNAL_FC) $(TOOLCHAIN_EXTERNAL_CFLAGS)") ; \

Why are you passing TOOLCHAIN_EXTERNAL_CFLAGS for the fortran compiler
check, while we are not using them for the C++ compiler check ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
