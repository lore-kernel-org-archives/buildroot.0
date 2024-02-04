Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A184DC4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4843385329;
	Sun,  4 Feb 2024 10:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4843385329
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3L_FzspLQYBz; Sun,  4 Feb 2024 10:21:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACA6585325;
	Sun,  4 Feb 2024 10:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACA6585325
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5377A1BF41D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B9568531C
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B9568531C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SIeaSl3NUxf5 for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:21:03 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67CBB85318
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67CBB85318
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40ef3f351d2so25515135e9.1
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 02:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707042061; x=1707646861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NRLZhFOvilqaJ7rXLI57xSglMyymZvSIe1n+fmMTf20=;
 b=r1xu/rg8xPRZySJrYjMeIuA0vBU36hWkOWOZVHGwv6wuReamvNGz6PfqYtjROd9aKp
 De/s7AzQ6QSXbpePT5mDXClUjN1VALEs5lSCb9NZSQBQbls0hBupYwE7z0CWPuXl/EN1
 QiilXSv7FbJZSSwmH3eDm3u+sl1rgG6Z8+ml/+EG9N5KwXwxEwBgblX93cksCEefQ+XW
 rBqcclY+b7QQhh9qGxiFllVCzAIG2DS6W/pbemOWqdi1lEoczsEieAyyKi0sOmZrdWL6
 Q2ZqLh01JbvqnIpMEHnVAxLOtmiR7u9jcwRa9lu1v62/BGiCF4N4OKP8j4HcZ38psH8m
 fWWA==
X-Gm-Message-State: AOJu0Yx1iCKX5SKACAJwbiLnV3Cv13DeT0endY7XTZpb23xkElav8WPt
 8nqqlTFmKgcYfhPOozPq5qRphJSndQioIwutqVxNZHio8LyeIlrTnKArySaBTAI=
X-Google-Smtp-Source: AGHT+IHTs89CKKFrpzX2CZohizCpHltFiNIoEGCdlrs3zKmCkXEEJ10nfTRSW52fpKRbfEaMN09s7g==
X-Received: by 2002:a05:600c:1914:b0:40f:d0a7:3fdd with SMTP id
 j20-20020a05600c191400b0040fd0a73fddmr2355121wmq.6.1707042060472; 
 Sun, 04 Feb 2024 02:21:00 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU8xfIU6g65oFDUzK0ewIk5vj0FsHYjfzTRLOlcL+mdvhsBqnkGFT5OGWxy9wrr2HqWNXYE9f9Wexk4e+DnA6aePmVCldNFMdtrDRKLkkBGF0SPM3S8ExvjqA0OaZ6P7dEEjbF488Rcl5g84Se3d7s/FA==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v13-20020a05600c444d00b0040fd2fe2867sm3437707wmn.9.2024.02.04.02.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 02:20:59 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 11:20:56 +0100
Message-ID: <20240204102056.1409453-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707042061; x=1707646861; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NRLZhFOvilqaJ7rXLI57xSglMyymZvSIe1n+fmMTf20=;
 b=EY9fjkjtBb49joOVRjKBu9laUhuWIfMzuzrbAQqIHkNftYSqpriJ3AY62I8U6LGWzh
 wVP8+BZGYdvfLNByzAIxeYBjdv+LRvkE+7eG4VYV+NVZvpLR3OfmXNXS1rZq7adx9Pcm
 MeoLsM2PmnDiSVuCPFT83JEFOmFZhZZeYhFqJOwebldUBnaSwv5rXE2Dw7ObfRjbCx1P
 nYO6vBz+/Sgkm4b95ZvzHhUtawzWOTiUtD4fQcJTaiCSrPWE9P/WLNvgyRYKFIIivW4I
 Rsw07X7yWwZYPayR58h/hsXJyL6Z0zZTM0aIGn7neYcKTGlUmtD4lVyiWjl1mb4qZv36
 KudA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EY9fjkjt
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: drop NFS_UTILS_AUTORECONF
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 63332c33aa0771532807fd2684d4eee4eb952435 wrongly set
NFS_UTILS_AUTORECONF

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nfs-utils/nfs-utils.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index a11ba154ad..4f2b41c782 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -11,7 +11,6 @@ NFS_UTILS_LICENSE = GPL-2.0+
 NFS_UTILS_LICENSE_FILES = COPYING
 NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libevent libtirpc sqlite util-linux
 NFS_UTILS_CPE_ID_VENDOR = linux-nfs
-NFS_UTILS_AUTORECONF = YES
 
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
