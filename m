Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1041CF9C69
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 21:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F5664187F;
	Fri, 20 Sep 2024 21:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgNeNqW7JzE4; Fri, 20 Sep 2024 21:09:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AD4C4188E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AD4C4188E;
	Fri, 20 Sep 2024 21:09:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 784821BF5A6
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 21:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55FB181583
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 21:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DPfvOk8zaTXT for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 21:08:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 75A7681518
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75A7681518
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75A7681518
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 21:08:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58AA620005;
 Fri, 20 Sep 2024 21:08:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1srkrw-00HAr1-2y;
 Fri, 20 Sep 2024 23:08:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 23:08:32 +0200
Message-Id: <20240920210836.4093091-14-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240920210836.4093091-1-peter@korsgaard.com>
References: <20240920210836.4093091-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 14/17]
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
