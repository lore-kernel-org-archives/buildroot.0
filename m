Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB142C43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 17:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 501A040528;
	Wed,  1 Jul 2026 17:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r01aUBs7AQcL; Wed,  1 Jul 2026 17:57:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BEC140517
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782928642;
	bh=MAVw3fSohJwkFxE5t7HUohcet+i1ZunN0QDURHFZx+g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oisp5X3xezW7RTaqjRYiBVRr0V44M5yMGxXELI4gEmhND/pAnXjygunIFrac+AFCp
	 w9Q2WSoFUK+UhcI3YgmxFvpHCL2LMgDn2jqWZJqzYKj2cO7MA7vroxC0Flx/B/5EOX
	 1Vd0/5/zj+zyVmkyTALLiJPxZXK3QLdqUBaJChmyahLUPNjOvAc+ddtiKhE3fI13iS
	 j7iiZW3DdRmJdQ8oo2jNknkBKzWHO6Hw9TTh5t6BpHy63Mea0pbAd+rYubUVka2K5X
	 ssFcbPwPrq0hRG/4kqSR5JOQljYimRVKzTmOpthhUFEYCqO3FnYlyqyIgiIG8wlWhs
	 5U2v90ViGoIhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BEC140517;
	Wed,  1 Jul 2026 17:57:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF504316
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 17:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C54108227B
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 17:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVbNNlBThH-w for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 17:57:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05FE680E58
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05FE680E58
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 17:57:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F8FA8793A; Wed,  1 Jul 2026 17:56:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jul 2026 19:56:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9030c9a81dc8763b89a4fb9df220dd1aa013cdbc
X-Git-Newrev: cfd7483a26e17ca4ea95793ea7a618c6cc1b1b78
X-Patchwork-Hint: ignore
Message-Id: <20260701175651.6F8FA8793A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_gnupg2: fix runtime
 failure
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cfd7483a26e17ca4ea95793ea7a618c6cc1b1b78
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In the precedent patch "support/testing: test_gnupg2.py: use
assertRunNotOk()" [1] a small typo (OK instead of Ok) was introduced
in the test_gnupg2.py file, which caused a runtime failure.

This patch simply replace "self.assertRunNotOK(cmd)" with
"self.assertRunNotOk(cmd)" to correct this typo.

[1] cb791850ada782beca4b03e26356fd8506912d52

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
[Fiona: fix commit message formatting]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
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
