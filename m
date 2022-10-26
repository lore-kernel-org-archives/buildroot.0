Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922A1C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 21:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B95260E00;
	Wed, 26 Oct 2022 21:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B95260E00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cFjmuDdxhcfI; Wed, 26 Oct 2022 21:15:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73E7B60DFC;
	Wed, 26 Oct 2022 21:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73E7B60DFC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 363D11BF31D
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 106248132C
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 106248132C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BpgT_tNT4qqn for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 21:15:52 +0000 (UTC)
X-Greylist: delayed 00:06:01 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE6A181326
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE6A181326
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 21:15:51 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id D330B3200950
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 17:09:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 26 Oct 2022 17:09:44 -0400
X-ME-Sender: <xms:GKJZY9wHLDAW27qBGYppGxpgWAA_4ZsbpOhRxxwzY78DHdoQk98tCA>
 <xme:GKJZY9QclWDEVYRy-YhCIlUMT4-zWpKgHCRYt9kkORDVSDHa_tuvRwWqpDRLDfC1f
 B4x4--HhVjtERna>
X-ME-Received: <xmr:GKJZY3UWNHqrVNfCLAjZJXelXhJ3-nhZV_Wveqh4j5wSC9LP1NXRgktanihr7BCCupWiw1RiLg7d7AtTpNazlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdduheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkofggtgfgsehtjeertd
 ertddvnecuhfhrohhmpeffrghnihhlohcuoehmrghilhesuggsrhhgnhdrtghhqeenucgg
 tffrrghtthgvrhhnpeetueekgfetheeileekiedtveeiieefgfevgfegjeekuefffedvve
 fhkeetlefggfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrghilhesuggsrhhgnhdrtghh
X-ME-Proxy: <xmx:GKJZY_gZGkMQB87lArX7hD_6X06r0p3jKswKHCsOs76jltncOQNwww>
 <xmx:GKJZY_CiVUJvZjxtwskU6urpOlzbetJoRfA8eMzP28RQiQxQZ3f_Sg>
 <xmx:GKJZY4KcAAUWu9UP4ILCMJRxgRMVejoA0S35tgwdToC-Cbl_OYdVcw>
 <xmx:GKJZYyMSq-HAX5EOgo_xstL0vySNmExLJx6K2jCZLATQmQRpDL151A>
Feedback-ID: i85804083:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <buildroot@buildroot.org>; Wed, 26 Oct 2022 17:09:43 -0400 (EDT)
Date: Wed, 26 Oct 2022 23:09:17 +0200
From: Danilo <mail@dbrgn.ch>
To: buildroot@buildroot.org
Message-ID: <20221026230917.5092886c@c3po>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dbrgn.ch; h=cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1666818584; x=1666904984; bh=16LiSmWCqp
 gxzR+FW+a9BcBLi8XwbeHGSAoJT0IW5DI=; b=1MnH27iupu4bTsHJ9L+eXG7jnz
 jAi24447uPjkflu2jcXIBgV9MsFOdXqusMbYDsWEl2Ym/cZGL9VFlhQDqaanOLX/
 CoZnMzJVEBT3borChiqXH0w1tH1MGKnJu2A947/6C2teYuQLcCjD/UFZQvkmid2b
 NDGo0pwV/7c76dRH/gbIItBc/Ky4+vO+s+kUGmEUOJGK1AQNRYM4uYODb0WGV2qb
 ZydifmSDTpTD8C7K4aZHCz4wo9MzLm2Xju/M8Cav+wsV/LTwhjH/tlvJk0rqbDef
 2mpc072l03P7l0DD1QKo9yCi4dbRAYjZEznKlt93g724Jvxqq+4KEd2D8EgA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:feedback-id:feedback-id:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666818584; x=1666904984; bh=16LiSmWCqpgxzR+FW+a9BcBLi8Xw
 beHGSAoJT0IW5DI=; b=WvwYTNbQH6DMLV9QQtoKg2kGK45HA798r2LvHUdggx4r
 zLL/09jfwXR1AHCQsUUbJ2nIBBN8KysrHv1ULQaMkv4USk8tJ+KfuEMOr5wWGHBj
 3C+Zr8aqALjSCr2en0/xHTiSG1D45T9zW8gahA4YZNkWDDCeiV0FXzC5WlU34FQo
 IqbVSeAf4a4UCKOQZTByNdWqiD6tkuNOYs2M2XzLQ1jAqgmBiTu4O9MO1TZZB1Bz
 qLvD9qdsTgoSKfW7E5brzt2KD7UyYN9n6yd+R9hTM2nwEj8VztRFzYs2ql9++H+m
 mOf9oWnFCBXwGTh0drslgFLtxd/MnxDftlMlcYPn2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=dbrgn.ch header.i=@dbrgn.ch
 header.a=rsa-sha256 header.s=fm1 header.b=1MnH27iu; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=WvwYTNbQ
Subject: [Buildroot] [PATCH 1/1] package/tealdeer: bump version to 1.6.1
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

Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
---
 package/tealdeer/tealdeer.hash | 2 +-
 package/tealdeer/tealdeer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tealdeer/tealdeer.hash b/package/tealdeer/tealdeer.hash
index 0e53174841..1d9eb7bf25 100644
--- a/package/tealdeer/tealdeer.hash
+++ b/package/tealdeer/tealdeer.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  42febf9ee84721b9230077d62e2fc51201fd59624d3c776ccc1a634788768a60  tealdeer-1.5.0.tar.gz
+sha256  90690d3a6e2f6c7444c281865bd5b0787e0afa599f06b52b4283bea4541e1e77  tealdeer-1.6.1.tar.gz
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  a313b5e62b80a08f3aae0fa62ff3de8482ef55247299eb352ab44f87ef456b1b  LICENSE-MIT
diff --git a/package/tealdeer/tealdeer.mk b/package/tealdeer/tealdeer.mk
index c396225098..aabfe2983c 100644
--- a/package/tealdeer/tealdeer.mk
+++ b/package/tealdeer/tealdeer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-TEALDEER_VERSION = 1.5.0
+TEALDEER_VERSION = 1.6.1
 TEALDEER_SITE = $(call github,dbrgn,tealdeer,v$(TEALDEER_VERSION))
 TEALDEER_LICENSE = Apache-2.0 or MIT
 TEALDEER_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
--
2.38.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
