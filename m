Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79072CD1288
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 20:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EE7241E2E;
	Thu,  4 Apr 2024 20:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLlSQM1xvwOz; Thu,  4 Apr 2024 20:43:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C558341E56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C558341E56;
	Thu,  4 Apr 2024 20:43:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B001B1BF3C0
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 20:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D33A41CD2
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 20:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h59YPZWcDrkf for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 20:43:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F25040195
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F25040195
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F25040195
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 20:43:12 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d68651e253so18491221fa.0
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 13:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712263389; x=1712868189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kOf+zFVcA3yXbNR2Xuc4jjh8FzSMl3wOyK1fBO222FY=;
 b=CxJ2IDnXeh9/7Nasl8ep4mmrK6Hj9MpwvO5iEVOqQphAl3kro6J3gmzs0I64dqK3a5
 2LnghgUYHvewMJO0C5e/w3Qot4MRcdx0Xsag9yRXffHqArHDZxl00nRiJqwySieMHuE1
 BiXI/cXAF/Ah27rZe5rVyQtVB/Qo1GHSkYF1PlsNI2tCo3+hYM2ALkPsE2q7JzI4OGqv
 9KdLCFvi4Q63xRBShJo0n6wPPsPNgpeLlLqsDXsxjdfk+6mt+ZQ5y38jmvIK4d+xYbrD
 ZZcuTVht+EVXJsjGB/1mZFIjMGDEl5+FjcILrjqYcsE+eJRjqdx2Ou+oIUyNA7LhxhsP
 MsQQ==
X-Gm-Message-State: AOJu0YwpmAivKnw2cHVGrlOnkkqsOrbY8OBCFna5ywwzHN00tCv7UHvG
 1EvuyuRvMH4cn7LbsrjTOgUJ234hDKT4WENWT2B2swmQxGOlpd8/c/n3jpJz
X-Google-Smtp-Source: AGHT+IEf50xjyeGVMCpTR16q4PL9K9xf5knwJWoxKEScdplZCWCLoQh3F4eXKy1cAelhugPsmG/FAg==
X-Received: by 2002:a2e:8559:0:b0:2d7:8152:1ee5 with SMTP id
 u25-20020a2e8559000000b002d781521ee5mr2635186ljj.31.1712263389054; 
 Thu, 04 Apr 2024 13:43:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c354600b0041488691eb1sm3863241wmq.17.2024.04.04.13.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 13:43:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 22:42:41 +0200
Message-ID: <20240404204241.1784136-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712263389; x=1712868189; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kOf+zFVcA3yXbNR2Xuc4jjh8FzSMl3wOyK1fBO222FY=;
 b=bvFVZpTl350MRIF/8NtBFbzJvVKb2fdjRqsIA7SnlI48qDqd0np7RoLfAdS1mg17Fl
 8JqiM5/uvu1F8/YaLbrxjlsPXOzxGh/8MWsJ1hvgPApWwCUPxNE7GtI45SwlEZbbhiMS
 RUGj38PMVl1QAJhVXYX3b+sg5nQ11DP3i7dBsVOZlg0o2J8b+bEt//Tn7GOR98ceWO4e
 FwJJHX0PxmfMbp87iHXX0QkeeI/HTfZC5hC/IQLomkzZVGjHToXQOLqTaIg7ErBxS/i1
 jbjVHiDHIBuPpVr9vzwbQ8QHK3iU23Vgf6sg+r2RvB6BEn6BQfGyr2/1v/kPuL2polNv
 q5Dw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bvFVZpTl
Subject: [Buildroot] [PATCH 1/1] package/dante: add libxcrypt optional
 dependency
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

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-5/output-1/per-package/dante/host/bin/../lib/gcc/sparc64-buildroot-linux-gnu/12.3.0/../../../../sparc64-buildroot-linux-gnu/bin/ld: auth_password.o: in function `passwordcheck':
/home/autobuild/autobuild/instance-5/output-1/build/dante-1.4.3/sockd/auth_password.c:126:(.text+0xc4): undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/c817caa1e9ad91a1c0f61d92f24d35612cc3a5d5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dante/Config.in | 1 +
 package/dante/dante.mk  | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/dante/Config.in b/package/dante/Config.in
index 41a89990d2..bd0ddb236d 100644
--- a/package/dante/Config.in
+++ b/package/dante/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DANTE
 	bool "dante"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Dante is a product developed by Inferno Nettverk A/S. It
 	  consists of a SOCKS server and a SOCKS client, implementing
diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index ae60252bed..bae46c5a71 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -22,6 +22,10 @@ else
 DANTE_CONF_OPTS += --without-upnp
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+DANTE_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 DANTE_DEPENDENCIES += linux-pam
 DANTE_CONF_OPTS += --with-pam
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
