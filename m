From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 11:57:10 +0200
Subject: [Buildroot] [PATCH v6 2/3] cloog: new package
In-Reply-To: <BLU436-SMTP138DD11D602CDEACC161440A8320@phx.gbl>
References: <1400528893-4483-1-git-send-email-scjthm@live.com>
 <BLU436-SMTP138DD11D602CDEACC161440A8320@phx.gbl>
Message-ID: <20140609115710.3799c3c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Thomas,

On Mon, 19 May 2014 19:48:12 +0000, Steve Thomas wrote:
> CLooG is a free software and library to generate code for scanning
> Z-polyhedra.
> 
> cloog is needed for the optional graphite optimisations that are
> supported by gcc since version 4.5. Therefore this package is required
> for the toolchain to support graphite.
> 
> Graphite optimisations primarily involve loop blocking flattening and
> interchage so are probably of mimimal use in an embedded system where
> small sizes are favoured.
> 
> cloog depends on isl.
> 
> Signed-off-by: Steve Thomas <scjthm@live.com>

Patch applied, with a few changes, see below.

> +CLOOG_VERSION = 0.18.1

Bumped to 0.18.2. I had to add a patch adding missing CMake-related
files.

> +CLOOG_SITE = http://www.bastoul.net/cloog/pages/download/
> +CLOOG_INSTALL_STAGING = YES

Dropped, it's a host-only package.

> +CLOOG_LICENSE = LGPLv2.1

License is LGPLv2.1+

> +CLOOG_LICENSE_FILES = LICENSE

This file did not exist in 0.18.2.

> +CLOOG_DEPENDENCIES = gmp isl
> +
> +HOST_CLOOG_CONF_OPT = --with-isl=system --with-polylib=no
> +
> +$(eval $(host-autotools-package))

Like for isl, I also had to disable the libtool patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
