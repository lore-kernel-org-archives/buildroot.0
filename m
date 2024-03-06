Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D31C5475B
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 09:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C59C4034D;
	Wed,  6 Mar 2024 09:19:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I-rNatovxy1m; Wed,  6 Mar 2024 09:19:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 224004050C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 224004050C;
	Wed,  6 Mar 2024 09:19:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1357C1BF3DA
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 09:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00CD2405E6
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 09:19:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8xVdSwucvRoM for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 09:19:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D9BC6405CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9BC6405CB
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9BC6405CB
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 09:19:35 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d2fad80eacso81226461fa.2
 for <buildroot@buildroot.org>; Wed, 06 Mar 2024 01:19:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709716772; x=1710321572;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LfU9pd1EYLv3CKBz5Mw4Mg0qun7KFnJzRRWy3yDSxP4=;
 b=QAsyNg1RWD9bwHbx75rsyni05OFYFdQLDYq7nmOIlHYRpPB6M0Zkg31MOpWRezwN2p
 zGN5gCOU8mw4ItxWU9F996+fCJVkQQM0zGZZb5e4MAeiSrRWk+IbLxPzdfUfi5H0di3x
 XqYHw/h3+yd3/zLbocrkx2z/nzesc9Rh8lpCSV9JsLNFfUC6ryX9glA7oGsZNoVubuvN
 Wek6WsQd06ErJ5YDvwoU3V1NX+bARb42+KrXz2OKwV243u32cuT+QoZlziKM7EFXoLMo
 0BG0QYhHDRBRtyalI/QONRmnl+5QhQFq7C9m1Q7FuY/yQ/t2B0TlEV2vG/Wm4j1PzAsh
 k9zw==
X-Gm-Message-State: AOJu0YxGTC3IOB7z2yV1ZuvJh/U10FMJdtRPw9xlb3xpT3CtI6/rdeo8
 PFgRTy+SxhvAPqIHiBdbODnN7FOruSlWaIZmDIEwXWLjaU5SnT7uvkZMYEcF
X-Google-Smtp-Source: AGHT+IGu07TDFwO18nbRn/g3wg3UI52bodnhxAQKOLaSwDuP3DCboW7mixgYK5lr/2F6Uth9weDXlA==
X-Received: by 2002:a19:ca10:0:b0:513:2054:1d1b with SMTP id
 a16-20020a19ca10000000b0051320541d1bmr2633832lfg.66.1709716772158; 
 Wed, 06 Mar 2024 01:19:32 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a6-20020a05600c348600b00412f778c4e3sm882321wmq.23.2024.03.06.01.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 01:19:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 10:19:30 +0100
Message-ID: <20240306091930.32801-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709716772; x=1710321572; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LfU9pd1EYLv3CKBz5Mw4Mg0qun7KFnJzRRWy3yDSxP4=;
 b=dvZ3quasA2h5rZC8dApgF0QCSURa4yfxdHntVAf/ppJoTCP5AMO/QznCyz4N6TtIk1
 NITC5M77BCLp3w75q6WPPOcbMtGiB7lbq6Q15gOw71p2BK7tJ7pvRDhYX96/0wiAz3NE
 UtKHTGL9oozhHrsnQT4W1+f0CbXaQs4hcIdQZleHGcuZ6jH/sfNa3srKUOc9LxWnRWf7
 4x7jm1cpICofKVb3lEUGhcGm3G29cL8qizo1wALo7eqGWNX9TxfPx9p+476ylJBalJ/F
 tWbAwK8cE7foYGxtOP0HRY1kG3X/YoZJ1LXCSTJk15s5UxG8qTRh1t7i6q38Mb6FCXyR
 bFDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dvZ3quas
Subject: [Buildroot] [PATCH 1/1] package/dmraid: fix musl build
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

dmraid is a very old package from 2010 with an awkward configure script
which doesn't honor CFLAGS:

 ac_cv_env_CFLAGS_set=set
 ac_cv_env_CFLAGS_value='-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 '

[...]

 ## ----------------- ##
 ## Output variables. ##
 ## ----------------- ##

 AWK='gawk'
 CC='/home/autobuild/autobuild/instance-3/output-1/host/bin/sh4a-buildroot-linux-musl-gcc'
 CFLAGS='-O2'

resulting in the following build failure with musl >= 1.2.4 and
https://github.com/bminor/musl/commit/25e6fee27f4a293728dd15b659170e7b9c7db9bc
because _LARGEFILE64_SOURCE is not set:

/home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/sh4a-buildroot-linux-musl/12.3.0/../../../../sh4a-buildroot-linux-musl/bin/ld: misc/file.o: in function `rw_file':
file.c:(.text+0x150): undefined reference to `lseek64'

To fix this issue, pass TARGET_CONFIGURE_OPTS through DMRAID_MAKE_OPTS

Fixes:
 - http://autobuild.buildroot.org/results/5c7c82959ce92db908d3ca20e2c1137509c2f981

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dmraid/dmraid.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 0382cd4d99..9a78c2ae07 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -13,6 +13,7 @@ DMRAID_MAKE = $(MAKE1)
 DMRAID_INSTALL_STAGING = YES
 DMRAID_LICENSE = GPL-2.0
 DMRAID_LICENSE_FILES = $(DMRAID_SUBDIR)/LICENSE_GPL $(DMRAID_SUBDIR)/LICENSE
+DMRAID_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
 DMRAID_DEPENDENCIES = lvm2
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
