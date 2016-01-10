From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 10 Jan 2016 18:58:06 +0100
Subject: [Buildroot] [PATCH] uclibc: update uClibc-ng to latest version
	1.0.11
Message-ID: <20160110175806.GA23441@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to 1.0.11. Contains a lot of bugfixes
and some new features:
 * mips{32r6,64r6} enablement
 * argp support
 * support for very simple /etc/gai.conf
 * Xtensa nommu vfork fix
 * systemd portability fixes

Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>

---
 package/uclibc/Config.in   |    2 +-
 package/uclibc/uclibc.hash |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 9ebec70..1e4d892 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -57,7 +57,7 @@ config BR2_USE_UCLIBC_SNAPSHOT
 config BR2_UCLIBC_VERSION_STRING
 	string
 	default "0.9.33.2"	if BR2_UCLIBC_VERSION_0_9_33
-	default "1.0.9"		if BR2_UCLIBC_VERSION_NG
+	default "1.0.11"		if BR2_UCLIBC_VERSION_NG
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 00e3389..9acb82e 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -2,7 +2,7 @@
 sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0.9.33.2.tar.xz
 
 # From http://www.uclibc-ng.org/
-sha256  08be8dd22ac0c3806add88b813129fb3014437eddc9d78fc73eba7f33c4b4a9d        uClibc-ng-1.0.9.tar.xz
+sha256  2fdc6b9015f8049be0eb12a5e3e446de471fb80061115afd8d72ea582cb22b74        uClibc-ng-1.0.11.tar.xz
 
 # No hash for this git snapshot
 none  xxx  uClibc-7bf35c8b7d4a1f97174eb49f47f33946b282114c.tar.gz
-- 
1.7.10.4
