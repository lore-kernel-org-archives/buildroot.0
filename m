From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 08:59:00 +0100
Subject: [Buildroot] [PATCH] package/pkg-meson: ensure the global
 cross-compilation.conf file is correct
In-Reply-To: <3e183413-d866-dc02-c846-3948dc5cb34c@mind.be>
References: <20191204150225.33749-1-thomas.petazzoni@bootlin.com>
 <3e183413-d866-dc02-c846-3948dc5cb34c@mind.be>
Message-ID: <20191206085900.6df9f25a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 5 Dec 2019 23:13:42 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> > -TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += PKG_MESON_INSTALL_CROSS_CONF
> > +TOOLCHAIN_TARGET_FINALIZE_HOOKS += PKG_MESON_INSTALL_CROSS_CONF  
> 
>  Note that this essentially reverts [1].

Yes, true.

>  The case for that patch was not terribly strong, so it should be OK. But then
> again, the case for this patch is not that strong either.

Well, the case for my patch is that it allows to produce a meson
cross-compilation.conf that has correct and usable values at the end of
the build.

>  Note that pkg-cmake has the same issue. And a number of other packages as well,
> e.g. the Python sysconfig refers to the Python per-package dirs.

For sysconfig, I have a pending patch that I will submit soon to fix
the problem. It is in fact worse for sysconfig because if you don't
tweak it during the build, the build simply fails. While for the global
meson cross-compilation.conf, it is less dramatic as it is not used by
Buildroot itself, just provided as a convenience.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
