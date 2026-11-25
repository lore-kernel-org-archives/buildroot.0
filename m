Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62487606A31E
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 16:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=T3BaBz7h;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=XvyPQSCu
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B53D40659;
	Wed, 25 Nov 2026 16:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NlhAfEkZ0Acg; Wed, 25 Nov 2026 16:14:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0FA4340838
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795623275;
	b=by+Sw2kdYwQgdMw284QBHXaTOmmm0NaiB82H+QQjfi3FVr4/eMallXfrmWwQhr1AK8RQ
	 l/pSOFBmN1ZlcH8PLwGiPDqaDu+ySNldhrU2kJ4tEBkIQRoQfcoQoxddq+Fjb5rMaceeE
	 7fAFqN/M0cKmGjBzeVsKR4Xsq0WCzApq6sJDFSFYy7KW+zQDl580iJ5ARI9IHjpPeGB4/
	 UsID7EvIo/9AqCNfcDIsOLfCDSM4mVBQh6/X75ip9k+8XcwT4c1eCK26hujOZdVc7ENSM
	 zwX3rtqZmcCbU0qBbYvh5rHjnKZQa6j/jKjJakDOyRgjbBTZ0lzlbEXI+5TUiMhFsiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795623275;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=HMLjAzPeUaKH17Gh0HyOIFQSfEuXKmknQk1yCKKhVjU=;
	b=lCofbUm+kmGHrP8UvMKKo2cP1pzazkargvm3Gv2RYObZ/Cwb5XqZiDlHO+cfBI9LO6oW
	 n8fvZoTi6V5vX/Ex7KTUxkQDlO3ffeyeX8YpcpZuKT8s/+6zJmV9HKsAh/u1cVjYwbNV8
	 falz4DXsXWAQQsM6T8nxrCStB4lyNGsvAT6pD6ugOjOtQoWpyO6sDQ+LfY4OL7D1z4mcL
	 p/I1SGAFd3u+wXfGwX+QWIsfcFKTcYjftm1awKyfhcdxmw7vV4JpetKD2q4p7282lZsuG
	 +l57Rs/wpYg4OW9OTAlBGU3K4rB1GJ1lhVxa2MCQpTog4WmSP3M93r4WOz15O1Oy7Ag==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795623275;
	bh=HMLjAzPeUaKH17Gh0HyOIFQSfEuXKmknQk1yCKKhVjU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T3BaBz7hO6xpfG3Ys4wK//01KqwI09sHRgSEbj7BvR43WK/ORieSpEn3yt8bQe588
	 MZJueNFyk40UAZQGeYSa1GfpmqhKGqwOVCiN+l/tR2UL0CmvUK5W8nfD1Dw/L0H1MQ
	 tP//VFXl/HzYPRKIbKXSw3OO42spB7uXxM8cBGF7kuDMQdIt0Yi8y3IDtayr6ddmQ8
	 P8VR2gxDDFyOt5DHjeGkhRS9iGaJGUuv23oyvDiJtw2c1NOjXUQzQwcTkAn28ZcqRa
	 GtF1ABoT/R044OqfnWqxDQ7OzChTHEjSeG0sHVUJfp+IsIotiaAyRO9S3Mq7qX0icf
	 eM7BX/6GkNc1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FA4340838;
	Wed, 25 Nov 2026 16:14:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F25981C9
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D78DC40116
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsAKGQoVMKcF for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 16:14:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5C179400CB
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XvyPQSCu
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C179400CB
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:29 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4bb55cda775so37695175e9.0
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 08:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795623268; x=1796228068;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2ayAI2304pZb2FkuElxvdRHiwKHc8qrpiKHsOwSq6ZY=;
 b=XvyPQSCu3m16GIPs7Brxy21Do5/g9e8SraPFvMRFWOn8I4B6ZUZ3+nA6Rpn4z2n7uX
 gHrWpJP57/oUkb4YEObX9gVprF7EAzWIxGE2hJOBzkKvNtGGN0n+TyVVeSl2Il3yxIyk
 RSSeXTSygwUXt3FH30X/TF5FZg/Gs/M1rb5cQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795623268; x=1796228068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2ayAI2304pZb2FkuElxvdRHiwKHc8qrpiKHsOwSq6ZY=;
 b=YQV9OfBCrQ0W/Xj4MhELYDTxtjx9Hfi3ZzYTED811B6vXGChcvuezAlqz2Gvv7yweJ
 ZkzhEvjRCL7q2uB9gqCUkgnDtZ0SdgyNml091o5CxCB8mELJgR3AC2PlZcM70pxeUupp
 excHcICZEzF2yZrhWW9h5IC826XbIo4tNdXmad9OySXzENV+KNhKnShHPGsDSwjfiPBO
 XCpH/6wSs0qDEK72e0y/H5kXsrEsRlSAA/BbeNbg6A36vD9g5ydW2keHfVeI/d3qCwhl
 K4bFBRAZ/7044lRUd61ZUf/LLrYk8MesAd3TcI45ctJdemoYo1a5Oo+/ITZotL2AHkvU
 e+Xw==
X-Gm-Message-State: APuU4Z+f5KM5my0qPhWKKlVeI38YiKppU+tC4+JwBz6sV8EaMDqmLyCX
 ITKSIcD9WJnUkRD8xDCbFaABKp3eoPLtQhBoP3gtXVlY3Xv6jZlwEwG1UOAP2m2qucQ7co2m3dz
 9Ls6m
X-Gm-Gg: AZFdTZfxWd/7mLN914qDnv+SKSmsdh80fCOKus2M6omjbBAD5TzcBEHHoZ36pmjrvd4
 EijWdki8BTo0YB4Gk9gjQ0gAHymNqWFu9nu3su5NeXL+cJj5GEgIYk6XMzNWj4aJuVYqJTwx3pr
 v1mJD1rYr9hDZaETgg6ullbKlRDjxzDSqOMXJ40qneGcMxEggykyQJEY1YqbkxKSZokWlR3AeD9
 6b7aip3Ytgd7d9ltzh98GbDigOwjWOMx7nCsa+ckKaZZMtts5koSzFnJMZICtMnaMcZhiJA8GjV
 /Oe2eMkJbpRPDl/RKrTEHqyrSJLJXfvfiTYSe2mtqMMYxmJXpGLYwizUU+f4QcJCiejtFrRYIkA
 X+Rubd/cZTx4ynEQpc5RilHoRC9c+PfZZs2kl44jIZU3WFb9OG1Ot+nisMeUcwWxNvIcnVXoZgr
 LaLpsPr+rqYj+jU/0/ykLSXnrpE99kvHwuKJOHq0eW51XQycQRcJTB6NqFBwILkc5EEpsfZuTWF
 LW6g74RtjTjXuBDWyWm1GRSHNHxj9+CtRDaY0vIu7RzFI8Gx/G6PgJEZSn9BrdXjCfn0qGH02XO
 oKRWCBupsbz0+ZTJ1N0V1reTeunZ5FoAkKTf2TGbv9NNO0EEZM+d6Fl+0DiUbLRlaOVUtxJUuVf
 8Kkwzwf1AHLOyxX9Gwqt/e9u+utDiYL1xX36FqyxcLiAiwgIjE7CHylYcgV816ddfG5jcQ7RKHK
 a7xUxDjPed8RQDOtmu+e1p
X-Received: by 2002:a05:600c:828e:b0:4a2:526b:d40f with SMTP id
 5b1f17b1804b1-4bb88785898mr382807475e9.0.1795623268133; 
 Wed, 25 Nov 2026 08:14:28 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88402ce9sm430741055e9.0.2026.11.25.08.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 08:14:27 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 25 Nov 2026 17:14:02 +0100
Message-ID: <20261125161404.859000-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125161404.859000-1-dario.binacchi@amarulasolutions.com>
References: <20261125161404.859000-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 3/5] package/isocline: new package
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Isocline is a pure C library that can be used as an alternative to the
GNU readline library.

Project page: https://github.com/daanx/isocline

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...nly-require-CXX-compiler-when-needed.patch | 55 +++++++++++++++++++
 package/isocline/Config.in                    | 13 +++++
 package/isocline/isocline.hash                |  3 +
 package/isocline/isocline.mk                  | 14 +++++
 6 files changed, 87 insertions(+)
 create mode 100644 package/isocline/0001-Only-require-CXX-compiler-when-needed.patch
 create mode 100644 package/isocline/Config.in
 create mode 100644 package/isocline/isocline.hash
 create mode 100644 package/isocline/isocline.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 59fad7f26bbf..b98c85996f97 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -834,6 +834,7 @@ F:	package/drogon/
 F:	package/empty/
 F:	package/iana-assignments/
 F:	package/inih/
+F:	package/isocline/
 F:	package/less/
 F:	package/libgphoto2/
 F:	package/pocketpy/
diff --git a/package/Config.in b/package/Config.in
index 49659b007e36..03267168a667 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2351,6 +2351,7 @@ menu "Text and terminal handling"
 	source "package/icu/Config.in"
 	source "package/inih/Config.in"
 	source "package/iniparser/Config.in"
+	source "package/isocline/Config.in"
 	source "package/libcli/Config.in"
 	source "package/libecoli/Config.in"
 	source "package/libedit/Config.in"
diff --git a/package/isocline/0001-Only-require-CXX-compiler-when-needed.patch b/package/isocline/0001-Only-require-CXX-compiler-when-needed.patch
new file mode 100644
index 000000000000..ddc150b42136
--- /dev/null
+++ b/package/isocline/0001-Only-require-CXX-compiler-when-needed.patch
@@ -0,0 +1,55 @@
+From a811b3dc38d296b5e4dc76ab2b932cf196795d47 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sat, 22 Aug 2026 16:58:05 +0200
+Subject: [PATCH] Only require CXX compiler when needed
+
+isocline is a pure C library and only requires a C++ compiler when
+IC_USE_CXX=ON.
+
+Unconditionally enabling CXX in project() makes the configure step fail
+for C-only toolchains. This was exposed while integrating isocline into
+Buildroot by running:
+
+  $ utils/test-pkg -p isocline -T br-arm-basic
+
+which fails during the CMake configure step with:
+
+  -- Check for working CXX compiler: /bin/false - broken
+  CMake Error at CMakeTestCXXCompiler.cmake:60 (message):
+    The C++ compiler "/bin/false" is not able to compile a simple test
+    program.
+  Call Stack (most recent call first):
+    CMakeLists.txt:5 (project)
+
+Do not enable CXX in project() unless IC_USE_CXX=ON.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/daanx/isocline/pull/54
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 11aff09bba58..a679098c97f7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,7 +2,7 @@
+ # Copyright (c) 2021, Daan Leijen
+ # -----------------------------------------------------------------------------
+ cmake_minimum_required(VERSION 3.10)
+-project(libisocline C CXX ASM)
++project(libisocline C ASM)
+ 
+ set(CMAKE_C_STANDARD   99)
+ set(CMAKE_CXX_STANDARD 11)
+@@ -44,6 +44,7 @@ if(IC_SEPARATE_OBJS)
+ endif()
+ 
+ if(IC_USE_CXX)
++  enable_language(CXX)
+   set(IC_COMPILER_ID "${CMAKE_CXX_COMPILER_ID}")
+   set_source_files_properties(${ic_sources}         PROPERTIES LANGUAGE CXX )
+   set_source_files_properties(${ic_example_sources} PROPERTIES LANGUAGE CXX )
+-- 
+2.43.0
+
diff --git a/package/isocline/Config.in b/package/isocline/Config.in
new file mode 100644
index 000000000000..02684f12dcdb
--- /dev/null
+++ b/package/isocline/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_ISOCLINE
+	bool "isocline"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Isocline is a pure C library that can be used as an
+	  alternative to the GNU readline library. It provides
+	  multi-line editing, history, completion and syntax
+	  highlighting.
+
+	  https://github.com/daanx/isocline
+
+comment "isocline needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/isocline/isocline.hash b/package/isocline/isocline.hash
new file mode 100644
index 000000000000..dd77b4cbd4ff
--- /dev/null
+++ b/package/isocline/isocline.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  1e5f0efa2b719c3e1d292f501e5329e141a039deefc801099f8bbb9a50255531  isocline-1.1.0.tar.gz
+sha256  60c6b0415a2e0afa8e65630a980b64b4df09cde910e44481a1b0946ebfc840e4  LICENSE
diff --git a/package/isocline/isocline.mk b/package/isocline/isocline.mk
new file mode 100644
index 000000000000..bc5127d1d4c8
--- /dev/null
+++ b/package/isocline/isocline.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# isocline
+#
+################################################################################
+
+ISOCLINE_VERSION = 1.1.0
+ISOCLINE_SITE = $(call github,daanx,isocline,v$(ISOCLINE_VERSION))
+ISOCLINE_LICENSE = MIT
+ISOCLINE_LICENSE_FILES = LICENSE
+ISOCLINE_INSTALL_STAGING = YES
+ISOCLINE_CONF_OPTS = -DIC_BUILD_TESTS=OFF
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
