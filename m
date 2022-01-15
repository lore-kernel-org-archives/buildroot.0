Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BF5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 20:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F61C81B36;
	Sat, 15 Jan 2022 20:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id utSPu-U3XXbX; Sat, 15 Jan 2022 20:04:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85C9981B23;
	Sat, 15 Jan 2022 20:04:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A3921BF3E9
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 20:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC883605DB
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 20:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id afJxBoMurl7N for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 20:03:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46867600BB
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 20:03:42 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id a18so47649909edj.7
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 12:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7ipBu57dWoBca8bjPVqg8t+34VyKyV2zn28/ywY1DUc=;
 b=IGo8lJopk8ygxblLhLdBTZ8Hq5VpD2f4VBI/R31n47YcF/RoLTLiwq0xaxvwEr1CBL
 vbwIxZPebCeQe9fTVMN9iIKaNi+2l9WGI6nkgS3pN5/xlE7x6QJkn//pvGYIlHejzGMI
 W9DTg8CAK4ZuDVH1H8gqOUwzirOLFbpBxAgyvhwom1/POu4RKRE2IGt77lxjYMwm/knm
 rFJDStpBlszc6fMsKRVira+Y5D7Es0koPCFKeZU9e3i5Vo0HwSN3FjeeGb8+3fyIXGMv
 9V1sQmYsqP7kr7fvlaKVJp801bzuy1FhtlUigDQUjnnLGFVTF7F3izSo6Xz54V9lscJP
 BXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7ipBu57dWoBca8bjPVqg8t+34VyKyV2zn28/ywY1DUc=;
 b=QsEyHTzM2UdknzRG+JTi71a8Mm/GcrJP1ohjjsrR85G2m6WlSiThT0I2H+xmsUWRMh
 kVHe/QWA30dAL1XS2hzpJF++0Z6QNNH6rHyKbo6fFLWiOTs5DL5FLKJpN9AYBMsHpk5Y
 CCo7ygAnKiAk8O0j2AcF2isyQEXCe3MqgPXVfvOUdzoxCAcEIIcbbSFNf6kIRmJIJIru
 nflnTq6Qj+MSgO1DGJZgLNM4ruACZ2okc7oPPWIONHHQN10XZH7+jsNH8SlXHELV/VMM
 /olJVhuGDJiEnT3VL2GbIo81E+PYtghMZoWK5gZ53RVn4atPLBqWx2YelPXOMDatgMkO
 ZXxg==
X-Gm-Message-State: AOAM532bKjpeHEpbuD6KcRdNohlOJEBGuxHbWiufbYVIM1LJps9GHxB6
 yhzfw6v48FRTAFDWXQmEdaUSDIlzZrbilQ==
X-Google-Smtp-Source: ABdhPJzNWfloR7UuJtBqSPAKMfPOhaHaE6o/6OuDeuTZYqpMUMfsD/L6UFHvaq6rlDR9t9V3wZFh8A==
X-Received: by 2002:a05:6402:34cb:: with SMTP id
 w11mr14135873edc.400.1642277020607; 
 Sat, 15 Jan 2022 12:03:40 -0800 (PST)
Received: from localhost (ptr-5gw9tzn82s1glqex1i.18120a2.ip6.access.telenet.be.
 [2a02:1810:510:3800:ad4b:62a2:fdc7:acc6])
 by smtp.gmail.com with ESMTPSA id w11sm2257982eds.88.2022.01.15.12.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 12:03:40 -0800 (PST)
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 21:03:05 +0100
Message-Id: <20220115200306.14037-8-patrickdepinguin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220115200306.14037-1-patrickdepinguin@gmail.com>
References: <20220115200306.14037-1-patrickdepinguin@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv2 7/7] linux/linux.mk: correct LINUX_ARCH_PATH
 for sparc64
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
Cc: romain.naour@gmail.com,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Buildroot uses variable LINUX_ARCH_PATH to refer to the arch-specific
directory in the Linux tree, which may not necessarily be arch/$(KERNEL_ARCH).

Buildroot already accounts for the case of KERNEL_ARCH=i386 and
KERNEL_ARCH=x86_64, but does not for KERNEL_ARCH=sparc64, in which case the
correct directory is arch/sparc.

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 linux/linux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index dd2eebd446..35e2484588 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -242,6 +242,8 @@ ifeq ($(KERNEL_ARCH),i386)
 LINUX_ARCH_PATH = $(LINUX_DIR)/arch/x86
 else ifeq ($(KERNEL_ARCH),x86_64)
 LINUX_ARCH_PATH = $(LINUX_DIR)/arch/x86
+else ifeq ($(KERNEL_ARCH),sparc64)
+LINUX_ARCH_PATH = $(LINUX_DIR)/arch/sparc
 else
 LINUX_ARCH_PATH = $(LINUX_DIR)/arch/$(KERNEL_ARCH)
 endif
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
