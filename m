Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64050C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 07:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0989960EAB;
	Mon,  8 Jan 2024 07:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0989960EAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hUOr8ku8alr1; Mon,  8 Jan 2024 07:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CB4A60D88;
	Mon,  8 Jan 2024 07:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CB4A60D88
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62C881BF580
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 07:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3710A400F1
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 07:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3710A400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SOCyLHZ-v6zv for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 07:22:37 +0000 (UTC)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AB6B400A4
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 07:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AB6B400A4
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7ba9f24acf8so112908139f.2
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 23:22:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704698555; x=1705303355;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oP4fk5pUvGgG0syYr77Meg4ct/JSNHpQQKflcyGLrL4=;
 b=lhu+Xc/eAQ2n+isg1vDvM6M/4Se0d3nTNu0EXp621sQnhAsyFj/FknQIfaTzZ/X1Ns
 l4Zf8al/Bwabh7F/W3C4Gi3FaJLtI+gfMysynVd4t0I5Cgob+YUueKCm/YZIttvAUwz1
 bQbmxZpW++FTc7JAISM1cpIe/lncMQ7Lnur644yvMkQ7WKFEY6eATUDkxa7ykThTXbTy
 40hwZSV/Zf6RdXYTgisfxMRu+SQYmBZssN9YJcwkgmq7Jre5ZTfnyqxXL5EnyEm9lHG7
 f9oxZ81d3k1AKrmzDnCZkDsLmepnOx4dhLozHnr1sQVHQ2TyDs4KsEJvB3utgjqIo1m8
 7g2A==
X-Gm-Message-State: AOJu0YxP2LQQVPEvEfQJmy14Vtw4q0TRWTD6988OA1DY92opw7qRq7Wp
 gCRTZHd0k1FEV8pDwcbsjfQ9VLOgTW5WGQ==
X-Google-Smtp-Source: AGHT+IH7lFccPkbBx6i4MwI/Xj2pHlXQPIk5zsXnc5wLGbrMhosXoa+ukuE1voDPuVkUyRcbiEYlQw==
X-Received: by 2002:a5e:9403:0:b0:7be:c3e6:99fe with SMTP id
 q3-20020a5e9403000000b007bec3e699femr922449ioj.14.1704698555681; 
 Sun, 07 Jan 2024 23:22:35 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 bm7-20020a05663842c700b0046b4a8df4f1sm2052880jab.75.2024.01.07.23.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 23:22:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 00:22:33 -0700
Message-Id: <20240108072233.3485954-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704698555; x=1705303355; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oP4fk5pUvGgG0syYr77Meg4ct/JSNHpQQKflcyGLrL4=;
 b=PX0/xJjggBMOcblOdlsUBQ14Htw8gSTBVNr10n7IJa5J5aet+bQ91pqN2U6J/0yyzm
 1E9jce6gRSAJcv30PrSp4oD0Iw1SAx86zF4TYphaCfsYn+Uqpp3DnbJilfx1Wq+elBj8
 gADr3h2mxAEFOYikL3glja/X/2LBCmTgGzPTmBjayMqk9+GP1PxGIHje5L4jEFVVpoIW
 Mp8Ie7eRb5eTfR6z/XL8Ew4CDxWAB7qD8N6B+XZmXDgAbH5u9qGSWLz3KmvZudlOv1EK
 7hpczvoHnPJXHqtbFhIR88Y9tyqdw2OClB6CN09gM4YiUibxKF96TbDpu089vN8Ww5gy
 668w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PX0/xJjg
Subject: [Buildroot] [PATCH 1/1] package/python-bitstring: bump to version
 4.1.4
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
 package/python-bitstring/python-bitstring.hash | 4 ++--
 package/python-bitstring/python-bitstring.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitstring/python-bitstring.hash b/package/python-bitstring/python-bitstring.hash
index c2ff9a69d5..1889983f47 100644
--- a/package/python-bitstring/python-bitstring.hash
+++ b/package/python-bitstring/python-bitstring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitstring/json
-md5  1750c35e8e45f597725037d35eed9ba1  bitstring-4.1.2.tar.gz
-sha256  c22283d60fd3e1a8f386ccd4f1915d7fe13481d6349db39711421e24d4a9cccf  bitstring-4.1.2.tar.gz
+md5  3909415d89586edabd577b62b0d0c1be  bitstring-4.1.4.tar.gz
+sha256  94f3f1c45383ebe8fd4a359424ffeb75c2f290760ae8fcac421b44f89ac85213  bitstring-4.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  3705eed5a923f35d9bfaca1f10e9136cc84d6e576570aec661bda69991f129ea  LICENSE
diff --git a/package/python-bitstring/python-bitstring.mk b/package/python-bitstring/python-bitstring.mk
index 9a5d8dfe84..983491303d 100644
--- a/package/python-bitstring/python-bitstring.mk
+++ b/package/python-bitstring/python-bitstring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITSTRING_VERSION = 4.1.2
+PYTHON_BITSTRING_VERSION = 4.1.4
 PYTHON_BITSTRING_SOURCE = bitstring-$(PYTHON_BITSTRING_VERSION).tar.gz
-PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/23/fc/b5ace4f51fea5bcc7f8cca8859748ea5eb941680b82a5b3687c980d9589b
+PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/7f/07/0fd502a29127b968bada3d1824a8af997546d2b9ff73f00e800b3d9888cb
 PYTHON_BITSTRING_SETUP_TYPE = setuptools
 PYTHON_BITSTRING_LICENSE = MIT
 PYTHON_BITSTRING_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
