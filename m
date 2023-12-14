Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30701C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 16:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB9A683BC5;
	Thu, 14 Dec 2023 16:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB9A683BC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WYh-85PtDt-H; Thu, 14 Dec 2023 16:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C96083CC9;
	Thu, 14 Dec 2023 16:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C96083CC9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FAE41BF28E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 426E2403C4
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 426E2403C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M3VJvcbqUzrB for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 16:54:44 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F06AE4010D
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 16:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F06AE4010D
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7b724fa9d09so249377539f.0
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 08:54:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702572882; x=1703177682;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Kq8fx/CAA/a8GXmCJAEhvK/dsaAQTj0ZynM+ok4/Qw=;
 b=aB6lPsYWii/nApyS3ECWJhfIZkegcF0stf8ROAt9REXeDrGY85/+0fTknMYx0XWaFZ
 ITFsxafBRxib6gEVhwnG7sW4hGdAGLkoetFz3nlBvk2xn7dZAGvnKsoVgt0IyINz1J/8
 T2fiunCa4bIs2JOm/ERpWXU51fchYY41C6unNrlQNjgAhXZDQEtkcx//1CiBzPFoU3HK
 3ynopFaCa/bk2YFwnXefI1nGPLa2wCbO4iMpxaXZziRV2xLB0FJXquk1RjhUGbSt2xQp
 rSBhd1VVuMMKA8/Gm+fhrqCldSBLQcx8zRQBWXFmXfMxBDgdHlqpJ0Bsz/gJKAvwAu25
 FroQ==
X-Gm-Message-State: AOJu0YxU/nxbrq5RPv0kOwNf0CQ5a6lxbEGRV63xzUfQ8OmgugEP9R66
 2p8HFgmWMW6FnnoeRl+yLQ1o2/L6kxfBHg==
X-Google-Smtp-Source: AGHT+IEl0OOg2lcVCLueG+fRbIQNvRzmkRgkrOeZUre6oF8oOsil+wpRsxCvGMnbMsrk0vhoGdNwdQ==
X-Received: by 2002:a6b:d80d:0:b0:7b7:400c:4e74 with SMTP id
 y13-20020a6bd80d000000b007b7400c4e74mr1634050iob.34.1702572882532; 
 Thu, 14 Dec 2023 08:54:42 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 u16-20020a6b4910000000b007b7372af699sm2912178iob.9.2023.12.14.08.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 08:54:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 09:54:13 -0700
Message-Id: <20231214165420.181703-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702572882; x=1703177682; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3Kq8fx/CAA/a8GXmCJAEhvK/dsaAQTj0ZynM+ok4/Qw=;
 b=nqG4fukzBVe0/8JLzIVBwvtUXlXVNlnMSmZXc3hZHforVgjLwwGCDl10RE169wH0Rv
 LwiFbvNzSY5bkIQWY3QWscOXewE7ftQwaJMMbcSR/WoB6YIEY9TytKsJ5aug4m0d3i0J
 b7uPyAwGts9GPHPQp8KgAp3VEyzQ3Vwk56rPA48j/cZNRYZ+AbKk8E3KblQ89BU8uglZ
 UYNOBeHxX9OxseJqhxXGZszrP989NpqEN2p9nPTh99VWflwbCR90UxZfyI13iAYbGEjq
 /PptgU0XJIJsutY4a+uAg5tnY6W0d1mrj0UbxXQGQtyy6eN1DUfZhhYtBCz6wGQUZYBa
 AUag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nqG4fukz
Subject: [Buildroot] [PATCH v3 1/8] package/python-typing-extensions: bump
 to version 4.9.0
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-typing-extensions/python-typing-extensions.hash  | 6 +++---
 .../python-typing-extensions/python-typing-extensions.mk    | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
index fedb9e0446..778b2d5771 100644
--- a/package/python-typing-extensions/python-typing-extensions.hash
+++ b/package/python-typing-extensions/python-typing-extensions.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/typing_extensions/json
-md5  06e7fff4b1d51f8dc6f49b16e71de54e  typing_extensions-4.7.1.tar.gz
-sha256  b75ddc264f0ba5615db7ba217daeb99701ad295353c45f9e95963337ceeeffb2  typing_extensions-4.7.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/typing-extensions/json
+md5  2bcafbd6817cb0d7a29ed7a7f1bb1e5d  typing_extensions-4.9.0.tar.gz
+sha256  23478f88c37f27d76ac8aee6c905017a143b0b1b886c3c9f66bc2fd94f9f5783  typing_extensions-4.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index 9d41b0a6a5..89ed75bda7 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_EXTENSIONS_VERSION = 4.7.1
+PYTHON_TYPING_EXTENSIONS_VERSION = 4.9.0
 PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
-PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/3c/8b/0111dd7d6c1478bf83baa1cab85c686426c7a6274119aceb2bd9d35395ad
+PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/0c/1d/eb26f5e75100d531d7399ae800814b069bc2ed2a7410834d57374d010d96
 PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
