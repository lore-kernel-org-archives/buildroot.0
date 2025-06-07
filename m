Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA5CC61CE8
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 17:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 896F581700;
	Sat,  7 Jun 2025 17:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 482aMpyPrDGO; Sat,  7 Jun 2025 17:09:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A993816E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A993816E0;
	Sat,  7 Jun 2025 17:09:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 450A31F2
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 17:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A70240582
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 17:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CmmgVdymxpL8 for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 17:09:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E4F454054C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4F454054C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4F454054C
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 17:09:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.120.224]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M42jK-1uNx3I1Shk-000bsT; Sat, 07
 Jun 2025 19:09:52 +0200
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Sat,  7 Jun 2025 19:09:34 +0200
Message-ID: <20250607170936.1502446-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:RsA2U0b8GFiU8bMfFKFRKERCts37hr+0A69z46n6r1QmHfslq9i
 g9IgdUzTuUK6aC7X188Hy8yffU7q8b6sl6RZi+x4FCH+srqYDybKmkPXMkLxEYJdmpsZbtc
 656rR7giH2+Oe1oi/AKaKbhs7L84x5XMRVzeDFLXpXQIo9Xot9v9W4ONoRRen8RI0R9Xep5
 mH0JxY/21r+arJBtyJA8A==
UI-OutboundReport: notjunk:1;M01:P0:8QPFMGnyBtI=;nv+TtKNntF9xCW98dVq148/7Eua
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1749316192; x=1749920992; i=fiona.klute@gmx.de;
 bh=2sBNAheIJS7+UwfmFx9Cnpeszvy0hrVyI8MXShmimMM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=l+0vIW8VVWJ3/eonWBEsb4G4Rig/Lpwsd4lEFHZbPPPwbo8ilIHcyrc02fLW5EQJ
 BkQirTQXA8UoiAyrzNF7Wmz4tJPnJzTMQYFttyUXHqdEnckeRi5o1zrDZZzkSg6PV
 k7AhSqn6wqwbZuZI/VgUG3WyBDkHVhe+rn3HOjQ+h+0NggX16RbY8paXL/JJnLlWD
 qjTzzOTwxqxLuxN7isKMYTsUvUq48iPBKRauL17yWayRks0dCS8wgXtErAOIXCJ3E
 GB2bBoEvJmfnNXreSGRDMgVUq4Mudb3xU9ZI8gyz7SuW95xf9aw/kEK/tQE4C9WNW
 WoU+p2hfO1pBILS+Pw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=l+0vIW8V
Subject: [Buildroot] [PATCH 1/3] package/eudev: remove obsolete
 --disable-introspection configure flag
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It was removed from eudev with version 1.5.1, when introspection
became part of the gudev option [1]. This has in turn been removed and
replaced by package/libgudev, yet somehow the flag stayed. Remove it
to remove a warning during configure stage.

[1] https://github.com/eudev-project/eudev/commit/d5d6a7f3040992f853eb23eb1bafac3b77891c2d

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/eudev/eudev.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 8318bc1ed4..99c9f0dcab 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -14,7 +14,6 @@ EUDEV_CONF_OPTS = \
 	--disable-manpages \
 	--sbindir=/sbin \
 	--libexecdir=/lib \
-	--disable-introspection \
 	--enable-kmod \
 	--enable-blkid
 
@@ -71,7 +70,6 @@ HOST_EUDEV_CONF_OPTS = \
 	--with-rootlibdir=/lib \
 	--sysconfdir=/etc \
 	--disable-blkid \
-	--disable-introspection \
 	--disable-kmod \
 	--disable-manpages \
 	--disable-rule-generator \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
