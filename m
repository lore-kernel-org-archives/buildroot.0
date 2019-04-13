From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Apr 2019 15:55:18 +0200
Subject: [Buildroot] [git commit] package/lldpd: fix build without cdp
Message-ID: <20190413135125.7E329813D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0b5129c9b3e1f8380cae2c77836e4df98565b00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/e46055b86bcb03614f3fba076af2278e46a39714

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...compilation-with--enable-fdp--disable-cdp.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/lldpd/0001-build-fix-compilation-with--enable-fdp--disable-cdp.patch b/package/lldpd/0001-build-fix-compilation-with--enable-fdp--disable-cdp.patch
new file mode 100644
index 0000000000..d71abde243
--- /dev/null
+++ b/package/lldpd/0001-build-fix-compilation-with--enable-fdp--disable-cdp.patch
@@ -0,0 +1,36 @@
+From 4e7ec8233cd185941eaa9e41785cfc53f92799b4 Mon Sep 17 00:00:00 2001
+From: Vincent Bernat <vincent@bernat.ch>
+Date: Tue, 8 Jan 2019 17:19:15 -0500
+Subject: [PATCH] build: fix compilation with `--enable-fdp --disable-cdp`
+
+Fix #315
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/vincentbernat/lldpd/commit/4e7ec8233cd185941eaa9e41785cfc53f92799b4]
+---
+ src/lldpd-structs.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/lldpd-structs.h b/src/lldpd-structs.h
+index c3ffa108..f6b03d7d 100644
+--- a/src/lldpd-structs.h
++++ b/src/lldpd-structs.h
+@@ -129,7 +129,7 @@ struct lldpd_dot3_power {
+ MARSHAL(lldpd_dot3_power);
+ #endif
+ 
+-#ifdef ENABLE_CDP
++#if defined (ENABLE_CDP) || defined (ENABLE_FDP)
+ struct cdpv2_power {
+ 	u_int16_t request_id;
+ 	u_int16_t management_id;
+@@ -273,7 +273,7 @@ struct lldpd_port {
+ 	struct lldpd_med_power	 p_med_power;
+ #endif
+ 
+-#ifdef ENABLE_CDP
++#if defined (ENABLE_CDP) || defined (ENABLE_FDP)
+ 	struct cdpv2_power p_cdp_power;
+ #endif
+ 
