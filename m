Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F72FC43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 20:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D07BE40A89;
	Fri, 22 Jul 2022 20:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D07BE40A89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bqNFwHAOh7sO; Fri, 22 Jul 2022 20:22:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCE3D40AA2;
	Fri, 22 Jul 2022 20:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCE3D40AA2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A4BE1BF3DE
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60B5440A8A
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60B5440A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MnmsHd1mNOS7 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 20:22:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8161340104
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8161340104
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 20:22:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 02123240002;
 Fri, 22 Jul 2022 20:21:58 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri, 22 Jul 2022 22:21:45 +0200
Message-Id: <20220722202151.76235-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
References: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658521319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lzeRxAIAygc7D4/4eBD5EiUrpdhXxINUIFGps1HDF+M=;
 b=iVLzXtE3bAiUy+5N0pqi1L2i/3bc0PNWghpa0FrK3avGZFbC6hK1titKpZSZDbrb2foVro
 vE5JucApC2Xb1B4qiRd2QzAdxmDWuebRu01fDhfP4n4zgUru2eR7hfp0IO0tDYVQaunpvl
 sOMBoOptI3vF4j/W/vCCBnPb31/QzldpyXwTSEASK09fZ0EPiwlAWH2YQlitQIbyQFvdkv
 NcUBiDWfOwrwXmAKLUpcLpUe+F1qJmdamAG+hq72zo31SLQ6kmvTV20H2/stfDcwhMgjJf
 ACHPvRekYUt4epIqyq3JUWUmo8aMU+a9OnlQFmMHZifu5dKu7QCZQVf1Tjz2Pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iVLzXtE3
Subject: [Buildroot] [PATCH 3/8] docs/manual: update documentation about
 partition-type-uuid convention in genimage.cfg
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Whenever possible, we want to use the "shortcuts" provided by genimage
for the partition-type-uuid values:

 - U for the EFI System Partition
 - F for FAT32 partitions
 - L for root filesystem partitions and other Linux filesystems

In follow-up commits, we will convert existing genimage.cfg to this
convention, except for the root filesystem, if the existing
genimage.cfg specifies a partition-type-uuid that doesn't match the
one that "L" would imply. In this case, we will things as-is to not
break existing setups. However, for all future genimage.cfg files, we
recommend to use "L" for the root filesystem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/writing-rules.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 84d8f76431..758965d80a 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -198,6 +198,18 @@ image sdimage.img {
   chance, the byte count.  In comments instead use +GB+, +MB+, +KB+
   (not +kb+) in place of +G+, +M+, +K+.
 
+* For GPT partitions, the +partition-type-uuid+ value must be +U+ for
+  the EFI System Partition (expanded to
+  +c12a7328-f81f-11d2-ba4b-00a0c93ec93b+ by _genimage_), +F+ for a FAT
+  partition (expanded to +ebd0a0a2-b9e5-4433-87c0-68b6b72699c7+ by
+  _genimage_) or +L+ for the root filesystem or other filesystems
+  (expanded to +0fc63daf-8483-4772-8e79-3d69d8477de4+ by
+  _genimage_). Even though +L+ is the default value of _genimage_, we
+  prefer to have it explicitly specified in our +genimage.cfg+
+  files. Finally, these shortcuts should be used without double
+  quotes, e.g +partition-type-uuid = U+. If an explicit GUID is
+  specified, lower-case letters should be used.
+
 The +genimage.cfg+ files are the input for the genimage tool used in
 Buildroot to generate the final image file(i.e. sdcard.img). For further
 details about the _genimage_ language, refer to
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
