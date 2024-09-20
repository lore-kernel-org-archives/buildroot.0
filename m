Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0690BCF9C6B
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 21:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA3CA40187;
	Fri, 20 Sep 2024 21:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xoj8eRc3vfbT; Fri, 20 Sep 2024 21:08:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F05340339
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F05340339;
	Fri, 20 Sep 2024 21:08:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6895F1BF5A6
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 21:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 649DB8151E
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 21:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gAGKana875Kj for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 21:08:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 865A0814C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 865A0814C1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 865A0814C1
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 21:08:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9AAD20005;
 Fri, 20 Sep 2024 21:08:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1srkro-00HAoZ-0X;
 Fri, 20 Sep 2024 23:08:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 23:08:22 +0200
Message-Id: <20240920210836.4093091-4-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240920210836.4093091-1-peter@korsgaard.com>
References: <20240920210836.4093091-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 04/17] support/misc/utils.mk: fix typos
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/misc/utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/misc/utils.mk b/support/misc/utils.mk
index 4d0efcced0..5275006d6d 100644
--- a/support/misc/utils.mk
+++ b/support/misc/utils.mk
@@ -40,7 +40,7 @@ SHARP_SIGN := \#
 # In other words, every letter is substituted one by one.
 #
 # The caseconvert-helper allows us to create this definition out of the
-# [FROM] and [TO] lists, so we don't need to write down every substition
+# [FROM] and [TO] lists, so we don't need to write down every substitution
 # manually. The uses of $ and $$ quoting are chosen in order to do as
 # much expansion as possible up-front.
 #
@@ -131,7 +131,7 @@ QUOTE = '
 # Once everything has been escaped, it is passed between single quotes
 # (that's why the single-quotes are escaped they way they are, above,
 # and why the dollar sign is not escaped) to printf(1). A trailing
-# newline is apended, too.
+# newline is appended, too.
 #
 # Note: leading or trailing spaces are *not* stripped.
 #
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
