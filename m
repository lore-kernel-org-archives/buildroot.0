From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 21:28:24 +0200
Subject: [Buildroot] [git commit] package/lldpd: bump to version 1.0.4
Message-ID: <20190921192408.9CDED8EFFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=842fe578d944236c99ec5dca0f35a1c7092d8996
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...compilation-with--enable-fdp--disable-cdp.patch | 36 ----------------------
 package/lldpd/lldpd.hash                           |  2 +-
 package/lldpd/lldpd.mk                             |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/package/lldpd/0001-build-fix-compilation-with--enable-fdp--disable-cdp.patch b/package/lldpd/0001-build-fix-compilation-with--enable-fdp--disable-cdp.patch
deleted file mode 100644
index d71abde243..0000000000
--- a/package/lldpd/0001-build-fix-compilation-with--enable-fdp--disable-cdp.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 4e7ec8233cd185941eaa9e41785cfc53f92799b4 Mon Sep 17 00:00:00 2001
-From: Vincent Bernat <vincent@bernat.ch>
-Date: Tue, 8 Jan 2019 17:19:15 -0500
-Subject: [PATCH] build: fix compilation with `--enable-fdp --disable-cdp`
-
-Fix #315
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/vincentbernat/lldpd/commit/4e7ec8233cd185941eaa9e41785cfc53f92799b4]
----
- src/lldpd-structs.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/lldpd-structs.h b/src/lldpd-structs.h
-index c3ffa108..f6b03d7d 100644
---- a/src/lldpd-structs.h
-+++ b/src/lldpd-structs.h
-@@ -129,7 +129,7 @@ struct lldpd_dot3_power {
- MARSHAL(lldpd_dot3_power);
- #endif
- 
--#ifdef ENABLE_CDP
-+#if defined (ENABLE_CDP) || defined (ENABLE_FDP)
- struct cdpv2_power {
- 	u_int16_t request_id;
- 	u_int16_t management_id;
-@@ -273,7 +273,7 @@ struct lldpd_port {
- 	struct lldpd_med_power	 p_med_power;
- #endif
- 
--#ifdef ENABLE_CDP
-+#if defined (ENABLE_CDP) || defined (ENABLE_FDP)
- 	struct cdpv2_power p_cdp_power;
- #endif
- 
diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index 6ac11ee38b..c12e004784 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 39fced395168015416bfe78b95414facf066f841f349024433aa20ab54e4c360  lldpd-1.0.3.tar.gz
+sha256 5319bc032fabf1008d5d91e280276aa7f1bbfbb70129d8526cd4526d7c22724f  lldpd-1.0.4.tar.gz
 sha256 0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 86c825c4e1..5569e409dd 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.3
+LLDPD_VERSION = 1.0.4
 LLDPD_SITE = http://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check) \
