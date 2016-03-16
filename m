From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 16 Mar 2016 11:20:13 -0300
Subject: [Buildroot] [PATCH] openpgm: depends on sync2/sync4
Message-ID: <1458138013-18031-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add dependency on BR2_TOOLCHAIN_HAS_SYNC_2/4 since it uses both
__sync_fetch_and_add_2() and __sync_fetch_and_add_4() atomic builtins.
Fixes:
http://autobuild.buildroot.net/results/8f2/8f2a3571611dc9414c23808e7615f87b677557dd/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openpgm/Config.in | 4 ++++
 package/zeromq/Config.in  | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/package/openpgm/Config.in b/package/openpgm/Config.in
index 94816d8..632c289 100644
--- a/package/openpgm/Config.in
+++ b/package/openpgm/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_OPENPGM
 	bool "openpgm"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	# This toolchain lack required compiler intrinsics
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -15,4 +17,6 @@ config BR2_PACKAGE_OPENPGM
 	  https://github.com/steve-o/openpgm/
 
 comment "openpgm needs a toolchain w/ wchar, threads"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR)
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index c780f25..2385606 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -29,6 +29,8 @@ if BR2_PACKAGE_ZEROMQ
 
 config BR2_PACKAGE_ZEROMQ_PGM
 	bool "PGM/EPGM support"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX # openpgm
 	select BR2_PACKAGE_OPENPGM
 	help
-- 
2.4.10
