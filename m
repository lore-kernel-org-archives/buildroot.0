From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Dec 2019 13:44:16 +0100
Subject: [Buildroot] [git commit] package/openal: switch to github mirror
Message-ID: <20191215123536.423958B523@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94d4f06ca2feb215369c5af1747a50744189543a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openal/openal.hash | 2 +-
 package/openal/openal.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index 219e334e6e..a133808cae 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 5c2f87ff5188b95e0dc4769719a9d89ce435b8322b4478b95dd4b427fe84b2e9  openal-soft-1.19.1.tar.bz2
+sha256 9f3536ab2bb7781dbafabc6a61e0b34b17edd16bd6c2eaf2ae71bc63078f98c7  openal-1.19.1.tar.gz
 sha256 d808ce217e5b611854da622b57ec29fe545584c48bc5352fae72a4b6e5074a15  COPYING
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index e15cf320c0..8e761a8d9b 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 OPENAL_VERSION = 1.19.1
-OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.bz2
-OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
+OPENAL_SITE = $(call github,kcat,openal-soft,openal-soft-$(OPENAL_VERSION))
 OPENAL_LICENSE = LGPL-2.0+
 OPENAL_LICENSE_FILES = COPYING
 OPENAL_INSTALL_STAGING = YES
