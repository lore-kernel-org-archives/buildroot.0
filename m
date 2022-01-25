Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F2EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 19:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9692607CE;
	Tue, 25 Jan 2022 19:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mlAjnU0HYrUO; Tue, 25 Jan 2022 19:09:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3051360899;
	Tue, 25 Jan 2022 19:09:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE7CE1BF301
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 19:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C1A0403AC
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 19:08:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S68eq5fCp2qZ for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 19:08:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48E5D402C3
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 19:08:47 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r25so4997908wrc.12
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 11:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=57yfqVFqhqgfc60Kibg6QlaAH4M0tfzn2667Cxa7Ro4=;
 b=jUZIwcrfb8a5ljteSOaVxqRynP8rbwaR4WLDO0CMGV8dj/X/ZlzLxd+Shz367X2Aob
 kgQ4q/s39IxwKCCv1Grfy/XRVEKWbzACbKUhqDjmiQMEVoVSdXf8DEsdtW7dSFlINTAb
 8iIQiNkU4OpsKKvDvDMEg8mtT0PwM7cmSZXBqDmfRjzH+V6UM+c0VyV7wzw1XFp27H9y
 xBsy0sI0sDjw1YKyfnJrHsgYx5XNIkVdE5VDgni2pzpC7ID6r6Ml5VSRsxr6FoX+vIPJ
 OS6SenHOmuOeFZlCWLb+5FGMZ1GSTAm9RuYGxXoP54nH4JT/44J0Dvt2bTnOIHyQgPNu
 0DMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=57yfqVFqhqgfc60Kibg6QlaAH4M0tfzn2667Cxa7Ro4=;
 b=bcYd6qc/WjqoE52CEgfoIlfIsAHOWge02mPQBuL4rmn+yNTcZEk4OJfJXIE6jmJMg2
 6pVpSXSWi/GfF7qg1Ogway07f8s0I5NBv1u3NYYD4Jg5R00kIV4N0NztNdNNfTYGjg2p
 RiIE9+pPGNHcFpK8ecI5oMky6OcEpWefDz5GYlX8N8x6ArtNQ+wLz7QdzZuPxW/nB1Sn
 zmbDfNA6Y4T/FM6zIb09e79YpdNXKTtSbW9Gy/1tEigxvhrSk0dXPT+DiirOqxiixOo3
 gTswlxWr22x5GqG/pV3GCYZVy9PRR38KUFiVwur5vsGqJSTwqkNO7oYolSUepMjm2pKA
 xBVw==
X-Gm-Message-State: AOAM530j3wOYhPHMj1EbdKU3DvSqxhlpdebJVz04qBFtSfiMDhjCtJlj
 8beOIW4cDnn2Py94zEDxe5qx7bFg2io=
X-Google-Smtp-Source: ABdhPJxWdpNd6jWoL4nNBgfXGVu6B8tSJVLfjPzGYzkvObOvzbLmkB4e1FXrrNjGqrQ7lFgLd5Pc8w==
X-Received: by 2002:adf:ee86:: with SMTP id b6mr13619740wro.288.1643137725454; 
 Tue, 25 Jan 2022 11:08:45 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id d7sm3564842wri.117.2022.01.25.11.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 11:08:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 20:06:50 +0100
Message-Id: <20220125190650.107677-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125190650.107677-1-fontaine.fabrice@gmail.com>
References: <20220125190650.107677-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/xvisor: add riscv support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

riscv is supported since version 0.3.0 and
https://github.com/xvisor/xvisor/commit/d6feda4e80eefd372294b081111ce709d08ee4c0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xvisor/Config.in | 4 +++-
 package/xvisor/xvisor.mk | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/xvisor/Config.in b/package/xvisor/Config.in
index 55c43e6959..4e7a3e1b53 100644
--- a/package/xvisor/Config.in
+++ b/package/xvisor/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_XVISOR_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_USE_MMU
-	depends on BR2_aarch64 || BR2_x86_64
+	depends on BR2_aarch64 || BR2_riscv || BR2_x86_64
 
 menuconfig BR2_PACKAGE_XVISOR
 	bool "xvisor"
@@ -32,6 +32,8 @@ endchoice
 config BR2_PACKAGE_XVISOR_DEFCONFIG
 	string "Defconfig name"
 	default "generic-v8" if BR2_aarch64
+	default "generic-32b" if BR2_RISCV_32
+	default "generic-64b" if BR2_RISCV_64
 	default "x86_64_generic" if BR2_x86_64
 	depends on BR2_PACKAGE_XVISOR_USE_DEFCONFIG
 	help
diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index 4ceb5ed7cb..1a7b49e689 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -32,6 +32,8 @@ ifeq ($(BR2_x86_64),y)
 XVISOR_ARCH = x86
 else ifeq ($(BR2_aarch64),y)
 XVISOR_ARCH = arm
+else ifeq ($(BR2_riscv),y)
+XVISOR_ARCH = riscv
 endif
 
 ifeq ($(BR2_PACKAGE_XVISOR)$(BR_BUILDING),yy)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
