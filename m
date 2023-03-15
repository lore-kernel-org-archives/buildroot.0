Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0282CC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 08:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9908B408F1;
	Wed, 15 Mar 2023 08:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9908B408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9cHSraXEzTtQ; Wed, 15 Mar 2023 08:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DFF2408D1;
	Wed, 15 Mar 2023 08:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DFF2408D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11A891BF2AF
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 08:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0FAB405BA
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 08:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0FAB405BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yYvBZk6AxDeW for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 08:46:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F20BD40590
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F20BD40590
 for <buildroot@uclibc.org>; Wed, 15 Mar 2023 08:46:43 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 1CDD55C0A07;
 Wed, 15 Mar 2023 04:46:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 15 Mar 2023 04:46:38 -0400
X-ME-Sender: <xms:7YURZBIcTtakXEOmFDxTvFqph96mQgsNnVReIr_kZJR4Ps1scBs3wA>
 <xme:7YURZNI7CDFB2HW5_93f_q0XZNqS7VJ3JFtn1Bqu9Qh2jvaWXZ8sbOas9TL75c4ih
 aX6Emu_08ZV2lWOMTE>
X-ME-Received: <xmr:7YURZJt8OH-0KFLawa44QR3_89awlA-Zj49UQYbhCMvcTEng926XuCNV8etkWalninTx8v_7Zx2sFIsbL8p3WFE831L897h3X52LibNmeGT_ppkjn19v8WsAgLh1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvjedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
 dtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhj
 ohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpeejffekheffffejhfdtieffhfehge
 dvvdefveehlefgteeltdeivdejvdekieduleenucffohhmrghinheplhhisghsughlrdho
 rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplh
 hukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:7oURZCa8x3hdQO1oyTZv4e4dXMTZRiCnqocG8Zf3mY8ehsNssQpvxg>
 <xmx:7oURZIYEYYMDW781rnWAJPEt1QU_U3YmWX5Ci_pLL-G_8cqarWpAPg>
 <xmx:7oURZGDtzfrWzGRpm-BJygtf30Ow6J6zjzrbXTR_ZrA0cbXrlVi2Vw>
 <xmx:7oURZO1WVfLFrHM5kj71drDloAfFYggMhpTxzdipKwx77TLm0WN25Q>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Mar 2023 04:46:37 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: buildroot@uclibc.org
Date: Wed, 15 Mar 2023 09:46:20 +0100
Message-Id: <20230315084624.1665061-1-luke@ljones.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ljones.dev; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1678869998; x=1678956398; bh=DNDfBnptyp
 e7wETXd2YP3ETq93G85sPnHnhHv5nxmgs=; b=XFu6xZOlHDLYwN0bYxD/zvQech
 ptdA6MtCW8erDHxu9acN5bkK6l/fAa0kkD3VsjsjiYw0arkkK8vkdkIfNNKDhfHE
 DUpFOq0axUYMV6rR6x0QuKAr7ejxOqbbm4/JlKsaYMqvzxKf4TpleZO9FKCKU6Ru
 g06VXExgaQbO1IAwQWPYWNn4ccKcLVfXOHhTz621oNTittowUA0wMgMuDlLCDstR
 oHfATUQyHIsxdg9392yJWMACZnSsroWkzunk6y56DCCLpEHf0hHuSoiYynpEfyWo
 nTH+GvY0NnCz8ZPu0Glsk0U9siELeNcWFzyF3w5Z8WJdig3mI2l3qUUbuJOA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1678869998; x=1678956398; bh=DNDfBnptype7w
 ETXd2YP3ETq93G85sPnHnhHv5nxmgs=; b=dEpoBifnJKURLrLYPqIVT/QWq02RS
 bb2FJIqa5+Ae6VW2JQoxEYbtqm1tBuCU326IwvYW2jjzLpL1FsaGHm7RvpYyAufw
 h1NZkSRQozsB+FDhAleUgVKQtrShiFL8c0QDqYaTyQiCPguv6HvetBp05xG+NXwN
 YfY2WBERxGj3iZuNSfF3rr1NwcJE9jsLIb7D2C7JsZegwbmCiEyIPpVfotAPAd9w
 LtT8sFVQ9INTqC5Y3dBv4LmTZoWAMcQXdhCsVDPgtSSXBSbCuuoeGmHgACnluUm5
 o0XpZmrazbNAQL9oASCJz7kT7BFoHfzmK5zAUZM+fVq2hU5Jyc8Gh9DXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ljones.dev header.i=@ljones.dev
 header.a=rsa-sha256 header.s=fm3 header.b=XFu6xZOl; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=dEpoBifn
Subject: [Buildroot] [PATCH 1/5] package/sdl2: bump version to 2.26.4
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
 package/sdl2/sdl2.hash | 4 ++--
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index e26dcee30160..8232e66bb13d 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.26.3.tar.gz.sig
-sha256  c661205a553b7d252425f4b751ff13209e5e020b876bbfa1598494af61790057  SDL2-2.26.3.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.26.4.tar.gz.sig
+sha256  1a0f686498fb768ad9f3f80b39037a7d006eac093aad39cb4ebcc832a8887231  SDL2-2.26.4.tar.gz
 # Locally calculated
 sha256  9928507f684c1965d07f2b6ef4b4723d5efc2f6b4ab731f743a413c51c319927  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 12bfe0eb1592..8504b345feb0 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.26.3
+SDL2_VERSION = 2.26.4
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
