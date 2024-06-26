Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A925C27C4F
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 08:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8D1D60017;
	Wed, 26 Jun 2024 08:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAuwqUnlqfur; Wed, 26 Jun 2024 08:52:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0B2F600B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0B2F600B9;
	Wed, 26 Jun 2024 08:52:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E0271BF41B
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 08:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEED981397
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 08:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lSN8_Ztj5vWI for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 08:52:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E4A28138E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E4A28138E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E4A28138E
 for <buildroot@busybox.net>; Wed, 26 Jun 2024 08:52:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.75]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqaxU-1siGn92pWq-00pRCT
 for <buildroot@busybox.net>; Wed, 26 Jun 2024 10:52:07 +0200
To: buildroot@busybox.net
Date: Wed, 26 Jun 2024 10:52:07 +0200
Message-ID: <20240626085207.21221-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:0NfMKQc3gsdiHhDqtRc/mAsU3NS9U4A/Wwwg8BOqVrw+cACp2PQ
 Ss1UN9bWOylPWkuKZQMcOaXuMef1dYg4Ygx9wwD/dKpZzSRYMYv16kIqbE5Kd9wj4VqO0NF
 B6BYRltUIRz8vgvr38OC1btTACC1kTTMirP5DdpoK8uj2RpKpquSZ1S3n8apzLiZS7udfaa
 PsUAM6xYHGAJ6mIJ9mRxQ==
UI-OutboundReport: notjunk:1;M01:P0:t56bIYPRWBI=;0Q2/V8kAYvg6soJGYVVXjcu92/g
 /qattiBJNZMquVgE4ciLvUbOFXl/UzAg1YgwM+EBwy1o+gCVG3CRSsaKEPufYoH3iArExKY5J
 g3URAMzEXnN/EyCD8+Z6QQJyw8vP/Fw/p24VeaDGe24m6uzEzGllSm4C1jsz4fmuwnje0Nuu6
 HGWW59fZpk7WFdKaPIBDoeoTsXn9riut40lbqAbPUZ4FJXK2yZxZJMRH+LeY+Vbe77AoOSLG/
 qpbev6EWhUCd5Tbsc+yOdKHKxms+aItsz8dvIRGRrZVnZBeWKIvXMhZmc8ODNNsrLEBNRoVpl
 NhwqgEVhBhJ7dyv5LScWs4qkAp7qg1apfPzjxsUl2rp8WN1M5mggDZvdWtyUt5C3ccu4E8VF+
 ozq7zzBeYeCjtNXJtP8yR9G76zKIFAnlkrvqJ9PsK1AyOwlTb00DkqKM0rFHkXgdnAiucr+cv
 iufkpeOJjNa4UxqfkKyqOIFjosT3OFAvjfVgoYy+X7ErqC20wxWPGPHA4Z3+7Y9ZcHIOUET1s
 J1vH4QmoVZQhulYTxhOG7aQOp5Z/r5yx/S+aRQMXxXi8WNxaIbtXTDasBbtVPzDtVNmEuvZzL
 ueE+vepnowyQdm74P/qauAYd+/EG9yPnVNlLbf+XNCLFKKbtVwY5Q1Y+skf66+an4pDcq3BlO
 cNJ8fkZjum/x+pYv0TbzInewgbCq8hiWr/Mc+847XI799lq+rYYQ/+BTa3P3jdMfPulQWn6Ur
 FOxpYu4TwFuKSf81FNitdHB5+anK8LYkb0ABbrLAgk5GvnN7CoPKY3P7ekQy41uH8IDqTl9F+
 EE8Ci8rpLjzltQgYFsb2SgUP9wDtwQ4XIu3c/e5LaSjV4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719391927; x=1719996727; i=ps.report@gmx.net;
 bh=JbVZFvfmRrDbeJC+ucdVxNbY9jbMJ0ecuJ2pZLf7gOw=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ZPrMWXWQTiDZkD50ryPtB2P780A9Tiji398goc9oVnc3D1P1vWfkikgH+pbXomNw
 IFBBK3kNaqXcagOjznDSDuDKLbdpp8NIm4pLiT8FryyNGK007l5UTqaPPhnkJbYYw
 RZpfTKW3DLRTc0sfLy0ynWvMYLSVGeJ1xRvec3/quhCR4I1P29HPfQIyYC905C6sJ
 0DXy+hwtX4Vk5zrLCGxqOJQ9bWwjFg7ic3mx8N6FA8w7rOQZLmb7WA8KGsfF3Tm7u
 7zwDYihK3mvJ8bLwC9ZPFMqQbqQTj141VQrds7Yaki6qCbTqRuUbFall8tfiix1/J
 09QtKXz+A0oOa5TJ6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ZPrMWXWQ
Subject: [Buildroot] [PATCH v1] package/smartmontools: bump version to 7.4
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://github.com/smartmontools/smartmontools/releases/tag/RELEASE_7_4

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/smartmontools/smartmontools.hash | 8 ++++----
 package/smartmontools/smartmontools.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/smartmontools/smartmontools.hash b/package/smartmontools/smartmontools.hash
index e48e955d01..fe6eae1075 100644
--- a/package/smartmontools/smartmontools.hash
+++ b/package/smartmontools/smartmontools.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/smartmontools/files/smartmontools/7.3/
-md5  7a71d388124e3cd43abf6586a43cb1ff  smartmontools-7.3.tar.gz
-sha1  5ce7adb606119148d725b91a00652d427ca0adc2  smartmontools-7.3.tar.gz
+# From https://sourceforge.net/projects/smartmontools/files/smartmontools/7.4/
+md5  178d31a6ff5256c093227ab45a3f52aa  smartmontools-7.4.tar.gz
+sha1  b0d7c9ca80768059607b92bf4e373e2822300d3f  smartmontools-7.4.tar.gz
 
 # Locally computed
-sha256  a544f8808d0c58cfb0e7424ca1841cb858a974922b035d505d4e4c248be3a22b  smartmontools-7.3.tar.gz
+sha256  e9a61f641ff96ca95319edfb17948cd297d0cd3342736b2c49c99d4716fb993d  smartmontools-7.4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index d24f008df4..18a1417681 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMARTMONTOOLS_VERSION = 7.3
+SMARTMONTOOLS_VERSION = 7.4
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
 SMARTMONTOOLS_LICENSE = GPL-2.0+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
