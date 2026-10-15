Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D3DCCA462
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4EAF4095A;
	Thu, 15 Oct 2026 21:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jW58rbQXQAz3; Thu, 15 Oct 2026 21:52:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D25114095B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101170;
	b=WduhHN1l+Gri1jZ+tklWfb6ZSn/tEdTMr9DcJGWKDj6EP8bf+yxFsFWGrLzwVhy5Oodo
	 /1IsKgLjE3AterTz9Po/5cW9UfYbDn0smZW+lWVCCVrrHoosJ/hmAlPNfdU5bi0iY6nVJ
	 sZewPvWtiz3eusWzvQL6ZEpc5rRwMVBNwG8cco9Hz9db7PCcWIZfP+w4iIGbCed7Eojo/
	 gBvKIZ6CXZWfxZ7EqMgbROfkOT2/ef8pE50DOljtprJ9JU/6ng8tgG8e9JfDwaB3Ldt+T
	 0cxv0tAAKV8Vo05MYUQYN6JGM1fX3MuNdrWkL0M3RYt+yT3ihJ/v5L/YqXjW3llfpEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101170;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hGqSNoeREsAd8wvClV2zuq7GRhM797AXY5v2yCexIr0=;
	b=HYRun43lXwAKuspa7rnCmoWt05CVGoqEclSJpYoZIHTeaqspT79LUfLhFEaY1oTHTfEP
	 GBTv5xYiWD7vZAorVbSoaPTddoWWLm9Hp5vNmVv5HUq8zF3J6rfJzQcD2JlhlzAlfTNj+
	 bPajxrIImcAynYfnM7KNAhdRFrpF2gcYUdfusFTRc3tUHWrNkX3wcHPXDyS3ihkOSQyqG
	 btgttPa3BYOD8gP/YQVv5hyFtsppta+LPl6N9FMWta9lquqQAC3ANRWuRYfC0XG8oelqM
	 QkERdrQn6PjRFV8DxrqHYa/I+RyPoyOgFsCH3tbnybfxaYwUWzYdIjWLqRvpNWweLtw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101170;
	bh=hGqSNoeREsAd8wvClV2zuq7GRhM797AXY5v2yCexIr0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K6R3c1JKUKFEaz0BDt9GcOgmfvEsIDMuzLakrHM7cj2LRnfuOr+tVAiltcdBpKCU1
	 Wnm1WhMK3fusIfw35GluBs3Br8Vcn9pmqWCQn3/D1Mvg2meuejlit0Rpe/YJcfZZ4y
	 keBGYTxvpTXQtCqi3NK4f1QGI8cU2Dzuiv0JR3F8d8naBaURO9CRDgnthzMm2ZKbG4
	 HTPMqoigtAEmwVO9W5hVYoDjbkWqbXorJ7/ancQ5ePyVIcm+D1DB8/YkcX3SyRilS4
	 BykZ0J4WGM5nuUdnaky9E86u2EkZPjRL5zckaooedz0jtARojVaSDpxDfsJHEcfweu
	 SlPwC+oOsYuWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D25114095B;
	Thu, 15 Oct 2026 21:52:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89347332
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B1DA8121D
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsOt7jMFNN46 for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7846E8121B
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::330"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101166;
 b=XeKS+cG98NkTTaQVvH7IUHESq43hgOM3+pJBrbRM2gO/z42I9kfoiNRVbFkXLZqAOEJk
 l7ZOTPHkfF5itw+XFRMRcI/TjmiUtxTYpOVz6Jg92ajyGQMh2a0heHNFKncLxicE0IvKz
 4Ag+WozIHp6RQ5qHvjXWusEo5OsEZvha2t5mdDbMqhnFLYAGnBiBcDq+FKn1kVIeHrNCk
 y6baNaaM4ZUtijLSMz8lI6zFtvvucn0UjD2LWc6X7A7TJVdMe2yNBDHyqVfbgDYgCTbmM
 2AqxXj6Atcccr9Q4zjWdCcghVPwRK97+U8IWYQ8JriDB9Ac74ngH4eDeTP24Zm+2+Pg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101166;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=gqGlJGVA1KiVLBw8TdMBAhyG5s+glgfkO7g7lAEwFt0=;
 b=CP2fUWapVdqGuaz1hIF+KqH8PRA7i2howdOEXFGt2ctOSYDBKRPQV/vtJ58zxEN5kl+D
 xYp1p0U/dRhjLRz3taUR51eO/K0ufhme4EEM/h8a5cFwCAbt2yPqOGeQXd5fcjWDEJJ9w
 I+IlzwCQkCI6WYvWl7htLlfDR92Eo2gMSM3rOM7f+ZAw03piGtW44ve20+3Abf+hV2VDH
 EI1OwheRDBQ0kEOdG1xeke//g/zqaB6fDfODtIk2gXFLr4cLCDdbz2SSvrFSmeieUpIS4
 Uxh1QCKD6tEybiDQPpU/7fZ4hpchu3gydTQMWFKNUnCCuUakKpPLZc7wpLer0VlrIWw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=BDcilrlv; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=BDcilrlv
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7846E8121B
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:46 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-81ba09a5d23so1809626a34.3
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101165; x=1792705965; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=gqGlJGVA1KiVLBw8TdMBAhyG5s+glgfkO7g7lAEwFt0=;
 b=BDcilrlvjbatolIA5wv5yIL7Fl7/aaSZw53RDEPhnCRGlvirkEu32A2fqB5GzsbjJJ
 U0QJUtScUXPB4zF9GtViqnyC38/ycE2w310jdOBIw1wo+1UstktdvMwk/05ecnAnm1me
 lx8CcQUHTz8EAtPlU85mAtQq7a4Wdgb3GKJu6CfgZQQV4rwyeIrsJytMVL1R6q+kC6ci
 aKZLgvZGClaMPW+dP6wplRL6DIhDPMf9J0O5fP12/+0AmFP/tc1RneCUOyLF4XoUjzgc
 cehTWJihailZ5V6Owo74ABHFNC8nZAXmh32HVTDhSssvFwltX+HzM76BgzE9q/oixhIb
 YJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101165; x=1792705965;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gqGlJGVA1KiVLBw8TdMBAhyG5s+glgfkO7g7lAEwFt0=;
 b=NGRgQmK9JQirheyUB9gnsfGw7ZUB+8z+YcEMZK2t+w6H7pS5dhwH3tO8NvksfcQkbP
 H58XrmXEX+C3SxI9BwCMm4taKgfqcE5H523DX/J7cxdMUAe+UpXT/nUBYlamUtvXtHqE
 DIUdXmN5X494Z0rgWdadvEl+IyI4eH+gqbcBA1AzCNyiGKesfIXR4tXdM4X3eJfeSnkD
 u1ZUlvjLwjTrNnf4tY8QZq0IVHTTrx9KgGtNUs0HW0vmxvhJm9K7ufqsbNzL7Ma65uMy
 Vd/ZHQKSL1yAo+ph+1r8RnjSvgA80AGNZxfU6bHY11/VrIIog1p7O5k3Msb9kLSUkTzI
 tZQg==
X-Gm-Message-State: AFq9FYJIzq2GJiPiubI94iU/ufWeWhKLxH58RvsiP4SXeIrp7+3sHsSC
 E7LoUiyC3verdQ4eOa3nuY4DqzpcPT+5dhdmupvoYFeYHMmUHwS952Bmu92ozA==
X-Gm-Gg: AYBFou2MvsZxyRKW047Se9/5ybjnX5p8j6KvZ90y7N4JqbQ7VNdATpUInD38edCk5Yv
 W31kuPNapkHGZTPN2R0VKLWOT9TK8opBBJZmOGiy0JR8Ze1h3Xk7KzPvCvR1qDtauO5WFFjewUy
 TOJLbbaJSL5zP9F5C42zzIfQsxvn9DhNvqJcWe+RSmKFSlUyaXLNrWE9mRFy4n1oyvFFcCrIosT
 0Ym2pNnhh3u/KrFQmI3EBK0GkoxaMQ9aeKi7mN/wZ6M19m7id81v2Qrjeletj5FF/wR1QAJNjEE
 O1WXc3t5/ciIiptGvLpJTomjIK9YUS7lk2YsTzAQAtj1lJAM/I6iu6E65BktiEYhnRYiZMfrY4e
 vpl9e9eygOnpiYTI4vU57l7bqvo+oox/pnFrRnQT3/1EYIRszLztq7DDPad773ccS/v+Jbsbq8+
 ZOI9afH3Lb//ShMklX0OSq+OvI2PAjvQgVNHDICx1SIwBGTYDRx98AN6PP+wDwwGE69vSxqVP/v
 CF+81TZteKd4vyS1faeHdw8fMBxQXDfcmpyA9eJUJ5W8nbdGKa2o/FkXk7Xm80hf/AsHfvCDEJ2
 A6KHtKOm7TuNnbp+Jhg5c+JKkkenc2Ozl5uKx3sJUNoy1/zEcMUnex+P9WCMO4wbSxpgd5IzpU8
 rDePEJqrgSmiMciNmS7uIkCmpiP9ygE3utQKqYU1CZ80=
X-Received: by 2002:a05:6808:e190:10b0:533:72c7:f80c with SMTP id
 5614622812f47-53372f63d06mr2289648b6e.42.1792101165099; 
 Thu, 15 Oct 2026 14:52:45 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2026 15:51:54 -0600
Message-ID: <20261015215210.3426895-18-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/snagboot: bump to version 3.0.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop the patch that was merged upstream [1] and remove the obsolete
host-python-pyfatfs dependency.

[1] https://github.com/bootlin/snagboot/pull/95

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...utils.py-import-compression-modules-.patch | 57 -------------------
 package/snagboot/snagboot.hash                |  2 +-
 package/snagboot/snagboot.mk                  |  5 +-
 3 files changed, 3 insertions(+), 61 deletions(-)
 delete mode 100644 package/snagboot/0001-src-snagrecover-utils.py-import-compression-modules-.patch

diff --git a/package/snagboot/0001-src-snagrecover-utils.py-import-compression-modules-.patch b/package/snagboot/0001-src-snagrecover-utils.py-import-compression-modules-.patch
deleted file mode 100644
index ea92c0caa2..0000000000
--- a/package/snagboot/0001-src-snagrecover-utils.py-import-compression-modules-.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From fa60aaf200eb1e6d31124ac3e7631e9e5458d145 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 8 Aug 2026 19:03:52 +0200
-Subject: [PATCH] src/snagrecover/utils.py: import compression modules when
- needed
-
-Commit 4f98bdec5ebeb13d9f851f848c3bd0086ef31eeb ("snagflash: Support
-on-the-fly decompression of input files") has added unconditional
-imports of lzma, bz2 and gzip Python modules, even if compressed input
-files are not used.
-
-Switch to dynamic imports where these modules are only imported
-on-demand. This allows to relax the need to have support for those
-modules in Python, which can be helpful in environments such as
-Buildroot where dependencies are kept to a minimum.
-
-Upstream: https://github.com/bootlin/snagboot/pull/95
-[Thomas: upstream version is different as upstream master branch also
-supports zstd compression, which wasn't supported as of v2.6.1 of
-snagboot]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/snagrecover/utils.py | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/src/snagrecover/utils.py b/src/snagrecover/utils.py
-index 8d240f6..dfe7d23 100644
---- a/src/snagrecover/utils.py
-+++ b/src/snagrecover/utils.py
-@@ -16,9 +16,7 @@ from snagrecover.usb import SnagbootUSBContext
- import yaml
- import importlib.resources
- 
--import lzma
--import bz2
--import gzip
-+from math import ceil
- 
- USB_RETRIES = 9
- USB_INTERVAL = 1
-@@ -47,10 +45,13 @@ def open_compressed_file(path: str, mode):
- 	comp = get_compression_method(path)
- 
- 	if comp == "xz":
-+		import lzma
- 		file = lzma.open(path, mode)
- 	elif comp == "bz2":
-+		import bz2
- 		file = bz2.open(path, mode)
- 	elif comp == "gz":
-+		import gzip
- 		file = gzip.open(path, mode)
- 	else:
- 		return open(path, mode)
--- 
-2.55.0
-
diff --git a/package/snagboot/snagboot.hash b/package/snagboot/snagboot.hash
index 09d765d9f5..7f28215061 100644
--- a/package/snagboot/snagboot.hash
+++ b/package/snagboot/snagboot.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0b94184d9668c46cc2cf11002772ddb2fe06542f4f96cc6884342b5561d84b8d  snagboot-2.6.1.tar.gz
+sha256  084a48bfeb557014c194d64fe63ad376f203cd89ea28e1fc5d129bd08c91d29b  snagboot-3.0.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/snagboot/snagboot.mk b/package/snagboot/snagboot.mk
index b3f699e988..7a0c9612cd 100644
--- a/package/snagboot/snagboot.mk
+++ b/package/snagboot/snagboot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAGBOOT_VERSION = 2.6.1
+SNAGBOOT_VERSION = 3.0.1
 SNAGBOOT_SITE = $(call github,bootlin,snagboot,v$(SNAGBOOT_VERSION))
 SNAGBOOT_LICENSE = GPL-2.0
 SNAGBOOT_LICENSE_FILES = LICENSE
@@ -17,8 +17,7 @@ HOST_SNAGBOOT_DEPENDENCIES = \
 	host-python-tftpy \
 	host-python-crccheck \
 	host-python-pylibfdt \
-	host-python-packaging \
-	host-python-pyfatfs
+	host-python-packaging
 
 # We do not install the dependencies for the snagfactory GUI
 define SNAGBOOT_REMOVE_SNAGFACTORY
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
