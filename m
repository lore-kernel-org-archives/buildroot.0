From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 21 Jun 2010 18:25:24 -0500
Subject: [Buildroot] sdl demo app install problem
Message-ID: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I'm trying to create package for one of the SDL demo apps in order to
verify that sdl is working on my i.MX35 system.  Here is my *.mk for it:


#############################################################
#
# fire
#
#############################################################

FIRE_VERSION:=1.0
FIRE_SOURCE:=fire-$(FIRE_VERSION).tar.gz
FIRE_SITE:=http://www.libsdl.org/projects/fire/src
FIRE_INSTALL_TARGET:=YES
FIRE_CONF_OPT:=--with-sdl-prefix=$(STAGING_DIR)/usr \
		--with-sdl-exec-prefix=$(STAGING_DIR)/usr

FIRE_DEPENDENCIES:=sdl

$(eval $(call AUTOTARGETS,package/customize,fire))


BTW, I hijacked the package/customize directory to use for my non
buildroot packages.  This has been working for other stuff so I don't
think it's the problem.

The package gets all the way thru the build stage but it dies
during the install.  Following is the log of the install stage:


>>> fire 1.0 Installing to target
/usr/bin/make -j2 DESTDIR=/home/bigguiness/extratech/buildroot/output/target  install-strip -C /home/bigguiness/extratech/buildroot/output/build/fire-1.0/
make[1]: Entering directory `/home/bigguiness/extratech/buildroot/output/build/fire-1.0'
/usr/bin/make  AM_INSTALL_PROGRAM_FLAGS=-s install
make[2]: Entering directory `/home/bigguiness/extratech/buildroot/output/build/fire-1.0'
make[3]: Entering directory `/home/bigguiness/extratech/buildroot/output/build/fire-1.0'
/bin/sh ./mkinstalldirs /home/bigguiness/extratech/buildroot/output/target/usr/bin
make[3]: Nothing to be done for `install-data-am'.
  /usr/bin/install -c -s fire /home/bigguiness/extratech/buildroot/output/target/usr/bin/fire
strip: Unable to recognise the format of the input file `/home/bigguiness/extratech/buildroot/output/target/usr/bin/fire'
/usr/bin/install: strip process terminated abnormally
make[3]: *** [install-binPROGRAMS] Error 1
make[3]: Leaving directory `/home/bigguiness/extratech/buildroot/output/build/fire-1.0'
make[2]: *** [install-am] Error 2
make[2]: Leaving directory `/home/bigguiness/extratech/buildroot/output/build/fire-1.0'
make[1]: *** [install-strip] Error 2
make[1]: Leaving directory `/home/bigguiness/extratech/buildroot/output/build/fire-1.0'
make: *** [/home/bigguiness/extratech/buildroot/output/build/fire-1.0/.stamp_target_installed] Error 2


Does anyone have an idea why the install is failing?

Thanks,
Hartley
