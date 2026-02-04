Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EE8E9D3FB
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5A8160D77;
	Wed,  4 Feb 2026 15:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id udCQaUFcAlpI; Wed,  4 Feb 2026 15:44:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51FE260D7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770219857;
	bh=CyUiAEPFuqPiN4x/5DczU9+vRNIgdgSS9nCsFIYejTQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=gd8qJDGBI4WDqARUrHXJwvBexEUw4dnIKyvrrQ11d/vGZt8YdhtoGmaKi22nfNKOM
	 3MU7gh4NugaxKM4ymEVnSKx9eXouC7hweFzKBs559ipbWb+Zu68AukOd42+inm2K7H
	 HoEO7F2ZhUhWwSKEIqMInKfy16cxye5Gp5+dPryzvEc9dCQfvqNJNW1/Bd8EdPk8Gc
	 z+4j6lpVh7L+ZCru1BeWdPJj6TCZt7d2UtegU0NQx2B6s6/9CxEkFntT7xXTr3cBF3
	 aH0lhFxpvR79OzgsPFVk4ck09AY7C8l/mcXV+30KFReckpsb6BD5qiSIPfP/o79p9G
	 jqsllL5CDBUnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51FE260D7E;
	Wed,  4 Feb 2026 15:44:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4E75F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB9FB60DC2
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sswAqHf-pd1R for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:44:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 62BE360D7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62BE360D7E
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62BE360D7E
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:08 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso59671065e9.1
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 07:44:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770219846; x=1770824646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0VObO5FwbLXlcylKVnX1VzKJYoxumiTnXEkZS+++Ko0=;
 b=O4VacTsoTaJR0yKiqW2zHZIeZkP63QY1SQCON04aj0yC6+5f3ibPoaetQRwvCBx4BG
 YwDxSvv7VpirI0YBPw8GhAKEKtJXGa8dv8cBXnQn0ebw+KltTMc+wLIYPligwveXN2VG
 OwXHEjqrJUYbklLjvjs6RcfHnhgcgSEzA3fy4Dgffq9C+7UB+5QHkV0ILxGgVSv03nMK
 CXBCmQA7j5YfT/ZTtB2mqoyaY8aWOYADX3KDcgXxuwgWe4f8FEDRZGIFM4VP4kUm4Ta8
 q8rndGSnjZHHOJhVCQioTOoLbtNWnNVnVwqJZVMv11dLjlfZFVbRb+CldjddzbvqV8BM
 SBSg==
X-Gm-Message-State: AOJu0YwTXuyyAANjjLB/IbyXcYYg2FRRBBvbDeT9EOUTXMuk4G/eW3/z
 fzkNxw8CXdX2EBB84Wz82c5Rt04l9/fZJ1vsU8d4SJhmkxhw6OhwB0fk+bN6ffkp0j7gU4uDF4Y
 MeDXdBtw=
X-Gm-Gg: AZuq6aIW7C29mFOg/wj2u+er2gHsAXVgzkUQeCkGfTqdSMMpakO33/cferAzoV9XnCM
 0pFFoRw+32JdIwYEfmOIIPZB5MeXqQhSb829M5VHLOBLPlWINpeB3kHlOpoSv3jzMLkRqFtn/YD
 ovI0zpz4zexCZoGhXy/zRrFfMbrvGp4QGuTLAHH2xdBbtVG+kXpe9207GwvAHdPjKrDv53GUOhM
 TAdYGsWm2IviXQO19srdx07PAyvnmDoKBdtTLUv4v7HEqgfLT0uGpAdkN+RKWG3FtdStYHyTfTI
 u8JNQ1RNWT0d8Oh1LTG/SAmQ0fgsXiWczBbefyarcqL3vprQYvJDT+GpKZFTor3aziZ/qA53Rkc
 uByOmDqcajS/seEgh+B50UhmRhbTcx1XZJ0HULLgx9TACQ2XocBpy8D/GP0rxDlEwm20MVlXUi7
 T9vXpDS28yNaBJ0OTXASgTEmei1GZpmpljZkrm7ibqmyAk8u+wZgV6JYBbli8=
X-Received: by 2002:a05:600c:8b21:b0:47e:e807:a05a with SMTP id
 5b1f17b1804b1-4830e99c6f0mr42117515e9.33.1770219846269; 
 Wed, 04 Feb 2026 07:44:06 -0800 (PST)
Received: from dragon (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483108d79d5sm55222545e9.3.2026.02.04.07.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 07:44:06 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 16:43:32 +0100
Message-ID: <20260204154340.766528-6-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260204154340.766528-1-titouan.christophe@mind.be>
References: <20260204154340.766528-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770219846; x=1770824646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0VObO5FwbLXlcylKVnX1VzKJYoxumiTnXEkZS+++Ko0=;
 b=ckPHaWnjsgijI7Ow3oenjdjZtPA+BOZVtMC21VF4t6ZlgC+F/fBLokbo/D0ECHjAv3
 DX/ajtnJvv5srXLKy++KFGWXPdQnTXtGJcreT0ghvTRjtKloRyYr5YGc/0VzBCa+iHka
 XivLEyWZDxpwukCg/ERZ5Eyftl5P388ijcXAvDSkMdAwWldwsJ9v74kGT2ngfT9zdcQQ
 cc1a1CzGYlIaNOL+/EAZ5haVvZTJmXMKUdaIsv7ScwAtx78LYQzlaVku628Tio2l4gjm
 vflN4aON7196VYYan8imw3XQWgT5dW33pOjgGwuejp+4ppnHRPJdhQnSAAOLy8J2cZyd
 qGTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ckPHaWnj
Subject: [Buildroot] [PATCH v3 5/7] package/openssl: move
 libopenssl/libressl/.br2-external.in.openssl source statements outside of
 the choice
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Petr Vorel <petr.vorel@gmail.com>, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Peter Seiderer <ps.report@gmx.net>

Fixes the following error/warnings with kconfig from linux-6.9-rc5:

  package/libopenssl/Config.in:5:warning: choice value must have a prompt
  package/libopenssl/Config.in:7:warning: defaults for choice values not supported
  package/libopenssl/Config.in:15:warning: choice value must have a prompt
  package/libopenssl/Config.in:18:warning: defaults for choice values not supported
  package/libopenssl/Config.in:19:warning: defaults for choice values not supported
  package/libopenssl/Config.in:20:warning: defaults for choice values not supported
  package/libopenssl/Config.in:21:warning: defaults for choice values not supported
  package/libopenssl/Config.in:22:warning: defaults for choice values not supported
  package/libopenssl/Config.in:23:warning: defaults for choice values not supported
  package/libopenssl/Config.in:24:warning: defaults for choice values not supported
  package/libopenssl/Config.in:25:warning: defaults for choice values not supported
  package/libopenssl/Config.in:26:warning: defaults for choice values not supported
  package/libopenssl/Config.in:27:warning: defaults for choice values not supported
  package/libopenssl/Config.in:28:warning: defaults for choice values not supported
  package/libopenssl/Config.in:32:warning: defaults for choice values not supported
  package/libopenssl/Config.in:33:warning: defaults for choice values not supported
  package/libopenssl/Config.in:34:warning: defaults for choice values not supported
  package/libopenssl/Config.in:50:warning: defaults for choice values not supported
  package/libopenssl/Config.in:54:warning: defaults for choice values not supported
  package/libopenssl/Config.in:58:warning: defaults for choice values not supported
  package/libopenssl/Config.in:62:warning: defaults for choice values not supported
  package/libopenssl/Config.in:66:warning: defaults for choice values not supported
  package/libopenssl/Config.in:70:warning: defaults for choice values not supported
  package/libopenssl/Config.in:75:warning: defaults for choice values not supported
  package/libopenssl/Config.in:79:warning: defaults for choice values not supported
  package/libopenssl/Config.in:83:warning: defaults for choice values not supported
  package/libopenssl/Config.in:87:warning: defaults for choice values not supported
  package/libopenssl/Config.in:91:warning: defaults for choice values not supported
  package/libopenssl/Config.in:95:warning: defaults for choice values not supported
  package/libopenssl/Config.in:99:warning: defaults for choice values not supported
  package/libopenssl/Config.in:103:warning: defaults for choice values not supported
  package/libopenssl/Config.in:107:warning: defaults for choice values not supported
  package/libopenssl/Config.in:111:warning: defaults for choice values not supported
  package/libopenssl/Config.in:115:warning: defaults for choice values not supported
  package/libopenssl/Config.in:119:warning: defaults for choice values not supported
  package/libopenssl/Config.in:123:warning: defaults for choice values not supported
  package/libopenssl/Config.in:130:warning: defaults for choice values not supported
  package/libopenssl/Config.in:134:warning: defaults for choice values not supported
  package/openssl/Config.in:12:error: recursive dependency detected!
  package/openssl/Config.in:12:	choice <choice> contains symbol BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC
  package/libopenssl/Config.in:5:	symbol BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC is part of choice BR2_PACKAGE_LIBOPENSSL
  package/openssl/Config.in:17:	symbol BR2_PACKAGE_LIBOPENSSL is part of choice <choice>
  For a resolution refer to Documentation/kbuild/kconfig-language.rst
  subsection "Kconfig recursive dependency limitations"

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libopenssl/Config.in |  4 ----
 package/libressl/Config.in   |  4 ----
 package/openssl/Config.in    | 19 ++++++++++++++-----
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 03d3def802..a76def1470 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -1,5 +1,3 @@
-if BR2_PACKAGE_LIBOPENSSL
-
 # 4xx PowerPC cores seem to have trouble with openssl's ASM
 # optimizations
 config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC
@@ -228,5 +226,3 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL_TRACE
 	help
 	  Build with SSL Trace support. Disabling this option may
 	  provide a small reduction in libssl binary size.
-
-endif # BR2_PACKAGE_LIBOPENSSL
diff --git a/package/libressl/Config.in b/package/libressl/Config.in
index 600829cb9e..2146481faa 100644
--- a/package/libressl/Config.in
+++ b/package/libressl/Config.in
@@ -1,9 +1,5 @@
-if BR2_PACKAGE_LIBRESSL
-
 config BR2_PACKAGE_LIBRESSL_BIN
 	bool "openssl binary"
 	help
 	  Install the openssl binary to the target file system. This is
 	  a command line tool for doing various cryptographic stuff.
-
-endif
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index ca9d1a7e50..335e00d04a 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -39,8 +39,6 @@ config BR2_PACKAGE_LIBOPENSSL
 
 	  Note: Some helper scripts need perl.
 
-source "package/libopenssl/Config.in"
-
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
 	depends on BR2_PACKAGE_LIBRESSL_ARCH_SUPPORTS
@@ -56,12 +54,23 @@ config BR2_PACKAGE_LIBRESSL
 
 	  http://www.libressl.org/
 
+config BR2_PACKAGE_OPENSSL_EXTERNAL
+        bool "from an external tree"
+        depends on "$(BR2_EXTERNAL)" != ""
+
+endchoice
+
+if BR2_PACKAGE_LIBOPENSSL
+source "package/libopenssl/Config.in"
+endif
+
+if BR2_PACKAGE_LIBRESSL
 source "package/libressl/Config.in"
+endif
 
-# openssl from br2-external trees, if any
+if BR2_PACKAGE_OPENSSL_EXTERNAL
 source "$(BASE_DIR)/.br2-external.in.openssl"
-
-endchoice
+endif
 
 config BR2_PACKAGE_HAS_OPENSSL
 	bool
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
