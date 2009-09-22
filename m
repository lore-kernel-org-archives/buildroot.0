From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Sep 2009 01:13:24 +0200
Subject: [Buildroot] [pull request] Buildroot cleanup, v2
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901D422D6@mi8nycmail19.Mi8.com>
References: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<BD79186B4FD85F4B8E60E381CAEE190901D422CB@mi8nycmail19.Mi8.com>
	<20090923003854.134a1993@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901D422D6@mi8nycmail19.Mi8.com>
Message-ID: <20090923011324.20577fe7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 22 Sep 2009 18:56:32 -0400,
"H Hartley Sweeten" <hartleys@visionengravers.com> a ?crit :

> One thing I did notice.
> 
> You default BR2_DL_DIR to $(BASE_DIR)/dl a better default might be
> $(TOPDIR)/dl.  This would make the default work for multiple
> make O=<directory> without having to create the <directory>/dl symlink
> or export BUILDROOT_DL_DIR.

True. It always bothered me as well. Care to prepare a patch and submit
it ?

> > That's definitely on my TODO-list. But don't hesitate to step-up
> > with a patch, since I'm very busy these days and don't know when
> > I'll be able to work on this again (next week ?).
> 
> I'll just wait for you to reach it on your TODO-list ;-)

Ooh, come on :-)

> Having a common package removal would be great!  Removing a single
> package from the filesystem can be a real pain...

It is basically unsupported these days. Some packages work more or
less, but on overall it just doesn't work.

> zlib.mk isn't even the worse one.  That one at least looks like it
> could be converted to the a Makefile.autotools.in target.  Some of the
> older *.mk files are a real mess...

Yes, they are. They are part of the work, but it will take quite some
time to implement the infrastructure and then convert the packages.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
