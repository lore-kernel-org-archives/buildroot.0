Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ABFC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 09:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E568435FB;
	Wed, 10 Jan 2024 09:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E568435FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H9ldBrQy1AeL; Wed, 10 Jan 2024 09:39:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E6F24366C;
	Wed, 10 Jan 2024 09:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E6F24366C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FEF11BF34C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45F4F404BF
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45F4F404BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WZBf6vnpkHoM for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 09:38:59 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 020D7435DB
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 09:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 020D7435DB
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7bb0af58134so186079239f.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 01:38:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704879537; x=1705484337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LNDJy1qdSIr4TyfRcGnXpmWWUz5lWSR68BFcH+V+zx8=;
 b=IOCexNYb9az4yIXJ0ig8YYPokD82uDWbvp8dafOxKCeNU6i2cyXwnXTL1OvNG+IJKD
 IMii1BhkiBszMaReiJWVXF11AGXjZyqzycF50x1Rn+DV8Wiwvfm4oVkw9wBu3EsajREY
 iunASxzgB3j8LK1BoNeCNnAnjyCn4U451LQ0szmJ2sKj9UHCyLrTwCrarD4o+YXoWuut
 qNTp1sXBl373i5hbxdqeFVk0t+8pmF5f7D1hWuoZpZSyhONBlyghzTXpCsC/PM8i0D+z
 TnxtbMvq5oV+7ihDA2F1PyLVvECfhsABHj7oIYxP9VkyBKM7Sg1fS3M1OHl4NUFOFMAB
 43Nw==
X-Gm-Message-State: AOJu0YzFcVMw1/ULxZaRlc97JfPwvd2BNgqLJou51hpgiAPZMEzLCdEY
 JqugHP3HcaUY4e0e7q92FqmbxUgRStTyPw==
X-Google-Smtp-Source: AGHT+IGFdxrj6VF7YsFQg0u/7gN4ud+5ZoLtNvJf+LaL8X9Evydsk1DEvv0Rm3hMIz+vJH5n7qy+iQ==
X-Received: by 2002:a5e:8f4a:0:b0:7be:f7e5:44fc with SMTP id
 x10-20020a5e8f4a000000b007bef7e544fcmr508564iop.21.1704879537458; 
 Wed, 10 Jan 2024 01:38:57 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cw9-20020a05663849c900b0046d950cf82bsm1185395jab.85.2024.01.10.01.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 01:38:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 02:38:49 -0700
Message-Id: <20240110093850.2302133-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110093850.2302133-1-james.hilliard1@gmail.com>
References: <20240110093850.2302133-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704879537; x=1705484337; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LNDJy1qdSIr4TyfRcGnXpmWWUz5lWSR68BFcH+V+zx8=;
 b=cbTAhD/8P6G8S7HPhu85z533BFLl9oneWE7Pdrp9muygxLtirx3tsopeYGpgQOUCWT
 tdLhBOyp6PmHm+2UJ/Qs6uVOJ6FTdh2QBLXeAgvtyDNNL4z/vJtv7/hBG3IJ6cay0NVs
 fXVhMlkwFRY4Y4IYM1Lw1NoLDyGQeO/ROGrbNxZidslJjaKZpNQQ4fnTH6qHR0dC6qxV
 dEWdeEkBszUiXYNCMmgcG+glGeoaWAu4J40oh051N3eq7r6hBWYp54uNzS28uiEQjBx2
 zpzUKZxIo3zHdOTwDBgtem4W3FlD1/52cJt2slkCcWrzg2Xv/j7hn1LUwKXxTHCrI3sz
 fAMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cbTAhD/8
Subject: [Buildroot] [PATCH 5/6] ackage/python-libclang: new package
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-libclang/python-libclang.hash |  5 +++++
 package/python-libclang/python-libclang.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-libclang/python-libclang.hash
 create mode 100644 package/python-libclang/python-libclang.mk

diff --git a/package/python-libclang/python-libclang.hash b/package/python-libclang/python-libclang.hash
new file mode 100644
index 0000000000..521062dbf5
--- /dev/null
+++ b/package/python-libclang/python-libclang.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/libclang/json
+md5  fffb0029127aa45bbdc46da944a97693  libclang-16.0.6.tar.gz
+sha256  4acdde39dfe410c877b4ccc0d4b57eb952100e4ee26bbdf6cfdb88e2033a7d31  libclang-16.0.6.tar.gz
+# Locally computed sha256 checksums
+sha256  ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47  LICENSE.TXT
diff --git a/package/python-libclang/python-libclang.mk b/package/python-libclang/python-libclang.mk
new file mode 100644
index 0000000000..8f68316c26
--- /dev/null
+++ b/package/python-libclang/python-libclang.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-libclang
+#
+################################################################################
+
+PYTHON_LIBCLANG_VERSION = 16.0.6
+PYTHON_LIBCLANG_SOURCE = libclang-$(PYTHON_LIBCLANG_VERSION).tar.gz
+PYTHON_LIBCLANG_SITE = https://files.pythonhosted.org/packages/c2/01/ec65dffc8c94bd8cafd359a76992f3212a239a80ead05522995c105432b8
+PYTHON_LIBCLANG_SETUP_TYPE = setuptools
+PYTHON_LIBCLANG_LICENSE = Apache-2.0
+PYTHON_LIBCLANG_LICENSE_FILES = LICENSE.TXT
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
