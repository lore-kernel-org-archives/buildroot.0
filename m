Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172A3C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Mar 2022 18:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEC3A60F1E;
	Wed,  2 Mar 2022 18:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTIem8QtITD0; Wed,  2 Mar 2022 18:42:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E64C60B5E;
	Wed,  2 Mar 2022 18:42:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1BD31BF398
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 18:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE92B4012E
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 18:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id myxn5RwIyCCc for <buildroot@lists.busybox.net>;
 Wed,  2 Mar 2022 18:42:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC1B5400C1
 for <buildroot@buildroot.org>; Wed,  2 Mar 2022 18:42:45 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id x15so4192319wru.13
 for <buildroot@buildroot.org>; Wed, 02 Mar 2022 10:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xi/TCar/JlSeDZhIKqHVGXmBvWn+nbRw3H3EXxgCxys=;
 b=TRG7umNRE5WH/4QKafI8CMUqQLhBKQV+KAwoM1bxxaEQKcugWecZaJtyYVpVPRQPdw
 mlNUNkWDVRFIYgs/BNRqp4M8rbRUKOxPnYaHiqP7lffNWu+7g/GFNo39ygI1o+5k4I7+
 979Vr3LzSP2+yQUOsoZHz26384z+kTx2Xm1C4tN+aKCbu/XJRyeIekqxMGKLQxdj1bz6
 ZaaCfPk6Srj2AX0NZIHv+IreadE+DlJZgPDtPclE64AHMrRDUltD8BJhAapTAzWGJqM1
 uuN5fwdMBBVC6mACPWS1NqlYiSK6qe9SCdE8CatgJ95sZhgXodp3YLqJxEptI5bkAtWo
 PLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xi/TCar/JlSeDZhIKqHVGXmBvWn+nbRw3H3EXxgCxys=;
 b=bNxltiCg0uvpjfgeyzRmxXB9sYwRg6hY55fdFvdCDdHqwyKHWBUtEAzzCWNWoBPg/a
 gTKmpoZjh10QHdPQ/pevawN74RjT2ACT9YBvn2N0AV3cXzlSw6h7b54bmfMxofPo6IRe
 Hl0rikYIFfXNP70kCZlDzdnlUnPwtCLJLkCKJWYVzF5zszYl0lgfN2HWSnEWiBjhCbZi
 rw+vrgRF2zb5Iqla5UWG+/E5a/FuA37e1kCXIvSOIZRHeb77ikELrW8qRJ7ZExSKX9g3
 6BEmrsKKVQct116nvV1eAk9Hvk5Nh4sXOsWAqIe8qanUQLqDPzuFe+/Z5d66L9yg8fpF
 MnNQ==
X-Gm-Message-State: AOAM531m1PkwvgpTYpqGCN9GVMN5kcPZRv6PejYq4GOZPCY7aVASjt8U
 YnybVLVtvQ0Rx+To8QVEHu++Xl343/U=
X-Google-Smtp-Source: ABdhPJxlulz/SDSqMRB7sthwYotmgmatuEJj6qQ0A2ykZ4e5UdBwxgzqIx3Bb2dwmHj++OfAc+/ZDg==
X-Received: by 2002:a05:6000:1864:b0:1ef:d2b0:560a with SMTP id
 d4-20020a056000186400b001efd2b0560amr12065991wri.38.1646246563695; 
 Wed, 02 Mar 2022 10:42:43 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bi21-20020a05600c3d9500b003814de297fcsm6197122wmb.16.2022.03.02.10.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:42:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Mar 2022 19:42:09 +0100
Message-Id: <20220302184209.2081120-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcamera-apps: link with -latomic
 if needed
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Link with -latomic if needed to avoid the following build failure raised
since the addition of the package in commit
7227d005d2435ec7b38995a6247d233ddb5ba365:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: CMakeFiles/libcamera-still.dir/libcamera_still.cpp.o: undefined reference to symbol '__atomic_fetch_sub_4@@LIBATOMIC_1.0'

Fixes:
 - http://autobuild.buildroot.org/results/b20465140f3a5281f9b586f442b67fd400e7184a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcamera-apps/libcamera-apps.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 210d4e1e52..f4fc019c17 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -45,4 +45,8 @@ else
 LIBCAMERA_APPS_CONF_OPTS += -DENABLE_QT=0
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBCAMERA_APPS_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
