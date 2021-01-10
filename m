From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Jan 2021 20:28:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/frotz: needs threads
Message-ID: <20210110192815.1121551-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/8443316d8074bf44a82ceeda4630a9acb1254947

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/frotz/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/frotz/Config.in b/package/frotz/Config.in
index 59b6d0007d..b73beea330 100644
--- a/package/frotz/Config.in
+++ b/package/frotz/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FROTZ
 	bool "frotz"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_NCURSES
 	help
 	  Frotz is an interpreter for old Infocom adventure games and
@@ -8,3 +9,6 @@ config BR2_PACKAGE_FROTZ
 	  be able to use it.
 
 	  https://661.org/proj/if/frotz/
+
+comment "frotz needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.29.2
