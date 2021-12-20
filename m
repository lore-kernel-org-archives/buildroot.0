Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42FDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 08:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57D838308B;
	Mon, 20 Dec 2021 08:46:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MqZBsVmGRHqT; Mon, 20 Dec 2021 08:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9BFC82C4D;
	Mon, 20 Dec 2021 08:46:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11E811BF406
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 08:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0036960BD5
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 08:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tsyC_vG5a6_P for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 08:46:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72E8C60B97
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 08:46:48 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id q72so12196028iod.12
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 00:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hXPzRykaTt2FXh1/dyy3iAp1W5594dkj6o7jMyYY/aA=;
 b=qWCPcSeYfbqKRm4vMm0zO0tDXu6Q4PKjK6/Rjwb2M4kjP8c7aCFrciBttY862Rl/EU
 At3+zeGTTPaCZclFSSFJE1tk9Hlqdq75jgvlBci9N//aqPaALBCtl07/tE+rnn6I4ypd
 4azNVIU6kfTiAOjweZ7RJOKcSzvmoksq6DB/nx3AWz/Xgt2BS5ClsvaawMBQGhvuW1Vn
 B6aNFMr4H1/GpV+HKMfHieB9XYGWwVTplTv8oHKc87Zz8qoaRiK+K038mVS8bnVFGHbg
 jIHHTt0zusdeWhOBUAvnO3gljEdiQHvQXhptW10qCgiMHTc7+QiF2EFswUqfMxk9g66O
 4gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hXPzRykaTt2FXh1/dyy3iAp1W5594dkj6o7jMyYY/aA=;
 b=UrWQKU+ugUjfELO+Wat4JGUymyWV+LUHEh3qiDYNqnOiTaFm07BxHshxNMb8L16Us9
 rhky4yjz1m3tlROs7eI0FhBTeB3vKjGNzVX7dg3AlT8MyUxbxe85KtaPuyPxAZH2yFAX
 FYkJoYz8Ty1NppS5lm3IdYG39lXZwHmpTTxHMB5/DCZaJd+eFj/Uq4APUVERKXP37H5v
 loM4OymE7DpLwPN5aXT8d+N67Xu4ckCH5vrh8QFGugPGHJXOnWOKnkkT2ssR5jOfojQM
 hyEKQIgEN7QIFWoQPiuUZ8vz0QK4QU6jdGpRz1uJdLTaa/2MyYFXb859uiopgLYv7AqJ
 KnIw==
X-Gm-Message-State: AOAM530XPCxGIDkQ4shOgQzzuSmI9B7lFj1rdqYIOR95sh0HeR0W6aP/
 8V8us3kKFyDEjt3oBx2i1J9RP83hXjv1Fw==
X-Google-Smtp-Source: ABdhPJzrtPuCktVjfsRQ79m4WZysezE7VXgyS9T/9kChJdXBRtAy1TYdQBvaml6wmTMY0clBJnfUuA==
X-Received: by 2002:a5d:944a:: with SMTP id x10mr7308202ior.18.1639990007316; 
 Mon, 20 Dec 2021 00:46:47 -0800 (PST)
Received: from james-x399.localdomain (71-218-229-18.hlrn.qwest.net.
 [71.218.229.18])
 by smtp.gmail.com with ESMTPSA id x14sm10114508ilu.74.2021.12.20.00.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 00:46:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 01:46:45 -0700
Message-Id: <20211220084645.28659-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/connman: add iwd support
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/connman/connman.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index e5e596c973..d3ebb40a1c 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -85,6 +85,13 @@ else
 CONNMAN_CONF_OPTS += --disable-wispr
 endif
 
+ifeq ($(BR2_PACKAGE_IWD),y)
+CONNMAN_CONF_OPTS += --enable-iwd
+else
+CONNMAN_CONF_OPTS += --disable-iwd
+endif
+
+
 define CONNMAN_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
