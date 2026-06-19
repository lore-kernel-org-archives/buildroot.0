Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5335FCDB46C
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A42442E68;
	Fri, 19 Jun 2026 09:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CIRiYhAiolG0; Fri, 19 Jun 2026 09:05:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 478B142E33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859936;
	bh=m7b746RfKpCnId8Trd/cP2/Cb48cUSy7roXBc06H7O0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X19JWqMWezYSq/lD0rqs7UDa1vlxaS7iGz5nQXYA62qr0xP422f/s/d55THEjNh7b
	 4uQbmwRt1sSEwsrdmbnXtAT7zlCvjB4I1lbur6p0Xmoa8+KjYV6tQox+/o0YtD3DaS
	 KyQhmO1toAiNjxLJQ77VB34P/HfSSqSG6peJiyh4hcSkfNjrrIYvCLP+LYgeNmZF87
	 hp23ompF4BI+8xCzfUwRGOFiUAkiwIqbeMk6aevPsqi/GDOd7b7l8nuoYwt76hkXeZ
	 0lMb1ITmj/DPDLq9wkhb05vgh23pi2Ap9x7zk/3QHvpKFFcVQp15nDDNhbgQUMk/o8
	 Lv5MG+9XdSVIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 478B142E33;
	Fri, 19 Jun 2026 09:05:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17350D06
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B058584C35
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kEcKlWBFJp6M for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D705E84BE9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D705E84BE9
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60BA08162E; Fri, 19 Jun 2026 09:04:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:03:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e04f8f21f2770d5e2205f4afa44831d23e05982
X-Git-Newrev: 8ffa0905607e7b642b30bcc6bb54b5feb5426704
X-Patchwork-Hint: ignore
Message-Id: <20260619090447.60BA08162E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_weston.py: use
 assertRunNotOk()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8ffa0905607e7b642b30bcc6bb54b5feb5426704
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_weston.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
index c8b243a6a7..737015f8c4 100644
--- a/support/testing/tests/package/test_weston.py
+++ b/support/testing/tests/package/test_weston.py
@@ -150,5 +150,4 @@ class TestWeston(infra.basetest.BRTest, GraphicsBase):
 
         # Now weston is supposed to be stopped,
         # a simple client is expected to fail.
-        _, exit_code = self.emulator.run("wayland-info")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("wayland-info")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
