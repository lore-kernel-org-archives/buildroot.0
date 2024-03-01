Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E45C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 20:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D92B441CA6;
	Fri,  1 Mar 2024 20:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mb9B5_FFM11I; Fri,  1 Mar 2024 20:15:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D146540471
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D146540471;
	Fri,  1 Mar 2024 20:15:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E786D1BF28F
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 20:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15E74827E0
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 20:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qQqZ8Iry4ENK for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 20:15:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC503827C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC503827C9
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC503827C9
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 20:15:51 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-412b83cfac4so17808935e9.0
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 12:15:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709324149; x=1709928949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rvA358bXEbePCJWqsRcCDpq3+MKlfUt/JHvBe/41hmI=;
 b=YD6tu09hz6kr9ZJHzcR8f6xDCdGU26zXS+xiyeVQKWkp6gL4xAY9mL6fASFFdc56lJ
 2tJPj26q9MVcAhaytvoDgqBiLKPCjFmsmRfnYzGAoOMUCWTB4SD4KJwWVAGmorWNo8d3
 Lu+k9HBGvSvEeiufLkgQwJoiXaYMGzlNOFdTL8qqfV17ZDYAN4GlG5uy41pUTS+9tKtA
 etwZUtcWSY/aDq0WuDt4+OM/37EkwN/FoTE/X1nWnOj8tLLZALA75AXv94OsS6lSjoJ0
 aT2V165sIvZ+uBkKbH9Ulz9Ea3jKrXaNmaRaA4y+MmSH0MJLupxHEfjgr12Io8qC7Frl
 kKCQ==
X-Gm-Message-State: AOJu0Yxyb7LugEHIjUmrbUPWEpjaYU24QWqeONYWNrIL3iorzJ2MYm/a
 pnJdICrDvzLEnpXjXklrw+QJxfwk3v6su/DO7ZEan6iicO1R3mooMU6sGeGY
X-Google-Smtp-Source: AGHT+IH9ppoe4ZF0YeRucHpMLTiegHeCcBmhL6ZsbuUZD4BBEbUR8c4Wa1Ci/2dgh+GMbedufRCs+Q==
X-Received: by 2002:a05:600c:1d16:b0:412:b2fe:6e46 with SMTP id
 l22-20020a05600c1d1600b00412b2fe6e46mr1872740wms.27.1709324148929; 
 Fri, 01 Mar 2024 12:15:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c4f1600b004128f41a13fsm6503323wmq.38.2024.03.01.12.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 12:15:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 21:15:43 +0100
Message-ID: <20240301201543.894357-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709324149; x=1709928949; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rvA358bXEbePCJWqsRcCDpq3+MKlfUt/JHvBe/41hmI=;
 b=dUzT+9fltVTwmFSltllLHQJrkxV4zbiClDl5p/75/7FO8YbnygW71L7x+c6v/uT9OF
 Ba3Tk3eM19Jd9AJ1XC3tpjbK475zrTM28W/TQnRCv0bv+RofgW57xzCT3f2MSDi9avZK
 37b3I03bAKyhhJCYAc3X/DmT0sKOIaTohWpVydvpOehgcHqmF3msxME7aeSwfcLgSREi
 FJfMDL7ArCxIAz3OER8Ej9rEKLjTUUjMf4mbK8hYzafQeJqQ3w4ADi40P8HlcAa3afGi
 wbC0gDWgaYtgCCTabD7EE5rmHd88S3wTEEo+k4Biw5rfBM92VIDgKPwctZibwW6jIVBI
 hqnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dUzT+9fl
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: security bump to
 version 3.9.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2024-23334 and CVE-2024-23829

https://github.com/aio-libs/aiohttp/security/advisories/GHSA-5h86-8mv2-jq9f
https://github.com/aio-libs/aiohttp/security/advisories/GHSA-8qpw-xqxj-h4r2
https://github.com/aio-libs/aiohttp/blob/v3.9.3/CHANGES.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 374e66ae8d..542a46f032 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  264e1b4fbe9f09050523c03f4d9b5ee2  aiohttp-3.9.1.tar.gz
-sha256  8fc49a87ac269d4529da45871e2ffb6874e87779c3d0e2ccd813c0899221239d  aiohttp-3.9.1.tar.gz
+md5  f237bcac4ade112b9e7c4b1098197244  aiohttp-3.9.3.tar.gz
+sha256  90842933e5d1ff760fae6caca4b2b3edba53ba8f4b71e95dacf2818a2aca06f7  aiohttp-3.9.3.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 3dc822e832..315d68cb2e 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.9.1
+PYTHON_AIOHTTP_VERSION = 3.9.3
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/54/07/9467d3f8dae29b14f423b414d9e67512a76743c5bb7686fb05fe10c9cc3e
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/18/93/1f005bbe044471a0444a82cdd7356f5120b9cf94fe2c50c0cdbf28f1258b
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
