From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2020 00:16:46 -0600
Subject: [Buildroot] [PATCH 1/1] package/mpdecimal: bump to version 2.5.0
Message-ID: <20201015061646.1011712-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update license hash due to date update.

Tweak patch so that it applies still.

Fixes:
http://autobuild.buildroot.net/results/b73/b7384312567825e6f4ddbd7c08c1b8e44c7f1f9b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...Add-minimal-support-for-enable-disable-shared-static.patch | 2 +-
 package/mpdecimal/mpdecimal.hash                              | 4 ++--
 package/mpdecimal/mpdecimal.mk                                | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch b/package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch
index 630bbd6642..4b60013840 100644
--- a/package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch
+++ b/package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch
@@ -37,7 +37,7 @@ index 2c91891..0c44f36 100644
 +endif
 +ifeq ($(BUILD_SHARED),yes)
  	$(INSTALL) -m 755 libmpdec/$(LIBSHARED) $(DESTDIR)$(libdir)
- 	cd $(DESTDIR)$(libdir) && ln -sf $(LIBSHARED) $(LIBSONAME) && ln -sf $(LIBSHARED) libmpdec.so
+ 	cd $(DESTDIR)$(libdir) && ln -sf $(LIBSHARED) $(LIBSONAME) && ln -sf $(LIBSHARED) $(LIBNAME)
 +endif
  	$(INSTALL) -d -m 755 $(DESTDIR)$(docdir)
  	cp -R doc/* $(DESTDIR)$(docdir)
diff --git a/package/mpdecimal/mpdecimal.hash b/package/mpdecimal/mpdecimal.hash
index e152243230..c931ee4a6d 100644
--- a/package/mpdecimal/mpdecimal.hash
+++ b/package/mpdecimal/mpdecimal.hash
@@ -1,4 +1,4 @@
 # From http://www.bytereef.org/mpdecimal/download.html
-sha256 83c628b90f009470981cf084c5418329c88b19835d8af3691b930afccb7d79c7 mpdecimal-2.4.2.tar.gz
+sha256  15417edc8e12a57d1d9d75fa7e3f22b158a3b98f44db9d694cfd2acde8dfa0ca  mpdecimal-2.5.0.tar.gz
 # Locally computed
-sha256 e384413a13f061a50f6fadceefc0f326c22d83c13ae94978e1f86d0468332c19 LICENSE.txt
+sha256  b07528d8b1dbf1e2d2741052996f0876e23342ce2d30d0effa39c5457716c25a  LICENSE.txt
diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index 2d06d0f6b4..00aa98e693 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases
-MPDECIMAL_VERSION = 2.4.2
+MPDECIMAL_VERSION = 2.5.0
 MPDECIMAL_INSTALL_STAGING = YES
 MPDECIMAL_LICENSE = BSD-2-Clause
 MPDECIMAL_LICENSE_FILES = LICENSE.txt
-- 
2.25.1
