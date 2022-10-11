Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71644C4332F
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 22:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6A0F607F2;
	Tue, 11 Oct 2022 22:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6A0F607F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sC4cpcUIM5xN; Tue, 11 Oct 2022 22:31:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2519607D1;
	Tue, 11 Oct 2022 22:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2519607D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A82F41BF852
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 22:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52BCE400FF
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 22:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52BCE400FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SchFf2Sw2XOy for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 22:30:57 +0000 (UTC)
X-Greylist: delayed 00:09:47 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FCA3400C4
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FCA3400C4
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 22:30:56 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 60DFC5C00B1
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 18:21:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 11 Oct 2022 18:21:07 -0400
X-ME-Sender: <xms:UuxFY1hP2ArVJZj4BeVMbzFZzoVEMMI9tXpjB_oi6IvDiSMQu3jCrw>
 <xme:UuxFY6D0eLKlTeAT52YcnuKX-YaEgh0vf2N1kwV5JmaGyz1QEGdp0MXajBQYUQjJ3
 KDvtMc5FHoq4rrg>
X-ME-Received: <xmr:UuxFY1FAKOSHIWjbFJ5e7L_eCUIjTiXcGNhC7oI-g8lXqUdYWGRxH_v8ZY_duUtUZ61TAIOx5kZH_5u1Rya1Iw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkofggtgfgsehtjeertd
 ertddvnecuhfhrohhmpeffrghnihhlohcuuegrrhhgvghnuceomhgrihhlsegusghrghhn
 rdgthheqnecuggftrfgrthhtvghrnhepueffuddtudfgtdduhedtjeeikeefgfektefhue
 efveefuedtffehveeujeefkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrihhlsegusghrghhnrdgthh
X-ME-Proxy: <xmx:UuxFY6SUexzR74acGVvgYWhadY9GOI9WmOCIWwLAiAltVN4toHMC6Q>
 <xmx:UuxFYyxmnaNtz9YnHFQSMVSe0zgLFhNwws7bCP1qOI180KKshTgL9w>
 <xmx:UuxFYw6lRu3twIpPHiuUSoTSi-5hfY06ekXFkqiFVol5agmB69kAtQ>
 <xmx:U-xFY3oQS-Bec4N9nIqZAYCa7AkHz-u4TFOtK-nO31YMll1-e1BZtw>
Feedback-ID: i1d444086:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <buildroot@buildroot.org>; Tue, 11 Oct 2022 18:21:06 -0400 (EDT)
Date: Wed, 12 Oct 2022 00:21:01 +0200
From: Danilo Bargen <mail@dbrgn.ch>
To: buildroot@buildroot.org
Message-ID: <20221012002101.02c1f4bf@c3po>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dbrgn.ch; h=cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1665526867; x=1665613267; bh=uloGzkeid0
 wDsYONCDHWAzrpWd63VZ3Alq1IsJDUq3o=; b=StI2u+qmbmK42TvufOZKyjBMFD
 Y1QMV1Pr6YgrBjqrc4vFHkWCpgAMbj4ftiPa2M4lYo9CcfNCSbAnWwm9QfTmQZx/
 v56btPzJUW27Jhbk8hLEFUmcaRs0qtEhpJCNdo3o/8elvmGKK5RLkqdGgwDxtn5v
 XOlB9hTWhNvvEd1UKp5jWwJBoyT+ySbKV9dckVEKNUgnsvotVl1xs5nhEO2SmoUQ
 2i6tpuCEF/eHkUoeksS5pNcNfHvdnov30G6Q7jOx4EOb4dfQjzX05InhR3Oewj3P
 shKAPJCP9zU68gAktq9HfgUibNApNGRQwwsZB/7T4l9VWJLVh27bfdsYNHQw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:feedback-id:feedback-id:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665526867; x=1665613267; bh=uloGzkeid0wDsYONCDHWAzrpWd63
 VZ3Alq1IsJDUq3o=; b=pQKcBOiZt1+ZpbFHD2oryWaYMtM+6Mt+OaewSzV+oOJZ
 IC8nwf08uqkABjUL6vTurx91q2Zor9vA5PE5CuaBotTx4RngyT9oLYTzr9qXVQxC
 dS8GUtYR1MJjrvJPkaoQdHetTyktUAfogUbKk07Dy39JVl6/jR7ZG8l+pjjU1f5d
 TJm0jELRqq24xSdJmhL9EpVY5ZsnbYpdEhSE3OI1K4VMoiNJ4FN/vQlk/mm9EaSn
 M8u4sRFzHi7JxFsmiaugQQdFCHZdXDbPlIIBThKt9sypVp57TZQmRUFhx1iYKbm9
 s12HgwKjs3lUZB2aVrKqCp8rpI3v29y6eJC+pl/bNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=dbrgn.ch header.i=@dbrgn.ch
 header.a=rsa-sha256 header.s=fm1 header.b=StI2u+qm; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=pQKcBOiZ
Subject: [Buildroot] [PATCH 1/1] package/tealdeer: bump version to 1.6.0
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
index 0e53174841..b8c9278405 100644
--- a/package/tealdeer/tealdeer.hash
+++ b/package/tealdeer/tealdeer.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  42febf9ee84721b9230077d62e2fc51201fd59624d3c776ccc1a634788768a60  tealdeer-1.5.0.tar.gz
+sha256  9b2e9c2d8cbdcf50b3b7865b27a535815874c8d6066f9b7e1ca4d88941065401  tealdeer-1.6.0.tar.gz
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  a313b5e62b80a08f3aae0fa62ff3de8482ef55247299eb352ab44f87ef456b1b  LICENSE-MIT
diff --git a/package/tealdeer/tealdeer.mk b/package/tealdeer/tealdeer.mk
index c396225098..18b5c35351 100644
--- a/package/tealdeer/tealdeer.mk
+++ b/package/tealdeer/tealdeer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-TEALDEER_VERSION = 1.5.0
+TEALDEER_VERSION = 1.6.0
 TEALDEER_SITE = $(call github,dbrgn,tealdeer,v$(TEALDEER_VERSION))
 TEALDEER_LICENSE = Apache-2.0 or MIT
 TEALDEER_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
--
2.38.0


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
