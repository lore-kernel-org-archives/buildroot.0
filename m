Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2804C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C339860A3A;
	Mon,  3 Jun 2024 07:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZ9Gx8GTug2v; Mon,  3 Jun 2024 07:18:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC09360908
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC09360908;
	Mon,  3 Jun 2024 07:18:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 174071BF2EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D393A4042D
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkQHjiPHtRVy for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:17:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE5084045C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE5084045C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE5084045C
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:17:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 990D5C000B;
 Mon,  3 Jun 2024 07:17:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sE1wm-002Ecd-0T;
 Mon, 03 Jun 2024 09:17:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 09:17:19 +0200
Message-Id: <20240603071726.532652-16-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603071726.532652-1-peter@korsgaard.com>
References: <20240603071726.532652-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 16/23] package/nfacct: use https:// reference
 for .hash file
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

ftp.netfilter.org no longer provides ftp, so use the https:// url from
_SITE.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nfacct/nfacct.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nfacct/nfacct.hash b/package/nfacct/nfacct.hash
index aac5ce0ab8..4038ff86bc 100644
--- a/package/nfacct/nfacct.hash
+++ b/package/nfacct/nfacct.hash
@@ -1,4 +1,4 @@
-# From ftp://ftp.netfilter.org/pub/nfacct/nfacct-1.0.2.tar.bz2.{md5sum,sha1sum}
+# From https://www.netfilter.org/projects/nfacct/files/nfacct-1.0.2.tar.bz2.{md5sum,sha1sum}
 md5  94faafdaaed85ca9220c5692be8a408e  nfacct-1.0.2.tar.bz2
 sha1  17d6576778227ea93c62600d9b18ff4932963c6a  nfacct-1.0.2.tar.bz2
 # Locally computed
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
