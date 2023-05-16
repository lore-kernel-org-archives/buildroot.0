Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47652C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 08:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E693941A48;
	Tue, 16 May 2023 08:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E693941A48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N5bKIPYqK1qS; Tue, 16 May 2023 08:24:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B301A402C0;
	Tue, 16 May 2023 08:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B301A402C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AA6B1BF2CF
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 08:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5A1140588
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 08:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5A1140588
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Umtyh9p4_D8h for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 08:24:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C44C14018F
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C44C14018F
 for <buildroot@buildroot.org>; Tue, 16 May 2023 08:24:00 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ac8091351eso144513551fa.2
 for <buildroot@buildroot.org>; Tue, 16 May 2023 01:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684225438; x=1686817438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wM2W8aj9ZYLYHGRTCjPaBZHNEfdzy8Gn/qgu9EL56jA=;
 b=EUl0EAuhuvdsoLSyO3W5j2QgleFfkIBLn3IrAtIERBaZQZU+7uSvkC2Ahuo8bRJqA7
 mrV8IWqlZ8qaWtKzSLY3sI/X6Mby0QRyFmTvNEGMowe2Tgzj21RpORZ9wfJimYdgUH7x
 zsaGr3oww0TwsF4Nu7dOuAUfsvIOwGcLkAsdWQAWF9KEqfq5q6Um9JcAYW6XqA8pCYOg
 LgBt1rk3h9HzJh2TvcMu0tf/ynYwDOo77NYbURFp4mT49e51VA24tl0TfjBwuVpkfJ+o
 z2EWVn2ejBRr9QRy01Oo8deNO3xHrGaU8oXtj3gjm0u7lGSf5baRaECdMPYQDZ/8Qvcp
 7Aag==
X-Gm-Message-State: AC+VfDwzlDESBOLrjnlsyfzAx2OqYI7qafo+IANzYuYAq0dYMP28Nug0
 uM8S0dxPPWkftbIqzM7ikQGloSHS36U=
X-Google-Smtp-Source: ACHHUZ5rrBk4YTlhJ0+oNF2f6DdzyFKSKf2CPu24J2F8FVmwpKXfTgACOWq6Z7RFZxw5cpsbJWrdrA==
X-Received: by 2002:a05:6512:963:b0:4f2:4bc2:fc35 with SMTP id
 v3-20020a056512096300b004f24bc2fc35mr7652974lft.53.1684225437740; 
 Tue, 16 May 2023 01:23:57 -0700 (PDT)
Received: from pc.. (mail.pulsar-telecom.ru. [94.181.180.60])
 by smtp.googlemail.com with ESMTPSA id
 w18-20020ac254b2000000b004edc6067affsm2880809lfk.8.2023.05.16.01.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 01:23:57 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 11:23:40 +0300
Message-Id: <20230516082340.1375834-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516082340.1375834-1-bigunclemax@gmail.com>
References: <20230516082340.1375834-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684225438; x=1686817438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wM2W8aj9ZYLYHGRTCjPaBZHNEfdzy8Gn/qgu9EL56jA=;
 b=McvCnrAiA+C3hRuvXmDEqCYJYRonbakYsW3MwiZYuizscn4JxHX5/TSHJ44WyfhRKi
 /3MnLK/SNA9hjDznuaaDeuG706BecCvl3zuobIb72BLCsNcOqlsmoOZwXZCs/NjUUHcX
 U40ZBVXTp5NB5Rr0jLrIybHhWIzP/FZRmYfdotL3o5JP1AZqW4WG66VRS3dRKQfAtTci
 SoslkYEgzJCSgDTUZRaAlH7RYEmYsXN9H3mytyeIRYeQPKSPoYp3R+0hB3ULlrjkpFnW
 YH9AnCWbHntNkKbXfFrMUghncCiNJw1np+CWEHLrUC90nVpLsUuJRX9mr/2Irxx/wtjl
 beYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=McvCnrAi
Subject: [Buildroot] [PATCH v1 2/2] package/fio: add optional libiscsi
 dependency
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
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit 247ef2a fio has optional libiscsi engine support

This patch enables fio iscsi support if BR2_PACKAGE_LIBISCSI
was selected

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 package/fio/fio.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 90ec407207..45092a0d80 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -9,6 +9,8 @@ FIO_SITE = http://brick.kernel.dk/snaps
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
 
+FIO_OPTS = --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_LIBAIO),y)
 FIO_DEPENDENCIES += libaio
 endif
@@ -17,6 +19,11 @@ ifeq ($(BR2_PACKAGE_LIBNFS),y)
 FIO_DEPENDENCIES += libnfs
 endif
 
+ifeq ($(BR2_PACKAGE_LIBISCSI),y)
+FIO_OPTS += --enable-libiscsi
+FIO_DEPENDENCIES += libiscsi
+endif
+
 ifeq ($(BR2_PACKAGE_NUMACTL),y)
 FIO_DEPENDENCIES += numactl
 endif
@@ -26,7 +33,7 @@ FIO_DEPENDENCIES += zlib
 endif
 
 define FIO_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) ./configure --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)")
+	(cd $(@D); $(TARGET_MAKE_ENV) ./configure $(FIO_OPTS))
 endef
 
 define FIO_BUILD_CMDS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
