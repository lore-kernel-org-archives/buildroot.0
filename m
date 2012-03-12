From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Mar 2012 08:02:36 +0100
Subject: [Buildroot] [PATCH v1 1/1] libgsl : new package The GNU
 Scientific Library
In-Reply-To: <1331518764-27555-2-git-send-email-sagaert.johan@skynet.be>
References: <1331518764-27555-1-git-send-email-sagaert.johan@skynet.be>
 <1331518764-27555-2-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20120312080236.730d91c5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 12 Mar 2012 03:19:24 +0100,
Sagaert Johan <sagaert.johan@skynet.be> a ?crit :

> +LIBGSL_VERSION=1.14
> +LIBGSL_SOURCE=gsl-$(LIBGSL_VERSION).tar.gz
> +LIBGSL_SITE=ftp://ftp.gnu.org/gnu/gsl/

Could you please put spaces before and after = ?

Could you use BR2_GNU_MIRROR ?

> +LIBGSL_INSTALL_STAGING = YES
> +LIBGSL_INSTALL_TARGET = YES

This last line is not needed, it's the default.

> +$(eval $(call AUTOTARGETS,package,libgsl))

This should just be:

$(eval $(call AUTOTARGETS))

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
