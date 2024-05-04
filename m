Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E406C4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C54C41ECB;
	Sat,  4 May 2024 21:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfumfDngWP3M; Sat,  4 May 2024 21:41:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF9F141ED3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF9F141ED3;
	Sat,  4 May 2024 21:41:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A9F41BF3C9
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7494C41557
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W2Cuq06j5SCh for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9AD0E41582
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AD0E41582
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AD0E41582
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:35 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41c1b75ca31so5789655e9.2
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858833; x=1715463633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+GJlgFsYbS7Zth32bGVuCCeyOhPFdLCQjTocpSgheDM=;
 b=gnk/Ea/HZmeMc0s+JiIFJPqJSnBzqKhj/xryzWsSI5UnTGA1bTaWwMOTcVrOEJUgUY
 gotAEhqpvBeli2vdmjUOVpVRzaGnfojyEdFSzmsCvTOjc+wHs7urr94UhQDPrAkDatKi
 enNgU/BO8PBjtFqqHrbgPPUqB0eCxYjDiRkoaci1jIXGJVKi+STLNSr70kYMOh8AEryW
 RiXXuTPAnqoDH04CA13OoKCdRuLk9OQ+D7UmRpXXrR0UelhTVFtVWIki2kaWmKa8hgti
 xTqxnjTSUFtlAXzPtl+BBeX4HyYkv2Svm7Dz4Ni29fDkqYAlbqIDQlkqtDpoq5JTZKhM
 bUXg==
X-Gm-Message-State: AOJu0YxAl9wthHB9bZ9Zmn87DMlhclJawC2/bhsgeFjtMhjFne4tGUPa
 dV1FDFbO77L5kzMVD6J030+khxPbCip8Tm6HWI7LCJcfdgC2g+8uI69yMw==
X-Google-Smtp-Source: AGHT+IG+fJq3D0TgZK+d/Px9hGFdcIyGLCLAW7fHB3NJgq7qIVv7xaiPX9EVGx7xPjvKbqyaq/Ll8w==
X-Received: by 2002:a05:600c:1e0b:b0:41a:f936:5326 with SMTP id
 ay11-20020a05600c1e0b00b0041af9365326mr5277019wmb.15.1714858833628; 
 Sat, 04 May 2024 14:40:33 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm10464230wmq.7.2024.05.04.14.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:33 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:15 +0200
Message-ID: <8551e35385e532ec076968e7d5499ec6e4c75a50.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714858818.git.yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858833; x=1715463633; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+GJlgFsYbS7Zth32bGVuCCeyOhPFdLCQjTocpSgheDM=;
 b=Jen1slR6K7hCq1eNSxXS0ufm5ZJMIVidTebDy3emTKbnU50MFZ5FvgH70N1PY6qYPP
 eiyecx+TbA0tkV7SYBwrlYOPYvi766n8rvYeux/y8VeyoF4Fy+hFPB3o0tqAA/6Jq9MS
 UQE3tIrC2QIkdKUl6e0Hr7AI/xZC6IhSeTgipbcRsWhladvR4Mu5tYArS07Q5eBOW7th
 2W+eVXmIccUb1OTTReZzaLb/xeMZB4Pmd/2eilix35HXxgbqb/dHiEcGbCa3DTc6T2ns
 eS2HRH4XZuPk8y1SVcleco4ohrJZh2JV3OOqvJN+UmN9IiSKlm220oD2nYuaWlFx2GYM
 MJ3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Jen1slR6
Subject: [Buildroot] [PATCH 14/22 v3] board: update hashes of git archives
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace the names of the tarballs in the hash files to -git3.

Linux and U-Boot sources do contain symlinks, so the hashes change.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/radxa/rock5b/patches/linux/linux.hash        | 2 +-
 board/toradex/apalis-imx6/patches/linux/linux.hash | 2 +-
 board/toradex/apalis-imx6/patches/uboot/uboot.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/radxa/rock5b/patches/linux/linux.hash b/board/radxa/rock5b/patches/linux/linux.hash
index 8797d29f68..18074c0aee 100644
--- a/board/radxa/rock5b/patches/linux/linux.hash
+++ b/board/radxa/rock5b/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a5eca7b8f929a1918125e2e4fbd7ab4ea5b3910b5ae4547e81c794b47373ffb5  linux-52f51a2b5ba178f331af62260d2da86d7472c14b-br2.tar.gz
+sha256  255961f7ea8ea82c42f19be049f94a690f9cb171fe8562ea87868ac5cabc3eb9  linux-52f51a2b5ba178f331af62260d2da86d7472c14b-git3.tar.gz
diff --git a/board/toradex/apalis-imx6/patches/linux/linux.hash b/board/toradex/apalis-imx6/patches/linux/linux.hash
index ff2b1ea287..277abc20aa 100644
--- a/board/toradex/apalis-imx6/patches/linux/linux.hash
+++ b/board/toradex/apalis-imx6/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9c69a1c283db6ee8042cc6f013a159473f257e71751887312c7dd2902f01bec8  linux-d899927728beca8357a5b4120b690cb3c1d80844-br2.tar.gz
+sha256  41551a4f44bdfe18f68bedc0fd9c644d8657d2ee63215cc348a708cfd5b7e6f2  linux-d899927728beca8357a5b4120b690cb3c1d80844-git3.tar.gz
diff --git a/board/toradex/apalis-imx6/patches/uboot/uboot.hash b/board/toradex/apalis-imx6/patches/uboot/uboot.hash
index 80cad35849..d451219cb4 100644
--- a/board/toradex/apalis-imx6/patches/uboot/uboot.hash
+++ b/board/toradex/apalis-imx6/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9a540b08ccb7e8a0252f86d0bad5d676d0964725a7f2a06d798225c2a3024878  uboot-30a1208727729dae22cb42f9ba9ba17efe5e6f77-br2.tar.gz
+sha256  2fa23d10559c17362ef92e5d7e636b388e9af3784c9b03e86c702a71df100f36  uboot-30a1208727729dae22cb42f9ba9ba17efe5e6f77-git3.tar.gz
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
