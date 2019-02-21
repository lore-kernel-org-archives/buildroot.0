From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 11:43:50 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/sqlcipher: force
 libopenssl
Message-ID: <20190221104213.179B781569@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a7ad24530b620d028a12bb3f93420c2d81ea072
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

v3.2.0 has a bug in the configure step which causes it to fail when being
built against libressl. As libopenssl is selected as the default, the
autobuilders have not uncovered this failure. The issue has been confirmed
in LTS 2018.02.10 (probably broken prior to that as well) and is not
related to the Openssl bump to 1.1.x.

Thread with more details
http://lists.busybox.net/pipermail/buildroot/2019-February/243133.html

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 886f3109a55dccab3fac884d5f0fecd767edd4f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlcipher/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sqlcipher/Config.in b/package/sqlcipher/Config.in
index 332754b15a..b26bc7709f 100644
--- a/package/sqlcipher/Config.in
+++ b/package/sqlcipher/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SQLCIPHER
 	depends on !BR2_PACKAGE_SQLITE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  SQLCipher is an SQLite extension that provides 256 bits AES
 	  encryption of database files. Note that it is a fork of
