From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 2 Aug 2015 23:38:51 +0200
Subject: [Buildroot] [PATCH 1/3] uclibc: update to latest 1.0.5 release
Message-ID: <20150802213851.GA23536@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes gcc 5.x problems on x86.
Fixes static linking issue on sh4.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/Config.in   |    2 +-
 package/uclibc/uclibc.hash |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index e1cc3a7..bf40a13 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -65,7 +65,7 @@ config BR2_UCLIBC_VERSION_STRING
 	string
 	default "0.9.33.2"	if BR2_UCLIBC_VERSION_0_9_33
 	default "arc-2015.06" if BR2_UCLIBC_VERSION_ARC_GIT
-	default "1.0.4"		if BR2_UCLIBC_VERSION_NG
+	default "1.0.5"		if BR2_UCLIBC_VERSION_NG
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index d810884..9ccf061 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -2,7 +2,7 @@
 sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0.9.33.2.tar.xz
 
 # From http://www.uclibc-ng.org/
-sha256  c037dbaea685380c75b112b5503778a90fa95ac524728770131aa17e29474915        uClibc-ng-1.0.4.tar.xz
+sha256  7a16bc9ff03b8f74f1f0cf921412f08e48a15285d9d555560d5cca915a28df5f        uClibc-ng-1.0.5.tar.xz
 
 # No hash for the ARC variant, comes from the github-helper
 none	xxx	uClibc-arc-2015.06.tar.gz
-- 
1.7.10.4
