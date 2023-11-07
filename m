Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C94C4167B
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 00:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E51A942032;
	Tue,  7 Nov 2023 00:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E51A942032
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mEeEylTQ5CrT; Tue,  7 Nov 2023 00:46:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28DFA4201F;
	Tue,  7 Nov 2023 00:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28DFA4201F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B2B51BF34D
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 00:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6478A8239A
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 00:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6478A8239A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IIbUpxbgm0VL for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 00:46:49 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E9FA82376
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 00:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E9FA82376
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7a94c5538aeso189342839f.3
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 16:46:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699318008; x=1699922808;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=phyqVgw3xqcYh/5e50p0SEItC8Ena3Fkt9lK9lMcp1g=;
 b=Je5tpTPEq1CUw1hCEpQZrVxq1WAuTYKqo7nT7MXWLXxlBE/m2MsoXhbOa9dN49Y9+t
 zVuMU4Xk4YiTtpOZ60DxUPfq1vRl2/5OmJFy3/U4efRJwTZ6h7i/PKM8k1sN0pAQ0hCR
 d5t2F/dgKa/BqG6O1AIlO2Ynhcvi4B8Q/m9MXxB1Ogb5Nm7w8VMSMut/s0n5hV1nD2i+
 gnjhN3CzuzCmMJqwcvCp677Bv9akeaWE93QPTfBnVgEvYjBQ9qoac64sHNRrmd42gvFW
 ZaByBGNJJhDgmsF6wU8N7MKFhxHPtu70ziYyWnwpXCE1DmgucR4ln/eOJmW2xhC8Q6yp
 KOSA==
X-Gm-Message-State: AOJu0YywaUB+7uHANev7Yi/zVLq6WKq48W/2gYWCtuNZJQsjuuOKdbHl
 JozgvDIXC+bdLlzKfL7i1fTSzHQ4pDA=
X-Google-Smtp-Source: AGHT+IFCYHe2g4Rs9lEroSbXPzQuXoqApzZ2GVzcCoL6OsjYhmHQCV3hmF0f2BRql0ubthejsAqafg==
X-Received: by 2002:a05:6e02:1d04:b0:350:f2a0:5c44 with SMTP id
 i4-20020a056e021d0400b00350f2a05c44mr1458968ila.2.1699318008255; 
 Mon, 06 Nov 2023 16:46:48 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 q7-20020a056e020c2700b003524d2ea34dsm2790358ilg.10.2023.11.06.16.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 16:46:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 17:46:46 -0700
Message-Id: <20231107004646.3444628-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699318008; x=1699922808; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=phyqVgw3xqcYh/5e50p0SEItC8Ena3Fkt9lK9lMcp1g=;
 b=kSTKexkGFQeYjcH51nN75yWJ415UmAJqywkAo+k0DRe8RJe4s7gyirNc8X3vQhckD5
 YUxV6pIdtt1rJ1D5mo0i5vJnjjEgGF1c1dGtcy8BnOGXxvkkfuaLhVJCL5/OTrlN0rXp
 adeR6PrPJ6B9iq7+3oVocAw2T1TOCVs7Un12RxoBXYtjMvYjJzRwii8nMHJWEVOfrFtX
 y6dkVX9iSqdkUV53n0XvJZWrk84aFq9Dd+TgkKPVOvFsqPZzazm5Req5//tjEWl+JaXY
 wAqz9o7c6yZgvmyaAm0gYR0/HAVM55UYI1BoJvB0hi7vViIqhTSLFfmfhsWKkwMBpSvP
 oIFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kSTKexkG
Subject: [Buildroot] [PATCH 1/1] package/python-libusb1: bump to version
 3.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-libusb1/python-libusb1.hash | 4 ++--
 package/python-libusb1/python-libusb1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-libusb1/python-libusb1.hash b/package/python-libusb1/python-libusb1.hash
index 86dea08c89..effecd8531 100644
--- a/package/python-libusb1/python-libusb1.hash
+++ b/package/python-libusb1/python-libusb1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/libusb1/json
-md5  ffbb02bf9aa49f973a6a58112aed7b06  libusb1-3.0.0.tar.gz
-sha256  5792a9defee40f15d330a40d9b1800545c32e47ba7fc66b6f28f133c9fcc8538  libusb1-3.0.0.tar.gz
+md5  7b4f094786d1dfc8d011c7649d8ccb97  libusb1-3.1.0.tar.gz
+sha256  4ee9b0a55f8bd0b3ea7017ae919a6c1f439af742c4a4b04543c5fd7af89b828c  libusb1-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-libusb1/python-libusb1.mk b/package/python-libusb1/python-libusb1.mk
index 48a0b1dea3..39fd7e40d3 100644
--- a/package/python-libusb1/python-libusb1.mk
+++ b/package/python-libusb1/python-libusb1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBUSB1_VERSION = 3.0.0
+PYTHON_LIBUSB1_VERSION = 3.1.0
 PYTHON_LIBUSB1_SOURCE = libusb1-$(PYTHON_LIBUSB1_VERSION).tar.gz
-PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/f4/83/59bf75e74e0c4859ea63eae0c7da660c1dcb78b31667d4a5f735d52f5974
+PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/af/19/53ecbfb96d6832f2272d13b84658c360802fcfff7c0c497ab8f6bf15ac40
 PYTHON_LIBUSB1_SETUP_TYPE = setuptools
 PYTHON_LIBUSB1_LICENSE = LGPL-2.1+
 PYTHON_LIBUSB1_LICENSE_FILES = COPYING.LESSER
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
