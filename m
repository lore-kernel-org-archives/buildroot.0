Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A08EC77B7C
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 08:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B28F60C2E;
	Sun, 21 May 2023 08:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B28F60C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GsIbrR0fX3Tj; Sun, 21 May 2023 08:16:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71AAA60B12;
	Sun, 21 May 2023 08:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71AAA60B12
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 449651BF3D8
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 08:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E30782C3C
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 08:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E30782C3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f08V2Tt01Viz for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 08:16:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37A6182C33
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37A6182C33
 for <buildroot@busybox.net>; Sun, 21 May 2023 08:16:20 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f41d087a84so15775775e9.1
 for <buildroot@busybox.net>; Sun, 21 May 2023 01:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684656978; x=1687248978;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sBqBsBaUG5W/d455hA9g9nAig1i+FOqN1Q9agtqKOp8=;
 b=GBcVtrbf3IEqiJQM2WUIUQcjz6qBda2N5Pb55IFHtmphuymEJ8vJT0Jjc1YSEHxCNr
 s3TsOL0obiTqnqZtn1yecdnOWrE/scwxtZcrjTS8AhiSk2brQo0mP4tzqzaycNGyNRTW
 YA64APOuziU+h8o2CY5yzTQX09NxR3LeoNhkOvf8qDi6pdcKyFQHeL7TXXh8II23RekO
 kyrMkjg5SKLfCAs4xiG+LKLyfXGGq57NOydgAuZlVfabHlYxg0cosr+ZP+YyRRjKGc/U
 SFVyOm2f6i6oxTU8igRYwLwfszcMhxsvG+Q2z5lRwnJ0wYP8m7I1chaHxCkBuamiCVg6
 Bubg==
X-Gm-Message-State: AC+VfDz8seE0Kc3T5iBfsbOWmPx7T6GDfKMWrkfvBW+jU09A4h3adT/8
 JLFwJaGeAAcLVupfWIUa0Zo/VlIB/T8=
X-Google-Smtp-Source: ACHHUZ68HXSjQ/IfOkPWMRj8oAn9qoqWC6SC8vEd5wFrn4C4DH25gvhWW9a8F37Lub8N+QnBI8g2lA==
X-Received: by 2002:a7b:cb56:0:b0:3f4:fe7f:3d18 with SMTP id
 v22-20020a7bcb56000000b003f4fe7f3d18mr4959331wmj.2.1684656977614; 
 Sun, 21 May 2023 01:16:17 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:e03:bd00:5ffe:deec:ec3f:c958])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a5d4244000000b00307bc4e39e5sm3930225wrr.117.2023.05.21.01.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 01:16:17 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sun, 21 May 2023 10:16:10 +0200
Message-Id: <20230521081610.3495-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684656978; x=1687248978;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sBqBsBaUG5W/d455hA9g9nAig1i+FOqN1Q9agtqKOp8=;
 b=gqSlO7zOWyvItJUVyPkt7Pme6JcALii9Yp/4AM5EwzTJ2yuqpfbnA7V/oD/yKRnQhZ
 OCRtOqFZzdkyqHs0IKjCxx7ogIDjnbWABc/b3pG1C/G9MNBZiQQPQgmUdjmQf0JAnhtb
 ELIczDdRKBK8jEiPFNYE/t1wEODdiICp98fUW/C9Jd5b8KljgVOvEYHIZ9XTrRZJBY1C
 vAKgwboIl2sn+VHoAoa8WElB+tfuW7oi/jcOtoDL2CeCbjTIxCUyQDrtRA08E1YQ57wK
 4v4unv92QgtNcZ9nk3xPVvRRl9d4Q8+b6KSJ4p6vHOCDrvWR4+xDQH0mrhB6ScDw6Vhi
 888Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=gqSlO7zO
Subject: [Buildroot] [PATCH 1/1] package/libxcrypt: bump to version 4.4.33
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/libxcrypt/libxcrypt.hash | 2 +-
 package/libxcrypt/libxcrypt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index e125072705..c13685e463 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  efb4e225c4e37658444ecdb4825883b70b744541b73022d91c4d12e0dd8e39a0  libxcrypt-4.4.29.tar.gz
+sha256  0a0c06bcd028fd0f0467f89f6a451112e8ec97c36e0f58e7464449a4c04607ed  libxcrypt-4.4.33.tar.gz
 sha256  f9b48b0bc67a92b752780710aa774cf08b62ec2ebaa3f4aebd00069fba6effd2  LICENSING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 18ea6e3c17..079445e489 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.29
+LIBXCRYPT_VERSION = 4.4.33
 LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
 LIBXCRYPT_LICENSE = LGPL-2.1+
 LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
