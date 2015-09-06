From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Sep 2015 11:32:24 +0200
Subject: [Buildroot] [git commit] uclibc: update to 1.0.6
Message-ID: <20150906093845.6732081922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b47168f16b4e9d9a05a866bcb1b448d9cc382c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes boost compile problem with ARC.
New function mkostemps required for efl are available.
Static sudo compiles are possible.
Full changes:
http://mailman.uclibc-ng.org/pipermail/devel/2015-August/000463.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/Config.in   |    2 +-
 package/uclibc/uclibc.hash |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index bf40a13..898d99d 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -65,7 +65,7 @@ config BR2_UCLIBC_VERSION_STRING
 	string
 	default "0.9.33.2"	if BR2_UCLIBC_VERSION_0_9_33
 	default "arc-2015.06" if BR2_UCLIBC_VERSION_ARC_GIT
-	default "1.0.5"		if BR2_UCLIBC_VERSION_NG
+	default "1.0.6"		if BR2_UCLIBC_VERSION_NG
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 9ccf061..6cd76dd 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -2,7 +2,7 @@
 sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0.9.33.2.tar.xz
 
 # From http://www.uclibc-ng.org/
-sha256  7a16bc9ff03b8f74f1f0cf921412f08e48a15285d9d555560d5cca915a28df5f        uClibc-ng-1.0.5.tar.xz
+sha256  afb2ec318fe5b115165e3fdc22964a2fd2b68e03a652ac36164ed096b4bb795c        uClibc-ng-1.0.6.tar.xz
 
 # No hash for the ARC variant, comes from the github-helper
 none	xxx	uClibc-arc-2015.06.tar.gz
