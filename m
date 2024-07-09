Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C318DC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 06:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FD8160E81;
	Tue,  9 Jul 2024 06:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqOcxvqlpCoh; Tue,  9 Jul 2024 06:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 547DB60E7A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 547DB60E7A;
	Tue,  9 Jul 2024 06:34:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6B171BF980
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 06:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B23E86077F
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 06:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMmHL5GdemhX for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 06:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEB4B60782
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEB4B60782
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 06:33:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB8BE842C8; Tue,  9 Jul 2024 06:33:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 08:33:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61fc8632d389a9464132c40b75eeafa6b1393d44
X-Git-Newrev: 515e579567a8e44e8e4c537ba10f49d5b5d732d9
X-Patchwork-Hint: ignore
Message-Id: <20240709063358.CB8BE842C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ghostscript: security bump version
 to 10.03.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=515e579567a8e44e8e4c537ba10f49d5b5d732d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2024-33869, CVE-2023-52722, CVE-2024-33870, CVE-2024-33871
and CVE-2024-29510.

Release notes:
https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/tag/gs10031

Remove patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-build-without-BUILD_PDF.patch         | 34 ----------------------
 package/ghostscript/ghostscript.hash               |  4 +--
 package/ghostscript/ghostscript.mk                 |  2 +-
 3 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch b/package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch
deleted file mode 100644
index af69cd3670..0000000000
--- a/package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 088f3cd6e58cff5fa51e072d1829f7691a5f6681 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 20 Sep 2023 13:44:28 +0100
-Subject: [PATCH] Fix build without BUILD_PDF
-
-The PDFSetParams PostScript extension operator was missing a stub function definition
-when the PDF interpreter is not built in.
-
- Author:    Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=088f3cd6e58cff5fa51e072d1829f7691a5f6681
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- psi/zpdfops.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/psi/zpdfops.c b/psi/zpdfops.c
-index e7e0a42ee..271687a18 100644
---- a/psi/zpdfops.c
-+++ b/psi/zpdfops.c
-@@ -1507,6 +1507,11 @@ static int zPDFdrawannots(i_ctx_t *i_ctx_p)
-     return_error(gs_error_undefined);
- }
- 
-+static int zPDFSetParams(i_ctx_t *i_ctx_p)
-+{
-+    return_error(gs_error_undefined);
-+}
-+
- static int zPDFInit(i_ctx_t *i_ctx_p)
- {
-     return_error(gs_error_undefined);
--- 
-2.34.1
-
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 849f6c64ba..ed8e4cf7d9 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10021/SHA512SUMS
-sha512  ee0f754c1bd8a18428ad14eaa3ead80ff8b96275af5012e7a8384f1f10490da056eec9ae3cc791a7a13a24e16e54df5bccdd109c7d53a14534bbd7360a300b11  ghostscript-10.02.1.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10031/SHA512SUMS
+sha512  59e071cd23aed246b51317d3cccd9ccf8e1e84c4ecf9b22fb938e561eff42cec61915b0bdd96a313a3ea27750579c54ca0d0862b65edd306a621731c0063ffd3  ghostscript-10.03.1.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index da23ebbadb..80e2543d1c 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.02.1
+GHOSTSCRIPT_VERSION = 10.03.1
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
