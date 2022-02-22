Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD639C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 20:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B00580CEA;
	Tue, 22 Feb 2022 20:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BLLAT06-DJtv; Tue, 22 Feb 2022 20:14:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A964280BD7;
	Tue, 22 Feb 2022 20:14:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 044331BF33C
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 20:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3AB280BD7
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 20:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qMNQe-oiaJql for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 20:14:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD92A80BB9
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 20:14:22 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id q23so871050wra.2
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 12:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=niKjlk5iMluxv9pY4fM6hfDlyp9GB7BVjQ1YGGU+ln8=;
 b=Mdk7/Z7t2G8XEUZ7S0jceqi1nCMs1KsmByFdPIuAeCMT484H3azH0ZiB4J74n1l6/+
 /ToR/aJYvIV+1M9IKpZ+CMwoqYxgsHfOP+FabjnEGI7l3GYBHbmr14xB6BNVFHM8qaqn
 66ozrfcxNocC/IoVBuxO9mtpbcL18LQv4j0u3T+uw+y+aSwOOAyhZY/7YsZ9JrrRgbyk
 Ij3gaXp/aQrWswLwmbzpPdO1lLwPXZmrL3v4GD/xrJmpxWc4Huijzs0JXkkiN7yIociE
 s1OcdscoX2vFJzfCjPclJAK2kv9QNkK9sVT0c0as+mCuy9UuX3Z7FWfdsihdUybbd9aH
 BOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=niKjlk5iMluxv9pY4fM6hfDlyp9GB7BVjQ1YGGU+ln8=;
 b=EBi8tw+nDLtQcb6uqq6CdoCOiLucdYqesz4hZ5c3nTxKUAD+D3mDtXXOxvpgCxQa/X
 xPjNl/wAT6D08FK21I+tQnziR2tbzDLU9XOHZv/emY90wAMUX/MTXyijw/hlSKM5U9cD
 QOP0r3djV4CknAfQqIdYoB3rE7HHZscPiC1c6dLKJVUhtW1FCumdgeqZh2cLtxj7lLaN
 qKh7CnvOjgcPoBDu50PZs/BG4zmZ3hP5KY53d6frpdEQZeNW75vvUZyQ6RZUVf7rq42a
 AwdtXG2Z+zFXTgwxqWxxbG6fKj1tqYHO5NLM8H44ltEt/0F12BMKvIy1/VDrB8E/HUSV
 YZGg==
X-Gm-Message-State: AOAM5308918E4VPA1wnbGuRUnPK1GMs8qYqW7SCO+yJiPiO71KaChGso
 t5CG5gm7DnJCtJ/s48zte5CHH/bJmCc=
X-Google-Smtp-Source: ABdhPJwW2XA48BRb5Yz1c/Mjh/jVJ3Njf1cInxhdMPlvDNebdqMsnolIJpUeJL4kleQTUGZUxMzCHg==
X-Received: by 2002:a5d:49c5:0:b0:1e0:8842:aebe with SMTP id
 t5-20020a5d49c5000000b001e08842aebemr21467571wrs.337.1645560860680; 
 Tue, 22 Feb 2022 12:14:20 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id q13sm2656799wmg.22.2022.02.22.12.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 12:14:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 21:14:18 +0100
Message-Id: <20220222201418.3087618-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5webkit: disable JIT with
 mips32r6
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable JIT with mips32r6 to avoid the following build failure raised
since bump to version 5.212.0-alpha4 in commit
df0b0fe6919c0d0f3750f439a3cfa765232bd569:

/tmp/ccHw2rHQ.s:18: Error: opcode not supported on this processor: mips32r6 (mips32r6) `addi $a0,$sp,-8'

Fixes:
 - http://autobuild.buildroot.org/results/5191600b463cda078203eeffae880ed989f8ac0f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5webkit/qt5webkit.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 2e96acc00f..6f8714140a 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -20,6 +20,10 @@ QT5WEBKIT_LICENSE = LGPL-2.1+, BSD-3-Clause, BSD-2-Clause
 # in the archive.
 QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21
 
+ifeq ($(BR2_MIPS_CPU_MIPS32R6),y)
+QT5WEBKIT_CONF_OPTS += -DENABLE_JIT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL),y)
 QT5WEBKIT_CONF_OPTS += \
 	-DENABLE_OPENGL=ON \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
