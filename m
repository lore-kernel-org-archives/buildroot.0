From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Oct 2013 21:06:31 +0200
Subject: [Buildroot] [git commit] sqlcipher: needs thread support
Message-ID: <20131005191321.568F39B953@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a9ed103d97cb27ff67eba895ed7d34cd9f716fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/ac4/ac482030479b8172bf45c4f850d9007ec7c95ea5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlcipher/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/sqlcipher/Config.in b/package/sqlcipher/Config.in
index af41eb2..e793019 100644
--- a/package/sqlcipher/Config.in
+++ b/package/sqlcipher/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SQLCIPHER
 	bool "sqlcipher"
 	depends on !BR2_PACKAGE_SQLITE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
 	help
 	  SQLCipher is an SQLite extension that provides 256 bits AES
@@ -27,3 +28,6 @@ config BR2_PACKAGE_SQLCIPHER_STAT3
 
 comment "sqlcipher conflicts with sqlite"
 	depends on BR2_PACKAGE_SQLITE
+
+comment "sqlcipher needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
