Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFE7C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 08:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CC4441765;
	Wed, 15 Mar 2023 08:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CC4441765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-JqlBdQ9Eox; Wed, 15 Mar 2023 08:47:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E01E41745;
	Wed, 15 Mar 2023 08:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E01E41745
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41BA31BF962
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 08:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1956F416AF
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 08:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1956F416AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E66TEq06hV_y for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 08:46:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82A32415D3
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82A32415D3
 for <buildroot@uclibc.org>; Wed, 15 Mar 2023 08:46:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3E3B45C0894;
 Wed, 15 Mar 2023 04:46:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 15 Mar 2023 04:46:40 -0400
X-ME-Sender: <xms:8IURZE5hCP0MSwcASoGJsnDw1WGO30i5qTr4y59O0gTuc0KYc_2aZQ>
 <xme:8IURZF6e2-PkUPWubnepBriIZUh2LOohtVkTOYRiOKTePAdFKH7DvK1mVPfE68g-h
 ejmGDq-T0jO4Y7rdT4>
X-ME-Received: <xmr:8IURZDc6085BRHT5LMIRWIqaN-fvadUbJ2OVb_BrWnX-HB5XkIYklHa-O653piHA8l8v-L2vqWVYqAS2QYPGGUs5K_ediRPl_7nQ_ZcrMzagi8sSpBMMpl4Nxlq8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvjedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
 ekredtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvges
 lhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpeeiffdvfefgtdevleehffekue
 ejueehtedulefgieekgfdtfeeiffdtuefhteevheenucffohhmrghinheplhhisghsughl
 rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:8IURZJKf1HdTkj7QMHoHF8PlrGG1TrkGfgcIaHpw26ru2cMdpybvaA>
 <xmx:8IURZILhwP8XLLk9gwRh6Q3Zr9wHlIJkRlnivvv8QRP984U-YAXixw>
 <xmx:8IURZKxseVCugJJOiV9eE6tuaCY05Qy1ybfFypsjy7A7IhdyBXVWrg>
 <xmx:8IURZPn-BXyUaR2Wju9PvK1BJMn3wIfobGvNPz9jbUo3jt0pR4w99w>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Mar 2023 04:46:39 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: buildroot@uclibc.org
Date: Wed, 15 Mar 2023 09:46:22 +0100
Message-Id: <20230315084624.1665061-3-luke@ljones.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315084624.1665061-1-luke@ljones.dev>
References: <20230315084624.1665061-1-luke@ljones.dev>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ljones.dev; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1678870000; x=
 1678956400; bh=E0sFdcJlyILV/vwlCJiuLxFY4jqKy6q4gIDrvBLC29k=; b=l
 XNYznflgKKnbWlhb8BpG+Zy5Ma6IfF1couIl0iYiCKbNgoaE2i5gd7zlDKqh5Dr8
 PJM783vCnndlFJhglhX/kFD8MaT7uYC9JnUw0NUlhPaLNDPadQlrn7uZEggMquXZ
 mcjOPX6xXxNk/12HhD3p3v1gSZaN1vNQNP7gCQMmJhSwlA5jWQNoMa3hk01Op8sF
 aN/s/7erLMGGMqrp1Wuekx0vtrn2biYFjqacQgju2QzdocvW0i8uAZDVpI7/3YEz
 xvuxpWrVGtO0rH0LVINfFF4lb+jC3c49GiUuU0QLMbPHPlPeymUmAsRqi2JAvnw7
 QjqYX+Wobqvx6MSg+vsVg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1678870000; x=
 1678956400; bh=E0sFdcJlyILV/vwlCJiuLxFY4jqKy6q4gIDrvBLC29k=; b=R
 +nAFoysB6oxRmo8lleelT/FIQx62vKE+ZnDXiHVADIzoHmzgF2UP2R4j3vxRSSAU
 g9nu56DwZYzw3b+1atCxCzCfQYf12X67BwUCmUkfdVA9HvN289VgyNZ1FCaQnqL7
 VEwaPkO2LOwVI8wM+VkVw+8Y2bbl617VoJcURSV9IzwlfgXKx8ef8fyoi0pCeaNT
 hhk7OJJY6MAoOEyR75bMd/1S2YZwcVl/pFGO5mmcaq2ejcslNtAKyEf0reybUQvK
 Knb7GwXqznjabnBpD7jkr2qquadRVfBFwh7dYqFcKEupEn1BtP/vJrn+zi3fM0oe
 lZm1yhoFjhRAzJVgAx9IA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ljones.dev header.i=@ljones.dev
 header.a=rsa-sha256 header.s=fm3 header.b=lXNYznfl; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=R+nAFoys
Subject: [Buildroot] [PATCH 3/5] package/sdl2_image: bump version to 2.6.3
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
 package/sdl2_image/sdl2_image.hash | 4 ++--
 package/sdl2_image/sdl2_image.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
index e1efa4debe6b..f20bccc9165d 100644
--- a/package/sdl2_image/sdl2_image.hash
+++ b/package/sdl2_image/sdl2_image.hash
@@ -1,3 +1,3 @@
-# Locally calculated after checking https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.6.2.tar.gz.sig
-sha256  48355fb4d8d00bac639cd1c4f4a7661c4afef2c212af60b340e06b7059814777  SDL2_image-2.6.2.tar.gz
+# Locally calculated after checking https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.6.3.tar.gz.sig
+sha256  931c9be5bf1d7c8fae9b7dc157828b7eee874e23c7f24b44ba7eff6b4836312c  SDL2_image-2.6.3.tar.gz
 sha256  28aabfed22b3cb0b7e23ef40385e4f66297c960082f029c96d073cc1d4e008d5  LICENSE.txt
diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
index 953742de28ab..aaf379788cc4 100644
--- a/package/sdl2_image/sdl2_image.mk
+++ b/package/sdl2_image/sdl2_image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_IMAGE_VERSION = 2.6.2
+SDL2_IMAGE_VERSION = 2.6.3
 SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
 SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL2_IMAGE_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
