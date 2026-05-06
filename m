Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5864ECD3445
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C477833CD;
	Wed,  6 May 2026 22:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDUTjjAoTVKh; Wed,  6 May 2026 22:34:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CDC18364B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106874;
	bh=exJUu1RJfPhg1BCOQDwJU+gRINxrtUAyn0WevLFyWvk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Y9lF5hPBqmvQM9yKQHgHAXbMnkf4XV2O1vSdAKOBaEzn+19R7QRo3d1E97guXRgEB
	 xvAQ1nr6jkBZ+yYjmfQ5SHrHfj6G+1VzQqn1XIvEFrepkHZIaGAkFLEJfi7Bsannpl
	 pnPoUqPu+rJOLhooghwMfJaZpzBRGS7CRNejXew58tiUMppyoXGJ5akMv9dix13l2d
	 vOp2DViEA5WZDjhO7FUM+zGwVbaSDnPyrg1jLglg5I0x8NqWJt9t+mZqNO9HhpB1PI
	 vAoRJjJpSRkpmj3DuOkpy1wt2uS4WaQykSKOFw6gTy9+OW7MupH6wj+u3XxcW0Whp1
	 G5a2E5+sAt49A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CDC18364B;
	Wed,  6 May 2026 22:34:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 429D7280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28E6483753
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDoXy4sR6Raj for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 198F983658
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 198F983658
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 198F983658
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:28 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7dcd689829eso204665a34.3
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106867; x=1778711667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BqQYPuKXaK5AsOZ8OKL2WfPCNe2c360WrtmCI8U7WbY=;
 b=pv8O5NTfrx8yxRCBotnOmZrHbtBHR2rAxLXFo8rUSwD1TQ3sOLZ/gZRFSJma7s+C/Q
 18D9W2Zf5EaFxSXHb/mHrF4qujqdGQrWVmP7NOCBRxDv/sGnGe8EetmZCbfXMt0x57V/
 s89BEAetzS2MVOM+U3DIsdTfx0/nDDwhAFXzPAlBoYCuIE9r+MsOQwE7oP0tbATiM0GC
 QHBESsr45MOeUhNx6W4cCoExowNxlqWG/kDbYtZOCl1RI4oZ/fbNxPUemwvx1IjVDrYW
 C07IMIQ1Rbqm6DknpAG3jBWZ+XB6UAj/ptOxYvzZ9Qt1rQigpKLbsufo6bR6Jl1TeENx
 3h+A==
X-Gm-Message-State: AOJu0Ywi5Y646iy79tvP34vfCfZioleFmpB8HkSahO4Zygk1rM+udKQi
 PoaAKxEVkkMaay1WtFiyAdJFdQ8PRXBjWUV+qOXLgZJA2akFTORqFWMVGAjZdsn4
X-Gm-Gg: AeBDieudbH4CyRXsvg/vk+Fio+8LhVqI4ujHBBF906d1eRjX5nV8dLuTCJeevGeYZ4r
 WnL4zP2xZgQlE7SOteY0ES3e/b7rfnBOO33ay2MYbutgHii9xT5H7YSAj4H8DugUWFQ+91aA3eL
 8g06u+g6ouMt3lsWkYQL3jnpvQyi2Zt+rC31qvz4P7vsrXM2tIW+vQ/7uoC0lEY4z1DmKhdBKSU
 rx7MJBwz8Y57CYBVULEJjjhEbrGMaAnsxfteU6Rt8NBa0rqSwgkC1y23H7azrj7va2y6LPh0rOW
 2oR/Z2XMfCMcj/W1uxg8hE/zPvrBn/dva0UWl9tIv/oXEJA8R8J4SSW2zRy75v1ffEltIVuFsHK
 HuRYAz6oTCEwfVwdlhYvREgpEN+DJ9bGjr4xQIh4mxbVl4yGQTvmyk8g4CiVPi71uuOrKROi+FP
 hmf0+vW8c2MB/3npW+H0SAMarn2+HXY6O5ZbKbJk/F8K0recJcFJnrtgRfcnLY6t5LMkTkF2fQh
 w3n9R7dXD20hOMXkIaO5QJcyP9Xe34sOzCHdu2fT4uCv3nAJ1esIEfFuKU14FhPJXM5zMRBLkk6
 fbJvNzU=
X-Received: by 2002:a05:6830:44aa:b0:7dc:c4ae:a66f with SMTP id
 46e09a7af769-7e1deeed181mr2814146a34.7.1778106867639; 
 Wed, 06 May 2026 15:34:27 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:38 -0600
Message-ID: <20260506223341.1759760-37-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106867; x=1778711667; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BqQYPuKXaK5AsOZ8OKL2WfPCNe2c360WrtmCI8U7WbY=;
 b=DspzU+GNTIt2nQzxpWDLRzXZqCQaPWPY6GmXilAEW+aWtEkViLumCeJi558amoSI3h
 i/uShRkwkdAVQvKEO3m9CvC1pkprLW+wLKNygWE4G3W2ndiGXPdyoakTAevRhBXKpZO3
 MBVGwidJUBBO505t1gon2tQSHXXLyQB7OGSkgZTjy8N+a/s5MYPNKcObyDjA2i0zDDiQ
 f3+nNF4KOc7ScFJq8x6zRwRji7uSSi57T6YNG9Kymv+K64qiONsjmkb0Q6NOPksBnohi
 gFlw8qrtckIAtgMoSPPzKqUT5jB48GogMkjCew/QQWue5K2eqow7TWzRYIEpNDLr/5oG
 U4hA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=DspzU+GN
Subject: [Buildroot] [PATCH 37/40] package/umtprd: preserve /usr/sbin symlink
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Brandon Maier <brandon.maier@collins.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>, Paul Cercueil <paul@crapouillou.net>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Doug Kehn <rdkehn@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With BR2_ROOTFS_MERGED_BIN=y, /usr/sbin is a symlink to bin.
Using install -D for files below $(TARGET_DIR)/usr/sbin can create
the parent directory path and replace that symlink with a real
directory.

With per-package directories, this can later make rsync fail when a
package target directory contains a non-empty usr/sbin directory and
the skeleton provides usr/sbin -> bin.

The skeleton dependency has already created /usr/sbin, either as a
directory or as the merged-bin symlink, so use plain install and let it
follow the existing path.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/umtprd/umtprd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/umtprd/umtprd.mk b/package/umtprd/umtprd.mk
index 1a2b387219..bde6a2e0cc 100644
--- a/package/umtprd/umtprd.mk
+++ b/package/umtprd/umtprd.mk
@@ -14,7 +14,7 @@ define UMTPRD_BUILD_CMDS
 endef
 
 define UMTPRD_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/umtprd $(TARGET_DIR)/usr/sbin/umtprd
+	$(INSTALL) -m 0755 $(@D)/umtprd $(TARGET_DIR)/usr/sbin/umtprd
 endef
 
 $(eval $(generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
