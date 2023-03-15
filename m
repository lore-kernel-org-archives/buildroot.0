Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A626C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 08:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB72415D3;
	Wed, 15 Mar 2023 08:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FB72415D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nnIl1t-aYbKV; Wed, 15 Mar 2023 08:46:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 888AB4168A;
	Wed, 15 Mar 2023 08:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 888AB4168A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5F981BF2AF
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 08:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACAC6405BA
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 08:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACAC6405BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tf5CAngdHy3w for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 08:46:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C575740590
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C575740590
 for <buildroot@uclibc.org>; Wed, 15 Mar 2023 08:46:40 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 407645C09FF;
 Wed, 15 Mar 2023 04:46:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 15 Mar 2023 04:46:39 -0400
X-ME-Sender: <xms:74URZIRled0WI8d7Is-52xVYsB5xfvVOjAgdQTGFJK_ApWCe21AtoA>
 <xme:74URZFztirO-a633PskWi2upLlXLY7eH9p5_n039_6_AgKJcNHKxmXX9_4BNbeeAM
 JtuiQtPKgSfCI-an8o>
X-ME-Received: <xmr:74URZF0QmNNbSPKzWEXzlaY-nQX92K9LKxOU4tp7j4SdsmubE2jdQZ7w1NUOzUI1N1vGzpeiDtmcHcODK9ZVXP6rXfMB4MWzdD70ayskdYCdZHibTneikT-nkPnG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvjedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
 ekredtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvges
 lhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpeeiffdvfefgtdevleehffekue
 ejueehtedulefgieekgfdtfeeiffdtuefhteevheenucffohhmrghinheplhhisghsughl
 rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:74URZMDxEbeNmbTEPZs1Io7F58a0YDenolFr8ze9-TgywObBW-_mfQ>
 <xmx:74URZBgzGqvUO5gcyUUQjjjdNxUjfWc_ji4B0rdRG1TkJGAG4NKDQw>
 <xmx:74URZIrtFc-d-YO4Rru8KKSYXc58Tc2kjSTnu8J0_T0wjJElnIjvzQ>
 <xmx:74URZLfvZFBjcZfcFU_TqIYlwrEwtnlKv5R340PRBryIhuvLK6MCAQ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Mar 2023 04:46:38 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: buildroot@uclibc.org
Date: Wed, 15 Mar 2023 09:46:21 +0100
Message-Id: <20230315084624.1665061-2-luke@ljones.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315084624.1665061-1-luke@ljones.dev>
References: <20230315084624.1665061-1-luke@ljones.dev>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ljones.dev; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1678869999; x=
 1678956399; bh=sJTBVk6AYDGQdso+qh5vFJnn76WZofVkChlEOItzpeY=; b=d
 siAdc4grcGGftp9Ta2GUadJtVLi4oLo1z6eTrVcY+Oj2czb57bDTn+0rD10XyFeI
 s4Dn5p32uiBy3LCBYt+aQXUkOAqmvKq2jj17hlWNUCXySq39xpoLnZgosjRD8uHr
 qxchrmX6fZftWaVeGf/2Zhi8KHABzGQ+MlSLmXhW4Az+/BZ/lt2qjAR7uMmZ4nZo
 p945zGOSoXE4vWVjrTrJFzq+VYQbU1bJ4BD1RqBW4KkCaHf4USxHs+/2hfjJjVnC
 oCNAzGQncnfN/i14U2vTd2pN85xkCEjbcnr/sninCpHyYOPJ3cqOU0EuHQdKilCq
 DnPAtVCXmAnQm6NDdMbDw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1678869999; x=
 1678956399; bh=sJTBVk6AYDGQdso+qh5vFJnn76WZofVkChlEOItzpeY=; b=P
 YA0zbRgNNpUnI1eJHJ9CU3+Q1hPt2iLUmPHCchsW59QYNhxhtjXkCW2C9itoSJRH
 V59di4vZ/Yb4TMaF4b/mNot/elyX23jenTPaUzFCG7MbpX0txCy/SkMOUw+u2ftw
 sgUQ0RNfPZUvS9ME4ugEkZxTbcZERZiHNqGn/l2VI+P2yXNuZMBDjF+xCx+BBmci
 uiZya+qFhNsWMyH1tqvKAR/sUyAK//xKz/Geiu1Ew7VDutd4nICCCXh72u77dwAN
 m7r1kmWHPr1+q+RWzjiIjWJtxQCGhoRYvz27rL1hXAEdJzwQjhS3HaSNcZbXggzy
 qocc449J6FLWGInMd+glQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ljones.dev header.i=@ljones.dev
 header.a=rsa-sha256 header.s=fm3 header.b=dsiAdc4g; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=PYA0zbRg
Subject: [Buildroot] [PATCH 2/5] package/sdl2_mixer: bump version to 2.6.3
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
 package/sdl2_mixer/sdl2_mixer.hash | 2 +-
 package/sdl2_mixer/sdl2_mixer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdl2_mixer/sdl2_mixer.hash b/package/sdl2_mixer/sdl2_mixer.hash
index f3bab151f22c..98c5fda6af50 100644
--- a/package/sdl2_mixer/sdl2_mixer.hash
+++ b/package/sdl2_mixer/sdl2_mixer.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b4cf5a382c061cd75081cf246c2aa2f9df8db04bdda8dcdc6b6cca55bede2419  SDL2_mixer-2.0.4.tar.gz
+sha256  7a6ba86a478648ce617e3a5e9277181bc67f7ce9876605eea6affd4a0d6eea8f  SDL2_mixer-2.6.3.tar.gz
 sha256  113727180e7956cb9718b03b41da85b63ea54743a33047071a623bf672895a10  COPYING.txt
diff --git a/package/sdl2_mixer/sdl2_mixer.mk b/package/sdl2_mixer/sdl2_mixer.mk
index f349b8ca80cf..425380bf5dd5 100644
--- a/package/sdl2_mixer/sdl2_mixer.mk
+++ b/package/sdl2_mixer/sdl2_mixer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_MIXER_VERSION = 2.0.4
+SDL2_MIXER_VERSION = 2.6.3
 SDL2_MIXER_SOURCE = SDL2_mixer-$(SDL2_MIXER_VERSION).tar.gz
 SDL2_MIXER_SITE = http://www.libsdl.org/projects/SDL_mixer/release
 SDL2_MIXER_LICENSE = Zlib
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
