Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C5AC6FA8E
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 12:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D12160AEA;
	Sat, 25 Feb 2023 12:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D12160AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id voykUYT0KPmz; Sat, 25 Feb 2023 12:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49C1460B70;
	Sat, 25 Feb 2023 12:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49C1460B70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B4BD1BF3BB
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 12:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8F2860B70
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 12:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8F2860B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iO5lz0o1Rfhj for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 12:55:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AF1960AEA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AF1960AEA
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 12:55:58 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.170.24.50])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C6EAE19F5A1;
 Sat, 25 Feb 2023 13:55:53 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 13:55:44 +0100
Message-Id: <20230225125544.390204-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677329755;
 bh=gUe4qzcZs3l0Um1amRI6kBzdRMVy3gbX+mWeObAFaEc=;
 h=From:To:Cc:Subject:Date:From;
 b=cHPMfHXAm4BYzIAVbVip9lFxYRWCgkNUJcgt1Rv0RfUXL9ix/z6Hpu6Hyw1L1JW0J
 IkygDZkgdEtm1Y99EpkBScaBQqFddhphA6nMWX9ZrYzR5LK1zOf8PutYyvmwzCUhwK
 SYwiTWbF8iTdu/v51KetE5RVn/ay7YNgRxaWLw02iuQtOweOUgH+u6VLZXpeArH5po
 tct1RuZ3i2mFR43eMw01J8pk61jm9oTxvhzxjgpW4AcCvujH5KPSEUw8SsDK4avOHz
 xzoU38G/FoWzwzeHJq1uJ6QgKrHgM3PeVfOu1yNtfCGwGdhheP2442YtijjZlPL7vx
 1rosQInren0Lw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cHPMfHXA
Subject: [Buildroot] [PATCH next 1/1] package/ptm2human: bump to latest
 commit d0b8b6b
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

For change log since commit d0b8b6b, see project commit log:
https://github.com/hwangcc23/ptm2human/commits/c8c5e7d5bdacd73114f4f244355e88c7f4e7d64a

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit b793f3a with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p ptm2human
    ...
    45 builds, 30 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/ptm2human/ptm2human.hash | 2 +-
 package/ptm2human/ptm2human.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ptm2human/ptm2human.hash b/package/ptm2human/ptm2human.hash
index 0346019667..d581491bde 100644
--- a/package/ptm2human/ptm2human.hash
+++ b/package/ptm2human/ptm2human.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  28947eeb458d8b6a362cbeb8c5cb6098006274af04ebb4f5da70eac89f927d95  ptm2human-d0b8b6be9897ea5b04fd6460038a4773cec078bc.tar.gz
+sha256  4c66e9429dfb92b5f4332b08050db0436511581102d1ec56555eb8229d9c2c74  ptm2human-c8c5e7d5bdacd73114f4f244355e88c7f4e7d64a.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/ptm2human/ptm2human.mk b/package/ptm2human/ptm2human.mk
index 28a7b7ab48..edba21d401 100644
--- a/package/ptm2human/ptm2human.mk
+++ b/package/ptm2human/ptm2human.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PTM2HUMAN_VERSION = d0b8b6be9897ea5b04fd6460038a4773cec078bc
+PTM2HUMAN_VERSION = c8c5e7d5bdacd73114f4f244355e88c7f4e7d64a
 PTM2HUMAN_SITE = $(call github,hwangcc23,ptm2human,$(PTM2HUMAN_VERSION))
 PTM2HUMAN_LICENSE = GPL-2.0
 PTM2HUMAN_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
