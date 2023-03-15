Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B09CC6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 08:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A746540926;
	Wed, 15 Mar 2023 08:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A746540926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QrzHMuTwcACf; Wed, 15 Mar 2023 08:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B92C5408F7;
	Wed, 15 Mar 2023 08:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B92C5408F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BD901BF2AF
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 08:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7623E40127
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 08:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7623E40127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KDljcEMKQ9xE for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 08:51:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1B5040590
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1B5040590
 for <buildroot@uclibc.org>; Wed, 15 Mar 2023 08:51:08 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 5F39A5C02DD
 for <buildroot@uclibc.org>; Wed, 15 Mar 2023 04:51:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 15 Mar 2023 04:51:07 -0400
X-ME-Sender: <xms:-4YRZNvpIZgHLRrtgKUfFXusnc9XpSQ_NELoIqYvLwG1sxGe_ie0gw>
 <xme:-4YRZGdwZQaZui_Ao3K6pxDJgosGAALsMffJU4vlrYQUn6o_wXSHHCAg5nb4TQqLe
 SHbK6NWh0Qhuf91wbU>
X-ME-Received: <xmr:-4YRZAy-gcTCnLOvaq1uzRjSj0PwW4x_WcsojIBdYIAx5vD8oldmIo4xQd_d9JO1dJk-emnNyFlsw2iYIg-JlAUp3mjoMk9A98LcohbvCDazR2JtMmu6IUmqmB4z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvjedguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecugfhmphhthicushhusghjvggtthculddutddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpedfnfhukhgvucff
 rdculfhonhgvshdfuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvg
 hrnhepudehheeggeefheejvdelffeukeevkeeivdetjeehleefteeliedvgfeltddthfeg
 necuffhomhgrihhnpehlihgsshgulhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:-4YRZEMf8Bttj1KeFDP18K6h616MbuKDBWvsIlYjSkOVcGcJnaDcMw>
 <xmx:-4YRZN9FW8liN5AMCsi2_i5RyUq6tW9NwtK9mpSOiHTPVpIVRTXvxA>
 <xmx:-4YRZEW2HQn7N93o_pDH01YcWJ7tKLozqWziPp-MZl7VFGoGKY5tGw>
 <xmx:-4YRZAKVlQqMspbpFs_yF5dJ4qeK48JUupnbaBPsIcRtCVOZDdifnA>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <buildroot@uclibc.org>; Wed, 15 Mar 2023 04:51:06 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: buildroot@uclibc.org
Date: Wed, 15 Mar 2023 09:51:02 +0100
Message-Id: <20230315085103.1671888-1-luke@ljones.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ljones.dev; h=cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1678870267; x=1678956667; bh=8MHd6nwBA7
 ZFsR3+BOpyKjn+G3smXXMM8S79QvizH/M=; b=RO4xjz0FDHwqslo2NmjwXNCiwo
 VfWRAYlc0sOeKtg5Jr7nQhsdvYZaoduzBYNLexGaREdtKhe52nfZYxrT+meLJRN1
 5vGhgrFfoeik5/k/pQ+kne8+Z4mvunKbJDRWJSsc+M8V4CZwldd3LOWAovjQdM++
 madMI0vXPShlqFj5awE+ympySHPhesXnUYHvci4w36eK4COMMB83QUBRh60ogElo
 FajTKjf3DRSpsrXCJAx76Ah5DZrtdcjpsoJ1DfeosQY1QTidnx3+yrsSm+NX3/zl
 6v50dPS4vWtk+kLvJtss4zo1WeERCFDqInkZVrTh2RS0cO7cCGLpZGNUXSWA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:feedback-id:feedback-id:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1678870267; x=1678956667; bh=8MHd6nwBA7ZFsR3+BOpyKjn+G3sm
 XXMM8S79QvizH/M=; b=eyevdh9zgxD1SGAct/B0dzO3yXHx8znUuEfsYwSKsGkt
 MNNr1cwk68Ap1TSNtCUsKOnNImS14d0TRiav2ewwoPoXIzWmqJbY5RM/ldr3Hdb6
 ttnz0CHjoNJg6pyxXDxKGzbqTVIUwMiLQ1h2wPvgqTx6aJHJ6X1mJ5XjpDP8m+vM
 PD9WsZSOUpUD46bAhUY/S822RTM8UJAq9dlzdxTVOTVO4Cj9+Nd9XdlD4h3aXMM/
 GJtGuowehS5Nf6/Cxcnx7BPt3J1g5fgwM2dg2kKrIt2fYI1NlocMHcuh0+r3d6yS
 Dajlbb3RFRbHaEiu2DXOuRl9lz1LY2LgELGMlyoq6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ljones.dev header.i=@ljones.dev
 header.a=rsa-sha256 header.s=fm3 header.b=RO4xjz0F; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=eyevdh9z
Subject: [Buildroot] (no subject)
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

This patch adds support for a few config options in SDL2 that I had need
of for a work project:

- video-wayland, to enable running SDL2 applications under weston without xorg
- video-vivante, to enable running using the etnaviv driver directly
- pulseaudio, to enable building SDL2 with sound support

The sound addition is heavily related to a decade old issue that still persists
as described here: http://forums.libsdl.org/viewtopic.php?t=7609&sid=40fdb9756b8e22e1b8253cda3338845f


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
