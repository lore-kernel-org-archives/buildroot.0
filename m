Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD52606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 16:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PXy39F7j;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WnADWGbl
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C696A81149;
	Sat,  7 Nov 2026 16:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_uPosK9WpP1; Sat,  7 Nov 2026 16:34:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C57408116F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794069270;
	b=OYTfBir9G3boww4IQwQeDfMGuFUJhX5fBdeAbzAwRjtIfyD06OCXYymHlWLpE/N9uCG0
	 6X7T28Pz154vTeemkX32EajqLOaacYwb07VrrXimtXbFLpfIkQ8M/AFLQcdJkirmcPNCb
	 im8Mh0KBx4vEYSJRQOAUO7wTEtkOYdsEqS35bA5gXERHewvl3yINbiKNJrgfjcVbU6ACD
	 almuVZLPGMhbbzXPmBtA0QhGwCBWfYeoTVmkEiMCB2QR+e+DS0sNE3JhLpylB5kGHRzGc
	 0RfgztCjb9hSnkCh9B+6N4pF0/S/+TABrmEqS8ovzb74fBHWG3YzC/tNkzVa1QFjFDg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794069270;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=N0zWXnCeEGQwlGy4PG1xBRKwc+yEIR+ygfxaDDHMWzw=;
	b=POPAxFDwHQ/NgAlajIaa1FdExg4VS9RPH737nSl3S0BFUeKk9/ipqOkH3eSfYfPGYEwz
	 +TUNvtV5SKBFYI5+kTdDawGzmbH3Yyf6qdKJuatEX6uhqIwlGdHHYWRCP5EXvpBDO5rOU
	 cXS4LMZVKmS6TsA/8kcOLBC05/DUC7ND7Z0zMfblDkq/Q+QNjtvqEnYJVuglMOzWKKFzc
	 GsgIUGSwlqFLZaX3N4uWq4CJHxwvqzSZgfK1mGdrptjUPw2DuZWL1qhKqVg/K2EK1GvCe
	 APxVLc1ClsXFuovgnwPaHr0Ku6NdMv1+FFzHaFuXw7iEIfD9e/Qbgtugd36qki7/6lA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794069270;
	bh=N0zWXnCeEGQwlGy4PG1xBRKwc+yEIR+ygfxaDDHMWzw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PXy39F7jZUMwELPqfG8l722eoxDVUcwVw01V3sLUMMtIWpkboCi/La4cXJCiAI7L+
	 7/BulQNW01AbrQpgrk/N7j0p801rButgGL8mpy8HXesszWIDnB+2Du36hO6eJSCUft
	 j9tIbskU+dNClTksJ/NN1ilaFg5d56vSs0e86ltWNY2FNrmsOfo1G/j/APFvfnyhh7
	 dRcSorJBP5yxpFDQV2kK2dTTHhoXMUDanttAh815P4ESjAvbkUbu4m9qNdJEZ+jlJ1
	 v8dd9iCuQ1Ef8yb8AV6ARaK08AXTGTDWzXHWinGDdP2cXTFhhXab9Iu6kkYDyM09z2
	 TaR/cWTvvSgtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C57408116F;
	Sat,  7 Nov 2026 16:34:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FE7F317
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25548605EA
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDyuCfnhkzJL for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 16:34:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0A471605E0
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=WnADWGbl
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A471605E0
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:26 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso17551025e9.1
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 08:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794069265; x=1794674065; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wHmDMjU0z57VQ+7L+4boB+BPxjMIlbH+XJsFCmbdGzU=;
 b=WnADWGbl9FLOT3cL0wCxeyyCjwbW9/V+dKXVRAeqot5QR47/8uyA0VBvTKUOXnBFBm
 3rsQdStypj3QnqvjvMaDz0AAmFr/ccrkuu92zyQGlwd1i8RsmBfUuh21pSCWbz8m9aMZ
 POirHzzpCPythH4ASOzle1QJ+jAH80WJgJpAXNHHkjPRq2liR0WSm/dJA5XHgsq6zyAC
 l/NiqXIkgVmtYm05F9WCKQ0MmSgBjrLvaz0KTLj+RsBPN2mP9yEZV0rewB1Wt946TdHq
 iB3xwezLgmcPALG86tfSVA2MXAkiPG+SXWS8j5LvwaoNQiDTdTu5S+n0qdEPdVAgAREv
 Hhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794069265; x=1794674065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wHmDMjU0z57VQ+7L+4boB+BPxjMIlbH+XJsFCmbdGzU=;
 b=0tuj31DDE5jmpuvZHqV2ZTrGMkPV1nVXiLbG1Cp1AAy7xdjqvFcWGAt4yD08IQqYSk
 9sOxn7qePgcvpVoYRDKqVw2dunxh7JUvWfcsaV0CFUhZeuDiMBT7RU7/kXuhog+hinjk
 6Zve+iiXwHqd83kL6x52uj9PfOD/5QWruexSCoC3MQlLpBQVnFbcU+oFSCQHQ0hgAiui
 LDOCVfsrMWE2G+Q6t+BJgjS51Q7oqN2JEo/gTgIDRIgrDT61J9zhyC62vx1hdxpJwkL7
 +OpgNgC6pFLqn3hbPHf9T4cOHX1WM+hiZCf9XjKYkDkXfAYVmsPgRGWMpRVuuVS99dzX
 xSCQ==
X-Gm-Message-State: APuU4Z9Zl0MRXGVv29cIk7HhfDgx9zoXHOgGcjgngLTrnaePZcxNGW8Y
 0pfeAaSWSfBm+2t2VcCB4zgW2cAzdip7ZyGUUne+q4nmDBAW5ucpFWT3LsAY2KoC
X-Gm-Gg: AYBFou3sCHFi2fqJ1/2F90N0FDulb5nBUYnABRHfcPJ20FuXwxzeTeZCNTR9ezDQb3q
 xN4nQYwzkzJlBdqduRf3EGWXtd3uXL/qr+dcshGjpDW3796CXoUySvdWwVvUdF10JkyfgKa5NgA
 GhJEVmKXxEWCDdXKiebRRi+V9OumMZ1JlWz3qoBg9sedufF1KxJG2OHBzHYeaBDD/q0srB5ldC6
 B5t8kq+uKTc7YesgCNq1vWHA1LnrhXsLXCIJiwfrvP7f7niNx+PWLC7yWuYoxDiV0rzYrDVfxCJ
 ju/T1po+XegaC9Nf47oQ/ivuHoquI3lLktwBrccXhy8OlAbb+cROsaDLH8xmIjrQriBnkORntjH
 8AqTpsdnPqA65ehmib3N51h8Cr7FnXy/glgmS3q5W7UT+r2d6EW3FjUX6HfurVpViPOQCZSWd0z
 2CIXy9hC7EIqURQk6hlCytwbbNxGUDT+t8VPWGp73O/WugT5a9yfb6HjFEkKEIKla8A/hwr4YV7
 GhEtb9imnYtSwVzlbqczkUVAim8/c6ASF2w/3JT34wJyyfjLZGAOwGo8/yw4rAX9TzRPbYt4ZYx
 RxMsBXbTxH2sqfXIhtWkIqqHhUTsnSMkY1A5k4kI1e3kQYHZlcFm40krw0jzS47N4BXDfYPG7g=
 =
X-Received: by 2002:a05:600c:8718:b0:4a1:ddaa:571e with SMTP id
 5b1f17b1804b1-4b6ddcf599fmr110146175e9.15.1794069264545; 
 Sat, 07 Nov 2026 08:34:24 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm82268255e9.7.2026.11.07.08.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 08:34:24 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 17:34:02 +0100
Message-ID: <20261107163414.560896-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107163414.560896-1-angelo.compagnucci@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 03/15] utils/check-package: remove hard-coded
 list from lib_config:Indent
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Romain Naour <romain.naour@gmail.com>, Antoine Tenart <atenart@kernel.org>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Knight <james.d.knight@live.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: James Knight <james.d.knight@live.com>

Apply a special comment enabling the flag
Indent_ignore-menu-indent-below to all configuration files intree that
allow indentation, allowing these special files to removed from an
internal list hard-coded inside `checkpackagelib/lib_config.py`.

A great side effect of this new type of special comment is that it can
also be used in source files from br2-external trees.

Signed-off-by: James Knight <james.d.knight@live.com>
[Ricardo: update commit message after rebase]
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v3 -> v4:
  - none (rebased on current master).

 package/Config.in                   | 2 ++
 package/Config.in.host              | 2 ++
 package/kodi/Config.in              | 2 ++
 package/x11r7/Config.in             | 2 ++
 utils/checkpackagelib/lib_config.py | 8 +++-----
 5 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a24c73c2ca..5a536b879d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1,3 +1,5 @@
+# check-package Indent_ignore-menu-indent-below
+
 menu "Target packages"
 
 	source "package/busybox/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 595caf9e7f..0f086f3b47 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,3 +1,5 @@
+# check-package Indent_ignore-menu-indent-below
+
 menu "Host utilities"
 
 	source "package/abootimg/Config.in.host"
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 110aa91a49..ac44552439 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,3 +1,5 @@
+# check-package Indent_ignore-menu-indent-below
+
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	default y
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index efa25988c9..bb54b11da4 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -1,3 +1,5 @@
+# check-package Indent_ignore-menu-indent-below
+
 menuconfig BR2_PACKAGE_XORG7
 	bool "X.org X Window System"
 	depends on BR2_USE_WCHAR
diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 202baa7f1b..2c1c378c52 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -194,6 +194,7 @@ class HelpText(_CheckFunction):
 
 
 class Indent(_CheckFunction):
+    flags = ["ignore-menu-indent-below"]
     ENDS_WITH_BACKSLASH = re.compile(r"^[^#].*\\$")
     entries_that_should_be_indented = [
         "bool", "default", "depends", "help", "prompt", "select", "string"]
@@ -231,11 +232,8 @@ class Indent(_CheckFunction):
                         text]
         elif entry in entries_that_should_not_be_indented:
             if not text.startswith(entry):
-                # four Config.in files have a special but legitimate indentation rule
-                if self.filename in ["package/Config.in",
-                                     "package/Config.in.host",
-                                     "package/kodi/Config.in",
-                                     "package/x11r7/Config.in"]:
+                # some Config.in files have a special but legitimate indentation rule
+                if self.enabled_flags["ignore-menu-indent-below"]:
                     return
                 return ["{}:{}: should not be indented"
                         .format(self.filename, lineno),
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
