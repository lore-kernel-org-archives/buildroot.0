Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38105C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6E16810E7;
	Fri, 10 Jul 2026 13:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHsJFLSDumvd; Fri, 10 Jul 2026 13:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF81D810E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691097;
	bh=9t6C28/H/Sjj5cS3YJeffLY8tWfPCZm57s73112c6OE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DVd0MmvrO2QYX0rjMDeQ/JWAlBm1JfloXp9sGVO375FGDh8alMGkntKk3j5DUXBnY
	 QkLpTHzzHnKcUKAMwby7VYmew9pURcJd3k2rLm5TRQG9+ar3HFe6t4oAJWPS2oz0PJ
	 9WJ1rEDYj8TSVTCb1FwpRNIoFnWmIA7H4kvPVKx2R4W4vjlHEcDwKxjdjwFhoWJX9D
	 5oKvYxNjZ6NEJB68UUHE4mF0bp1Vqkq7I1aCIGg10g0l4RJgF1Mvemptsw5dJpI1Ze
	 31pw8GBRo0HIQXI23kKYhhJUwsVbHTu9xb2msyKy5kNSUvzswV+owdLCw8Gn5eUrQg
	 a0wuyKzSEpubA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF81D810E8;
	Fri, 10 Jul 2026 13:44:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E4F7A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80D35810B3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gAfJ-YpiFbsI for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A482C81025
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A482C81025
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD0D988674; Fri, 10 Jul 2026 13:44:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:50:34 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: c833ebb3e816ce5b2e63939d1ca272becc200c44
X-Git-Newrev: 055e954cd44233c5249c4b35a1e80cf78f2fbfdb
X-Patchwork-Hint: ignore
Message-Id: <20260710134411.CD0D988674@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/055e954cd44233c5249c4b35a1e80cf78f2fbfdb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
