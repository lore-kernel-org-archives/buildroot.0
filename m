Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA5DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 09:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83F0561170;
	Thu, 21 Apr 2022 09:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hhbylGxePOSf; Thu, 21 Apr 2022 09:21:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A91B61125;
	Thu, 21 Apr 2022 09:21:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A61A1BF356
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 09:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 081868402D
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 09:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZqZTFsjRVfYo for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 09:21:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0958830C0
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 09:21:17 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id s25so884532wrb.8
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 02:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SVdXXaSwrZ0lvcgcWpTUbxLWfSJzktnQtEeUGGr7nHs=;
 b=K90Ta+PBrmJzyndBO6CLBbn7XaRo5+vluJNbQV/xHpVKS6JbRmkqAGgR3dITQ79d/n
 lCB7zHoctqBwRMiCOCNZ77V615DGDDy+H4zyi5A0u60uFwUpWu9jTuvDuiEb5NO6DmOu
 YBDNhFAjIM+NK73CD22dNZLOXPNAahts5LPAAv9b6vMj5ORhupQGYI7pMxeUzNb+Kf5P
 mMQLZ4WetCtLSXC7c2cmYq37huJB2yw3b+4AFmMYMoH+pxb5id2/9YLqsrRAytL9GzV2
 x9hXmIbAxNsZvxYIVUQ8kwxys66/O9gcZffMCRQ9TIEPgdXJOy2B2jLL1BM7t06pxxwk
 3OXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SVdXXaSwrZ0lvcgcWpTUbxLWfSJzktnQtEeUGGr7nHs=;
 b=RXfD6ByDFjGOFU2Fhze0KRNWCuHgX9mIXX4kgrxtQXJo9QlyVHCwExzaHhxajH2CuF
 N40NtvShCfRrbdH0c0ru8GFXz4ZjHRi+SQHTqJEELf4i0iYdRN6sDhpIvvKV+uqGkB0o
 7dFgIVZ5lw0a4kkjoLU235zmTbkSlnFqqaUcj9jqeiOuYC56RWEU1EIUfbhVN4Odp3IE
 gGc+9t573W8+A3pCLquaeFQ8KTOM4O0ciwpB3lT8ImJQn74Z+DG+7I9Gpsm5zFGt5vOV
 4agahujlw3xldBHobygKEc0ud/kp1QaYAod1VdFXff0HiNoYZ8vCKDABamKARPO+W/rX
 /J1A==
X-Gm-Message-State: AOAM531BLEU8ntSz5bj6J45ej3XXin2m1VL7V5YD5nRNDVi7690qfmYu
 4rHzhjp+DF6VOXF2Teo53FOfWYSSNkQ=
X-Google-Smtp-Source: ABdhPJynCtwyL6sd1swtki26mhCPwfJZWTRNPJP4hmg/UHTulArGJx2yOGApdfOFx19FHPPpGsks3Q==
X-Received: by 2002:a5d:47a7:0:b0:20a:a2c7:a7b0 with SMTP id
 7-20020a5d47a7000000b0020aa2c7a7b0mr10847831wrb.227.1650532875661; 
 Thu, 21 Apr 2022 02:21:15 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b00205aa05fa03sm1781942wrr.58.2022.04.21.02.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 02:21:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 11:19:07 +0200
Message-Id: <20220421091907.2774561-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vde2: fix build with BR2_OPTIMIZE_0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with BR2_OPTIMIZE_0:

/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/mips64-buildroot-linux-uclibc/10.3.0/../../../../mips64-buildroot-linux-uclibc/bin/ld: vde_l3.o: in function `ip_output_ready':
vde_l3.c:(.text+0xb30): undefined reference to `iphead'

Fixes:
 - http://autobuild.buildroot.org/results/5eeefcdac0b8974a424a885fdc2e82f7cb4b617d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...de_l3-Add-static-to-inline-functions.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/vde2/0003-vde_l3-Add-static-to-inline-functions.patch

diff --git a/package/vde2/0003-vde_l3-Add-static-to-inline-functions.patch b/package/vde2/0003-vde_l3-Add-static-to-inline-functions.patch
new file mode 100644
index 0000000000..7f771dfc7e
--- /dev/null
+++ b/package/vde2/0003-vde_l3-Add-static-to-inline-functions.patch
@@ -0,0 +1,37 @@
+vde_l3: Add static to inline functions
+
+Add static to inline functions to avoid the following build failure
+with BR2_OPTIMIZE_0:
+
+/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/mips64-buildroot-linux-uclibc/10.3.0/../../../../mips64-buildroot-linux-uclibc/bin/ld: vde_l3.o: in function `ip_output_ready':
+vde_l3.c:(.text+0xb30): undefined reference to `iphead'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5eeefcdac0b8974a424a885fdc2e82f7cb4b617d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Nura vde2-2.3.2.orig/src/vde_l3/vde_l3.c vde2-2.3.2/src/vde_l3/vde_l3.c
+--- vde2-2.3.2.orig/src/vde_l3/vde_l3.c	2022-04-21 11:05:17.393452698 +0200
++++ vde2-2.3.2/src/vde_l3/vde_l3.c	2022-04-21 11:10:36.509804404 +0200
+@@ -100,17 +100,17 @@
+ };
+ 
+ 
+-inline struct vde_ethernet_header *ethhead(struct vde_buff *vdb)
++static inline struct vde_ethernet_header *ethhead(struct vde_buff *vdb)
+ {
+ 	return (struct vde_ethernet_header*)(vdb->data);
+ }
+ 
+-inline struct iphdr *iphead(struct vde_buff *vdb)
++static inline struct iphdr *iphead(struct vde_buff *vdb)
+ {
+ 	return (struct iphdr*)(vdb->data + 14);
+ }
+ 
+-inline void *payload(struct vde_buff *vdb)
++static inline void *payload(struct vde_buff *vdb)
+ {
+ 	return (uint8_t*)(vdb->data + 14 + sizeof(struct iphdr));
+ }
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
