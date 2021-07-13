Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23460C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:08:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC60860F94
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC60860F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B330D42422;
	Wed,  4 Aug 2021 00:08:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iO8GTPjHa4NL; Wed,  4 Aug 2021 00:08:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4A3242429;
	Wed,  4 Aug 2021 00:08:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FBC71BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2331440E89
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AVS74e2amx3R for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D87BB406BC
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 279C487F55; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 13 Jul 2021 21:52:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5b88a0a57a9a590427d03719777c46f7ea5a6c43
X-Git-Newrev: aeb320899fa46565e174846bb42dad71a4cdcb22
X-Patchwork-Hint: ignore
Message-Id: <20210803211001.279C487F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] rtl8189fs: disable debug
 messages
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=aeb320899fa46565e174846bb42dad71a4cdcb22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Debug messages in rtl8189fs are enabled by default. Add patch
that disables debug messages to make driver less noisy.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-include-disable-debug-messages.patch      | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/rtl8189fs/0001-include-disable-debug-messages.patch b/package/rtl8189fs/0001-include-disable-debug-messages.patch
new file mode 100644
index 0000000000..532982b1d3
--- /dev/null
+++ b/package/rtl8189fs/0001-include-disable-debug-messages.patch
@@ -0,0 +1,28 @@
+From 5d3a44ff1aeb8ace6e08df3cad16102aaac1ef09 Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Sun, 13 Jun 2021 15:51:51 +0300
+Subject: [PATCH] include: disable debug messages
+
+Disable debug messages to make rtl8189fs driver less noisy.
+
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ include/autoconf.h | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/include/autoconf.h b/include/autoconf.h
+index 44efe42..b5df57b 100644
+--- a/include/autoconf.h
++++ b/include/autoconf.h
+@@ -224,8 +224,6 @@
+ /*
+  * Debug Related Config
+  */
+-#define CONFIG_DEBUG /* DBG_871X, etc... */
+-
+ #ifdef CONFIG_DEBUG
+ #define DBG	1	// for ODM & BTCOEX debug
+ //#define CONFIG_DEBUG_RTL871X /* RT_TRACE, RT_PRINT_DATA, _func_enter_, _func_exit_ */
+-- 
+2.32.0
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
