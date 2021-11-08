Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1928AC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:48:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9EAA6134F
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9EAA6134F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7C0A80F3B;
	Mon,  8 Nov 2021 22:48:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nuvbw5CiCj9f; Mon,  8 Nov 2021 22:48:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E748480F36;
	Mon,  8 Nov 2021 22:48:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16CCB1BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 063FD80D73
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QIBB9nRb33rH for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:39:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D74BD80D66
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636411139;
 bh=NKz8jNYiSMsljgvP9buu4OMt7NSba/GFyeMyMupGapE=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=GpqqHVen67E4430a96ntv2Jdy4j6UkDrfBAdYWC/9Rc54sqyZKJ4p5m5KORY5HNj2
 e1B7finYQS/d/GnUOhnLWI7wtLI157MqaCHQV18ac0gJoIQGoxmbhn0QUdTCGFMk6s
 NagyHvJGANqVvdGSt1PnvphlryE+7wIMFA5GWeA0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.202]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MjS9I-1mI05Y3g4Y-00l0Zf for <buildroot@buildroot.org>; Mon, 08 Nov 2021
 23:38:58 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon,  8 Nov 2021 23:38:58 +0100
Message-Id: <20211108223858.12626-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:kvDwFvV+ELF9BGRnR/5y8OAqDs9kQwMRYAT3Dl/Wwlrtx8z7n1K
 ynCFYAHotf3JNEH2QY6ZvVHUsVuO/iupQy2NQHgenWOs7BwgPyOuXUjZrLa7JpEYeiInUF2
 Z8D7rqi9Ky2XndXpuv5gmLiVOrUTFNwZoBhsBXbnUth7HkwnQJPpyBDh0KHTywcbXB2X+fO
 saTtQm3jONUPxqVegeynQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LRIpz4ySqBg=:ERW9kgE/T0X7G2GeQDp+F9
 b1H/iID+wEtT5STxHOht+Se5ER4qE7ru4eAzggSLJToChMyCAF6SwiKI1uiCMwEngRbhOokYu
 4YgQyUzjux8x/eLgP9K3OIDN6Guomf2oMZqDCcPmylHFBM5bDeHkApXJc8TyxICVGx7e/70L0
 u6DFaJRmy5UstkLu9hrfklg5rjjW3NMxClvj8+UJktQw4ElScEeQBfz3W15+WqT0hD8+YnTam
 OfSdC3WjPpISD1H15JEMe7paUTcAiH2Vy93aVCHOMERhOjig+YvYcGmtMIygQRWXXaDGxXEf4
 iILR6wi3UYb8PRoIo3+3iXIBR6rl/ZeVcB+nC9iMCDTKvdRuP1TjqZJeungWEO8e4YVqEM+8m
 1tDWUwcKiC9CDd/lFvMf/3VeCv8iswXztLxvuQ0jpe0CXugFBOtPjdCSHbZY1ChbZOC2QNmVH
 80lPqjovDMmPZSD0X2/QgGOJndfkmdVrzSrFLcWwBQGRctUdlHkSL2MnQ/2NJEXYaSwwUqgsJ
 61Br4O6iwNc/Jvb9tWQCNYNXod5/28Jk4TkcZUBxI9tavKsBF7770aQqDXFohWwOCop+IhQ2y
 g34o2pFhu/DTOVTkct7EsmEsg7FqRcTem6+IHOv3apiNvb+RyJWZYNnWhKFifwmYLpgmnm5i0
 BI0ZHTUk26TVZKMRoAcKhQelE8MGSN1WvYHlQC/sVjUH+5IzwMpatlPNN3XZ+jQkctOqRxHmA
 dxfvWc46HxQWv5OTH+TssWfAfE+g37alGyCD5TraMYL/0wF9CEKVPv6uFz2IzLsaxPbum3ebH
 8XODj5mGBEhz4JG0wjb+2CfwpWIjNWwBmb3pCdB/57mlfbYc+MkYMqG62xCM2hmQxS22HRGGY
 ME2Yteng0P6eAPsYHNr54dmKDqw6jfWeRNW25oJr7vzVGt/OUZCBTTxS6pn/KjDYyVOsWRedH
 eCUHGADnxfTrgOb2yDAocHb3yqLQ4W9O8iEmFoY6fnb9nHr+3k7eEdV6WYnJTlhXmL8jXuj3P
 +eve1nrfF6BHaD5zCaPm395VBk4JzeRT+gXETOiT1AZiAGD0mk6a8k6pKbHFp4FlbWef8UyuB
 iCnWAp0Hht0LXk=
Subject: [Buildroot] [PATCH v1] package/gst1-interpipe: bump version to 1.1.7
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

Changelog (for details see [1]):

  - Fix memory leak generated by last node not being freed.

[1] https://github.com/RidgeRun/gst-interpipe/releases/tag/1.1.7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-interpipe/gst1-interpipe.hash | 2 +-
 package/gstreamer1/gst1-interpipe/gst1-interpipe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
index b3fc8ef018..348abdb003 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  00d3a91625f6cc5d263f35b9330b4ba6eb40781be2e823231e5b2be9281e1fb4  gst1-interpipe-1.1.6-br1.tar.gz
+sha256  0fd29d3cba623163dd5852989d7ca21eee9033da9d14a467ccd5e527e3b4297b  gst1-interpipe-1.1.7-br1.tar.gz
 
 # Hashes for license files:
 sha256  16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5  COPYING
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
index 80e5b577f6..fa4485e6f8 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_INTERPIPE_VERSION = 1.1.6
+GST1_INTERPIPE_VERSION = 1.1.7
 GST1_INTERPIPE_SITE = https://github.com/RidgeRun/gst-interpipe
 GST1_INTERPIPE_SITE_METHOD = git
 # fetch gst-interpipe/common sub module
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
