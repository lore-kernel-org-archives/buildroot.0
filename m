Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0300C27C4F
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB98A4022E;
	Mon,  3 Jun 2024 07:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3WDzO2pwbgc; Mon,  3 Jun 2024 07:17:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9505340484
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9505340484;
	Mon,  3 Jun 2024 07:17:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82AE41BF2EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E546405C8
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjowiyPYKWvx for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:17:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 169C44043A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 169C44043A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 169C44043A
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:17:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0984040006;
 Mon,  3 Jun 2024 07:17:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sE1we-002EZr-1X;
 Mon, 03 Jun 2024 09:17:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 09:17:05 +0200
Message-Id: <20240603071726.532652-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603071726.532652-1-peter@korsgaard.com>
References: <20240603071726.532652-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 02/23] package/ebtables/ebtables.hash: use
 http:// to match _SITE
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

For consistency.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ebtables/ebtables.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ebtables/ebtables.hash b/package/ebtables/ebtables.hash
index 98106b0d60..06e2f9f345 100644
--- a/package/ebtables/ebtables.hash
+++ b/package/ebtables/ebtables.hash
@@ -1,4 +1,4 @@
-# ftp://ftp.netfilter.org/pub/ebtables/ebtables-2.0.11.tar.gz.sha256sum
+# http://ftp.netfilter.org/pub/ebtables/ebtables-2.0.11.tar.gz.sha256sum
 sha256  b71f654784a726329f88b412ef7b96b4e5d786ed2bd28193ed7b4c0d677dfd2a  ebtables-2.0.11.tar.gz
 # Locally computed
 sha256  ebdb8ae564c952792017ec680e2edd30443642216eb9f8a3d8fa166c0cb628c1  COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
