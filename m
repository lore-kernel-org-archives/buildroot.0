From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 1 Aug 2013 00:13:35 +0200
Subject: [Buildroot] List of pending patches: what to do?
In-Reply-To: <20130731191415.545f7dff@skate>
References: <20130731191415.545f7dff@skate>
Message-ID: <CAHXCMMJ63sJ=m5V1c5+TqOn8TfdBop20gzDHjL85Ks1rYYU+-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

2013/7/31 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:

> http://patchwork.ozlabs.org/patch/243426 Fix bug with dependencies of *-rebuild and *-reconfigure
> http://patchwork.ozlabs.org/patch/172278 pkg-infra: limit -reconfigure and -rebuild actions
Both treat the same thing!
A "political decision" has to be made on this since it slightly
changes the way some BR commands work.

> http://patchwork.ozlabs.org/patch/172506 [01/11] libgpg-error: add optional nls support
To be dropped, nobody needs it.

> http://patchwork.ozlabs.org/patch/189336 libglib2: Fix midori save file dialog not being rendered
AFAICS, this one is no longer needed.
It fix a glib-2.32 issue, and now we provide the 2.36 version.

> http://patchwork.ozlabs.org/patch/200889 [04/33] igh-ethercat: disable drivers build with kernel 3.6
> http://patchwork.ozlabs.org/patch/200896 [05/33] imagemagick: explicitly disable c++ support if no c++ compiler available
> http://patchwork.ozlabs.org/patch/200909 [20/33] pkg-download.mk: add tarball check in the wget method
> http://patchwork.ozlabs.org/patch/204804 flite: new package
> http://patchwork.ozlabs.org/patch/204806 libcanfestival: new package
Still in my stack.
Postponed to the next release.

> http://patchwork.ozlabs.org/patch/208801 [3/8] package/Makefile.in: update/fix HOST_PATH variable
> http://patchwork.ozlabs.org/patch/208802 [4/8] package/pkg-cmake.mk: make sure $(HOST_PATH) is in the PATH at configure time
Still in my stack.
Part of some infra cleanup.
Postponed to the next release.

> http://patchwork.ozlabs.org/patch/208803 [5/8] dependencies: build a host python2 if no suitable one can be found
> http://patchwork.ozlabs.org/patch/208804 [6/8] scons: add host-python2-if-needed dependency
> http://patchwork.ozlabs.org/patch/208805 [7/8] scons: ensure $(HOST_DIR)/usr/bin is in the PATH when invoking $(SCONS)
> http://patchwork.ozlabs.org/patch/208806 [8/8] manual: add host python2 dependency section
Still in my stack.
Part of some infra cleanup.
If nobody but me cares about this, then I don't mind dropping them;
I'll keep them locally.

> http://patchwork.ozlabs.org/patch/214943 [1/1] Documentation update : add tips to build manual, add information about buildroot toolchain not being relocable and put some hints to use it, move the Beyond Buildroot section before FAQs and add content
> http://patchwork.ozlabs.org/patch/216485 Docu: Add LIBFOO_EXTRACT_CMDS
> http://patchwork.ozlabs.org/patch/232024 [1/1] manual: add patch revision and versioning section
Doc/manual: need review/respin/rebase imho. Can wait for the next release cycle.

> http://patchwork.ozlabs.org/patch/230289 [v2] Enable ccache for cmake packages
> http://patchwork.ozlabs.org/patch/243442 [1/6] package infra: remove CPPFLAGS from CFLAGS
Part of some cleanup I have in my stack and I'd like to do for the next release.

> http://patchwork.ozlabs.org/patch/244409 [1/1] libtirpc: requires toolchain with threads support
Fixes autobuilders, and is the v2 of a patch, including comments from
the 1st submission.

> http://patchwork.ozlabs.org/patch/182233 Depend autotools targets on host-ccache when BR2_CCACHE is enabled.
> http://patchwork.ozlabs.org/patch/256744 tar: avoid ccache chicken and egg problem when bootstrapping tar
> http://patchwork.ozlabs.org/patch/257372 [1/3] infra: make possible to run 'make *-menuconfig' from a clean output dir
ccache chicken-egg issue that need to be carefully handled.

> http://patchwork.ozlabs.org/patch/257374 [2/3] crosstool-ng: remove unneed explicit ccache dependency
> http://patchwork.ozlabs.org/patch/257375 [3/3] sstrip: remove unneed explicit ccache dependency
Few more ccache cleanups after the previous issue is fixed.

> http://patchwork.ozlabs.org/patch/257376 [1/3] qt{4, 5}: add an explicit choice to express Buildroot does not support their coexistence
> http://patchwork.ozlabs.org/patch/257377 [2/3] manual: add faq entry explaining why Buildroot does not support Qt{4, 5} coexistence
> http://patchwork.ozlabs.org/patch/257378 [3/3] opencv: bump version to 2.4.6
Still in my stack.
I will rework them during the next release cycle.


Regards,

-- 
Samuel
