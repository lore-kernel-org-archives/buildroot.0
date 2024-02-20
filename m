Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49795C48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 22:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2B8560BC4;
	Tue, 20 Feb 2024 22:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pn9nHuvAOPbl; Tue, 20 Feb 2024 22:50:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17ADC606CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17ADC606CB;
	Tue, 20 Feb 2024 22:50:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82D121BF29D
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 22:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FEDA405B8
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 22:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YKUq-AkA_twg for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 22:50:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DA5214035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA5214035D
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA5214035D
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 22:50:30 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4127188dd5cso6100915e9.0
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 14:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708469428; x=1709074228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bDm8WOjWUUVqzv/EgRx0YD0AbiihwuEN7SrY2GcbBsw=;
 b=vW8OWZmaTrVIX3iLN8OGrx0JfJFUxx7/swNVrsKzDrttzAkMUVINDnih5QdbF6JhkN
 wuPmvxkK6/GIxhX7rVCVqzO/5k9dXMycgTDqUeMizNflIJGp8dXYa6XkQx5KFUgOhtSR
 j2a86Ur6b3Z3whxV7fiQk1uYnqRGLClqciSbirmxaiAJHYtQRWnfQi+SB8QiYzxZ15hb
 S7Jw2px68PlE/40NiN/sIiOt+v+RTSEoKf4tAtKf/FGOlIeO1dp+ktYHcg5o35YGB1Zr
 F2zWyDW/btyoLyhKcUpXmjRhQT/wYwuSpnr/5g/uxza5Czw+AWCDxBlc+8WzLHReOTKi
 9j7A==
X-Gm-Message-State: AOJu0Yzwp3HXiYuKQyrC23vorgQ64084Djg+km0PHeXa6AFQx7ssPTNC
 EF3aZMSufRP/6M2xqo/h8ILeRXnpa5Nl/MFBcBbapnI2PmeQwBbsNdjGg3Q6G/0gdQDdf8fSCxM
 S
X-Google-Smtp-Source: AGHT+IHsojZN2VFKieYWKB5MLp2veUnCAdoj+OcLAgw6g3Pn2u3U+ZaA+U6Cul8w3qZ6dTJMnJ+Kqg==
X-Received: by 2002:a7b:cd8a:0:b0:412:a6b:d572 with SMTP id
 y10-20020a7bcd8a000000b004120a6bd572mr11666116wmj.34.1708469428255; 
 Tue, 20 Feb 2024 14:50:28 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a5d5184000000b0033b4f82b301sm15060057wrv.3.2024.02.20.14.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 14:50:28 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 23:50:24 +0100
Message-ID: <20240220225025.781466-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708469428; x=1709074228;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bDm8WOjWUUVqzv/EgRx0YD0AbiihwuEN7SrY2GcbBsw=;
 b=MlWEgjzbvWPyOnZylCEJZVWW3bD/ila/1DWY/djCQEx30XBpKSmi51Cj4QEYjonIr3
 MZhDcu6ks2KS4y4sJqCWXettJH/WWk9gtE/eZHrILDGAsGn+ZhDRPwDNKFYBwlIqhsJC
 sVIRip7Tks1zJXS8R+MUQQrIKRxcxylWxQRwEOYMmKYhUq/zWUgXO6zEGVni6ki5zIrC
 CQG51+EnHpXPKhWeHe7J/754Eva0ugXbGfUgK4t7hD+DBIMUh+oDDsteWEGego0cpdBL
 V77W8imUhm7r1fhhVLmJnfw3lmhBPIbiU2zQXHe+epMza7EUcZIq+DuuQrI3J5rmCDo+
 6j9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=MlWEgjzb
Subject: [Buildroot] [PATCH] DEVELOPERS: add Romain Naour for
 am574x_idk_defconfig
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The DEVELOPERS entry was missing.

Fixes: 35eb74c634 ("configs/am574x_idk_defconfig: new defconfig")
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0d12c3abcb..ff44741f9f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2667,7 +2667,9 @@ F:	package/vnstat/
 
 N:	Romain Naour <romain.naour@gmail.com>
 F:	board/qemu/
+F:	board/ti/am574x-idk/
 F:	configs/qemu_*
+F:	configs/am574x_idk_defconfig
 F:	package/alure/
 F:	package/aubio/
 F:	package/binutils/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
