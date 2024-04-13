Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94991C4345F
	for <buildroot@archiver.kernel.org>; Sat, 13 Apr 2024 07:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CAA2821D7;
	Sat, 13 Apr 2024 07:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n1lXdO08Tk4m; Sat, 13 Apr 2024 07:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28929821DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28929821DF;
	Sat, 13 Apr 2024 07:55:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B161E1BF348
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 07:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A17060899
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 07:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bG5IpG5447zH for <buildroot@lists.busybox.net>;
 Sat, 13 Apr 2024 07:55:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.133;
 helo=smtpdh18-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BDDF76087D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDDF76087D
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDDF76087D
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 07:55:07 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vYE3rP1sEwcFevYE3rlpP7; Sat, 13 Apr 2024 09:55:04 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 13 Apr 2024 09:49:23 +0200
Message-Id: <20240413074923.1082313-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLd2777ad4YvxTFb9V2zdnARn9f6+bOoelu0ywBkM0iyS11UuTPHlhvWNgc8isN3GIqAq179M4cUWAfrKocfacRLbrRfjgqdTUYhilDPZuhPdiFOb9Zs
 TlNsrfZcraXfhcj0oHdy7tSMSg07lRWAYShomB/6O3N9WkUefH/TnzvHKRe1N27IO56j8XzxChLwqTxzEapaxwWqvYP7AFAXY5998mXvSt/unrOm3LXXf31k
 0fOtAmETcI2LmQF1C9Sd04mSnmwvfHhH1ke7a4ZjRCvxri4gZgjWOr5b01bL2NttytiuZySvM5gSqm+kV6JOxPvYh6vZCHzjEBgpF/+Ps2lt9TO+pNZn7oih
 2pcftBCnuAMjew5ptrXbRcr1g31i5UTvKp3UyEpT6Ey5dc1DoPlYViuvMCStTuiMuiU6Yexmr65JXP90YUvEmc00WNB+YA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1712994904; bh=ksnz779WMR2GvoxRKadu7l8/g2B5+vj+1b3LvN3xFYA=;
 h=From:To:Subject:Date:MIME-Version;
 b=jWxlvuZawWrC2+2jE0b755C4OeYOA24+nofAUaeqqKl0Qh2cHi+VwUMdqX7xoGdFw
 1G7w0GzSwC/5xzImCS1Ko2vvmSGcr6PR+LAqOQLHRwtVCgwTWAwUq7vqi997NM2p3e
 nbA0lCIetxJl7iDBLhiF8fFknlazlwi5KITgUCNx89ZRuqRuvdr3m8UVt2uz7RE95g
 svcf2FXtG2E015xaXlMSzctGKA9eNQXvFVrnhLRzQnC4OcPVTTZsuPjoZW2Wl7+8Ep
 t7J/NB2A3CUCeQ2YweUPEo4IUYJqIiobVpFyQ427uhumfWXDxk9hL6TBBFu3hPpWn+
 2TeLBA6HK2TTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=jWxlvuZa
Subject: [Buildroot] [PATCH] toolchain: remove gcc bug 90620
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While building packages affected by gcc bug 90620 with Microblaze
and gcc versions 11, 12, 13 built with Buildroot and external Bootlin
toolchains without -O0 work-around it turns out that the bug has been
fixed. So let's remove gcc bug 90620.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/haproxy/haproxy.mk                   | 8 +-------
 package/qt5/qt5base/qt5base.mk               | 5 -----
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk | 4 ----
 toolchain/Config.in                          | 9 ---------
 4 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 61a9ebebe4..697dbdf4bf 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -74,15 +74,9 @@ endif
 
 HAPROXY_MAKE_OPTS += ADDLIB="$(HAPROXY_LIBS)"
 
-HAPROXY_CFLAGS = $(TARGET_CFLAGS)
-
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_90620),y)
-HAPROXY_CFLAGS += -O0
-endif
-
 define HAPROXY_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		$(HAPROXY_MAKE_OPTS) DEFINE="$(HAPROXY_CFLAGS)" -C $(@D)
+		$(HAPROXY_MAKE_OPTS) DEFINE="$(TARGET_CFLAGS)" -C $(@D)
 endef
 
 define HAPROXY_INSTALL_TARGET_CMDS
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e173639cca..d6445be9b2 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -50,11 +50,6 @@ QT5BASE_CONFIGURE_OPTS += -no-optimize-debug
 QT5BASE_CFLAGS = $(TARGET_CFLAGS)
 QT5BASE_CXXFLAGS = $(TARGET_CXXFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_90620),y)
-QT5BASE_CFLAGS += -O0
-QT5BASE_CXXFLAGS += -O0
-endif
-
 ifeq ($(BR2_X86_CPU_HAS_SSE2),)
 QT5BASE_CONFIGURE_OPTS += -no-sse2
 else ifeq ($(BR2_X86_CPU_HAS_SSE3),)
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 2126d3c915..f99baa1be7 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -20,8 +20,4 @@ ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5XMLPATTERNS_LICENSE += , BSD-3-Clause (examples)
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_90620),y)
-QT5XMLPATTERNS_CONF_OPTS += "QMAKE_CXXFLAGS+=-O0"
-endif
-
 $(eval $(qmake-package))
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 944e573f82..de5ef7a08f 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -170,15 +170,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_85862
 	default y if BR2_microblaze
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620
-# ICE: in do_output_reload, at reload1.c:7978 on microblaze.
-# This bug no longer exists in gcc 10.x but reappeared in gcc 11.x
-config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
-	bool
-	default y if BR2_microblaze
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
-		|| BR2_TOOLCHAIN_GCC_AT_LEAST_11
-
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847
 # ICE: compiler error: Segmentation fault on Nios II. This bug
 # no longer exists in gcc 9.x.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
