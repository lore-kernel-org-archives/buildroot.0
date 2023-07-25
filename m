Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CACC001DE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 18:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAAA1610F2;
	Tue, 25 Jul 2023 18:49:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAAA1610F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DO0yVFPw4HMS; Tue, 25 Jul 2023 18:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EEB2610AA;
	Tue, 25 Jul 2023 18:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EEB2610AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED4191BF376
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 18:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D274E41726
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 18:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D274E41726
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PR11aSNnsIMO for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 18:49:09 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F323F416CC
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 18:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F323F416CC
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-992f15c36fcso993153166b.3
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 11:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690310947; x=1690915747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2+P6akA4TpQgHbJTHwpc/ij/txYmPpv8RpNF9b9ASkA=;
 b=FwrzsO7kO9kl547SPDG9WHVIAxNlS0ukfNZqnRjCXdesNgOMKIXbeolgZd50WW3yhA
 /SUNY8AuDzVjtByFICkZ/IAbOclQEsPIF7V8l2FKDMgynwYOeXCDwqVESKyCtif7WsuU
 fPaM/U31xHThqH54CS879A1vRxiWbjyLQouVVoDdkeMnqUx9n4E1eLa5SqcYTeubyIX1
 3F1HnBXuYI6V9YZvlArhwGZV/MSxIawGMzQ5aGU3QzbxkBZ+V7iyxmCTPjYhc8IPKsgf
 vSm3qfTNfNA8a+ZD5jfwosncHogG+PMVDl++5EhX8J5b4lMqYzjZI+/IUhtnzDGhVpAC
 VRTw==
X-Gm-Message-State: ABy/qLYEzbdYfeMTT9VQ9i9EBfJ1hIwXtOIskC0edPEeDVae3zNWH8NW
 2Bcq/Mh+XGJOrn2JZwEtNtAxizjUgA==
X-Google-Smtp-Source: APBJJlGMSVowRkI56CPHmvv4Pb2QR6pJBbjfny9RtR9X2SxgMRB3rLFhS5A/wsZupVi59avDuu5lFw==
X-Received: by 2002:a17:906:253:b0:99b:5085:42a2 with SMTP id
 19-20020a170906025300b0099b508542a2mr13855691ejl.40.1690310946845; 
 Tue, 25 Jul 2023 11:49:06 -0700 (PDT)
Received: from pieterjan.lan
 (ptr-dc5856pdhz5fufzy22d.18120a2.ip6.access.telenet.be.
 [2a02:1811:bc80:f7f0:6d83:bb9e:8193:7df5])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a1709066b8e00b00992aea2c55dsm8529847ejr.153.2023.07.25.11.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 11:49:06 -0700 (PDT)
From: Pieterjan Camerlynck <pieterjanca@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 20:48:47 +0200
Message-Id: <20230725184847.3936-1-pieterjanca@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690310947; x=1690915747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2+P6akA4TpQgHbJTHwpc/ij/txYmPpv8RpNF9b9ASkA=;
 b=gq+sefLUruExsF9JJE5tO+pO3jwoYb2RkmYW7AANELFk+ldpmekc2f27HvGX8+bCfF
 /2WUpdxhnS9oy7e8KOTiB/PsOucCa/htBnIVbB1nVUWua5RHt4JCQIpl0ti7dQ86wqVF
 42LeYBV63HDB3ao7oBbGtSV7AV3aBJRC37PF/TSU391d2nlZq41obtNkJZV9rotEYJMb
 /d2jO+5q6HYA8mTH1vcZpQEDRic9sGor3IeIHbeTx3cqDGRJcG9nubyitbB/A/1OckMu
 G0dqmX5iFsvdB0ATK5/cWZeSSrjfmdwj49+Bq2eohSOImutuTnFcM9+Xpjgv+Omw7LPZ
 6oew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=gq+sefLU
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: update email address for
 Pieterjan Camerlynck
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
Cc: Pieterjan Camerlynck <pieterjanca@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Pieterjan Camerlynck <pieterjanca@gmail.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c690f1dac7..6d8b43c31e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2428,7 +2428,7 @@ F:	package/tree/
 N:	Pieter De Gendt <pieter.degendt@gmail.com>
 F:	package/libvips/
 
-N:	Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
+N:	Pieterjan Camerlynck <pieterjanca@gmail.com>
 F:	package/libdvbpsi/
 F:	package/mraa/
 F:	package/synergy/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
