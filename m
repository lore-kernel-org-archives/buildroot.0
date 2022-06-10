Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E83C43334
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 16:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2D2E612C2;
	Fri, 10 Jun 2022 16:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Okl89-VqLCdJ; Fri, 10 Jun 2022 16:57:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5586612C5;
	Fri, 10 Jun 2022 16:57:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B51E41BF358
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4E9C8443D
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:57:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWNygB9a5Leq for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 16:57:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1DF784422
 for <buildroot@busybox.net>; Fri, 10 Jun 2022 16:57:13 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id q15so11024227wmj.2
 for <buildroot@busybox.net>; Fri, 10 Jun 2022 09:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J8s9EtxPcLsJWPW1adXuT5EjZR+oqgMsDCJPZNJFQ8I=;
 b=Ptg6lGQ/RBhLrPAStjbKzDi8oCdPb1GWNj94WDbRfxVBEpAl2qAb57wClNFvxlbyrx
 2viR1BLkxEZIKZUZy+wOcjdxV6ogKlIwbSG66tNW/i7CNeW0hmPny6NQ5DNbb8bIC+wI
 0JkU0wgIfBgocqcwuPtgX2zxtGS0Ys6/C602V1BCrw4qLb30YoKUqMZgZodwGVOVjFae
 BDpqAD0Bq9/pjz+FbcjU97cHagEdvVw8XOclm0GI8CgSqApd+AK6kS7tAKGY00oRHcYX
 AgI1KZzEYnAxIknVZTrnGpubhVYL8Cd0M87P+rqgb6z0tXXFJvd8wvAFap+WEs2WDgyM
 fi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J8s9EtxPcLsJWPW1adXuT5EjZR+oqgMsDCJPZNJFQ8I=;
 b=E3XnRwx+R6T2NBW5w2b+wgOZ01iek2eX6MFCY4df5uU47FxfPDVld0FJ/a1SAPhTWD
 NB+TBWkO93WjF/swv0hP5ZaWHDt97Q25GEVXVm4msE25JMroO35MOL9OL3w40w+gWo85
 CTtsqTjTQsNpvxB2DtgIvOQ+WB1YJgAs6Oabjze/Mz3ETEmNQQNY8Xoe+/JPwypDeHTl
 H2JCKusFpFFFtIjaTZxwjLqYpR8+oYnMdYdcyTeTSk7aCSdeOZ/dxTs0p/7b2Gx+8Iko
 tMeiCW0TYdOyeTn9Bdj7eyJ6WnDraikn6tbkh/+OTjIDx4pwS1FTS1VJ7gIp1ob9pqKz
 UsDw==
X-Gm-Message-State: AOAM533sH9x64tai+46Jdt7ohFihb0AB38QUJCjOgwDYCSweJR3Lg/7S
 wgdY5+p+P1hFyRCHBTkdR+NRDMT7NWNrCw==
X-Google-Smtp-Source: ABdhPJwa1gTHuuIi6CVzcTOwz4CbrZRDvDIgsncNr+SfqzQct7LLDjcXIyDybwynhzLrn7MH96IcuA==
X-Received: by 2002:a1c:19c4:0:b0:397:88a6:6 with SMTP id
 187-20020a1c19c4000000b0039788a60006mr668674wmz.138.1654880231836; 
 Fri, 10 Jun 2022 09:57:11 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b0039c5497deccsm8649573wms.1.2022.06.10.09.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:57:11 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 10 Jun 2022 18:57:07 +0200
Message-Id: <20220610165707.2574471-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.34
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
index 23ce1f42b..c68c6e90f 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.33.sha256sum
-sha256  588b06522e25d1579e989b6f9d8a1bdbf2fe13cde01a04e904ff346a225e7801  gtk+-3.24.33.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.34.sha256sum
+sha256  dbc69f90ddc821b8d1441f00374dc1da4323a2eafa9078e61edbe5eeefa852ec  gtk+-3.24.34.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index cd0a75eb2..53d7f6898 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).33
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).34
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
