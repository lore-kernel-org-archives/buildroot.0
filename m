Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5199FC54798
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 12:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBCBE41675;
	Tue,  5 Mar 2024 12:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hRa6VhSJbuoP; Tue,  5 Mar 2024 12:53:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85F554167B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85F554167B;
	Tue,  5 Mar 2024 12:53:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 826961BF955
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 12:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DFC840470
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 12:53:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2YvlXaaCDy8B for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 12:53:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0EF1A400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EF1A400EA
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EF1A400EA
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 12:53:04 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33d118a181fso3606799f8f.1
 for <buildroot@buildroot.org>; Tue, 05 Mar 2024 04:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709643181; x=1710247981;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xWjvgQSg1meMpWXIGJjOi+5a4+R6jgRuk3JwdsOmex4=;
 b=HhkVMyy0tIQLwPVYxGbl8Lh/9uGV9LKM8djNgScSdd/BN3KszrPArTXQ3LUHXzbaXe
 YU8PSWx0jZ3CsWq803NKSNVlnVq37WJjyrHxqrrmKgHM6SitZKNcGQshMXHhe38xxXx0
 PQeIY9a7msGuzN1Wcc9UtflkWJ9296hRSXc/HvYAhqK7oWi57Bd+OaYtg04Mn+kvAQE4
 dc6VdHVKBsV4D/XkK4EcniamdIUzjLrL1wCbJ0nyLTRyHGY6GG7jhraMdfQOYSKs9NFj
 XT/tsUb4y9la9mN1CwYy+Iztqrjh/pGaIL4aoAWfIrLUU7YcN8dLPNDIbx7qC0UuMiP6
 X3QA==
X-Gm-Message-State: AOJu0YyUlq4iIsBc2h+BLhJ5Fap5+8eZWN5NCskKD1iVU66BXEPJdwVz
 izbgQUNnqjWM5wJMqs4Fpcp4zPfKAnQM6xS4F/zpK0ZaTP3JwYVP5Iq4dIRL
X-Google-Smtp-Source: AGHT+IH3Bw68Yd1AOTsE6aEIynaGEm/7xTwoUpljH5IwYAlXRzLzdKyUjqg/GpdzCZmZYcCmyhFbXQ==
X-Received: by 2002:adf:ffd2:0:b0:33d:3abc:8a4a with SMTP id
 x18-20020adfffd2000000b0033d3abc8a4amr9143153wrs.62.1709643181150; 
 Tue, 05 Mar 2024 04:53:01 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p3-20020a5d4583000000b0033b47ee01f1sm14857049wrq.49.2024.03.05.04.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 04:53:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 13:52:56 +0100
Message-ID: <20240305125256.480327-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709643181; x=1710247981; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xWjvgQSg1meMpWXIGJjOi+5a4+R6jgRuk3JwdsOmex4=;
 b=P97qnjWJI4v0K3HhaEniSWPM9C1EOaZILKyoTimEySzBCL56DguzxsBy9WSX+paGFU
 yFQrm/S28bltvMWT1AxxSINudEJIAMZZ4GEfVbl66q6s6PgTxE06jhd0Ng0gaXuG7IvG
 c5+nRbBsa5cD5rAAfb13f6dY4yp1atbTEbRcpsvL2SOyFmE22QkXJT6mQF4r09ZdmUHY
 QgmhDZlsWBmw6YzkGZ7lmWbwX0Vj3EzSt3pacely1aiTLvMFnXLeF7odTk4ZloqNLuQF
 r7lTa5yNCbfTdrqKaqSSG5JaGNW0lf56ovKcEVNpKhUnpLcWHAXVGP9yPYtoer7Y31jn
 Fmog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=P97qnjWJ
Subject: [Buildroot] [PATCH 1/1] package/botan: fix build without NPTL
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

botan unconditionally uses pthread_setname_np since bump to version
3.2.0 in commit 2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813 and
https://github.com/randombit/botan/commit/313e439c786d68bcf374b2cb0edfe3ffd891db94
resulting in the following build failure:

src/lib/utils/os_utils.cpp:625:22: error: 'pthread_setname_np' was not declared in this scope
  625 |    static_cast<void>(pthread_setname_np(thread.native_handle(), name.c_str()));
      |                      ^~~~~~~~~~~~~~~~~~

So only enable threads if NPTL is available

Fixes: 2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813
 - http://autobuild.buildroot.org/results/03677de6270ff5de61fff2a76e5cd723aa34e64e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/botan/Config.in | 5 ++---
 package/botan/botan.mk  | 6 ++++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index 5c3f31726e..c74128bb9d 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -15,7 +15,6 @@ config BR2_PACKAGE_BOTAN
 	bool "botan"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
@@ -24,7 +23,7 @@ config BR2_PACKAGE_BOTAN
 
 	  http://botan.randombit.net
 
-comment "botan needs a toolchain w/ C++, threads, gcc >= 10"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
+comment "botan needs a toolchain w/ C++, gcc >= 10"
+	depends on !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 88dbfa5807..95352ea41b 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -48,6 +48,12 @@ else
 BOTAN_CONF_OPTS += --without-stack-protector
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
+BOTAN_CONF_OPTS += --with-os-feature=threads
+else
+BOTAN_CONF_OPTS += --without-os-feature=threads
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 BOTAN_CONF_OPTS += --without-os-feature=explicit_bzero,getauxval,getentropy
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
