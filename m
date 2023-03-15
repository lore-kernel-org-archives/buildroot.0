Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9237C7618B
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 08:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 396F240023;
	Wed, 15 Mar 2023 08:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 396F240023
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FtYHkpFD1i35; Wed, 15 Mar 2023 08:46:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1844B4173A;
	Wed, 15 Mar 2023 08:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1844B4173A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D09AC1BF2AF
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 08:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A32C416AF
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 08:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A32C416AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Cy7tiF7cfRJ for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 08:46:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83E0641688
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83E0641688
 for <buildroot@uclibc.org>; Wed, 15 Mar 2023 08:46:42 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4E3965C0A12;
 Wed, 15 Mar 2023 04:46:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 15 Mar 2023 04:46:41 -0400
X-ME-Sender: <xms:8YURZNkfVlXY6X-8PkQC6BYCnsGEcsLAO-1hnutDJsg1zV8_nJ6MoQ>
 <xme:8YURZI2hSoju8HAqGO7BDo6SID-NnUIuJ9npwDEWHF-MOxFfFAMav-PdynUNbEQtf
 qKnNd7YKetlrtd4T24>
X-ME-Received: <xmr:8YURZDrPR0B8Ori6EIa5IJD-k7tGNpFNylYI6aIgSS23WuDI00kc9bu2RMcf14_nx3RvUn0MDTYUg-RJa15Jop0B8SqbT41NHDXOOLGDNGag69xUG0qoTXXZcK-P>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvjedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
 ekredtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvges
 lhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpeeiffdvfefgtdevleehffekue
 ejueehtedulefgieekgfdtfeeiffdtuefhteevheenucffohhmrghinheplhhisghsughl
 rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:8YURZNnDHH385GaDkf-gh-XD83Qj8ULiZWWHNsUECF0nl8PWTEwX0A>
 <xmx:8YURZL0dhBM4QpETtlQPP-NnXepsgrLswjKlhV5Q8okSIJmZVJWpyw>
 <xmx:8YURZMsTG9PFQeZsgDNo8awTAIKsd7efsMpRt0fMDDTLLnwDc02hdg>
 <xmx:8YURZAiZGkiXUkZC688NIXmX3av7-HrmL38Rrro04Z4qEjK2tiHFHA>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Mar 2023 04:46:40 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: buildroot@uclibc.org
Date: Wed, 15 Mar 2023 09:46:23 +0100
Message-Id: <20230315084624.1665061-4-luke@ljones.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315084624.1665061-1-luke@ljones.dev>
References: <20230315084624.1665061-1-luke@ljones.dev>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ljones.dev; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1678870001; x=
 1678956401; bh=4e9WfceUEi6pTTQLEoMPefY+KQ4Z+EcQWvKyJ7hOUlo=; b=d
 0ukBGY2fyqQMqcGMfewsSFQSf3ZRt9XjhjM74dRizOJ8xRuMaLGAnkjjnbL2mXK/
 Ny06kJ5+EXLC5GhZJ9eCtPaHStOLQ7UaIysPfPNmFcWuF6WsluBfN42pLb2Gn9Ib
 9+PoAR9FEhqIxWWzBGc1dAayKR+4Cyuy+t6SS3J1QPf3ols4owLtJmHB/DTtE9hD
 WdEvu6pDK7rxQuMuMF/8i8NTPj8MdnFCPryV1NLB5GwH2sum6QxgvAHrGErC9DKX
 HaiiQT5F+fICzRu1oIzmrfLd9qsTFsIsEeL6J6TgT9vEiZS/00nwI/oe+4CV5qpv
 wf9NFOS0RtJulQJm2U9SA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1678870001; x=
 1678956401; bh=4e9WfceUEi6pTTQLEoMPefY+KQ4Z+EcQWvKyJ7hOUlo=; b=S
 KbQkUZCVKkCo006eQpyUghDxZuqEGdwrlkhwe3MPslaW4crjNXPgjl3ft3xhpXXi
 3v8JFgq3trA3l5JHngJUEEhqVn5YVqtsfdXLTh9XiNN8FdmqNy+CiNl9dxhIgqgk
 OBckmdR++Z1Rt9LiGeHtN7Z28AnvHZ5xQVSU2LNFhJx1KZYatuVoL61+Vkix75h6
 sCwlbe7+qtnX/ClVpnwgdpXgwge6tnNLz8eID20nYkqBN+g8fOJhCcsEoThIeyw0
 X0GEtKPfPdQT24ASM9Akf4ioefnI10Zsl/98M2GHTbgKarqeDGu4aGRUIl3EaaX+
 +C+9ZNgtz+w+hIht1C1MA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ljones.dev header.i=@ljones.dev
 header.a=rsa-sha256 header.s=fm3 header.b=d0ukBGY2; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=SKbQkUZC
Subject: [Buildroot] [PATCH 4/5] package/sdl2_net: bump version to 2.2.0
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
Cc: "Luke D. Jones" <luke@ljones.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 package/sdl2_net/sdl2_net.hash | 2 +-
 package/sdl2_net/sdl2_net.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdl2_net/sdl2_net.hash b/package/sdl2_net/sdl2_net.hash
index a58e3c96cf31..c614aee25557 100644
--- a/package/sdl2_net/sdl2_net.hash
+++ b/package/sdl2_net/sdl2_net.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  15ce8a7e5a23dafe8177c8df6e6c79b6749a03fff1e8196742d3571657609d21  SDL2_net-2.0.1.tar.gz
+sha256  4e4a891988316271974ff4e9585ed1ef729a123d22c08bd473129179dc857feb  SDL2_net-2.2.0.tar.gz
 sha256  f09845a238245402a8b8388db6634d8a5b2c3e1dc098f16f9d8c74a276ef4594  COPYING.txt
diff --git a/package/sdl2_net/sdl2_net.mk b/package/sdl2_net/sdl2_net.mk
index 93bf3a2eb366..6adf8eb77919 100644
--- a/package/sdl2_net/sdl2_net.mk
+++ b/package/sdl2_net/sdl2_net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_NET_VERSION = 2.0.1
+SDL2_NET_VERSION = 2.2.0
 SDL2_NET_SOURCE = SDL2_net-$(SDL2_NET_VERSION).tar.gz
 SDL2_NET_SITE = http://www.libsdl.org/projects/SDL_net/release
 SDL2_NET_LICENSE = Zlib
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
