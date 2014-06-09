From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 11:53:49 +0200
Subject: [Buildroot] [PATCH v6 1/3] isl: new package
In-Reply-To: <BLU436-SMTP138C9EAD057B0769B85E111A8320@phx.gbl>
References: <1400528893-4483-1-git-send-email-scjthm@live.com>
 <BLU436-SMTP138C9EAD057B0769B85E111A8320@phx.gbl>
Message-ID: <20140609115349.0eb9ca73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Thomas,

On Mon, 19 May 2014 19:48:11 +0000, Steve Thomas wrote:
> isl is a library for manipulating sets and relations of integer points
> bounded by linear constraints.
> 
> isl is needed for the optional graphite optimisations that are supported
> by gcc since version 4.5. Therefore this package is required for the
> toolchain to support graphite.
> 
> Graphite optimisations primarily involve loop blocking flattening and
> interchage so are probably of mimimal use in an embedded system where
> small sizes are favoured.
> 
> Signed-off-by: Steve Thomas <scjthm@live.com>

I've committed your patch, after making a few changes (see below).

> +ISL_VERSION = 0.11.1

I've updated to 0.12.2 and used the .bz2 tarball. Updating to 0.13 was
not possible due to incompatibility with cloog.

> +ISL_SITE = http://isl.gforge.inria.fr/
> +ISL_LICENSE = MIT
> +ISL_LICENSE_FILES = LICENSE
> +ISL_INSTALL_STAGING = YES
> +ISL_DEPENDENCIES = gmp

I had to use ISL_LIBTOOL_PATCH = NO to disable applying our Buildroot
libtool patch, which wasn't applying properly. It was anyway
unnecessary since it's a host only package.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
