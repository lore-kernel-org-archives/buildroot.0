Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4AAC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 19:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB5DC408D9;
	Tue, 22 Feb 2022 19:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKUtVSTjUrGw; Tue, 22 Feb 2022 19:29:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0023340897;
	Tue, 22 Feb 2022 19:29:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFE8C1BF39F
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 19:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE18260B24
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 19:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kHSLu2FHQdJj for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 19:29:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E860660AA7
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 19:29:15 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id bg10so46048348ejb.4
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 11:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Nx4O0D10WydGcHucyFZrcFNJyObEUU8sop8itpvxkg=;
 b=N6Ra0EJS12mwm1+6FCqj4cTeFna3OVFlENimzzN5rRdzkLOmt8Qg+8Jt183Ma5ADP6
 Xt1NPLsCc0l3kf7aRQphRQUqtLud5jQ4xVr7CKddnuymN+Q4eXrlgTLsOSnQFXjKybFF
 MbXL60MXvd7dc5hKHlAdn8SoIbeTmei/F+/7AwU5W1IeiuLGh+0UiTB5821SzRF+KX44
 8T0UMStgX+FgAW72UTwGWbnNFkXDETPAAQYklRlc/tQzwo5ccKYZOVT5XvTaEMkDe+SJ
 Ehsf71crMm5C/G39+/fv/e+HLNaMS+MATf5dGHfYW4CKCLROZF6qAdQ4ArrvCKZjZE4Q
 /oHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Nx4O0D10WydGcHucyFZrcFNJyObEUU8sop8itpvxkg=;
 b=j1ABBOZwqpXwCTQY45C9k3y8QQzoy5+M3DHfyE3ucFr5zfed976z7Yb8//RUpmsX/l
 KasdyxsAOapkN29FCAh5tuNEwD4s/xj9//Qr7p54VpaKf086HseCW6fe71B0h+IIl9QJ
 9yKYNprgDPw8UrvEatdCWELIHkoCXzCQOjAx9jfsvtYz1/XmM2Ia+9J7m5TmQl4eRTyp
 63xVGn8OJfJ0x3FkLiALRx7tzKm8Dgd7kkTPgxS5xqrnMQfifoXRwlx0imBmrPLjxT+t
 mOzqk1No0pyMKlXSk1lIc005NPA8mzAVzTAC5HtY3N1tKzzLgOQbR6H0kzjwFKvVdwwO
 G+wQ==
X-Gm-Message-State: AOAM530r7hA1GZ07CGsgUmoAO/zpIiPGelr0v4sdOCblVtuHxYguJ+YY
 QMGJquQSYUVmBGm9lGKR4kAadR7EStd8oA==
X-Google-Smtp-Source: ABdhPJzLLAhlj6C67LLViqrFrS37heRMeBKUWYAilwq7ZCaGoGu7VJP8hwaSOGd2VWs1slscjUswug==
X-Received: by 2002:a17:906:3803:b0:6cf:56b9:60a9 with SMTP id
 v3-20020a170906380300b006cf56b960a9mr19211424ejc.716.1645558153995; 
 Tue, 22 Feb 2022 11:29:13 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id q12sm10164115edv.99.2022.02.22.11.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:29:13 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 20:29:05 +0100
Message-Id: <20220222192905.20456-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/modem-manager: bump version to
 1.18.6
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
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* fix version in commit message subject (Yegor Yefremov)

 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 14597215df..ea91f42fe0 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  2ccf1f716c2d121e8e6709bcf8af29ee86971a90adacca2e8d6288b30278862e  ModemManager-1.16.10.tar.xz
+sha256  d4f804b31cf504239c5f1d4973c62095c00cba1ee9abb503718dac6d146a470a  ModemManager-1.18.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index a881edc272..d7e2c55bf8 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.16.10
+MODEM_MANAGER_VERSION = 1.18.6
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
