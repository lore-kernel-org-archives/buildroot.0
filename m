Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C49C61D97
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 01:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8038A420A6;
	Sat, 25 Nov 2023 01:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8038A420A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KQiZmX7vlMUB; Sat, 25 Nov 2023 01:01:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD8EF42073;
	Sat, 25 Nov 2023 01:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD8EF42073
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E80B61BF29F
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE48960B90
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE48960B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HceORIMqc65K for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 01:01:20 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D9D460AC6
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 01:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D9D460AC6
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1cf8b35a6dbso17524315ad.0
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 17:01:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700874079; x=1701478879;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ACX/CdjmZNCaDgVxIcSlnskNuBBKskIysheDr3sLn7U=;
 b=KUQE1jdnFaPLJ+OufLKdjwri05+JJmi2RS+m7XtWsl3WFxbsKypmeuRqSg35iIqwiH
 7mp9hsbDH6H1W40kqRjtAJ44T3oQQFSrz8m4dxJXKSNzjQP97UqGWqaJv3bmb372xiBp
 4xcU7qJpsOOYptL7vgf4T7xyALkuy7a9B+rjjKDrnpTRmfQOLP+MmCoCawgqKPNFv0PI
 n0fpdUzM8euIq0dxxFL3GGFhwfqKX74lT7Nlvek6p2ZEviPoABaVT2a8zUWEevxYE5ie
 ouPGa9zZ4ZBmz2oJAo7kCACgxoC7GC/qfvIKDVnNloN1k3bvELeBM91hHJpizdmidUz/
 mTDw==
X-Gm-Message-State: AOJu0Yyha6Fxyo7O2vrGDblVSAy1Ip7LPA+khVIMpmPdUAsFt0/3fstU
 Zl+qTfqIO2/LEOjdkvKyWRYmWNBQta65svZ77mk=
X-Google-Smtp-Source: AGHT+IEgq3G7oTaX9tWjW2p8SbnmePCTDym7fRjYlHMfriSS1uqgqVJfwOuAYn75zF7gRKKNqYazqQ==
X-Received: by 2002:a17:902:d303:b0:1cc:2f70:4865 with SMTP id
 b3-20020a170902d30300b001cc2f704865mr4796980plc.26.1700874078529; 
 Fri, 24 Nov 2023 17:01:18 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 jk2-20020a170903330200b001b8b1f6619asm3807749plb.75.2023.11.24.17.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 17:01:17 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 18:01:09 -0700
Message-ID: <20231125010113.1758786-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700874079; x=1701478879;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ACX/CdjmZNCaDgVxIcSlnskNuBBKskIysheDr3sLn7U=;
 b=lTmrd5sB6Vb1IRDemPY+dtItcF0wIBOp5Xqwzx29D2l0XmubgJVoil/PfkemZBRTo2
 T5iSrbtsKUB0sSgKnQHAHmNliS/ENS256Zxx/o//j3Re3WgGICDurfPhdDptSd+MeqGd
 t9QNNdScFtqP9japSEV09uMojgcC3JtwUedik=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lTmrd5sB
Subject: [Buildroot] [PATCH/next v2 1/5] package/Config.in: move
 flutter-gallery
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a graphic application not a graphic library

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..c971127759 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -313,6 +313,7 @@ menu "Graphic libraries and applications (graphic/text)"
 comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
+	source "package/flutter-gallery/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
 	source "package/glmark2/Config.in"
@@ -345,7 +346,6 @@ comment "Graphic libraries"
 	source "package/fbset/Config.in"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
-	source "package/flutter-gallery/Config.in"
 	source "package/flutter-pi/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
