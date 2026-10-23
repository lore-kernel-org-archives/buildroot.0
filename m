Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4070C606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 09:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ubp5IlB0
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12F3E60650;
	Fri, 23 Oct 2026 09:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNnS3dEFVrzm; Fri, 23 Oct 2026 09:17:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1F98F6065A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792747065;
	b=R88rglJHaUkLkpPXfa6tIG8kjEu0pEG0/6+gHZ2sYeIq78C1TgPpF3SxbNP5WG/LLge8
	 YY4KXPN+zc2mB1cudzjdkWSyJdX8LhKg5JJR3/EfwDl9j5Ll/Js3//gyJufd/UglZ2ti7
	 7Rrgud6qpHEoIUKHPcfCgGNFi67PPunaLtY45Omv35twFmYJKwvSCsw6WZ7RYuXa1W2Mo
	 9GphkPVld38T+lyTIPVa7RurYMnQFyW9dTu5rjkSUv8xQjJoZMG9kAMPnLRQZPuhEddwT
	 iFcfKzhc34WIz0YWW1OycVEI9lAx9PsQauqkuj1nfgH3IOymq/qcqsRTDZILZOienhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792747065;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/Kq56JJ50w/7oyGz1eZTwmdR1x3NXy9YWek/3v5gKVU=;
	b=GM1T9Mea19wAAXmSE0BDru1iAUC1FJ3vAYocfm6y5bqNpXPhtPws8VE7CJusWGd+Qcpj
	 Rsd/5aR46PC4f3V5AebklrusOu9imBxJ2dpX6jZAlOxD/zLfjSiRgfhSxdWP9h39yqorK
	 tkrOPY9O4kQk8F+vYiLCwkt6Q8kFjmwbP0at3JoperPhwbXX3f536wo1avP/4UUTkujiW
	 zWxoGg+4e3+ow3sf8HW0dQnkw1ikcbrOZgcuMnix7lHDx6GBgMXiz2tYjGwiDMS78LKBa
	 unpGO4ayEKyZLOQDTLBX4KDCS2Jb1HM5s4llmcZ9SrwbRJoCsBTWoS7zq2tMa5hrz9Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792747065;
	bh=/Kq56JJ50w/7oyGz1eZTwmdR1x3NXy9YWek/3v5gKVU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Ubp5IlB0oDJalet/mQjAOUiTRj6X95x8gRnkzH5y4QZL/oCaLAG8SSyNl1kv9KcO/
	 Fuw6qmZXwqowwr1wuwYBkXJUVOi7UcRFS8vAKGqWPqkyGSdgEoqu9I7/B92QCfD4Hh
	 IbDjVYB4+MQcC4F7atZ0wj2i/3b7aQHgCX3wvGIKJcYsyb2Wd1Qh21j8woWtTjKDr8
	 9NCTpTaZqBMldrPloxBpy07sdFcqUwDH28ltR6Naolwlm/N1rJm/WN2svCjBythtp8
	 DKpaIMxmGNRjaiYcq1egJy0DEjbZkm7bbFViokvSwLpg8ZRllp74NtE2QgYLp7ej+W
	 i6aCkLGNG3odQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F98F6065A;
	Fri, 23 Oct 2026 09:17:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BCF312C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6920C400B5
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gIRP2e_19GQS for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 09:17:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3F1774008A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792747062;
 b=WP7eEtV6Paz7q7u+A2B5FFG5aa+GrSweVZohgP09YrFzFn2N/tns2iql1iYfQvzN/ru6
 WWZbxsRtyO7J/7sApK63JGrehfqBVVGvKCyyiUoc+huJ026DiEAgBcL1IcSq6zzO4/JvJ
 AAEcF0oBxMv5Ok3/q6Fvi68XSwiNBAGvMYKn1B2sniAORdNwr9d0x5dtN+rLVM7iR3EZt
 ZjLlELxUYCH3JVGDZ4prbPrwXOgtAcp5PegM7xxoxTFcrU+9hQqejbHC0OobcpPKj1X2c
 76KHnQH7rezn6nYiNJJBpS71xHu/WU7/Ru6s40/EPd/mS5joRWuH1VzYGjXp/3tDyoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792747062;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=2asMzu/gRTo5jMPXMbT3Ak4shUzRzNeHtPj1lwnyPWs=;
 b=bNP9kUF62rRFce5TBnUeHkc/jDe+Cxs3FwFSvvtl0oreWOM0x7MG33Bg5+I9dOvh57Gq
 xIYXSUzlRp62MQMRD6+2qwn1g7ekU69rAxpknrpQSpNcBwhQA3OGVkNIHrsBz5V6FgxMv
 SDKLrszwUwcSUC27OJcGfHQCFcysQXUyFy4Am38m6zI4lTLo9tpJYDR61BxcSgVhKUU7h
 SZIDQtF8IyOUvfjgXiih0XFkR0Iv3dO6ePFpKruF5HUQhR/1bHmbjP6Sdok3JB6TXxRTm
 46R0ccLvGF4sfZMG+sJPfM0zJAZ8BrmyedsZ+ET1/6WKfxmhALOfk/DYr7wF6XxJtsg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=lxjSiN4w; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::534"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F1774008A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:17:41 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6af8620a7d2so736036a12.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 02:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792747060; x=1793351860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2asMzu/gRTo5jMPXMbT3Ak4shUzRzNeHtPj1lwnyPWs=;
 b=GXvUZBmFYlSXO2fTC6JBimiSjiPUI7Q18COzcGOg1tIq69Y/EIprMPeDFw1LZfT3o6
 cFfGt+3NK1y5yCYCqba54SHHHAExFDL8xD0cQD4LtMUVESUfFHucpFtKoMPvG8LrQ7mm
 Xf5tX9CRaZ5J4ef8vjwhfr7Ii/sdnNDvjlQtdEkIyl+CeITpuIUlgGTGeCeCZ1Rk9yas
 QazgWkvQR2TPylbVFW/WiIo8OdaZ0bII8+HLXkmwCWjTvnV9H1jbJraoP3yurgZ1/YOw
 n+MPpsgA0h9oaUyDmLC2kg/bnGjxdrojprgC2cnzzIyMdAoNt2AeuosBGMP2gGjl+/Hi
 +zQw==
X-Gm-Message-State: AFq9FYKcO21FV1gtRr8zD42YYKi630sSfz6G0LbCKnC9TJpiwUvxmyzg
 /BkX7PHXClTEQqH0xBS/jXxMAuUxtzTupB4OpkJrily5PLZAiImESl9GI66HhA==
X-Gm-Gg: AYBFou0Nna3eosqgBeCnDp+HrecJxO88EHDyj4pf6TeL59rL1NVhBrK9lw7LQEhQFCR
 LKi5krAPWAhh2K72qSf4xEutZCaiX4YRu61dVogfAhKqAek8djMo+p/0mDKx0qNSPiJpTloPxL2
 L+3w0e/qehunDf9EdZ2U5E2+hfwAONq6+r3J8fAeiD5i4nLxk0efx/nCeFTkhQ8zLzHYIn3M0jH
 9U/QkcBd8LAUEjtp2ivVZ76AlSK50rmXpXh8EDJxUa9NP878OFKnstNSeIVDI0vLqbYYf7A3XO7
 lUzNtsYxfGhUJBaUGarqyzab1iFUB7RdIjeTvcZTW6L5A9jsACOXUjTOArlRTgL1WjdB70H4tbF
 9K6jPKmcWAHdNrU275Nq80B/tiUzKHBuXlkbqt9P2QE3DSK4FnIpgFqeDqqxKngpzWGFyikASe9
 9MiwdwE26dj7F5LJWiAhfO56yVjAcIe83OFEej+76GDp1pCMJeIDUoGcIQP68n4Ol3hMfeo19sQ
 rlggX6p4fQOxxMbn/uCinOjwGSG5r8PlUlOfEHQsk7yZ8ihetFnjvtOoLLw0hyoZdURoHaL9STK
 QMGxjBDKlo+NoSXHfKcSUs7M+E/T+Gvgifh5ptH8cdmklZxg8VdLjzAL
X-Received: by 2002:a05:6402:a6c3:10b0:6b1:abe7:8276 with SMTP id
 4fb4d7f45d1cf-6b432b22ae6mr1934873a12.2.1792747059597; 
 Fri, 23 Oct 2026 02:17:39 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b432ccf7dasm862598a12.29.2026.10.23.02.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 02:17:38 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 11:17:38 +0200
Message-Id: <20261023091738.1319115-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/avrdude: bump to version 8.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://github.com/avrdudes/avrdude/releases/tag/v8.2
https://github.com/avrdudes/avrdude/releases/tag/v8.3

Drop 0001-CMakeLists.txt-allow-disabling-Python-support.patch: the
upstream pull request [1] was merged, but the option was renamed to
FORCE_DISABLE_PYTHON_SUPPORT, so use that instead of
ENABLE_PYTHON_SUPPORT.

[1] https://github.com/avrdudes/avrdude/pull/2051

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...s.txt-allow-disabling-Python-support.patch | 59 -------------------
 package/avrdude/avrdude.hash                  |  2 +-
 package/avrdude/avrdude.mk                    |  4 +-
 3 files changed, 3 insertions(+), 62 deletions(-)
 delete mode 100644 package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch

diff --git a/package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch b/package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch
deleted file mode 100644
index fc6210c099..0000000000
--- a/package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 41ee27cf1d31bbc62425aab286b7e524acc64bff Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Fri, 29 Aug 2025 22:21:50 +0200
-Subject: [PATCH] CMakeLists.txt: allow disabling Python support
-
-In some cases, even if Swig is found and Python3 is found, it may not
-be desirable to build Python support in avrdude, so this commit adds
-an ENABLE_PYTHON_SUPPORT option to be able to explicitly disable using
-Python support (unfortunately CMake doesn't allow passing arguments
-that would prevent it from finding Swig/Python 3 if available).
-
-To preserve existing behavior, this option defaults to enabled (ON).
-
-Upstream: https://github.com/avrdudes/avrdude/pull/2051
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- CMakeLists.txt | 19 +++++++++++--------
- 1 file changed, 11 insertions(+), 8 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7f3fce92..94263bab 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -34,6 +34,7 @@ option(USE_EXTERNAL_LIBS "Use external libraries from AVRDUDE GitHub repositorie
- option(USE_LIBUSBWIN32 "Prefer libusb-win32 over libusb" OFF)
- option(DEBUG_CMAKE "Enable debugging output for this CMake project" OFF)
- option(BUILD_SHARED_LIBS "Build shared libraries" OFF)
-+option(ENABLE_PYTHON_SUPPORT "Enable Python support" ON)
- 
- if(WIN32)
-     # Prefer static libraries over DLLs on Windows
-@@ -281,14 +282,16 @@ if(HAVE_LINUXGPIO)
- endif()
- 
- # -------------------------------------
--# Find SWIG
--find_package(SWIG 4.0 COMPONENTS python)
--if(SWIG_FOUND)
--  find_package(Python3 COMPONENTS Interpreter Development)
--  if(PYTHON3_FOUND)
--    set(HAVE_SWIG 1)
--  else()
--    message(STATUS "Found SWIG but no Python3 header/library; cannot use SWIG")
-+# Find SWIG/Python3 if needed
-+if(ENABLE_PYTHON_SUPPORT)
-+  find_package(SWIG 4.0 COMPONENTS python)
-+  if(SWIG_FOUND)
-+    find_package(Python3 COMPONENTS Interpreter Development)
-+    if(PYTHON3_FOUND)
-+      set(HAVE_SWIG 1)
-+    else()
-+      message(STATUS "Found SWIG but no Python3 header/library; cannot use SWIG")
-+    endif()
-   endif()
- endif()
- 
--- 
-2.50.1
-
diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
index 995dad3782..d7ab47d895 100644
--- a/package/avrdude/avrdude.hash
+++ b/package/avrdude/avrdude.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2d3016edd5281ea09627c20b865e605d4f5354fe98f269ce20522a5b910ab399  avrdude-8.1.tar.gz
+sha256  6c6fe3606f2ef331e502fb9c1d418ba09eb9705e811efbe18259025a9787ee3d  avrdude-8.3.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 8f451a7fdb..5708fe2017 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-AVRDUDE_VERSION = 8.1
+AVRDUDE_VERSION = 8.3
 AVRDUDE_SITE = $(call github,avrdudes,avrdude,v$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPL-2.0+
 AVRDUDE_LICENSE_FILES = COPYING
 
-AVRDUDE_CONF_OPTS = -DHAVE_LINUXGPIO=ON -DENABLE_PYTHON_SUPPORT=NO
+AVRDUDE_CONF_OPTS = -DHAVE_LINUXGPIO=ON -DFORCE_DISABLE_PYTHON_SUPPORT=ON
 AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
 	host-flex host-bison
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
