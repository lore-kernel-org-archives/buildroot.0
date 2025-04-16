Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F56C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FC0460AD8;
	Wed, 16 Apr 2025 21:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3vk6MA7gKxx; Wed, 16 Apr 2025 21:41:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E775A6FBBB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E775A6FBBB;
	Wed, 16 Apr 2025 21:41:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19269159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B4AD6F606
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_ab_k5JmXOf for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:40:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C38A6118B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C38A6118B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:40:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A41783DE6; Wed, 16 Apr 2025 21:40:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 10:45:15 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5c86cfb222fce767b4aa4e96ae0b93f1a941e4dd
X-Git-Newrev: c39f68310214a9604674e7311aa9fa56d1e457a8
X-Patchwork-Hint: ignore
Message-Id: <20250416214041.9A41783DE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/augeas: add
 upstream security fix for CVE-2025-2588
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c39f68310214a9604674e7311aa9fa56d1e457a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes the following security issue:

- CVE-2025-2588: This vulnerability affects the function
    re_case_expand of the file src/fa.c. The manipulation of the
    argument re leads to null pointer dereference

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-2588
  - https://github.com/hercules-team/augeas/commit/af2aa88ab37fc48167d8c5e43b1770a4ba2ff403

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: add patch name in comment near _IGNORE_CVES]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c497e5fcc7b5d6b0877ba0dc557c604dcd194260)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...fic-error-was-set-yet-parse_regexp-failed.patch | 77 ++++++++++++++++++++++
 package/augeas/augeas.mk                           |  3 +
 2 files changed, 80 insertions(+)

diff --git a/package/augeas/0001-CVE-2025-2588-return-_REG_ENOSYS-if-no-specific-error-was-set-yet-parse_regexp-failed.patch b/package/augeas/0001-CVE-2025-2588-return-_REG_ENOSYS-if-no-specific-error-was-set-yet-parse_regexp-failed.patch
new file mode 100644
index 0000000000..0716211387
--- /dev/null
+++ b/package/augeas/0001-CVE-2025-2588-return-_REG_ENOSYS-if-no-specific-error-was-set-yet-parse_regexp-failed.patch
@@ -0,0 +1,77 @@
+From af2aa88ab37fc48167d8c5e43b1770a4ba2ff403 Mon Sep 17 00:00:00 2001
+From: Alexander Bokovoy <abbra@users.noreply.github.com>
+Date: Sun, 30 Mar 2025 12:27:04 +0300
+Subject: [PATCH] CVE-2025-2588: return _REG_ENOSYS if no specific error was
+ set yet parse_regexp failed (#854)
+
+parse_regexp() supposed to set an error on the parser state in case of a
+failure. If no specific error was set, return _REG_ENOSYS to indicate a
+generic failure.
+
+Fixes: https://github.com/hercules-team/augeas/issues/671
+Fixes: https://github.com/hercules-team/augeas/issues/778
+Fixes: https://github.com/hercules-team/augeas/issues/852
+
+Signed-off-by: Alexander Bokovoy <abokovoy@redhat.com>
+
+Upstream: https://github.com/hercules-team/augeas/commit/af2aa88ab37fc48167d8c5e43b1770a4ba2ff403
+CVE: CVE-2025-2588
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+
+---
+ src/fa.c       | 2 ++
+ src/fa.h       | 3 ++-
+ tests/fatest.c | 6 ++++++
+ 3 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/fa.c b/src/fa.c
+index 66ac70784..4de5675b9 100644
+--- a/src/fa.c
++++ b/src/fa.c
+@@ -3550,6 +3550,8 @@ static struct re *parse_regexp(struct re_parse *parse) {
+     return re;
+ 
+  error:
++    if (re == NULL && parse->error == REG_NOERROR)
++        parse->error = _REG_ENOSYS;
+     re_unref(re);
+     return NULL;
+ }
+diff --git a/src/fa.h b/src/fa.h
+index 1fd754ad0..89c9b17e9 100644
+--- a/src/fa.h
++++ b/src/fa.h
+@@ -81,7 +81,8 @@ extern int fa_minimization_algorithm;
+  *
+  * On success, FA points to the newly allocated automaton constructed for
+  * RE, and the function returns REG_NOERROR. Otherwise, FA is NULL, and the
+- * return value indicates the error.
++ * return value indicates the error. Special value _REG_ENOSYS indicates
++ * fa_compile() couldn't identify the syntax issue with regexp.
+  *
+  * The FA is case sensitive. Call FA_NOCASE to switch it to
+  * case-insensitive.
+diff --git a/tests/fatest.c b/tests/fatest.c
+index 0c9ca7696..6717af8f4 100644
+--- a/tests/fatest.c
++++ b/tests/fatest.c
+@@ -589,6 +589,7 @@ static void testExpandNoCase(CuTest *tc) {
+     const char *p1 = "aB";
+     const char *p2 = "[a-cUV]";
+     const char *p3 = "[^a-z]";
++    const char *wrong_regexp = "{&.{";
+     char *s;
+     size_t len;
+     int r;
+@@ -607,6 +608,11 @@ static void testExpandNoCase(CuTest *tc) {
+     CuAssertIntEquals(tc, 0, r);
+     CuAssertStrEquals(tc, "[^A-Za-z]", s);
+     free(s);
++
++    /* Test that fa_expand_nocase does return _REG_ENOSYS */
++    r = fa_expand_nocase(wrong_regexp, strlen(wrong_regexp), &s, &len);
++    CuAssertIntEquals(tc, _REG_ENOSYS, r);
++    free(s);
+ }
+ 
+ static void testNoCaseComplement(CuTest *tc) {
diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
index ac4bc7d0be..e47c485147 100644
--- a/package/augeas/augeas.mk
+++ b/package/augeas/augeas.mk
@@ -14,6 +14,9 @@ AUGEAS_DEPENDENCIES = host-pkgconf readline libxml2
 
 AUGEAS_CONF_OPTS = --disable-gnulib-tests
 
+# 0001-CVE-2025-2588-return-_REG_ENOSYS-if-no-specific-error-was-set-yet-parse_regexp-failed.patch
+AUGEAS_IGNORE_CVES += CVE-2025-2588
+
 # Remove the test lenses which occupy about 1.4 MB on the target
 define AUGEAS_REMOVE_TEST_LENSES
 	rm -rf $(TARGET_DIR)/usr/share/augeas/lenses/dist/tests
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
