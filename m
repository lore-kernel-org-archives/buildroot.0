From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 15:57:30 +0100
Subject: [Buildroot] [git commit] package/libevdev: add dependency on
	host-python
Message-ID: <20131228145826.090F59C221@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79c31e3297da7f0aec4d4675c154736e4cffe3ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libevdev needs python to generate a header file. We can't rely on the
1system pPython, since it may be too old (missing argparse in python
2.6).

Fixes:
    http://autobuild.buildroot.net/results/1f5c0689ae129ae5fa30f31a4f47ccbd7705ff00/
    http://autobuild.buildroot.net/results/1729043d9c977a59a4fdd7ccd3d16cfc8aef7678/
    http://autobuild.buildroot.net/results/3ab080e96576e0012fea853009811247338e665e/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libevdev/libevdev.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 338bebd..693da24 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -12,6 +12,11 @@ LIBEVDEV_LICENSE_FILES = COPYING
 # Uses PKG_CHECK_MODULES() in configure.ac
 LIBEVDEV_DEPENDENCIES = host-pkgconf
 
+# Needs Python to generate a header file
+# We can't rely on the system pPython, since it may be too old
+# (missing argparse in python 2.6)
+LIBEVDEV_DEPENDENCIES += host-python
+
 # package source code coming from git, so it doesn't have generated
 # configure and Makefile.in
 LIBEVDEV_AUTORECONF = YES
