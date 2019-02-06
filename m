From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 10:23:03 +0100
Subject: [Buildroot] [PATCH v4 16/17] package/fftw: remove as regular
 package
In-Reply-To: <20190202171641.GH6663@scaer>
References: <1548078671-63318-7-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-8-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-9-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-10-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-11-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-12-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-13-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-14-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-15-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-16-git-send-email-gwenj@trabucayre.com>
 <20190202171641.GH6663@scaer>
Message-ID: <20190206102303.067c3f63@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 2 Feb 2019 18:16:41 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > -ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)
> > -FFTW_DEPENDENCIES += fftw-double
> > -endif
> > -
> > -ifeq ($(BR2_PACKAGE_FFTW_LONG_DOUBLE),y)
> > -FFTW_DEPENDENCIES += fftw-long-double
> > -endif
> > -
> > -ifeq ($(BR2_PACKAGE_FFTW_QUAD),y)
> > -FFTW_DEPENDENCIES += fftw-quad
> > -endif
> > -
> > -ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
> > -FFTW_DEPENDENCIES += fftw-single
> > -endif  
> 
> Actually, I think these dependencies should stay. This would allow a
> package that needs any fftw variant to just select BR2_PACKAGE_FFTW
> and add FOO_DEPENDENCIES = fftw.

As far as I know, we don't have any such package in the tree today, so
that would be a bit of dead code.

In addition, I believe such a situation is pretty unlikely to happen.
Those 4 variants are separate libraries with different filenames, and
the functions provided by those libraries are different. So it's pretty
unlikely that a package will be able to use "any fftw variant". Should
that happen one day, it will always be time to revisit this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
