Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70805C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 22:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E921D40140;
	Fri,  3 Dec 2021 22:31:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6sQl02S--blB; Fri,  3 Dec 2021 22:31:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1BAD405B9;
	Fri,  3 Dec 2021 22:31:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2E481BF9D1
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 22:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE58E405B9
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 22:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qOtNzlEulzB9 for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 22:31:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75A8240140
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 22:31:40 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so3286425wmc.2
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 14:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MtVuN5pVGv1shnQatuoGXJNKHsiCdH81ZvfGFGly3PM=;
 b=pkCTuLlm//dKBhwXqlS2pXbOMIJuCnn2H6N3y7fd0+7Q6gfCjv/JOmTTux3ozknGmp
 FLEv7OfDj6zng7jLgqF0TuZrYlFpkNU8ocgc/jO69/zuVgmV8uCmZZJvvLzVZuY3iKB2
 ZXljGlMlLU1gATcvfpqK/oKRjfYE+VdxB/ApGXaSuvDMjPPp39Qumchv6mGxbQ09Vv+U
 4TheXfP4Rfgy3QDYH02816hU7cmobW49aPvg+Vzcgt7g8TY/DKI8Ye7xpQYxaKjU+/cj
 Z69m3E83NgXZ4gV2dU/9GVAfizWaIaEgfgdkMCxSaOm7y+J3FE+V3chK85HCdNW5jXtc
 PxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MtVuN5pVGv1shnQatuoGXJNKHsiCdH81ZvfGFGly3PM=;
 b=OqqGTyABG7aeXC/Tr99aRT7cjuxs1UBPGKPgdMpNzwP6fSvZk8ofiVYk3XiimNw1FX
 i0Sltp09Yvr7ZjDiYvbr+y3TSoldbw4HGPZS4/LTN2qTobpate4HRX+aE/INDJyUa17k
 3S4I5SyifGbzFij6d43GijobYI/rwM7ui0OgFjgFqH3mTmM27mfBz1aEXMvZpTmIZ++h
 XM/J1a1yajt9LFJ5afbHLivYIraa9eS91zSnNCuPefimSycItCw/ZOdJsoNv7atN4yj4
 p7iFrY/l8YamMJrNfXTajckyJ0YV543iKliPsdQK9I40ZB2Ij06GFaFJ59cHZNEY7BI1
 xErA==
X-Gm-Message-State: AOAM532v/6wC5ZI4usM8hU3RCUw8t2i9ZWVFmNWtEc8K/maWkFK4j3Iv
 IDIKWlHajd3z2dNo/Zfz7Ip7R+bAf6tMc1Rs
X-Google-Smtp-Source: ABdhPJxP4fs3gRCyXJf1E9yJBQvCY4JErDEnYIm8tQshrHPJD6pcQh+hucHCEefp9tknucrScZ5osQ==
X-Received: by 2002:a05:600c:4ed2:: with SMTP id
 g18mr18637316wmq.25.1638570698622; 
 Fri, 03 Dec 2021 14:31:38 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id l21sm3801798wrb.38.2021.12.03.14.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 14:31:38 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 23:31:24 +0100
Message-Id: <20211203223127.274985-2-nolange79@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211203223127.274985-1-nolange79@gmail.com>
References: <20211203223127.274985-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/4] package/systemd: Update description and
 kernel options
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

realign the configuration to the README.

enable CONFIG_AUTOFS_FS (kernel >= 4.18) aswell as the someday
to be removed CONFIG_AUTOFS4_FS option.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1->v2: no change
---
 package/systemd/Config.in  | 20 +++++++++++++++-----
 package/systemd/systemd.mk | 16 ++++++++++++----
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 0148cad791..6f622c73f3 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -22,7 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
 	select BR2_PACKAGE_HAS_UDEV
@@ -51,13 +51,23 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	  an elaborate transactional dependency-based service control
 	  logic.  It can work as a drop-in replacement for sysvinit.
 
-	  Systemd requires a Linux kernel >= 3.0 with the following
+	  Systemd requires a Linux kernel >= 3.13 with the following
 	  options enabled:
 
-	  - CONFIG_CGROUPS
+	  - CONFIG_DEVTMPFS
+	  - CONFIG_CGROUPS (it is OK to disable all controllers)
 	  - CONFIG_INOTIFY_USER
-	  - CONFIG_FHANDLE
-	  - CONFIG_AUTOFS4_FS
+	  - CONFIG_SIGNALFD
+	  - CONFIG_TIMERFD
+	  - CONFIG_EPOLL
+	  - CONFIG_UNIX (it requires CONFIG_NET, but every other flag in it is not necessary)
+	  - CONFIG_SYSFS
+	  - CONFIG_PROC_FS
+	  - CONFIG_FHANDLE (libudev, mount and bind mount handling)
+
+	  - CONFIG_NET_NS (needed by PrivateNetwork=, used in some systemd units)
+
+	  - CONFIG_AUTOFS_FS / CONFIG_AUTOFS4_FS
 	  - CONFIG_TMPFS_POSIX_ACL
 	  - CONFIG_TMPFS_XATTR
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 6c57a123bb..373e5c82bb 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -648,14 +648,22 @@ SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
 define SYSTEMD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_EPOLL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SIGNALFD)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TIMERFD)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_EPOLL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_UNIX)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SYSFS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE)
+
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS)
+
+	$(call KCONFIG_DISABLE_OPT,CONFIG_SYSFS_DEPRECATED)
+
+	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS_FS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_XATTR)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
