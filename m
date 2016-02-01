From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 1 Feb 2016 17:20:22 +0100
Subject: [Buildroot] [PATCH] uclibc: update uClibc-ng to 1.0.12
Message-ID: <20160201162022.GA8040@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New release contains a security fix for the resolver library parts.
It contains exp10(), so some patches in buildroot might be obsolete,
when the buildroot toolchains are rebuild.
It also contains a fix for the symbol clashing with bind9.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/Config.in   |    2 +-
 package/uclibc/uclibc.hash |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 1e4d892..b4d7bd8 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -57,7 +57,7 @@ config BR2_USE_UCLIBC_SNAPSHOT
 config BR2_UCLIBC_VERSION_STRING
 	string
 	default "0.9.33.2"	if BR2_UCLIBC_VERSION_0_9_33
-	default "1.0.11"		if BR2_UCLIBC_VERSION_NG
+	default "1.0.12"		if BR2_UCLIBC_VERSION_NG
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 9acb82e..cb95468 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -2,7 +2,7 @@
 sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0.9.33.2.tar.xz
 
 # From http://www.uclibc-ng.org/
-sha256  2fdc6b9015f8049be0eb12a5e3e446de471fb80061115afd8d72ea582cb22b74        uClibc-ng-1.0.11.tar.xz
+sha256  c238b300356b2638432e023076293f29935094108a2714ad1762b76015fae729        uClibc-ng-1.0.12.tar.xz
 
 # No hash for this git snapshot
 none  xxx  uClibc-7bf35c8b7d4a1f97174eb49f47f33946b282114c.tar.gz
-- 
1.7.10.4
