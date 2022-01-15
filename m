Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78FEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 20:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78C5A60BCD;
	Sat, 15 Jan 2022 20:04:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJXnngA1NpbB; Sat, 15 Jan 2022 20:04:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D053760BDE;
	Sat, 15 Jan 2022 20:04:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE6671BF3E9
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 20:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD307605DB
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 20:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p0YCV4mzZbZx for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 20:03:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF862600BB
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 20:03:37 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id b13so47852025edn.0
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 12:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7pF4+5IQxqR+2006acVXZE/R+gP6rMrh1uunHJ0LX3U=;
 b=VUdnUJrrOOfE6IGb8ynrcHn7s5UUBor+xsawvwvASdyqY/+I1TKbLi0CW4aFgpmgd1
 AZsEsW/KEBgiK8yf92pz4DDd7HPOOotI7a2xatmUHlc92IErohmxd6H/2p1iYTxSUeXE
 xseXOJABHZuzudb+54LkCiqqVhUhd12QLMZHFgPZAGbXLI3CW10nVhsuyNCN0LDKfKrn
 yTzZhRBUiTdhcOxuopNWxHavqeEJtSolqaIG+QzG9c6PdWVM0Jv5XMlFatOTA1nEg+YE
 +YERRnHwlfbuc2+FueSyQkyJG4TRlW5h+MMNL72bifZFK5DTHYCE97DdzruMvijOXG7u
 NTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7pF4+5IQxqR+2006acVXZE/R+gP6rMrh1uunHJ0LX3U=;
 b=7pstaQXAbV1YTmJXfIzedd128HfPC26/tEjQqhZjZzqQvc2MxUtkFGmlCSPqY3Hf5+
 b1UCbnKMIGZflJ9Jr6F3VRCSNj1NME9WzetWPsLx0RQPetVFGj+pYkh+ROxIp62h6ayU
 c8FGvZcyNdltb2HggePHO7Rd0odKlkb5VFzKyx81YP6Izrd+S4KlUsH8qiWgjC8KyAD4
 rs4YgDH/LusCvx0wQjMOoaXKn5TpuP68ufFwUmxSyscNVkbFAHZVr8dQCUsCUsdgSYpW
 sxNdPdvpN0V/5AoIwMH/TtNdAcwa/sm1g9hJld/+qpz4WwBA5Ms8N1VlWLyzI9RYj8XT
 66wQ==
X-Gm-Message-State: AOAM530r0/2y1/HnQx1PmVzquODWeDakNPsw/38rv6Xkv8Mqjp0E0C2D
 zZL/Uy4IRsbhpADMIUXgdbOG2zATlUU=
X-Google-Smtp-Source: ABdhPJw38EbTeED93qoIMcSYw98IF1JLDz/iAO5QvvF0yOsJDvu6uM5QnXpFdKfSLxNqLvK2eOqltw==
X-Received: by 2002:a17:907:1b01:: with SMTP id
 mp1mr11705488ejc.683.1642277016247; 
 Sat, 15 Jan 2022 12:03:36 -0800 (PST)
Received: from localhost (ptr-5gw9tzn82s1glqex1i.18120a2.ip6.access.telenet.be.
 [2a02:1810:510:3800:ad4b:62a2:fdc7:acc6])
 by smtp.gmail.com with ESMTPSA id qb2sm2859276ejc.219.2022.01.15.12.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 12:03:35 -0800 (PST)
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 21:03:03 +0100
Message-Id: <20220115200306.14037-6-patrickdepinguin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220115200306.14037-1-patrickdepinguin@gmail.com>
References: <20220115200306.14037-1-patrickdepinguin@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv2 5/7] package/qemu: add support for overridden
 KERNEL_ARCH=x86_64
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

When the kernel architecture is overridden via BR2_KERNEL_ARCH_OVERRIDE,
this has an impact on the required architecture for qemu-system.

The correct architecture for Qemu is currently determined based on ARCH, not
KERNEL_ARCH. For example, while KERNEL_ARCH is 'powerpc' for all PowerPC
variants, ARCH may be powerpc, powerpc64 or powerpc64le. And this translates
to ppc, ppc64 and ppc64le for Qemu.

This means that it is not generically possible to determine the Qemu
architecture based on KERNEL_ARCH alone.

For now, already handle the case of x86_64.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/qemu/qemu.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index e69e813059..bcf684e615 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -302,6 +302,9 @@ endif
 ifeq ($(HOST_QEMU_ARCH),sh4aeb)
 HOST_QEMU_ARCH = sh4eb
 endif
+ifeq ($(call qstrip,$(BR2_KERNEL_ARCH_OVERRIDE)),x86_64)
+HOST_QEMU_SYS_ARCH = x86_64
+endif
 HOST_QEMU_SYS_ARCH ?= $(HOST_QEMU_ARCH)
 
 HOST_QEMU_CFLAGS = $(HOST_CFLAGS)
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
