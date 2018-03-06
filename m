From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Mar 2018 15:44:18 +0100
Subject: [Buildroot] [git commit] ipset: bump to version 6.36
Message-ID: <20180306144437.8F65382531@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74295b02d4b380e5267357be0ae1281c7410cdc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-last-reference-to-u_int8_t-with-uint8_t.patch | 28 ----------------------
 package/ipset/ipset.hash                           |  6 ++---
 package/ipset/ipset.mk                             |  2 +-
 3 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/package/ipset/0001-Replace-the-last-reference-to-u_int8_t-with-uint8_t.patch b/package/ipset/0001-Replace-the-last-reference-to-u_int8_t-with-uint8_t.patch
deleted file mode 100644
index 84863e6e13..0000000000
--- a/package/ipset/0001-Replace-the-last-reference-to-u_int8_t-with-uint8_t.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a4212bf911026740afc7fce98d9100e2ef5dcea0 Mon Sep 17 00:00:00 2001
-From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
-Date: Tue, 26 Sep 2017 07:00:13 +0200
-Subject: [PATCH] Replace the last reference to u_int8_t with uint8_t.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit a4212bf911026740
-
- src/ipset.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/ipset.c b/src/ipset.c
-index 79f56b869ea7..df0778a92d8b 100644
---- a/src/ipset.c
-+++ b/src/ipset.c
-@@ -282,7 +282,7 @@ call_parser(int *argc, char *argv[], const struct ipset_type *type,
- 	const struct ipset_arg *arg;
- 	const char *optstr;
- 	const struct ipset_type *t = type;
--	u_int8_t revision = type->revision;
-+	uint8_t revision = type->revision;
- 	int ret = 0, i = 1;
- 
- 	/* Currently CREATE and ADT may have got additional arguments */
--- 
-2.14.2
-
diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index dcd709e8c1..9185d94d85 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,6 +1,6 @@
-# From http://ftp.netfilter.org/pub/ipset/ipset-6.34.tar.bz2.md5sum.txt
-md5 51bd03f976a1501fd45e1d71a1e2e6bf  ipset-6.34.tar.bz2
+# From http://ftp.netfilter.org/pub/ipset/ipset-6.36.tar.bz2.md5sum.txt
+md5 fda041afefd581464e445b87beeb0681  ipset-6.36.tar.bz2
 # Calculated based on the hash above
-sha256 d70e831b670b7aa25dde81fd994d3a7ce0c0e801559a557105576df66cd8d680  ipset-6.34.tar.bz2
+sha256 22224a90dc6c7d97b7a7addedd0740c3841e3d9a7ff8c8d2123bae0c3620d30d  ipset-6.36.tar.bz2
 # Locally calculated
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index d7299568e5..e9f8165fab 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 6.34
+IPSET_VERSION = 6.36
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
