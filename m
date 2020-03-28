From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Mar 2020 14:25:29 +0100
Subject: [Buildroot] [git commit] package/hiredis: security bump to version
 0.14.1
Message-ID: <20200328131211.0D690888A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40bc86afe9bf2bf2d443fcfc10d8ddb371598098
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2020-7105: async.c and dict.c in libhiredis.a in hiredis
  through 0.14.0 allow a NULL pointer dereference because malloc return
  values are unchecked.
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hiredis/hiredis.hash | 4 ++--
 package/hiredis/hiredis.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/hiredis/hiredis.hash b/package/hiredis/hiredis.hash
index 709fff8639..2d50ce0f54 100644
--- a/package/hiredis/hiredis.hash
+++ b/package/hiredis/hiredis.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	042f965e182b80693015839a9d0278ae73fae5d5d09d8bf6d0e6a39a8c4393bd	hiredis-0.14.0.tar.gz
-sha256	dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb	COPYING
+sha256  2663b2aed9fd430507e30fc5e63274ee40cdd1a296026e22eafd7d99b01c8913  hiredis-0.14.1.tar.gz
+sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  COPYING
diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index 06d2f4de68..02055b05d4 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HIREDIS_VERSION_MAJOR = 0.14
-HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).0
+HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).1
 HIREDIS_SITE = $(call github,redis,hiredis,v$(HIREDIS_VERSION))
 HIREDIS_LICENSE = BSD-3-Clause
 HIREDIS_LICENSE_FILES = COPYING
