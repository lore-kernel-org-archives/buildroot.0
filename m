Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765C5C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CE25400E9;
	Sun,  9 Jan 2022 11:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hbhqbBtK4x78; Sun,  9 Jan 2022 11:02:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB99C4047C;
	Sun,  9 Jan 2022 11:02:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E7811BF4DD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AD8780BCF
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jFdyGvGBRrpt for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:02:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4574A8139A
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:02:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E141C82A91; Sun,  9 Jan 2022 10:56:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 12:02:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eeace1cc13ce09a0c88ce177465b836d6eb58298
X-Git-Newrev: b0a7bffad9e041d9920171802621b67903f9389e
X-Patchwork-Hint: ignore
Message-Id: <20220109105604.E141C82A91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mongrel2: bump to version 1.13.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b0a7bffad9e041d9920171802621b67903f9389e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop third patch (already in version)
- Drop fourth patch (not needed since
  https://github.com/mongrel2/mongrel2/commit/8a6db3beb32da1d66757a746f440d92edff166f9)

https://github.com/mongrel2/mongrel2/blob/v1.13.0/changelog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...definition-error-when-building-with-gcc10.patch |  25 -----
 .../0004-Support-urandom-inside-chroot.patch       | 113 ---------------------
 package/mongrel2/mongrel2.hash                     |   4 +-
 package/mongrel2/mongrel2.mk                       |   2 +-
 4 files changed, 3 insertions(+), 141 deletions(-)

diff --git a/package/mongrel2/0003-fix-multiple-definition-error-when-building-with-gcc10.patch b/package/mongrel2/0003-fix-multiple-definition-error-when-building-with-gcc10.patch
deleted file mode 100644
index e1b5788494..0000000000
--- a/package/mongrel2/0003-fix-multiple-definition-error-when-building-with-gcc10.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From c51815b10c39c6e802bd1b56549f1d479b480fcc Mon Sep 17 00:00:00 2001
-From: Andrew Sun <adsun701@gmail.com>
-Date: Sat, 18 Jul 2020 09:11:11 -0400
-Subject: [PATCH] fix multiple definition error when building with gcc10
-
-[Retrieved from:
-https://github.com/mongrel2/mongrel2/pull/343/commits/c51815b10c39c6e802bd1b56549f1d479b480fcc]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/unixy.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/unixy.h b/src/unixy.h
-index 045e7c28..4225220c 100644
---- a/src/unixy.h
-+++ b/src/unixy.h
-@@ -38,7 +38,7 @@
- #include <bstring.h>
- #include <unistd.h>
- 
--char *m2program;
-+extern char *m2program;
- 
- int Unixy_chroot(bstring path);
- 
diff --git a/package/mongrel2/0004-Support-urandom-inside-chroot.patch b/package/mongrel2/0004-Support-urandom-inside-chroot.patch
deleted file mode 100644
index 468ddb83fe..0000000000
--- a/package/mongrel2/0004-Support-urandom-inside-chroot.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 330e8c8352eb0ed3c178ac6e0102403c0a835492 Mon Sep 17 00:00:00 2001
-From: Jason Miller <jason@milr.com>
-Date: Thu, 5 Jul 2018 20:53:51 -0700
-Subject: [PATCH] Support urandom inside chroot
-
-This adds a new default entropy function that uses a /dev/urandom stream
-opened before the chroot.  If initializing that fails, it fallsback on
-HAVEGE only if HAVEGE is supported by the mbedTLS.
-
-This should remove the hard requirement on HAVEGE
-
-resolves #326
-resolves #327
-
-[Upstream status: https://github.com/mongrel2/mongrel2/pull/328]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/mongrel2.c |  7 -------
- src/server.c   | 36 +++++++++++++++++++++++-------------
- 2 files changed, 23 insertions(+), 20 deletions(-)
-
-diff --git a/src/mongrel2.c b/src/mongrel2.c
-index da632d95..48ece8a5 100644
---- a/src/mongrel2.c
-+++ b/src/mongrel2.c
-@@ -404,13 +404,6 @@ void taskmain(int argc, char **argv)
-     rc = attempt_chroot_drop(srv);
-     check(rc == 0, "Major failure in chroot/droppriv, aborting."); 
- 
--    // set up rng after chroot
--    // TODO: once mbedtls is updated, we can move this back into Server_create
--    if(srv->use_ssl) {
--        rc = Server_init_rng(srv);
--        check(rc == 0, "Failed to initialize rng for server %s", bdata(srv->uuid));
--    }
--
-     final_setup();
- 
-     taskcreate(tickertask, NULL, TICKER_TASK_STACK);
-diff --git a/src/server.c b/src/server.c
-index 45761db4..e44e199b 100644
---- a/src/server.c
-+++ b/src/server.c
-@@ -149,35 +149,45 @@ static int Server_load_ciphers(Server *srv, bstring ssl_ciphers_val)
-     return -1;
- }
- 
-+static int urandom_entropy_func(void *data, unsigned char *output, size_t len)
-+{
-+    FILE* urandom = (FILE *)data;
-+    size_t rc = fread(output, 1, len, urandom);
-+
-+    if (rc != len) return MBEDTLS_ERR_ENTROPY_SOURCE_FAILED;
-+
-+    return 0;
-+}
-+
- int Server_init_rng(Server *srv)
- {
-     int rc;
--    unsigned char buf[MBEDTLS_ENTROPY_BLOCK_SIZE];
-     void *ctx = NULL;
- 
--    mbedtls_entropy_init( &srv->entropy );
-+    FILE *urandom = fopen("/dev/urandom","r");
- 
--    // test the entropy source
--    rc = mbedtls_entropy_func(&srv->entropy, buf, MBEDTLS_ENTROPY_BLOCK_SIZE);
--
--    if(rc == 0) {
-+    if(urandom != NULL) {
-         ctx = calloc(sizeof(mbedtls_ctr_drbg_context), 1);
- 
-         mbedtls_ctr_drbg_init((mbedtls_ctr_drbg_context *)ctx);
-         rc = mbedtls_ctr_drbg_seed((mbedtls_ctr_drbg_context *)ctx,
--            mbedtls_entropy_func, &srv->entropy, NULL, 0);
-+            urandom_entropy_func, urandom, NULL, 0);
-         check(rc == 0, "Init rng failed: ctr_drbg_init returned %d\n", rc);
- 
-         srv->rng_func = mbedtls_ctr_drbg_random;
-         srv->rng_ctx = ctx;
-     } else {
--        log_warn("entropy source unavailable. falling back to havege rng");
- 
-+#if defined(MBEDTLS_HAVEGE_C)
-+        log_warn("entropy source unavailable. falling back to havege rng");
-         ctx = calloc(sizeof(mbedtls_havege_state), 1);
-         mbedtls_havege_init((mbedtls_havege_state *)ctx);
--
-         srv->rng_func = mbedtls_havege_random;
-         srv->rng_ctx = ctx;
-+#else
-+        log_err("Unable to initialize urandom entropy source, and mbedTLS compiled without HAVEGE");
-+        goto error;
-+#endif
-     }
- 
-     return 0;
-@@ -278,10 +288,10 @@ Server *Server_create(bstring uuid, bstring default_host,
- 
-     // TODO: once mbedtls supports opening urandom early and keeping it open,
-     //   put the rng initialization back here (before chroot)
--    //if(use_ssl) {
--    //    rc = Server_init_rng(srv);
--    //    check(rc == 0, "Failed to initialize rng for server %s", bdata(uuid));
--    //}
-+    if(use_ssl) {
-+        rc = Server_init_rng(srv);
-+        check(rc == 0, "Failed to initialize rng for server %s", bdata(uuid));
-+    }
- 
-     if(blength(chroot) > 0) {
-         srv->chroot = bstrcpy(chroot); check_mem(srv->chroot);
diff --git a/package/mongrel2/mongrel2.hash b/package/mongrel2/mongrel2.hash
index ea3a1cb426..f4f094ea03 100644
--- a/package/mongrel2/mongrel2.hash
+++ b/package/mongrel2/mongrel2.hash
@@ -1,6 +1,6 @@
 # From https://mongrel2.org
-sha1  6f81fa747a1e198d1a655c3677b6de686a5a51f7  mongrel2-v1.12.2.tar.bz2
+sha1  6057f9cbfae41e2cdef1e0f715df3c1a4d3a1884  mongrel2-v1.13.0.tar.bz2
 
 # Locally computed
-sha256  3bffeae198c37a1efc9c12f77d5f1eb61cdf62b35d661babc2527dd030aa7d8f  mongrel2-v1.12.2.tar.bz2
+sha256  b6f1f50c9f65b605342d8792b1cc8a1c151105339030313b9825b6a68d400c10  mongrel2-v1.13.0.tar.bz2
 sha256  eb6e2a2baa637d06f6aa762886fbc8939934eb5fdb0b3a5b3882f2a61e9a4357  LICENSE
diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
index cbe7e3fb91..07914ad0fe 100644
--- a/package/mongrel2/mongrel2.mk
+++ b/package/mongrel2/mongrel2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGREL2_VERSION = 1.12.2
+MONGREL2_VERSION = 1.13.0
 MONGREL2_SOURCE = mongrel2-v$(MONGREL2_VERSION).tar.bz2
 # Do not use the github helper here, the generated tarball is *NOT* the same
 # as the one uploaded by upstream for the release.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
