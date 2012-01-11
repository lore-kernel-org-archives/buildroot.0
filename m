From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 11 Jan 2012 18:53:41 +0100
Subject: [Buildroot] [PATCH 4/4] Update the documentation to add these
	changes
In-Reply-To: <cover.1326304128.git.maxime.ripard@free-electrons.com>
References: <cover.1326304128.git.maxime.ripard@free-electrons.com>
Message-ID: <ad9fb6b99c31f84658dcc8f15cbd5c2440ee0918.1326304128.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 docs/manual/adding-packages-gentargets.txt |   19 +++++++++++++++++--
 1 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-gentargets.txt b/docs/manual/adding-packages-gentargets.txt
index b344494..6617e26 100644
--- a/docs/manual/adding-packages-gentargets.txt
+++ b/docs/manual/adding-packages-gentargets.txt
@@ -38,7 +38,15 @@ system is based on hand-written Makefiles or shell scripts.
 24: 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
 25: endef
 26:
-27: $(eval $(call GENTARGETS))
+27: define LIBFOO_DEVICES
+28: 	/dev/foo  c  666  0  0  42  0  -  -  -
+29: endef
+30:
+31: define LIBFOO_PERMISSIONS
+32: 	/bin/foo  f  4755  0  0  -  -  -  -  -
+33: endef
+34:
+35: $(eval $(call GENTARGETS))
 --------------------------------
 
 The Makefile begins on line 6 to 8 with metadata information: the
@@ -75,7 +83,7 @@ All these steps rely on the +$(@D)+ variable, which
 contains the directory where the source code of the package has been
 extracted.
 
-Finally, on line 27, we call the +GENTARGETS+ which
+Finally, on line 35, we call the +GENTARGETS+ which
 generates, according to the variables defined previously, all the
 Makefile code necessary to make your package working.
 
@@ -188,6 +196,13 @@ information is (assuming the package name is +libfoo+) :
   variables are executed to install the package into the target
   directory.
 
+* +LIBFOO_DEVICES+ lists the device files to be created by Buildroot
+  when using the static device table. The syntax to use is the
+  makedevs one.
+
+* +LIBFOO_PERMISSIONS+ lists the changes of permissions to be done at
+  the end of the build process. The syntax is once again the makedevs one.
+
 The recommended way to define these variables is to use the following
 syntax:
 
-- 
1.7.4.1
