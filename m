Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFADC433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 11:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8278240584;
	Mon, 17 Jan 2022 11:37:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id em627kSfa4Jz; Mon, 17 Jan 2022 11:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0C5740220;
	Mon, 17 Jan 2022 11:37:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC3841BF419
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 11:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9ABDB81244
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 11:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id phMb5lkxwRjg for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 11:37:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DFF880F05
 for <buildroot@busybox.net>; Mon, 17 Jan 2022 11:37:09 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id k5so10519018wmj.3
 for <buildroot@busybox.net>; Mon, 17 Jan 2022 03:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5/zVHhujwH1YnkCXkZxMGsTSGztciWM2rudxtrWiReQ=;
 b=Yb+2yyM7W4LoT1sSYsiFtUEs5CfgQqzUzokx6O52SDKy2mSI/9pfih9rv7eWv6S5yI
 LP001KmYEl4eWxd7F3lQgO7LRuYwkSzyORJJQhR4PJJK8ekjV1cr2KS7dzaDz1sxDxcv
 qsw+Pa9QyfDw1rv9itzUaLMZ86DY1FuPZuE/iZ/h5fU5ElkjddBoE3la05bEVp6FflLV
 ohQLcV5QJmClja+zVllB232i3OQRZYkLHWHEvRgDFMPWwe8sbCYUup1VkL1FM3TO6QHQ
 QATZzoE0ErjXhpRbNKdRRbtPrW2HeOGmLLx1yLzBE+uJXLt58nH/gr6njeSnpi6oPILb
 Vjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5/zVHhujwH1YnkCXkZxMGsTSGztciWM2rudxtrWiReQ=;
 b=QCA3lO7wCqgg9SLDqMzLE2fMr7FYRXcDOry1lue2BFrf/Jw/vinmaNWs+X/WM/cd4y
 9d7QBLDPENHERQ7zh4wT8HC1MW9jJwK/qOYKUtO3AN+MWiJ+4q/bGK3ONqA5fl2OXnem
 2hG0nHKfRQbTDI8mtTgv8UZvyWD08d9itBjW1IQnd5bnlSBC53e+75NA+lgJZT0f1lMS
 S4niWedo9dSpvDWKXvYFI7V7mrgxig4Cl7+DgfjCUJ609mN+N5L8BQASpyAP/Gw4JWI9
 YcPHvwc52bc+2B3xEf9XXf9A4zpnR4CSmYmaMsPGnaUJr0dTMRdl83DApu3lqKJ7/ich
 iiCw==
X-Gm-Message-State: AOAM531yboWr5cVIgjUtP20kpNonauQNUJ4mDrWC4W0rYNagB9yU5pdq
 tN8JrOeZMU+0e00Ha8GqYSKzjbhp5+Y=
X-Google-Smtp-Source: ABdhPJy+6g+pNR+MUI7dh5xHTcFC0kITEomMsxXm1nT2N+oeQeuOOC5xUOt/Y9fMkbrqJs4bsyi+0w==
X-Received: by 2002:a05:6000:178b:: with SMTP id
 e11mr16389940wrg.126.1642419427740; 
 Mon, 17 Jan 2022 03:37:07 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id g6sm14592077wri.80.2022.01.17.03.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 03:37:07 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 17 Jan 2022 12:36:56 +0100
Message-Id: <20220117113656.234077-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/prosody: security bump to 0.11.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

see https://blog.prosody.im/prosody-0.11.12-released/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/prosody/prosody.hash | 8 ++++----
 package/prosody/prosody.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index ee459f85d..a925d0d00 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5  78d01bb97a935f6a776d141873a33fd7  prosody-0.11.11.tar.gz
-sha1  ff653812fcb1789a517b55281a8d01e9e8261848  prosody-0.11.11.tar.gz
-sha256  a1af90e2d4ac2f7cf81b385475140ecee60bec1eb83003efb5aeb89765b13774  prosody-0.11.11.tar.gz
-sha512  eb9851e1b279bef894d556ca6bc6210d1cd55e0c02a9d475f74e6e6b4a2dfef704fd3de77b71cff97909925c48c60940c34cfb541e6f3801e23e90ea21d119a9  prosody-0.11.11.tar.gz
+md5  64a99571a5de84ace24d8142a1556d68  prosody-0.11.12.tar.gz
+sha1  64c918439c2df130204dcd86398832cb7a481eb3  prosody-0.11.12.tar.gz
+sha256  56cd52d820f5b3ed37e02d8a2577aa064bbc04db8e87fd18a6020eba0c10560d  prosody-0.11.12.tar.gz
+sha512  cd03ee8b02ffaa478b5329d9942d833cfed2d8bf720bf580a2082d681e7d333bc34f45041cea7234bee75f1a0e7c07983a685fe2ac9b31d51a0dbb36e87ba5d2  prosody-0.11.12.tar.gz
 
 # Hash for license file:
 sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index 7acfa4708..d697c8556 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.11
+PROSODY_VERSION = 0.11.12
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
