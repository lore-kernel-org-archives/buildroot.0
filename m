Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10087C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 07:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B849B40042;
	Sun, 21 Jul 2024 07:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A97xGamrGbHl; Sun, 21 Jul 2024 07:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8829540470
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8829540470;
	Sun, 21 Jul 2024 07:49:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D6AD1BF868
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 07:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 297B781276
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 07:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3YsB0Zujl7O for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 07:49:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8CC581236
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8CC581236
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8CC581236
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 07:49:18 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4266f3e0df8so22761805e9.2
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 00:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721548156; x=1722152956;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xyEe2N9biQciIFE0dO7wUdMJgZxcfV6Rb6e2dJCvxRU=;
 b=TUANX3b364h9sJR7GNTMcwgUdR/YSqEGoJsA1KHmq22REBk+sQiirqx4N3V0RsqcpR
 ukVu1Dx7PA5uApLxmDHxCMsyGcPqMTD/UBTVnK0+jeCfFzVJjYmpdpIBrlDckPwww8Z7
 i9QPfEGmga729hCXf/iHinEYDVRBzLSdwJKb7Ng2M6soKsHZ7JroSYcIlwZF1Q++lrTM
 qfKRGwC6PhiIbxFnWU7oaMbNcpDYzDOvfAEsGoQ5CaOWBvhC7uAibdVDvppcnsbVZS85
 nMpW3djcFpXPMbb4JkhFIfZVoQUpKs3wZXdVBRLiHQFAjOV2UnsCgJ2tODjOQkAbK9j8
 139A==
X-Gm-Message-State: AOJu0YyN2UghNvYGn6Rm7VowQR0ZaPZVJYnAin4DNLYRtIVqg6p6ZGmF
 oY0BLSvSS5eOMbHBQ0yGX31uEkjHDlC8KouoGBmtqPbLe4cnyZaAVwnhig==
X-Google-Smtp-Source: AGHT+IEVaslzA/cZUr6ZwYNsS0dtirN8BB9w6l32jC0lKMbGySanNPwj9pPdU4D+Lf9AF9WTxRkAoA==
X-Received: by 2002:a05:600c:1d1f:b0:427:d72a:6c26 with SMTP id
 5b1f17b1804b1-427dc52062fmr21470525e9.6.1721548155676; 
 Sun, 21 Jul 2024 00:49:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6929976sm82184405e9.29.2024.07.21.00.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 00:49:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 09:49:13 +0200
Message-ID: <20240721074913.95765-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721548156; x=1722152956; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xyEe2N9biQciIFE0dO7wUdMJgZxcfV6Rb6e2dJCvxRU=;
 b=eX4W4zdFtlzchPKHf/Iw+ve/LFmHtlAj4dn7SYWwAEHXIqmkOSHWly1k5FyDnbwdA+
 knPhJmc7Jz8xQn1CoSZ9BmE1YWNT2sfiNUcBKbb9mPeEzF7NaPPGJQ/HkAsAO2xXXg/a
 yOfeca4AXvip4VsfDoG8OcojhlDAHtS5lfzrAdUkkjDmKg6/GbkosJpomfPaiK9PCVgI
 w7e0nLWMB6ydGkgqGzcm0MYlkgXYT/A6g/6oJVOkhbbyhsPIhHeTbl+ml66WI1syNIs+
 orPFL6RexshZsagGzefoQcdTDizhCLnfTP553xlMoefu2mF/0R5XYXbDHovVbL46ICIj
 ur0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eX4W4zdF
Subject: [Buildroot] [PATCH 1/1] package/librelp: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

librelp unconditionally calls the (deprecated) ENGINE_* logic in
libopenssl resulting in a build failure when
!BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
623d3bbe43e9193aa8e3395367d01af59071b859:

tcp.c: In function 'relpTcpExitTLS_ossl':
tcp.c:1992:17: error: implicit declaration of function 'ENGINE_cleanup'; did you mean 'EVP_PBE_cleanup'? [-Wimplicit-function-declaration]
 1992 |                 ENGINE_cleanup();
      |                 ^~~~~~~~~~~~~~
      |                 EVP_PBE_cleanup

Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
 - http://autobuild.buildroot.org/results/68a1e94e077d8d57690a2543e557ba3f2974b03e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/librelp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/librelp/Config.in b/package/librelp/Config.in
index c0ae5fbe89..f1744bb60c 100644
--- a/package/librelp/Config.in
+++ b/package/librelp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBRELP
 	bool "librelp"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Reliable Event Logging Protocol library
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
