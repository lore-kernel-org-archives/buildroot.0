Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF46C47DA7
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 21:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75BD74206E;
	Wed, 17 Jan 2024 21:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75BD74206E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ee8Q36YfLcfF; Wed, 17 Jan 2024 21:19:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB84D42114;
	Wed, 17 Jan 2024 21:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB84D42114
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A2781BF335
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 21:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42C9E83E91
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 21:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42C9E83E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPfZnuUc8toY for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 21:19:35 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 17 Jan 2024 21:19:35 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5440583D3F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5440583D3F
 for <buildroot@busybox.net>; Wed, 17 Jan 2024 21:19:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.11]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE27-1rgNDO0JOl-00Kl4x; Wed, 17
 Jan 2024 22:14:25 +0100
To: buildroot@busybox.net
Date: Wed, 17 Jan 2024 22:14:24 +0100
Message-ID: <20240117211424.22038-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:YiMdUhEKO/dkEevuguLYMCaR/yKR7OxpNe7KU341FKhFB37uKLo
 Py68SdXHVJKsYIu26kjH62fRU8kYmQHtleNViPh6zRtp3ZPhnx8LM/b3D0gR4Nc1zlF8gLC
 fcH5BAG72ar+43J3n9qbQD7d+pfa05Xa5FL2rvz/OhM4cyVUiNSSfhQlYOjJ/oF4oDXUzgC
 jJ1XgVS/9+Wq9NcfgwlLg==
UI-OutboundReport: notjunk:1;M01:P0:ez9+2o9NNpo=;aGuJ8YCG/hgZEn5U35Cn4AyI1ZL
 umKQQWPxbQu5hqcuMys2AqONL3dux7fnBy4seWOwHaMamvlMzogCCYyWxX0UiFDoAcy0L+BNi
 LFsiE7T2oetJFf4UYhrlG6bLAOr6UOAL34HhGnJbZ1AJPUEWI5wyHfSR+TymG/Q1vRzsHosGY
 v4lzeZX6K5IgWPD0TlyawJdYZocZCFbEA5EPPD86/C8sCKEV8o6KJrO3SkZGSdqy/KEvtY2+O
 4b7EJqcaek46hqATLjMMbcMENXyBHg1QhxDHPEqMCWnoXxwlSpUDBtqqokZLlmM0xtIJo6rVL
 29/6EY2Ir/kMbGbYfHuNpiF6x2BlzSaXuFYvII04iCCAJ9M7q3qSduPbNAmpm0qf77jY6tuxx
 vupUBaBE5AVzjf12WC4iB11huKB0BdRdBdJ31o/YsuKHKNdvcXFvEmYs230dXcGnt90XQ7dbD
 Jts9s9kFgtbHT/lM37taTN5jGRbvXE+T5Hht31Q4TE8E0+y+mGRyEeawmawoxvBfyDXOoN7s+
 OQpHWLSM/GNmKHcSZEBrAaxhvXtCPAX/nEiS4BOPhwqjAQj1jcEuDK31/DEy/+HC4zk3vfdtv
 F6LzP1ZTPeu24V4LEep1+dgw0ScM3YOSRHEyxNs7YBpQLwWJtgFxavzTcCrxTiIEmgyqBc2TQ
 1vAHariXF5TyGhPTZX/kA3D0GQ/x4di3rlfPmu6HNfyPFjHVs1vNd5vzqmKZS8YDWlvdIVl6l
 460Sae+8ZEujiUwGiPOZHYDfsp7+CwsMsKrmZku0Z59p2f+y5dt0M3oOI/L2qwgy1VwanQClU
 tsKetD7xiYUBJ2NcoR2nY9Hx5XFNDg0VGpt9HykUNmmIhVRzQovSa5Yt1WX/KGiFFNBIoVIkw
 C36m+e/FuyOQErMzsCNSFRl1ADaTFdU0iX4BeJE8rq5AqBMvy/68wqFix8BJLv9D2Uiz/1VXi
 OerNvbJBS+vt32OZ6i2j4pnQcXqCOIkF1SMZ1eiZRU2aGb2R
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1705526373; x=1706131173; i=ps.report@gmx.net;
 bh=b7BfwjD1OZKfNGvb1lKV2Hexg4u6rOTh4o4CJ1D1k+k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=ZL6n+7S3AA4xNbS+7dskSAi6/hk9Szm6xrVnqhwuoIFIuBhvAHSpLG82chveO/wY
 2Lhn/InwFehLU06O9CcH/OWFK9iVJ54mMIkRY5UNALgR9OyNQa6f/XWg3sIYgC/1d
 ZcDe9qYff24cVPAVJ+f/aVnlbg/3rL68/c0nCKcmjtYnBXn6nbYnJh/izeQY9Fv16
 vV56BAHotE0weUixhuZgDStKCMpToiBMQij6hheyn7EH1SIS+IZrOGHBjv8Qc9LZE
 44oC5rrlhTIlhTqIFw6Urmb5K8qSa20NwBEa0ZQelex4QYGR+AOC5cA5KmBlxZidZ
 g5hikszkArHy4GqN7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ZL6n+7S3
Subject: [Buildroot] [PATCH v1] package/nghttp2: bump version to 1.58.0
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
Cc: Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://github.com/nghttp2/nghttp2/releases/tag/v1.58.0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/nghttp2/nghttp2.hash | 2 +-
 package/nghttp2/nghttp2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
index 18774d01d4..dddf6fe1bd 100644
--- a/package/nghttp2/nghttp2.hash
+++ b/package/nghttp2/nghttp2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9210b0113109f43be526ac5835d58a701411821a4d39e155c40d67c40f47a958  nghttp2-1.57.0.tar.xz
+sha256  4a68a3040da92fd9872c056d0f6b0cd60de8410de10b578f8ade9ecc14d297e0  nghttp2-1.58.0.tar.xz
 sha256  6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 70a25d409c..7a05e38fa9 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGHTTP2_VERSION = 1.57.0
+NGHTTP2_VERSION = 1.58.0
 NGHTTP2_SOURCE =  nghttp2-$(NGHTTP2_VERSION).tar.xz
 NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
 NGHTTP2_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
