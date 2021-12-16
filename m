Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1951C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8831283F2B;
	Thu, 16 Dec 2021 18:58:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8FrJr8Hwzt4j; Thu, 16 Dec 2021 18:58:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D75D483F25;
	Thu, 16 Dec 2021 18:58:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4181BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A44A40399
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LyECpleuZIqr for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:57:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB89640017
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:57:37 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id j9so13799436wrc.0
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 10:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gCh6Rp99RGUDQ2RM0Ni9AqZiXUU7H8Eh9nu1FAUnvD0=;
 b=IL+CTDbKORFofcjSQguSUusxu0BHCN9ow46EPwD06fQafVNNeTc6vPVinQDIJjSXF5
 qul+rNQgEJ0yp+vqfnVNQ3a8tp+iv7hfIMy6m1RZnkec+pf2ARHeDbE0UfC3XjrRbCjh
 lfg1r4tskV3L+rHkvC2QuLaDa7IzLQqublhsGgN/oEqLfX+zs9hFXlNRovJFBY3c7d5x
 8fjhwvEubN5aasTi3McmLygfG4UeJ1i0UlmP9L7OF7Vd14EXB8iuI6/s/W8AtT6O3iM6
 qnDtrJHW6K0ScZw2/GIdbws9SEobi0u4MKgXtKlRic/aWvG4FzepCGvQF0BL55kDKvTq
 9Q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gCh6Rp99RGUDQ2RM0Ni9AqZiXUU7H8Eh9nu1FAUnvD0=;
 b=dUb0LnNK8LONMWGTuKjLfA4wHtIwh3mmj2hY4B63QGNCG51wV50nyzAXyUdGXTZuCo
 Rf1ixLsD+ohb4bqlapHmbe+5edD97Xik7VtloyXcSvNvufsf9fs6hQtx0u9zc28TbfIs
 o2ZORn7R33ZqWsh3/ocePdYoRrFDDwMeoJPl2f85XnG8eXvT9pgMDmV4FcXH5whfkJmv
 9eZBO8MdgPwgZLNjrEU+p5w9rVBID52BbgofdLHM2poymvK4Wa4aM9JMc74YANj8vrQg
 itiO2NypGTRgD7MSC3b3lD37SwdPkxWVMxrksZT7FTVZMZweYaK8ki/9MSXTX8SO6QAx
 E8Lg==
X-Gm-Message-State: AOAM531IoL57Li7G14nhVJiR7DZyLel1JAO0h65AJu+JkRBJI/xfCiA+
 i6jk+Hlaj0HqUnEqus1jXbNY+ojT2707cQ==
X-Google-Smtp-Source: ABdhPJyW456NjCvoR1dB4JY5lN4hdXPpqUmzsaEHaF+JET13FyJrSB+joHBuGwudr0cmYVIjhS9ezw==
X-Received: by 2002:adf:fb47:: with SMTP id c7mr10282890wrs.602.1639681056032; 
 Thu, 16 Dec 2021 10:57:36 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id m9sm5669584wmq.1.2021.12.16.10.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 10:57:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 19:57:10 +0100
Message-Id: <20211216185710.658720-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/frr: add zeromq optional dependency
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
Cc: Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

zeromq is an optional dependency since version 4.0 and
https://github.com/FRRouting/frr/commit/b6116506ec81735afa647af112c6aaa1ed35e9df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/frr/frr.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 49b4a190f0..8e53faaf33 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -40,6 +40,13 @@ else
 FRR_CONF_OPTS += --disable-capabilities
 endif
 
+ifeq ($(BR2_PACKAGE_ZEROMQ),y)
+FRR_DEPENDENCIES += zeromq
+FRR_CONF_OPTS += --enable-zeromq
+else
+FRR_CONF_OPTS += --disable-zeromq
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 FRR_CONF_ENV += LIBS=-latomic
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
