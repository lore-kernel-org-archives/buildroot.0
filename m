Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64053C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ECA56071F;
	Mon,  3 Jun 2024 07:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01T9FJsus16M; Mon,  3 Jun 2024 07:17:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4063C60724
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4063C60724;
	Mon,  3 Jun 2024 07:17:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E4961BF2EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C97B284240
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id okgtwO5_V_hD for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:17:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E24D584247
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E24D584247
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E24D584247
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:17:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB9671BF20A;
 Mon,  3 Jun 2024 07:17:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sE1wh-002Eag-0n;
 Mon, 03 Jun 2024 09:17:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 09:17:10 +0200
Message-Id: <20240603071726.532652-7-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603071726.532652-1-peter@korsgaard.com>
References: <20240603071726.532652-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 07/23] package/libmnl: use upstream sha256sum
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
Cc: Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ftp.netfilter.org no longer provides ftp, so use the https:// url from
_SITE.

This provides a .sha256sum but NOT md5/sha1, so update the .hash file to
match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmnl/libmnl.hash | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/libmnl/libmnl.hash b/package/libmnl/libmnl.hash
index 4b592333cb..e2db46f03b 100644
--- a/package/libmnl/libmnl.hash
+++ b/package/libmnl/libmnl.hash
@@ -1,7 +1,5 @@
-# From ftp://ftp.netfilter.org/pub/libmnl/libmnl-1.0.5.tar.bz2.{md5sum,sha1sum}
-md5  0bbb70573119ec5d49435114583e7a49  libmnl-1.0.5.tar.bz2
-sha1  63c6456b77f7978a7b37e62c1b38346b2ef2d91c  libmnl-1.0.5.tar.bz2
+# From https://netfilter.org/projects/libmnl/files/libmnl-1.0.5.tar.bz2.sha256sum
+sha256  274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525  libmnl-1.0.5.tar.bz2
 
 # Locally calculated
-sha256  274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525  libmnl-1.0.5.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
