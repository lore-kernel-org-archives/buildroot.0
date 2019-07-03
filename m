From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 4 Jul 2019 01:01:54 +0200
Subject: [Buildroot] [git commit] package/nettle: bump version to 3.5.1
Message-ID: <20190703230713.B9BDD87FED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a63bd6a02c564582d30a7c9d32063be5054dafd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
http://lists.lysator.liu.se/pipermail/nettle-bugs/2019/007593.html

Removed patch which was applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-Fix-accidental-use-of-C99-for-loop.patch  | 71 ----------------------
 package/nettle/nettle.hash                         |  4 +-
 package/nettle/nettle.mk                           |  2 +-
 3 files changed, 3 insertions(+), 74 deletions(-)

diff --git a/package/nettle/0001-Fix-accidental-use-of-C99-for-loop.patch b/package/nettle/0001-Fix-accidental-use-of-C99-for-loop.patch
deleted file mode 100644
index e03af7a45a..0000000000
--- a/package/nettle/0001-Fix-accidental-use-of-C99-for-loop.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From f5a3a224bf00bef5669366d2ae23c2b2b13b8016 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Niels=20M=C3=B6ller?= <nisse@lysator.liu.se>
-Date: Wed, 26 Dec 2018 11:04:31 +0100
-Subject: [PATCH] Fix accidental use of C99 for loop.
-
-* rsa-sign-tr.c (sec_equal): Fix accidental use of C99 for loop.
-Reported by Andreas Gustafsson.
-* testsuite/rsa-sec-decrypt-test.c (test_main): Likewise.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://git.lysator.liu.se/nettle/nettle/commit/f5a3a224bf00bef5669366d2ae23c2b2b13b8016]
----
- ChangeLog                        | 6 ++++++
- rsa-sign-tr.c                    | 3 ++-
- testsuite/rsa-sec-decrypt-test.c | 3 ++-
- 3 files changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index 4c7338a1..079d0153 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,9 @@
-+2018-12-26  Niels M??ller  <nisse@lysator.liu.se>
-+
-+	* rsa-sign-tr.c (sec_equal): Fix accidental use of C99 for loop.
-+	Reported by Andreas Gustafsson.
-+	* testsuite/rsa-sec-decrypt-test.c (test_main): Likewise.
-+
- 2018-12-04  Niels M??ller  <nisse@lysator.liu.se>
- 
- 	* Released nettle-3.4.1.
-diff --git a/rsa-sign-tr.c b/rsa-sign-tr.c
-index 59c9bd07..f824c4ca 100644
---- a/rsa-sign-tr.c
-+++ b/rsa-sign-tr.c
-@@ -239,8 +239,9 @@ static int
- sec_equal(const mp_limb_t *a, const mp_limb_t *b, size_t limbs)
- {
-   volatile mp_limb_t z = 0;
-+  size_t i;
- 
--  for (size_t i = 0; i < limbs; i++)
-+  for (i = 0; i < limbs; i++)
-     {
-       z |= (a[i] ^ b[i]);
-     }
-diff --git a/testsuite/rsa-sec-decrypt-test.c b/testsuite/rsa-sec-decrypt-test.c
-index 64f0b13c..fb0ed3a1 100644
---- a/testsuite/rsa-sec-decrypt-test.c
-+++ b/testsuite/rsa-sec-decrypt-test.c
-@@ -68,6 +68,7 @@ test_main(void)
-   unsigned n_size = 1024;
-   mpz_t gibberish;
-   mpz_t garbage;
-+  size_t size;
- 
-   rsa_private_key_init(&key);
-   rsa_public_key_init(&pub);
-@@ -78,7 +79,7 @@ test_main(void)
- 
-   memset(verifybad, 'A', PAYLOAD_SIZE);
- 
--  for (size_t size = 1; size < 51; size++)
-+  for (size = 1; size < 51; size++)
-     {
-       ASSERT (rsa_generate_keypair(&pub, &key, &random_ctx,
- 			           (nettle_random_func *) knuth_lfib_random,
--- 
-2.18.1
-
diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
index 32ed22c6c7..1e13aab411 100644
--- a/package/nettle/nettle.hash
+++ b/package/nettle/nettle.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/nettle/nettle-3.4.1.tar.gz.sig
-sha256	f941cf1535cd5d1819be5ccae5babef01f6db611f9b5a777bae9c7604b8a92ad	nettle-3.4.1.tar.gz
+# https://ftp.gnu.org/gnu/nettle/nettle-3.5.1.tar.gz.sig
+sha256	75cca1998761b02e16f2db56da52992aef622bf55a3b45ec538bc2eedadc9419	nettle-3.5.1.tar.gz
 # Locally calculated
 sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c	COPYING.LESSERv3
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYINGv2
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 6a1144ed39..380d167521 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 3.4.1
+NETTLE_VERSION = 3.5.1
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
