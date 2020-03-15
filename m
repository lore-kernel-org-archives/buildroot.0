From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:18:29 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/fbgrab: bump
 version to 1.3.1 and update projct URL
Message-ID: <20200315100711.2F84F8434E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=728b00d2201167fa75ff22bee3f304c6237a89a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- bump version to 1.3.1
  Changelog:
  * Incorrect alpha value when converting 32-bit framebuffers.
  * Documentation for github instead of own homepage.

- update project URL

Fixes bug 12606 ([1]).

[1] https://bugs.busybox.net/show_bug.cgi?id=12606

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Timo Ketola <timo.ketola@exertus.fi>
Acked-by: Timo Ketola <timo.ketola@exertus.fi>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7e87817d2c4168e857d1a2aa4cd6b21ed080a96f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fbgrab/Config.in   | 2 +-
 package/fbgrab/fbgrab.hash | 3 ++-
 package/fbgrab/fbgrab.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/fbgrab/Config.in b/package/fbgrab/Config.in
index d1e9e69b3f..b1d8755f32 100644
--- a/package/fbgrab/Config.in
+++ b/package/fbgrab/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_FBGRAB
 	  FBGrab is a framebuffer screenshot program, capturing the
 	  linux frambuffer and converting it to a png-picture.
 
-	  http://fbgrab.monells.se/
+	  https://github.com/GunnarMonell/fbgrab
diff --git a/package/fbgrab/fbgrab.hash b/package/fbgrab/fbgrab.hash
index de3bc1ffd7..6cd19dc1d5 100644
--- a/package/fbgrab/fbgrab.hash
+++ b/package/fbgrab/fbgrab.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 5fab478cbf8731fbacefaa76236a8f8b38ccff920c53b3a8253bc35509fba8ed fbgrab-1.3.tar.gz
+sha256  3314a932f830e32feaf36914e1b43326529fe35b7eb7410ff55f16c930ddfbcb  fbgrab-1.3.1.tar.gz
+sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
index d81a5ee2a0..43fd0ba948 100644
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FBGRAB_VERSION = 1.3
-FBGRAB_SITE = http://fbgrab.monells.se
+FBGRAB_VERSION = 1.3.1
+FBGRAB_SITE = $(call github,GunnarMonell,fbgrab,$(FBGRAB_VERSION))
 FBGRAB_DEPENDENCIES = libpng
 FBGRAB_LICENSE = GPL-2.0
 FBGRAB_LICENSE_FILES = COPYING
