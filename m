From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 16:34:54 +0200
Subject: [Buildroot] [PATCHv4] am335x-pru-package: new package
In-Reply-To: <1413121138-23216-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 12 Oct 2014 15:38:58 +0200")
References: <1413121138-23216-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <8738atxsoh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Frank Hunleth <fhunleth@troodon-software.com>
 > am335x-pru-package provides an assembler and program loader for Texas
 > Instrument's AM335x programmable real-time units.

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > ---
 > Changes v3 -> v4:
 >   - rename patch to start at 1, like git-format-patch does  (Thomas P.)

 > Changes v2 -> v3:
 >   - add missing patch file

 > Changes v1 -> v2:
 >   - build debug or release accordingly
 >   - create a symlink for debug libraries
 >   - do not build shared if PREFER_STATIC is et
 >   - use the 'install' rule to install both in target and staging
 >   - properly pass DESTDIR and PREFIX at install time
 >   - add missing file to host-variant build (due to version bump)
 >   - drop the host variant from the menu
 >   - bump revision
 > ---
 >  package/Config.in                                  |  1 +
 >  .../0001-install-does-not-build.patch              | 23 +++++++
 >  package/am335x-pru-package/Config.in               |  7 ++
 >  package/am335x-pru-package/am335x-pru-package.mk   | 74 ++++++++++++++++++++++
 >  4 files changed, 105 insertions(+)
 >  create mode 100644 package/am335x-pru-package/0001-install-does-not-build.patch
 >  create mode 100644 package/am335x-pru-package/Config.in
 >  create mode 100644 package/am335x-pru-package/am335x-pru-package.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index b655763..5b8ce9c 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -281,6 +281,7 @@ menu "Firmware"
 >  endmenu
 >  	source "package/a10disp/Config.in"
 >  	source "package/acpid/Config.in"
 > +	source "package/am335x-pru-package/Config.in"
 >  	source "package/avrdude/Config.in"
 >  	source "package/bcache-tools/Config.in"
 >  	source "package/biosdevname/Config.in"
 > diff --git a/package/am335x-pru-package/0001-install-does-not-build.patch b/package/am335x-pru-package/0001-install-does-not-build.patch
 > new file mode 100644
 > index 0000000..72f398a
 > --- /dev/null
 > +++ b/package/am335x-pru-package/0001-install-does-not-build.patch
 > @@ -0,0 +1,23 @@
 > +Makefile: do not force the release build on install
 > +
 > +If we did build any of the other targets, and are just interested
 > +in those and not the relase one, we still want to use the 'install'

s/relase/release/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
