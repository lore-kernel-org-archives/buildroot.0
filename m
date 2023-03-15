Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C69C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 08:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25A75408D9;
	Wed, 15 Mar 2023 08:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25A75408D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHj5k-6sZijv; Wed, 15 Mar 2023 08:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D13A14088D;
	Wed, 15 Mar 2023 08:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D13A14088D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 434601BF2AF
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 08:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C6A460C13
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 08:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C6A460C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EGjz0JSOOG3D for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 08:46:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26C1860701
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26C1860701
 for <buildroot@uclibc.org>; Wed, 15 Mar 2023 08:46:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D9095C0A27;
 Wed, 15 Mar 2023 04:46:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 15 Mar 2023 04:46:42 -0400
X-ME-Sender: <xms:8oURZKxSwhcDjKzMuqRIvkEKb1kC8v7RHzhfsTEuAlzWmTW4mOP2Fg>
 <xme:8oURZGTXiVqYodLQpAd6SFLhu5ojP0dRxdZalaMP-VYc-rLmeFRqRTUW4ECwZ2VeK
 FkG4uRBjfU-EJ3m8Q0>
X-ME-Received: <xmr:8oURZMXlxKPsEftBnR3wEsN3M6RVEIV-JzsQeROYZwF1OBamWM-lfec8XrM-pTTNO_5s17_SRTMcv25foPN9pIojQQ8KT1z7Px_zetngxIwkTRq-4YJ2wDloXl30>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvjedguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
 ekredtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvges
 lhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpeeiffdvfefgtdevleehffekue
 ejueehtedulefgieekgfdtfeeiffdtuefhteevheenucffohhmrghinheplhhisghsughl
 rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:8oURZAg_xI03K0E_iPUcxeSoAd9n57nX3ITJWXSZ9ewOHazS1Ozytw>
 <xmx:8oURZMDK0_RA0AcURU7--7cvv-eMztf1e4wzE6ExOic7MC90Rzfwvw>
 <xmx:8oURZBJwPHBtiqJ1SrhHDEd6hMB-sEsGuW8vhJmNJs5KSChGrgey5w>
 <xmx:8oURZL8SxPW1KgGb90ORiQsK9zMl_zX5uSZsjhqGglhgxNrnSFIjnA>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Mar 2023 04:46:41 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: buildroot@uclibc.org
Date: Wed, 15 Mar 2023 09:46:24 +0100
Message-Id: <20230315084624.1665061-5-luke@ljones.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315084624.1665061-1-luke@ljones.dev>
References: <20230315084624.1665061-1-luke@ljones.dev>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ljones.dev; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1678870002; x=
 1678956402; bh=BNdxPcyq+UgPLb5p/48tdXQMD+MRovtFdakCOj+R8qo=; b=V
 RWTgzW4TV/xoHaokRj52x5cOziJKVTab6409N4jvGn1SWCK0rfemEtoD36hNjSCM
 jklExIjxpTu5o03TdxGf0RcSo3UqCfGLPLSDZvWx41ObbwwT8/XVm8actWdQrIKs
 1knGj/3NuAo1qqeFY/zBNdMauN+lSlm9esAeSsreI/dNCEFhn3fLkndU3XfkR3lW
 2L/RpLWH3JxGGZJl3Lcrdxi15mmZOzwzn5DbDIdJq1f8x4yfbZeqLJn4dw4dtWR5
 hX1gSA72DTuS/9Cs2H4gb/3351Fl0FPqVsTXE8sBC2oHQVZu+USSYPYdByODkPzq
 eisyzkXInW6WyovjbyyuA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1678870002; x=
 1678956402; bh=BNdxPcyq+UgPLb5p/48tdXQMD+MRovtFdakCOj+R8qo=; b=t
 3N7vZyi3RmcvlBB4mvCsKfFYzb1ixYmdleRlh4/sAyRfJbkKshw2I0/Gcqp2uhi5
 WwUt85r0ImnUsePrpBhb4RRkv5Zv9aOPmgYM6jgatAbNVQ9cuTzcOlsGCowh68tU
 ETsoCf58i9QyIv4Wzv/9Xys+Yur/BIHu4aorNZHXQhwpKC+urw/aKpKOhQVydMpp
 cDMxwQjFbRKWJHo0i3EyuBIig0HxnpvmGXmWnJ38GSTHNS15L98TyfK0SKyZz/La
 AkK5qd9NBDYa2RgUcR7aQ6xWIEXygdtPn8zDU2thXdOwq+0BFraAgH9k3lRxs45C
 3l/LgQ6kJ/2+15a87/HGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ljones.dev header.i=@ljones.dev
 header.a=rsa-sha256 header.s=fm3 header.b=VRWTgzW4; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=t3N7vZyi
Subject: [Buildroot] [PATCH 5/5] package/sdl2_ttf: bump version to 2.20.2
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
 package/sdl2_ttf/sdl2_ttf.hash | 2 +-
 package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
index 3313b341f9e6..1225ee1acbd5 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  78cdad51f3cc3ada6932b1bb6e914b33798ab970a1e817763f22ddbfd97d0c57  SDL2_ttf-2.20.1.tar.gz
+sha256  9dc71ed93487521b107a2c4a9ca6bf43fb62f6bddd5c26b055e6b91418a22053  SDL2_ttf-2.20.2.tar.gz
 sha256  28aabfed22b3cb0b7e23ef40385e4f66297c960082f029c96d073cc1d4e008d5  LICENSE.txt
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index f859d097fff7..c2c4b660f82f 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_TTF_VERSION = 2.20.1
+SDL2_TTF_VERSION = 2.20.2
 SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
 SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 SDL2_TTF_LICENSE = Zlib
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
