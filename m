Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C61AC47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 22:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64A39405E1;
	Fri, 26 Jan 2024 22:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64A39405E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g2A7g4H5Ozpc; Fri, 26 Jan 2024 22:12:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5336F404BF;
	Fri, 26 Jan 2024 22:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5336F404BF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FB651BF3C8
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 22:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E50E984042
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 22:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E50E984042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ia9UnsKgLF0w for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 22:12:43 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC82A8402D
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 22:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC82A8402D
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40ee705e9bfso11175055e9.0
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 14:12:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706307160; x=1706911960;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fUZG74761U9e3MIWM927fOgu0UU/1bXlAMrCtXTxKsA=;
 b=jI885L1u0pvnkU02yiB86NSL1iJbLE//DliSQK4TkvsIGAhxCry2IbU2pqLF9NrzYO
 bLDIK4GlvH10VNO0PSZXj/nAsMZgrYHG1o73QkgOkDaq0UN8Ar+mchjHbxx0Cls1T8xv
 JS3Ty4pW4MpZB2w3jx3Pt70afsR2M2oSpdZilUZ9qjDXbgnZxf+AlOgJ02QithugftZa
 SCkhermSpL1QMf7m5uSi04a+Kt0EeLfNVUrgUfxG30KSpsTDPbhBdeif6sD0cnmFBrde
 faDZF3n5cVp0JWega/7oKiP/T/DN7163mnrqVc/c9ya4X9cbUzVE+/pec8VHtbkVy3mE
 NiPw==
X-Gm-Message-State: AOJu0YyOMTttGfgiQPuCoFYh8EeConF/o+TC9jhiNDSLnBu36JW3tgOZ
 znX8fTvzf9XyHhYWFgW/J9yUpkz1bjJP2exa3wNn/DKmbe6dDDzrmBo6qwKoAvc=
X-Google-Smtp-Source: AGHT+IHGKrnsIzsMfypI+aOeeaKXmaEp68re7PVdaSDqQbVUTDvQVqJaQPsqaMlKRygY4KWUqq/0Wg==
X-Received: by 2002:a05:600c:4f0e:b0:40e:d188:a009 with SMTP id
 l14-20020a05600c4f0e00b0040ed188a009mr343178wmq.102.1706307159868; 
 Fri, 26 Jan 2024 14:12:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e4-20020a05600c4e4400b0040ee2093a17sm2277210wmq.17.2024.01.26.14.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 14:12:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 23:12:37 +0100
Message-ID: <20240126221237.1780047-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706307160; x=1706911960; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fUZG74761U9e3MIWM927fOgu0UU/1bXlAMrCtXTxKsA=;
 b=GLLCl7/VNT0TOjwG+5sqBOec5fsItn6jLTFe37c6QHlUSg3WUTtRm/+/dxDP7IARiQ
 0kCis/6lN8+gUsyOwM42Rtcul5CYriLaDksNvayTx+Us3Amz/Hlsib/hTgq3u6ropIvR
 QQ6RBCLOB06t4K5Ez1qa/Fi2pxX+AuonKSQTHfIsYLHM2btU+P2phJ5SwUHRe43EtbLe
 L7dEwnKJe99Q2NgjJwqWRvaYaFMAgSzLYp817rmkXnupVds7qKkj76GUrqBLCAHyuKjL
 yG8hSZWNEDhz7LzwYTP8stsCuZb8Imiz1CqTJEIMwXYN8h9gZB/eRDz5jlB5/rsyYrMc
 u2+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GLLCl7/V
Subject: [Buildroot] [PATCH 1/1] package/libzlib: bump to version 1.3.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/madler/zlib/releases/tag/v1.3.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libzlib/libzlib.hash | 2 +-
 package/libzlib/libzlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzlib/libzlib.hash b/package/libzlib/libzlib.hash
index 23bfda8474..cbd9313870 100644
--- a/package/libzlib/libzlib.hash
+++ b/package/libzlib/libzlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  8a9ba2898e1d0d774eca6ba5b4627a11e5588ba85c8851336eb38de4683050a7  zlib-1.3.tar.xz
+sha256  38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32  zlib-1.3.1.tar.xz
 # License files, locally calculated
 sha256  845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1ed2495753243  LICENSE
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index e0a4e454e1..bc5092d9a9 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZLIB_VERSION = 1.3
+LIBZLIB_VERSION = 1.3.1
 LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
 LIBZLIB_SITE = https://www.zlib.net
 LIBZLIB_LICENSE = Zlib
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
