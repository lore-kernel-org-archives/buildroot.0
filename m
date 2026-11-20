Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4877E60A2609
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o55fFUpt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J4xj1B1l
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 195D681668;
	Fri, 20 Nov 2026 10:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBSq8fYY2eOa; Fri, 20 Nov 2026 10:11:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6B52D81669
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795169463;
	b=LhlqpB62fQEKwipc1QgY5tATAeWDpa+Bk+GR78Av7ZTPY68hM1oNwKz7ndoxWnoPc0aR
	 fKWCQZQxG0jQV5Cqe4nUnOV/cptvqhWoVR9h7dZU7YieRTct4EGV7aLC3OrIYe3UCe8Fy
	 FHwWfUuZZNeIXpTO/uMzaYBroX7iwX8m9P4nSexJNGEEa4nNXFw8R41Fu5Vng0W3+fTMm
	 7HD3aoKn1n+MQoHwR1iFyZvtgO3tmCgi+vWBriVKy/vWBnrxDnE8/ZLKi1DY7r5ILQhUS
	 cLbeNzOsKpNmv7OTtZWPtJDaHXj0zzeCjm6+GONNpvuM2GPwIEbhk9tmyiUz6BzgOsg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795169463;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sxCsrUrDFdz7XvQDbziu/7JaEkUoROz236zApVyDZnA=;
	b=GUVB5608a7bAUjoaNNeCfGpXL0NjkeYwA4GKEZRBg11a4WbpNI21C6Dooq/VFJZ0xrcK
	 XQ4pkYM9RWbSTsNQY5viVrmX/oqRKXIFfXIWEKGqiBi0uavSCgS1YF2s8MNe08EVhslbw
	 tM3Io8vXs08131DRL22BQvui2Sd3Nl4MKRllBFce4X9/wI4J893HJsgGmAFFOC2Ady1Ih
	 AO/2Fb0p5PIYSthmbatqbCmet7Wqzam6rmOba6bQBnZyPrI4yWS+n8xC69GYqjQgd3Gua
	 6KyUWgsBCClesNt9fWiZfL6k7zphaxiPJ0kH2oDDCZfgnKeD2NlKqZ1PvUFZwxCl/Pw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795169463;
	bh=sxCsrUrDFdz7XvQDbziu/7JaEkUoROz236zApVyDZnA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o55fFUptnhF8krNMrRKRZK2PpwCGbd6/X+DQP9mfkQB+EmulvfbVKHPaIKHCoIBoP
	 zOP1QDST/gSO96qS0Ln8uKTM8hCDx44i0aN3YcrPPaSMjkt+kb4IpBAoavBZO+2QMe
	 hzUYwoPz9pantPzfZIO/ZYCrAv/L0nriO0riHtwAqM9c1YUBqdQPnsGGsRoC1Oo3Ts
	 rv57g49AWQ3E5NSWfCfq/VYKvpUYp9qhqDQmx3pcEOsJ6TW2jpQytP7XomQ1ogN0mb
	 xoBycs/KpMleyL5EsPxXrO8CZo7SplnBay2sYtdQAgzjHiqm5FSuTRIU2qcaF5hAxA
	 3VNCv/jD8g99A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B52D81669;
	Fri, 20 Nov 2026 10:11:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFC10169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A15E060E36
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ZvbbcxN1Jxz for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:11:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5E58D6064A
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=pieterjanca@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=J4xj1B1l
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E58D6064A
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:10:59 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4bb70074ab2so6559605e9.0
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795169458; x=1795774258; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KT3BiCIYzLJDPn/Uzo9pHfgUqGfFYDjBACdlTgyksiA=;
 b=J4xj1B1lzWGDE3Vdl4D/ElRWrl0If/7n9kcOqpb+i+xSGDByabAObwcpYbGMFINRO9
 G1OVheg5f6dJmpmSaqfnMZ33UGMN4ygMXADfJrYnS9vi7saPIMXHjfVhfBffJTVV8rrw
 ajJN2naRA1VSPpvNfZq+ONV3MoYaX3o0q4qsPx0tq7ZkXhsqn5ZeVDJXOOk8iJMQtyLm
 3DDm0El8GOOTbjYaAWUxdk+QNuWiBNpDKLNakjTzYUdEwOy8uLP9FHjzfYjj/bOTGBMN
 UCO50e1BE2ejeEmgHFggqcKMoSVHtLiZEKXMBQeZJaKE/7clLtc6SvX88kvsjSsgFK52
 wUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795169458; x=1795774258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=KT3BiCIYzLJDPn/Uzo9pHfgUqGfFYDjBACdlTgyksiA=;
 b=If8t11PnQQ1FPYcEEpk3+wnd5bB2Agmz/19rq2QIhkou8d1tP3vFBVALP4j0zRwTIM
 BXzBDpPT0fb1PJnmDB588kvAvghe1VNouocEM4i0llL2LXdymz1E4bRn5VXqC1FbGvDe
 QlGuXRQ993g8LReGhqsEQ2ipNdAoDYRHv+T5lBqeM/iEiMXmKPGlUgQJRtWrjmcJ5kM1
 pchUuNi3Wp+YSrc9KzMDARJrdOfc+R/kTL/HYBJlrf2hqt2IC6dJ59NqQjnp9FSVHQwN
 2AGj53I0f/vLEK2/IsUBvbomskhg1oA73NI/c1htxj1DE4ltoTLX/nQ/cBpM+20BsyNT
 VSzg==
X-Gm-Message-State: APuU4Z+4rvf+kR4VPF8XSZIiFHpKuHtBPI5zyCi5PH8L9vVyQOVPz9we
 gkSYhisQhtVTbzwSibch8O97WZbfT79NeARaQ7N3hSB+uUEpMm54pSb5d8+F
X-Gm-Gg: AYBFou3zwdLT+2EDeoE+K3+XkWFVzC6g3xULwxOCIV/PICxsW5P/agT2DT95C0dd32z
 P+TXatm5EiXywFAltEM3DRxvhpGH37p0x75rebPaW11LqHrs8FApvXY4L/smGh9o9ZXPlx4hYTZ
 pySzXgbrCOLTmRJ3gvPGRxFUzqsw3QEJCGuBWaJZDaOKadNtovi7q1Bc6VsZbH70NZr34TGRhwm
 6XChEJldYst/9j8iNyoBfWdaQmvJlCA2ulHRP0LgM2XW2Eo3Cy99H3wdT3pkthvvzXqr0PUERve
 6oNh/QQh2sH9EPMI4GyQNF5AX+bpzfZWMMl+t9YXZmAKmv9ZasZowHGcizTbNnOsUT4gJzYCvp8
 PT+xt4Ek5+epBK8NXl52gTGp3AgbevZUpAlPhpr+yddabuuzGbHIr1OYqkuiFzbqEcNOrbl7OK3
 c70XFjbRen0EZNVGjdiVn1SesPcPazHWf/AMiBCGWZylJKC/SCJqtSAz6htx6SvFWmvahHHC2L7
 13FetzakdruETcX5BrimhkW5N2bVoQFhzvuKEyp7JdBA/Gpv1IJySmLo5xUsqr3RnKjaSYsevaE
 4b1v65GlqSwSVetWzkm4
X-Received: by 2002:a05:600c:5395:b0:4a3:5a98:c279 with SMTP id
 5b1f17b1804b1-4bb8880e599mr53188385e9.8.1795169458051; 
 Fri, 20 Nov 2026 02:10:58 -0800 (PST)
Received: from case ([84.199.255.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884a3a3dsm64614995e9.10.2026.11.20.02.10.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:10:57 -0800 (PST)
From: Pieterjan Camerlynck <pieterjanca@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Nov 2026 11:10:38 +0100
Message-ID: <20261120101039.3397958-1-pieterjanca@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH next] package/synergy: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot packages synergy 2.0.12-beta, a beta of Synergy 2, which was
discontinued upstream [1]. Its symless/synergy-core repository is gone
from GitHub, so the package only builds from the sources.buildroot.net
backup.

The synergy codebase lives on as Deskflow [2], but switching to it is
not a simple bump: it requires Qt6, libei and libportal, the latter two
not being packaged in Buildroot. The legacy option therefore does not
select a replacement.

[1] https://symless.com/synergy/news/synergy-3-beta-launch
[2] https://github.com/symless/synergy

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Pieterjan Camerlynck <pieterjanca@gmail.com>
---
 Config.in.legacy             |  7 +++++++
 DEVELOPERS                   |  1 -
 package/Config.in            |  1 -
 package/synergy/Config.in    | 22 --------------------
 package/synergy/synergy.hash |  3 ---
 package/synergy/synergy.mk   | 39 ------------------------------------
 6 files changed, 7 insertions(+), 66 deletions(-)
 delete mode 100644 package/synergy/Config.in
 delete mode 100644 package/synergy/synergy.hash
 delete mode 100644 package/synergy/synergy.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 4c03b41df9..b2a6ba2908 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2027.02"
 
+config BR2_PACKAGE_SYNERGY
+	bool "synergy has been removed"
+	select BR2_LEGACY
+	help
+	  Synergy 2 was discontinued upstream. The codebase lives on
+	  as Deskflow.
+
 config BR2_PACKAGE_PYTHON_DBUS_NEXT
 	bool "python-dbus-next has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index e0a08ac155..54ff506400 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2850,7 +2850,6 @@ F:	package/libvips/
 N:	Pieterjan Camerlynck <pieterjanca@gmail.com>
 F:	package/libdvbpsi/
 F:	package/mraa/
-F:	package/synergy/
 
 N:	Qais Yousef <qais.yousef@arm.com>
 F:	package/bpftrace/
diff --git a/package/Config.in b/package/Config.in
index 3d7c601df2..4baf82e746 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -410,7 +410,6 @@ comment "X applications"
 	source "package/pcmanfm/Config.in"
 	source "package/qt-webkit-kiosk/Config.in"
 	source "package/rdesktop/Config.in"
-	source "package/synergy/Config.in"
 	source "package/vte/Config.in"
 	source "package/wmctrl/Config.in"
 	source "package/x11vnc/Config.in"
diff --git a/package/synergy/Config.in b/package/synergy/Config.in
deleted file mode 100644
index c1216c4ba9..0000000000
--- a/package/synergy/Config.in
+++ /dev/null
@@ -1,22 +0,0 @@
-config BR2_PACKAGE_SYNERGY
-	bool "synergy"
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXTST
-	help
-	  Synergy lets you easily share a single mouse and
-	  keyboard between multiple computers with different
-	  operating systems, each with its own display,
-	  without special hardware.
-
-	  https://github.com/symless/synergy-core/
-
-comment "synergy needs a toolchain w/ C++, wchar, gcc >= 4.9"
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_4_9)
diff --git a/package/synergy/synergy.hash b/package/synergy/synergy.hash
deleted file mode 100644
index 248fd9dce7..0000000000
--- a/package/synergy/synergy.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  06d1cb1d43251b0b624212652e9c0ab2657d124ac4f7e7d0c7f3e448c953c2a8  synergy-2.0.12-beta.tar.gz
-sha256  4921009cd76e7d38a8e873c362b25dbaf032c320bbb36a40dec775ddbdcbe1d8  LICENSE
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
deleted file mode 100644
index bc7ebea070..0000000000
--- a/package/synergy/synergy.mk
+++ /dev/null
@@ -1,39 +0,0 @@
-################################################################################
-#
-# synergy
-#
-################################################################################
-
-SYNERGY_VERSION = 2.0.12-beta
-SYNERGY_SITE = $(call github,symless,synergy-core,v$(SYNERGY_VERSION))
-SYNERGY_LICENSE = GPL-2.0
-SYNERGY_LICENSE_FILES = LICENSE
-SYNERGY_CPE_ID_VENDOR = symless
-SYNERGY_DEPENDENCIES = xlib_libX11 xlib_libXtst
-
-# Avoid using buildroot commit hash inside cmake/Version.cmake
-# by setting SYNERGY_VERSION_STAGE != snapshot
-SYNERGY_CONF_ENV += SYNERGY_VERSION_STAGE="beta"
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT),y)
-SYNERGY_DEPENDENCIES += xlib_libXext
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
-SYNERGY_DEPENDENCIES += xlib_libXi
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
-SYNERGY_DEPENDENCIES += xlib_libXinerama
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
-SYNERGY_DEPENDENCIES += xlib_libXrandr
-endif
-
-define SYNERGY_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/bin/synergyc $(TARGET_DIR)/usr/bin/synergyc
-	$(INSTALL) -D -m 0755 $(@D)/bin/synergys $(TARGET_DIR)/usr/bin/synergys
-endef
-
-$(eval $(cmake-package))
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
