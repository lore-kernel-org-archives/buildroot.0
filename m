Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517E2C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 17:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D14CD81435;
	Mon,  7 Feb 2022 17:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AxKSzfno69Qd; Mon,  7 Feb 2022 17:34:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED8328142D;
	Mon,  7 Feb 2022 17:34:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1ECB1BF29C
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE67E60B96
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKKbspO6sLqo for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 17:34:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BABA560B20
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 17:34:29 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id m5so8889257wrb.2
 for <buildroot@buildroot.org>; Mon, 07 Feb 2022 09:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JqO+F/RnSZk07KfGCRpTRqvex6AilGqX2FNgDLb6iC4=;
 b=qSJCk02q7KrOiBZiRYRCyPbem2J6Gne/5rWU+cBGwYfo34XYTw/0yoTrLr5sIo4vCr
 JMd4Yj4/PoMrw/qTg3rVA248zMhC68rTt70gFNicNDhZnERI6vGGv4+T2pnQsZakECcZ
 IxtMQS01c4AFg9QQliMJPrCQBrPkd2cMM2qf3p9Xjo1xVW9myTGnj45awKTKKFMJql1i
 ZAEUAKJnj+2JxtqTXFx10JFWMoDkIYszuRwFxzvSKWlcq69sFNQgs5XtlBm4+meyv3tb
 +slCORapBtUuWRhqSHbkQfaybBXEKiVzuj/GcqKLAonohvKyX7Ad2HUzgOMjj+YIT1I9
 RZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JqO+F/RnSZk07KfGCRpTRqvex6AilGqX2FNgDLb6iC4=;
 b=SHkf1twbzvMhH+G5vqBopyosdXdoRH2or7WlLpxjZvhg8Myj3cXG7QfZfEieN3juE+
 /algfWVfCvucsZiV9rpLEllsZm3ubW31AhUvqRyC18DUnROBNEsLxuGVt8XzxV4tdjBZ
 yYvCkbH/HIp0e2GgGFZZCJPv25lxuVCsG3RQMy6Gs18bMlm1wON9/yoSt1o4pWmTu9Gx
 ZqcKE2gE8kDeUlXyeRBKF54S9dzuxUwkLtWLRT32qWxJ63IaFC9gsBZmEhJeCFvGoSWM
 Yc0u8Na9ecLZYGqlC1M3ukRivvM9k3GWy1Kv76PgbSiaAPhMjBm3+yH5GLSsE6g9Hdhu
 yzmQ==
X-Gm-Message-State: AOAM530qGjL/7oUBl/k0SS1RqsY1FT6pZ9pXoHclGVZP99Jbnx1rCN1v
 JCB8IrjXQ1KOkJ0O63wR/yqpiPg7w/s=
X-Google-Smtp-Source: ABdhPJwJ3jeFRhBh4i8UG3MnHt9uqIF7TGWkT701y6UdlR0fSopxdmk61KisDAQH/ux5Th2TcJUdyw==
X-Received: by 2002:a5d:6143:: with SMTP id y3mr418023wrt.556.1644255267864;
 Mon, 07 Feb 2022 09:34:27 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id u15sm10559675wrn.48.2022.02.07.09.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 09:34:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  7 Feb 2022 18:32:15 +0100
Message-Id: <20220207173215.3041588-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ace: needs C++11
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ace needs C++11 since its addition in commit
3621918d1bc1ddc9312dd1cc8dec6db61e712fe2 to avoid the following build
failure:

In file included from /home/peko/autobuild/instance-1/output-1/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/chrono:35:0,
                 from /home/peko/autobuild/instance-1/output-1/build/ace-7.0.1/ace/Time_Value.h:23,
                 from /home/peko/autobuild/instance-1/output-1/build/ace-7.0.1/ace/OS_NS_unistd.h:25,
                 from /home/peko/autobuild/instance-1/output-1/build/ace-7.0.1/ace/ACE.inl:2,
                 from /home/peko/autobuild/instance-1/output-1/build/ace-7.0.1/ace/ACE.h:886,
                 from /home/peko/autobuild/instance-1/output-1/build/ace-7.0.1/ace/ACE.cpp:1:
/home/peko/autobuild/instance-1/output-1/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support is currently experimental, and must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
 #error This file requires compiler and library support for the \
  ^

Fixes:
 - http://autobuild.buildroot.org/results/13376405e313da112f546076a10859e60631d5d5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ace/Config.in | 8 ++++++--
 package/ace/ace.mk    | 9 +++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/ace/Config.in b/package/ace/Config.in
index 226e34df32..5000f2352f 100644
--- a/package/ace/Config.in
+++ b/package/ace/Config.in
@@ -2,11 +2,15 @@ config BR2_PACKAGE_ACE
 	bool "ace"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	help
 	  The ADAPTIVE Communication Environment (ACE(TM))
 	  An OO Network Programming Toolkit in C++.
 
 	  http://www.dre.vanderbilt.edu/~schmidt/ACE.html
 
-comment "ACE needs a glibc toolchain, dynamic library"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS
+comment "ACE needs a glibc toolchain, dynamic library, C++, gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/ace/ace.mk b/package/ace/ace.mk
index b6b4cfbc24..8df89d8c6f 100644
--- a/package/ace/ace.mk
+++ b/package/ace/ace.mk
@@ -17,6 +17,10 @@ ACE_CPE_ID_PRODUCT = adaptive_communication_environment
 # Only compiling ACE libraries (no TAO)
 ACE_LIBARIES = ace ACEXML Kokyu netsvcs protocols/ace
 
+ACE_MAKE_OPTS = \
+	ACE_ROOT="$(@D)" \
+	DEFFLAGS="$(TARGET_CPPFLAGS) -std=c++11"
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ACE_LIBARIES += ace/SSL
 ACE_DEPENDENCIES += openssl
@@ -39,14 +43,15 @@ endef
 
 define ACE_BUILD_CMDS
 	$(foreach lib,$(ACE_LIBARIES), \
-		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(lib) ACE_ROOT="$(@D)" all
+		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(lib) \
+			$(ACE_MAKE_OPTS) all
 	)
 endef
 
 define  ACE_LIBARIES_INSTALL
 	mkdir -p $(1)/usr/share/ace
 	$(foreach lib,$(ACE_LIBARIES), \
-		$(MAKE) -C $(@D)/$(lib) ACE_ROOT="$(@D)" DESTDIR=$(1) install
+		$(MAKE) -C $(@D)/$(lib) $(ACE_MAKE_OPTS) DESTDIR=$(1) install
 	)
 endef
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
