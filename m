Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5B4C282DE
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 20:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C27F41763;
	Thu, 13 Mar 2025 20:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WA4ufnf37-u; Thu, 13 Mar 2025 20:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BB93417AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BB93417AB;
	Thu, 13 Mar 2025 20:47:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 616A611A
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42AEF401D8
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2L8W9tPq5cP for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 20:47:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31A49401A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31A49401A2
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:47:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B50387FA9; Thu, 13 Mar 2025 20:47:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Mar 2025 21:12:23 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: fa7d35db4c0f05344f23e0ed0b80ff974c071bef
X-Git-Newrev: 3d6e2e41114d4ce0d1a44dad18a7f609eb4e778c
X-Patchwork-Hint: ignore
Message-Id: <20250313204703.1B50387FA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/jbig2dec: add
 upstream security fix for CVE-2023-46361
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8041665262858739079=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8041665262858739079==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3d6e2e41114d4ce0d1a44dad18a7f609eb4e778c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following security issue:
CVE-2023-46361: Artifex Software jbig2dec v0.20 was discovered to
contain a SEGV vulnerability via jbig2_error at /jbig2dec/jbig2.c.

https://www.cve.org/CVERecord?id=CVE-2023-46361

Note that jbig2dec version 0.19 (used in Buildroot 2024.02.11) is not
officially listed as affected, but it actually has the same bug.

Also note that this CVE is about a crash in the CLI tool only.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
[Julien: add JBIG2DEC_IGNORE_CVES]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 63c2dd2d40186ca6817a5be122a2ba78033f3cfc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...jbig2dec-Avoid-uninitialized-allocator-in.patch | 28 ++++++++++++++++++++++
 package/jbig2dec/jbig2dec.mk                       |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/package/jbig2dec/0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch b/package/jbig2dec/0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch
new file mode 100644
index 0000000000..8331d5f2a4
--- /dev/null
+++ b/package/jbig2dec/0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch
@@ -0,0 +1,28 @@
+From e60a9f388bd5655cb514491ef8d55d403aef0773 Mon Sep 17 00:00:00 2001
+From: Sebastian Rasmussen <sebras@gmail.com>
+Date: Sun, 5 Nov 2023 12:21:52 +0100
+Subject: [PATCH] Bug 705041: jbig2dec: Avoid uninitialized allocator in
+ command-line tool.
+
+Upstream: https://github.com/ArtifexSoftware/jbig2dec/commit/ee53a7e4bc7819d32e8c0b2057885bcc97586bf3
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+---
+ jbig2dec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/jbig2dec.c b/jbig2dec.c
+index 15d204d..1e1dad8 100644
+--- a/jbig2dec.c
++++ b/jbig2dec.c
+@@ -567,7 +567,7 @@ main(int argc, char **argv)
+ {
+     jbig2dec_params_t params;
+     jbig2dec_error_callback_state_t error_callback_state;
+-    jbig2dec_allocator_t allocator_;
++    jbig2dec_allocator_t allocator_ = { 0 };
+     jbig2dec_allocator_t *allocator = &allocator_;
+     Jbig2Ctx *ctx = NULL;
+     FILE *f = NULL, *f_page = NULL;
+-- 
+2.48.1
+
diff --git a/package/jbig2dec/jbig2dec.mk b/package/jbig2dec/jbig2dec.mk
index 8d881136ad..2cc3e5ed4f 100644
--- a/package/jbig2dec/jbig2dec.mk
+++ b/package/jbig2dec/jbig2dec.mk
@@ -14,4 +14,7 @@ JBIG2DEC_INSTALL_STAGING = YES
 # tarball is missing install-sh, install.sh, or shtool
 JBIG2DEC_AUTORECONF = YES
 
+# 0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch
+JBIG2DEC_IGNORE_CVES += CVE-2023-46361
+
 $(eval $(autotools-package))

--===============8041665262858739079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8041665262858739079==--
