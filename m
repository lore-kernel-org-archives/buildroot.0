Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FCCC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 15:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7026818C9;
	Sat, 15 Jan 2022 15:07:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I91R2Kb_GvWn; Sat, 15 Jan 2022 15:07:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C2CA81451;
	Sat, 15 Jan 2022 15:07:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3826D1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E1BA400C8
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:07:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHiM6RCm1zjf for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 15:07:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE30740004
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 15:07:41 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso12852283wmj.0
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 07:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wOpeNENcdns5p4gAxkXgxVUuDCFTYKssh3tVTgRWpwg=;
 b=mVQgmYnyOgf0V2jiau+mHYkpz9cykA0lvSDi7BMnITWWHZZ8tRZrYZNz9tJxImjXFR
 43RLl5r33ej0r+QJ+76oQfLA+E+LwWOLPn5RoIa3s6URNgwpcC8xaWZAxWDmVZo9RVkI
 NoPeNbwZZZtL8nDcCVAQe3tRWYeWfa1cFXQQUtP8DNJSpJ1ngnw52KpQMizRxkaSCc66
 coe6vL9A94YCiUFR/twqqiaGhbTkLfCor4zfZpF2IzupyPDdn7FQUA8yubCGvfH4Yznp
 7K+DGiRiBLybLJ36dUZjwVXwP4QRo1BR8NUbxxNJTICziVVBok8elKU1K0Bx+3A3bXtk
 n1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wOpeNENcdns5p4gAxkXgxVUuDCFTYKssh3tVTgRWpwg=;
 b=NcX1KRRlfrZKxygzSbaN01msIZFB2NAdKMAmQnN3jSaVCVxBSyQHNojWRxWTQju/HF
 cQD57b8r9ByTmtbGyhvQaj441leSZNBn0bV8Tolt/wj7pxLUAXbTtz2MjMkUpvwsf/YO
 gvl6NmwMMlrczfY9bL1W48FME3JFZ4FZzbHU06lOY4qlpN8kEyzlNmnF0PiuKCY3CJYn
 wemTn9yNBBEeQqg6NAeVJKQJLaSsZDvgoQIuA1r4hqJqtc6ywtgJBttbvfSynaHjIvL1
 NGkv6Eb1B9i1JxoScLbl3tbhFjCHg0PKLdoZZFwR/nBNx7HZnMqodlgvLmNqhwh4Gr10
 sObQ==
X-Gm-Message-State: AOAM531+67afJkNeutoa9W+hH74Q7UdqZ5e1N5zp1HHf0Q1ppX6d56m0
 ERfpNyKWgZsxEKCw+GV/Slc40MjgzzI=
X-Google-Smtp-Source: ABdhPJyyJ+CwdrBbfg2mY+6EhBT51nqG/fV8dj9LSmjIO5hvfeQsJSl8R/mgJVc4zC3WOBangvfyVQ==
X-Received: by 2002:a05:600c:1912:: with SMTP id
 j18mr3184454wmq.148.1642259259750; 
 Sat, 15 Jan 2022 07:07:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id z7sm10033031wrm.117.2022.01.15.07.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 07:07:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 16:06:10 +0100
Message-Id: <20220115150610.2084070-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mtd: fix build with libexecinfo
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised on uclibc and musl since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: tests/fs-tests/integrity/integck-integck.o: in function `check_failed.constprop.0':
integck.c:(.text+0x96c): undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/9409ebf6517db87672f3f4df5909a8ac4abfe8af

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mtd/mtd.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 9f4cc27ef1..45e7c0c61c 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -13,6 +13,15 @@ MTD_CPE_ID_VENDOR = mtd-utils_project
 MTD_CPE_ID_PRODUCT = mtd-utils
 MTD_INSTALL_STAGING = YES
 
+MTD_LDFLAGS = $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+MTD_DEPENDENCIES += libexecinfo
+MTD_LDFLAGS += -lexecinfo
+endif
+
+MTD_CONF_ENV += LDFLAGS="$(MTD_LDFLAGS)"
+
 ifeq ($(BR2_PACKAGE_MTD_JFFS_UTILS),y)
 MTD_DEPENDENCIES += zlib lzo host-pkgconf
 MTD_CONF_OPTS += --with-jffs
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
