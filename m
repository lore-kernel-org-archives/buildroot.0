Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88795CF2566
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57E8841A5C;
	Sat, 12 Oct 2024 14:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ze18a_2hgsdP; Sat, 12 Oct 2024 14:07:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DB6041B51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DB6041B51;
	Sat, 12 Oct 2024 14:07:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A84051BF3DA
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7759B40884
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWc5zPA2CKoK for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F8AD40781
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F8AD40781
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:05:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 491CE8285E; Sat, 12 Oct 2024 14:05:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:59:21 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: f0a248e16c58e1d9441d19d9c42f2923603fec8b
X-Git-Newrev: aaabe7720f25e144dc74d52753539d9e1509fff2
X-Patchwork-Hint: ignore
Message-Id: <20241012140531.491CE8285E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x]
 support/testing/tests/package/test_iptables.py: fix 'OUTPUT' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=aaabe7720f25e144dc74d52753539d9e1509fff2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1772ad2f5f34e28bf845c45ce355e888cdea9f63)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_iptables.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
index ee57b31558..924a483ddb 100644
--- a/support/testing/tests/package/test_iptables.py
+++ b/support/testing/tests/package/test_iptables.py
@@ -40,7 +40,7 @@ class TestIptables(infra.basetest.BRTest):
         self.assertRunOk("iptables --version")
 
         # We delete all rules in all chains. We also set default
-        # policies to ACCEPT for INPUT and OUPUT chains. This should
+        # policies to ACCEPT for INPUT and OUTPUT chains. This should
         # already be the case (default Kernel config). This makes sure
         # this test starts from a known state and also those common
         # command invocations works.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
