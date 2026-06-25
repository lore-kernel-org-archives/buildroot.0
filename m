Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623BFC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0039F410F9;
	Fri, 26 Jun 2026 14:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zWd2W0dl3hK; Fri, 26 Jun 2026 14:52:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F09B4113F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485520;
	bh=Rf6TEMc1h0lBr72vTp2b20z6hmdIJwZ8R8ll/lIW/is=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jhCSVoG/M0USRLb98/lSwZ3zrvxZ3Eq2A/5jsq01bhtI4T1C4rMk8WEqqtERRVFfQ
	 J1RzpgLoT3R2wL+ZS+/kKQUvaYRm+rWjUacgROp1mwM+gfOoAgBU01oICqRANBrlTN
	 s5fDQukJ4h/NvqMPksmuFmqKmrN05YGGt2Uce+dm/BfYCPkdZXce06PButG72VKA9a
	 MKg+P/8fyk61i0TrzPkD5aY51sab21AtbCARoYTzEZ6eItDP4NKKKVOKEzaOXke272
	 eKfusVVsAB2cz6EfnLeUCwQdijPaI0fGnjs2LImQxnnGhf+tCUZGifVxpCyaOf1KCZ
	 mAdVDelNFG6cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F09B4113F;
	Fri, 26 Jun 2026 14:52:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B18F33A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2BBD60F8F
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Plnai94qfXs8 for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5737D60F30
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5737D60F30
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57392864B9; Fri, 26 Jun 2026 14:51:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:35:35 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 21bb39308fc64ba145f56e0be236afbb17361631
X-Git-Newrev: 4f342f960d3a32580df4b7c57dd8b9a5afdcffb5
X-Patchwork-Hint: ignore
Message-Id: <20260626145111.57392864B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 test_connman.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4f342f960d3a32580df4b7c57dd8b9a5afdcffb5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2889d0f05277cf22fe10268026aa2f551739e2a9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_connman.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_connman.py b/support/testing/tests/package/test_connman.py
index 6fef95104c..2e53135208 100644
--- a/support/testing/tests/package/test_connman.py
+++ b/support/testing/tests/package/test_connman.py
@@ -47,8 +47,7 @@ class TestConnMan(infra.basetest.BRTest):
 
         # If we try to ping again the qemu gateway,
         # it should now fail.
-        _, ret = self.emulator.run(ping_cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(ping_cmd)
 
         # We ask connman to re-enable Ethernet.
         self.assertRunOk("connmanctl enable ethernet")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
