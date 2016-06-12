From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 22:25:38 +0200
Subject: [Buildroot] [PATCH v2 1/2] fmc: added powerpc e6500 support
In-Reply-To: <1463578886-43470-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1463578886-43470-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160612222538.762fd49b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 May 2016 08:41:25 -0500, Matt Weber wrote:

> @@ -18,7 +19,12 @@ FMC_MAKE_OPTS = \
>  	LIBXML2_HEADER_PATH="$(STAGING_DIR)/usr/include/libxml2" \
>  	TCLAP_HEADER_PATH="$(STAGING_DIR)/usr/include"
>  
> +ifeq ($(BR2_powerpc64),y)
> +	FMC_MAKE_OPTS += M64BIT=1

We don't indent such definitions, so I've removed the tab here.

> +endif
> +
>  define FMC_BUILD_CMDS
> +	$(SED) "s:P4080:$(FMLIB_PLATFORM):g" $(@D)/source/Makefile

I don't like when accessing variables defined by other packages, so
I've instead defined FMC_PLATFORM, which re-calculates the value from
BR2_PACKAGE_FMLIB_PLATFORM.

Applied with those two minor things changed.

Don't hesitate to make a build test again to make sure everything is
still working fine.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
