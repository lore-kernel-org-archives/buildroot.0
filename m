From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Dec 2012 14:06:30 +0100
Subject: [Buildroot] [git commit] libnss: fix build failures
In-Reply-To: <20121216090250.02C379A201@busybox.osuosl.org>
References: <20121216090250.02C379A201@busybox.osuosl.org>
Message-ID: <20121216140630.3840dee5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Sun, 16 Dec 2012 10:01:19 +0100, Peter Korsgaard wrote:

>  define LIBNSS_BUILD_CMDS
> -	$(MAKE1) -C $(@D)/$(LIBNSS_SUBDIR)/nss build_coreconf
> build_dbm all \
> +	$(MAKE1) -C $(@D)/$(LIBNSS_SUBDIR)/nss build_coreconf \
>  			SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
>  			DIST=$(@D)/$(LIBNSS_DISTDIR) \
>  			CHECKLOC= \
>  			$(LIBNSS_BUILD_VARS)
> +	$(MAKE1) -C $(@D)/$(LIBNSS_SUBDIR)/nss build_dbm all \
> +			SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
> +			DIST=$(@D)/$(LIBNSS_DISTDIR) \
> +			CHECKLOC= \
> +			$(LIBNSS_BUILD_VARS)
> OPTIMIZER="$(TARGET_CFLAGS)" endef

A few comments in the source code to explain what's going on here would
have been useful.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
