From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jul 2016 22:17:14 +0200
Subject: [Buildroot] [PATCH v3] kmsxx: new package
In-Reply-To: <20160728194927.GD5862@free.fr>
References: <20160728193825.9199-1-maxime.ripard@free-electrons.com>
 <20160728194927.GD5862@free.fr>
Message-ID: <20160728221714.79a45576@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jul 2016 21:49:27 +0200, Yann E. MORIN wrote:

> > +	depends on BR2_INSTALL_LIBSTDCPP
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS # libpthread-stubs  
> 
> The comment "# libpthread-stubs" seems to imply that the dependency on
> C++ is ihnerited from libpthread-stubs, but it is neither selected not
> depended on; it is also not in the build dependency. Is it an oversight?
> 
> However, given the name of the package, I guess it needs C++ for itself.
> So, whether libpthread-stubs is needed or not, you should drop the
> comment altogether: C++ *is* needed by kms++.

There is no comment on the C++ dependency, so I'm not sure what you
mean here.

The BR2_TOOLCHAIN_HAS_THREADS dependency is inherited from libdrm,
which itself inherits it from libpthread-stubs. So the way we typically
do it is:

	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm -> libpthread-stubs

Or just:

	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
