From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Nov 2012 11:04:09 +0100
Subject: [Buildroot] [PATCH 3/3] xtensa: disable libffi for Xtensa
In-Reply-To: <50ACA0A6.9020507@zankel.net>
References: <50ac8f69.6548420a.6f5c.2a1b@mx.google.com>
 <20121121083521.GB28785@sapphire.tkos.co.il>
 <50ACA0A6.9020507@zankel.net>
Message-ID: <20121121110409.59547168@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Zankel,

On Wed, 21 Nov 2012 01:36:38 -0800, Chris Zankel wrote:

> > You need to recursively propagate this 'depends' to all packages selecting 
> > BR2_PACKAGE_LIBFFI. This is due to a limitation of kconfig that doesn't check 
> > whether a package is actually selectable.
> 
> Ah, good to know. Thanks. Will create another patch.

No, don't do it. You will become crazy before you get to the end of it.
libffi is a dependency for glib and python, and glib in turn has a
crazy number of reverse dependencies, themselves having other
reverse dependencies. You would have to add a depends on !BR2_xtensa on
dozens and dozens of packages.

This is a known limitation of kconfig, which we have discussed in
length during the last Buildroot Developer Days, see point 6) in
http://elinux.org/Buildroot:DeveloperDaysELCE2012#Details_of_the_discussion.

For now, I think it's better to just leave libffi as it is, until we
find a good way of solving the entire problem. We know that we should
ignore those autobuilders failures.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
