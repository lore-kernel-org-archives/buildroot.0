Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6BAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 19:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9E3260E7C;
	Mon, 13 Jun 2022 19:58:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5z04RcQAA88S; Mon, 13 Jun 2022 19:58:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF90760E5C;
	Mon, 13 Jun 2022 19:58:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4739F1BF2BF
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 19:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 333EF818A1
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 19:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vTBqlbUgA08C for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 19:58:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 337C481467
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 19:58:47 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v14so8441298wra.5
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 12:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aCqVJNpFatRmHDMQlQEUMoieqyl0kPVwSzk/cjZ3TTI=;
 b=IZ+xRQ32nnofEZ1S2zpxHWLtlyGKKF0XPT/BpDjigvyIqK06ZWXWtUg/NEzTy88Vu+
 1lI4Ngxoxtf5KikWxU2fqhBTiSFLAnEAShSop4kdCmrAFUak81lNqddIM2QMIyQb1VUx
 THIjqVudB3aIEbUZnX5Vx5rRejihuW/t/8DtwokyKXiUMI96K8byTbjl249R0xi06Ltj
 4464OzKGR9DzupRAIa8pniev2E/+sENWgERsMCJRm09C59qusODbEX+SrZ0fhzlP9V1a
 4oUQZxRNT7tSxfYMr9ENLpxFAsC0tMZM5Abw2B4bBNVIdUcIsy9O8bCquwUyOSIMNws0
 D7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aCqVJNpFatRmHDMQlQEUMoieqyl0kPVwSzk/cjZ3TTI=;
 b=XOA6JosJnaAUv1PsdVCJDPByC73x2CxkmFoK7n5wvH+EWeSUCssRQ6UUwHl0G6iA5k
 +tp6zhsaYuOXirzf5SsYEdYv1yz42tJFCZlVXqQfkff2SaymIM1a5FbyHoqRF40o1FpN
 yNSiVbGqLOVU1pL2BhVuUliL0Qq5I3jOUtBBhOjAkqGBp1Inkvu9yKphMz97O3WmpuQ7
 pJVesUyktIqvWOTW2LgmZD1CozABbjETnv4W7RlXDWWh9/t1VA0fiGb59CkNrybquc7A
 zAcrjJ5U4joterJXCpKqrTt9swXiAC3prlkbZNbW0Vvh9AMhNW0IwtvYnz/z6WJyJrn1
 LnmA==
X-Gm-Message-State: AJIora8XNdcpGuA5/pycMYuq8f4wdjq0AWC/IA9ngpENAV1H4I1X0xf4
 MsiiVXCT4uPedgcWhj1NFpNPUuruBrA=
X-Google-Smtp-Source: AGRyM1sP1czQtPZB5UGRvfP7csxHSgOwtDIKqf7PCnFIxCOO3PRMz0238YTMl4oVQvEzj8sBrPO+Zg==
X-Received: by 2002:a5d:510d:0:b0:219:e73c:d320 with SMTP id
 s13-20020a5d510d000000b00219e73cd320mr1277766wrt.531.1655150325122; 
 Mon, 13 Jun 2022 12:58:45 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f13-20020adff8cd000000b002103de97455sm9533900wrq.69.2022.06.13.12.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 12:58:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jun 2022 21:55:59 +0200
Message-Id: <20220613195559.291427-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/procrank_linux: fix static build
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

Pass TARGET_CFLAGS which will contain -static to fix the following
static build failure:

/home/buildroot/autobuild/instance-0/output-1/host/bin/sh4a-buildroot-linux-musl-gcc -Wall procrank.c -Ilibpagemap/include -Llibpagemap -lpagemap -o procrank
/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/sh4a-buildroot-linux-musl/10.3.0/../../../../sh4a-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/sh4a-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
/home/buildroot/autobuild/instance-0/output-1/build/host-gcc-final-10.3.0/build/sh4a-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89: undefined reference to `abort'

Fixes:
 - http://autobuild.buildroot.org/results/8eccc34c99a75501179fe93a80646cc684261ff4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/procrank_linux/procrank_linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/procrank_linux/procrank_linux.mk b/package/procrank_linux/procrank_linux.mk
index 7e743194fc..415a4e41b7 100644
--- a/package/procrank_linux/procrank_linux.mk
+++ b/package/procrank_linux/procrank_linux.mk
@@ -10,7 +10,8 @@ PROCRANK_LINUX_LICENSE = Apache-2.0
 PROCRANK_LINUX_LICENSE_FILES = NOTICE
 
 define PROCRANK_LINUX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)" \
+		LOCAL_CFLAGS="$(TARGET_CFLAGS)"
 endef
 
 define PROCRANK_LINUX_INSTALL_TARGET_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
