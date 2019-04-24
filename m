From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 24 Apr 2019 23:59:51 +0200
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.13.1
In-Reply-To: <20190424224418.725174dc@windsurf>
References: <20190423204113.20563-1-ps.report@gmx.net>
 <20190424224418.725174dc@windsurf>
Message-ID: <20190424235951.19850312@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, 24 Apr 2019 22:44:18 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Tue, 23 Apr 2019 22:41:13 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> >  - for changelog see [1] and [2]
> >  - removed 0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch
> >    (upstream applied, see [3])
> >
> > [1] https://lists.freedesktop.org/archives/wayland-devel/2019-March/040363.html
> > [2] https://lists.freedesktop.org/archives/wayland-devel/2019-April/040403.html
> > [3] https://gitlab.freedesktop.org/libinput/libinput/commit/4516ba977c1e22d01da4cc50a8ebffa5d11d73f1
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  ...le-CPP-include-check-only-in-case-CP.patch | 54 -------------------
> >  package/libinput/libinput.hash                | 10 ++--
> >  package/libinput/libinput.mk                  |  2 +-
> >  3 files changed, 6 insertions(+), 60 deletions(-)
> >  delete mode 100644 package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch
>
> Applied to master, thanks. For some reason, your patch was not applying properly:
>
> Applying patch #1089746 using "git am -s"
> Description: [v1] package/libinput: bump version to 1.13.1
> Applying: package/libinput: bump version to 1.13.1
> error: patch failed: package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch:1
> error: package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch: patch does not apply
> Patch failed at 0001 package/libinput: bump version to 1.13.1
> hint: Use 'git am --show-current-patch' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 'git am' failed with exit status 128

Mhhh, did compare the commit from buildroot git (exported via gitk - Write
commit to file) and my local stored patch file and could not spot any relevant
difference...

But did compare the file from patchwork (downloaded with firefox via [1]) and
my local stored patch file, and they differ:

	$ diff -u v1-0001-package-libinput-bump-version-to-1.13.1.patch ~/Downloads/v1-package-libinput-bump-version-to-1.13.1.patch
--- v1-0001-package-libinput-bump-version-to-1.13.1.patch	2019-04-23 22:40:23.268384146 +0200
+++ /home/seiderer/Downloads/v1-package-libinput-bump-version-to-1.13.1.patch	2019-04-24 23:53:18.727138242 +0200
@@ -1,9 +1,18 @@
-From 3c6d2fc866ff12cc6566c258a091295b3bd9c855 Mon Sep 17 00:00:00 2001
+From patchwork Tue Apr 23 20:41:13 2019
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: [v1] package/libinput: bump version to 1.13.1
+X-Patchwork-Submitter: Peter Seiderer <ps.report@gmx.net>
+X-Patchwork-Id: 1089746
+Message-Id: <20190423204113.20563-1-ps.report@gmx.net>
+To: buildroot at buildroot.org
+Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
+Date: Tue, 23 Apr 2019 22:41:13 +0200
 From: Peter Seiderer <ps.report@gmx.net>
-Date: Tue, 23 Apr 2019 22:33:23 +0200
-Subject: [PATCH v1] package/libinput: bump version to 1.13.1
+List-Id: Discussion and development of buildroot <buildroot.busybox.net>

- - for changelog see [1] and [2]
+- for changelog see [1] and [2]
  - removed 0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch
    (upstream applied, see [3])

@@ -19,6 +28,9 @@
  3 files changed, 6 insertions(+), 60 deletions(-)
  delete mode 100644 package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch

+--
+2.21.0
+
 diff --git a/package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch b/package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch
 deleted file mode 100644
 index 341f6eb11d..0000000000
@@ -73,10 +85,10 @@
 -+		   include_directories : [includes_src, includes_include],
 -+		   install : false)
 -+endif
--
+-
 - # This is the test suite runner, we allow disabling that one because of
 - # dependencies
----
+---
 -2.20.1
 -
 diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
@@ -94,7 +106,7 @@
 +sha1 a0338e5f2ff2cecbb88f91e5bf363f9b66770be2 libinput-1.13.1.tar.xz
 +sha256 e1d487d478ee2bb118890a64211c2b7f2348aaed7363b214bed4d642274841ab libinput-1.13.1.tar.xz
 +sha512 a19deec802e704038df0901c103a82a3370f56e0299f4cc1b6aa84c1832a66fb638e6f9d0fa708b51df6c3b939cdc1271e4ff547c645c566be03dce0bc9ff7e0 libinput-1.13.1.tar.xz
-
+
  # License files
  sha256 70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14 COPYING
 diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
@@ -104,12 +116,9 @@
 @@ -4,7 +4,7 @@
  #
  ################################################################################
-
+
 -LIBINPUT_VERSION = 1.12.6
 +LIBINPUT_VERSION = 1.13.1
  LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
  LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
  LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
---
-2.21.0
-

>
> I fixed it up manually when applying.

Nevertheless thanks for applying and fixing it...

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/1089746/mbox/

>
> Thomas
