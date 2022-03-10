Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34523C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 11:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6D5284728;
	Thu, 10 Mar 2022 11:41:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ivLop0BAJR39; Thu, 10 Mar 2022 11:41:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2853A84721;
	Thu, 10 Mar 2022 11:41:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2F8E1BF868
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B196084726
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dtWU942lPDdV for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 11:41:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DABC08438F
 for <buildroot@busybox.net>; Thu, 10 Mar 2022 11:41:48 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u10so7482748wra.9
 for <buildroot@busybox.net>; Thu, 10 Mar 2022 03:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FUXz9E/zB7/MSwGxF8jbHIP26qRuPgrC4CEczuz2oK4=;
 b=NgpFsOPx6t6rbD69EX9fOe1apGtUI/eOt3C+FGeAtJy3LtBCqKKkqOLD0oiN+Sc56q
 6tWJMrPmAanVzzrGy5F6mYq5fw5SSODFCOEG4LEPNuM1bcSqF9wfik1QXJGK2G9Zhfp+
 x+l/N4r9HIu2jpYIOGB9sKP7I2bPvOKJfiEgU+fxgi180BYd1P+/IOtu62z3WPv/N3O+
 DIUTm+Pm8A7qdE5edkhzOOjHv0o8L90g4FHoy1uMapXDa06wViB0np+u+KJOs0sfXXo9
 g0gBXGWcjKXXxvoBjvtxSzwHGdbs9Ccqe/LD8+6ZSxgQBkF/1PlXxpPsn1x5itUVzHFW
 CSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FUXz9E/zB7/MSwGxF8jbHIP26qRuPgrC4CEczuz2oK4=;
 b=2oVI9ZsH/21LrFqO0NG5STHMICpWfZrAq3mk0/MBeRoaz+uLb+wjiNH7az7cs6SJeb
 JOxLUe9d+Bmr8KeNcGkRKc/ywJ098nNTf8AJdcTJSjU6nakKW+e/wcOnnIcZ8iKy73mE
 ifrv3l53I8NTR7qKBjjltYwUBogcrQvrUPIcY5RPhcZtBrbo0fwat7/u5PyUULCC2UAl
 fAFne0ltHF5PUF+sS7BJDLxtUpEQhMQXIvucRvTIdjNHq+rbHq2nyo8ArGkKV1EzpGc6
 LxpzcE6Ie5vaOt4YRpxdb/ZlZWKnzcjpc5Rh4/6BNJRWYxFVGMPgKjDpVaEXmP8RPjgG
 g0ww==
X-Gm-Message-State: AOAM531fkIrrvd8eMefNbnzvvYho355sbN51oHX5iQpxO3l/nAaW3jWc
 OpCQtRS3BxUmd09C995outjTWSqvVS0=
X-Google-Smtp-Source: ABdhPJwX8mrXcE2ZIwpUsnA93T1MESExPK+WSBdw75BFNgJp4UOmax/+lNFe70R3rVhYnDOfgBUFHA==
X-Received: by 2002:a5d:5849:0:b0:1ef:f98a:5406 with SMTP id
 i9-20020a5d5849000000b001eff98a5406mr2281269wrf.8.1646912507176; 
 Thu, 10 Mar 2022 03:41:47 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6b43000000b001e317fb86ecsm3929303wrw.57.2022.03.10.03.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:41:46 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu, 10 Mar 2022 12:41:41 +0100
Message-Id: <20220310114141.919836-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.33
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index c23abcb51..23ce1f42b 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.31.sha256sum
-sha256  423c3e7fdb4c459ee889e35fd4d71fd2623562541c1041b11c07e5ad1ff10bf9  gtk+-3.24.31.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.33.sha256sum
+sha256  588b06522e25d1579e989b6f9d8a1bdbf2fe13cde01a04e904ff346a225e7801  gtk+-3.24.33.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index f298afade..cd0a75eb2 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).31
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).33
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
