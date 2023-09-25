Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1198CE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 05:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DA5281F18;
	Mon, 25 Sep 2023 05:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DA5281F18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yPEhJymIwaZv; Mon, 25 Sep 2023 05:43:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 928F681E9C;
	Mon, 25 Sep 2023 05:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 928F681E9C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BAA81BF3BB
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 05:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEA9A81EC1
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 05:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEA9A81EC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ikgdOFW0arH7 for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 05:42:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6CF481EB4
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 05:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6CF481EB4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5201876D5; Mon, 25 Sep 2023 05:42:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 07:39:06 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 7acbed476342f10523f6b54e14f71814b230a5a2
X-Git-Newrev: 0bc624c6cc2a65926a3b847f7e1d423ce6ed1ad3
X-Patchwork-Hint: ignore
Message-Id: <20230925054203.D5201876D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/ghostscript:
 security bump to version 10.02.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bc624c6cc2a65926a3b847f7e1d423ce6ed1ad3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

- Fix CVE-2023-36664: Artifex Ghostscript through 10.01.2 mishandles
  permission validation for pipe devices (with the %pipe% prefix or the |
  pipe character prefix).
- Fix CVE-2023-38559: A buffer overflow flaw was found in
  base/gdevdevn.c:1973 in devn_pcx_write_rle() in ghostscript. This
  issue may allow a local attacker to cause a denial of service via
  outputting a crafted PDF file for a DEVN device with gs.
- Fix CVE-2023-38560: An integer overflow flaw was found in
  pcl/pl/plfont.c:418 in pl_glyph_name in ghostscript. This issue may
  allow a local attacker to cause a denial of service via transforming a
  crafted PCL file to PDF format.

https://ghostscript.readthedocs.io/en/gs10.02.0/News.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 93ef6997aeef443336651dab46b31ff87be07860)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-build-without-BUILD_PDF.patch         | 34 ++++++++++++++++++++++
 package/ghostscript/ghostscript.hash               |  4 +--
 package/ghostscript/ghostscript.mk                 |  2 +-
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch b/package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch
new file mode 100644
index 0000000000..af69cd3670
--- /dev/null
+++ b/package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch
@@ -0,0 +1,34 @@
+From 088f3cd6e58cff5fa51e072d1829f7691a5f6681 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 20 Sep 2023 13:44:28 +0100
+Subject: [PATCH] Fix build without BUILD_PDF
+
+The PDFSetParams PostScript extension operator was missing a stub function definition
+when the PDF interpreter is not built in.
+
+ Author:    Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=088f3cd6e58cff5fa51e072d1829f7691a5f6681
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ psi/zpdfops.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/psi/zpdfops.c b/psi/zpdfops.c
+index e7e0a42ee..271687a18 100644
+--- a/psi/zpdfops.c
++++ b/psi/zpdfops.c
+@@ -1507,6 +1507,11 @@ static int zPDFdrawannots(i_ctx_t *i_ctx_p)
+     return_error(gs_error_undefined);
+ }
+ 
++static int zPDFSetParams(i_ctx_t *i_ctx_p)
++{
++    return_error(gs_error_undefined);
++}
++
+ static int zPDFInit(i_ctx_t *i_ctx_p)
+ {
+     return_error(gs_error_undefined);
+-- 
+2.34.1
+
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 2e4b6ac750..77c8faccbe 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10012/SHA512SUMS
-sha512  ee20f0e12f553a3d04578e71a0d45defebc71117ce4dc2c14043985bfe7348ad7f8b2fe98fc9b4f5b935ecb32e50dc340be67d6ef58190542ec6d0f9da1de380  ghostscript-10.01.2.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10020/SHA512SUMS
+sha512  c49344151063e915add55a0a842c2a645d8362a5cbca663bd07638f4bd3699a08cade37a9efe905ad5a41e014353e5e1b1268b7925e43128ad30d5b031396b71  ghostscript-10.02.0.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 8a39d4b695..161521f970 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.01.2
+GHOSTSCRIPT_VERSION = 10.02.0
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
