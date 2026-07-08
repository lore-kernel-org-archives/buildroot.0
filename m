Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52551C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D32F940924;
	Fri, 10 Jul 2026 13:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9smSPlsGFhzs; Fri, 10 Jul 2026 13:42:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6BF64095B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783690979;
	bh=nC6dTsH8XlDm5HABg/gsNw9+Vnut9YduNiNuxAGzyUs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=av099LzLYGmRJDXoWMjE39AWsWBCdlXfdzowGsDpvlJLiN6EqOrDuYcvBkQ2DIbjy
	 a8cqDbtXTVIVFj8aHZt2rQ98JfwO7zzvvriR85jtlGqRA7ISAk3fJJnAHbvO3+RiaV
	 ESzK4S/8iEX0dH+1VNEIwtycEChGKKjCC4eur6h78VkEisvDRa01FeQRbO1GwxnyCR
	 VQiS1OA3/7w8EGUvcYIUowDIEaOIUgY+l59Pvsmvxl6iGGNbzt3d9/gVYs04fO+i3P
	 STRJ+muzdbSejvJCBWiwC0V2Lo4z15f2nSYq5beg7NmU+J3XE8YyL/QGs49WLPC4Up
	 i1Y89ZoowtpIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6BF64095B;
	Fri, 10 Jul 2026 13:42:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF294A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B100D408F0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IiO-_eOx-0rW for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E04E7408F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E04E7408F3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21BCD88678; Fri, 10 Jul 2026 13:42:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:50:31 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0c13eee22f40f40a407bb88410c90989583fc02e
X-Git-Newrev: 70864c5c81e4123454a999adb1704b98397a39f8
X-Patchwork-Hint: ignore
Message-Id: <20260710134217.21BCD88678@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_gnupg2: fix runtime failure
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/70864c5c81e4123454a999adb1704b98397a39f8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

In the precedent patch "support/testing: test_gnupg2.py: use
assertRunNotOk()" [1] a small typo (OK instead of Ok) was introduced
in the test_gnupg2.py file, which caused a runtime failure.

This patch simply replace "self.assertRunNotOK(cmd)" with
"self.assertRunNotOk(cmd)" to correct this typo.

[1] cb791850ada782beca4b03e26356fd8506912d52

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
[Fiona: fix commit message formatting]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit cfd7483a26e17ca4ea95793ea7a618c6cc1b1b78)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_gnupg2.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_gnupg2.py b/support/testing/tests/package/test_gnupg2.py
index 6f862c31ce..c8fb029c95 100644
--- a/support/testing/tests/package/test_gnupg2.py
+++ b/support/testing/tests/package/test_gnupg2.py
@@ -108,4 +108,4 @@ class TestGnupg2(infra.basetest.BRTest):
         self.assertRunNotOk(cmd)
 
         cmd = "gpg --armor --verify {}".format(asc_file)
-        self.assertRunNotOK(cmd)
+        self.assertRunNotOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
