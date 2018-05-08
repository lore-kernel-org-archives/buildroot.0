From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:40:34 +0200
Subject: [Buildroot] [git commit] package/tovid: bump version
Message-ID: <20180509193609.45BA68C5EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23001ad1a150e55ed8dde2764532e7cfaf1f356c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for mpv is not present in the tarball version 0.35.2, therefore
we bump this package to current git master branch to prepare the switch
from mplayer to mpv.

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tovid/tovid.hash | 3 ++-
 package/tovid/tovid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/tovid/tovid.hash b/package/tovid/tovid.hash
index 0bd7668fad..89d0461a98 100644
--- a/package/tovid/tovid.hash
+++ b/package/tovid/tovid.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 3193d081a7aa8e00f946b7514066f1fb7647f533ab1ebcc36b5ced927b0a1ab5  tovid-0.35.2.tar.gz
+sha256 c03a746a3592a656bab0be4045da114a4231eb0f858d6c18503dac64049fbe48  tovid-87c676f4aadb7303d2cd921380b054bafa4b85bb.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/tovid/tovid.mk b/package/tovid/tovid.mk
index c904b981f6..4c5c60aa7f 100644
--- a/package/tovid/tovid.mk
+++ b/package/tovid/tovid.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TOVID_VERSION = 0.35.2
-TOVID_SITE = https://github.com/tovid-suite/tovid/releases/download/$(TOVID_VERSION)
+TOVID_VERSION = 87c676f4aadb7303d2cd921380b054bafa4b85bb
+TOVID_SITE = $(call github,tovid-suite,tovid,$(TOVID_VERSION))
 TOVID_LICENSE = GPL-2.0+
 TOVID_LICENSE_FILES = COPYING
 TOVID_SETUP_TYPE = distutils
