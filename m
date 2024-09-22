Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5A4CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 06:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E8FC402E4;
	Sun, 22 Sep 2024 06:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVHo30qqaBU5; Sun, 22 Sep 2024 06:27:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B345440360
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B345440360;
	Sun, 22 Sep 2024 06:27:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92C671BF86C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81ED540360
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kicVE8wBbMWW for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 06:27:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3EECB402E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EECB402E4
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EECB402E4
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 06:27:36 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-39f526fd19bso12447575ab.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 23:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726986455; x=1727591255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JdfX20vcnVWtiwalqEouP8BxOcoyJeI7QKS84CwrAyw=;
 b=j2cvWHZFBIIwWI7vCg3zFRkxhVJM34c454VBDyVzAYqSOVwbQWmwwYrJ9A1zlrYCb3
 PSc+nu/UnstcU8i4b9bzmT98gPU4Oc4WQ8vzIOScDKRLn9gbXvplhvlAm4b4Qar6Hikq
 +0wvBGnL5FVxwOpcRf+KKtxRAtj/gV4xEQV2VPESJ+MoIm0cOcKKTF6BIvO7IdPM81Mv
 yDFr4rZGMqLF5NmdMOK1r1fdRV4L5X69IF3GxowezZ7Rp1dItn6A8A8sbL7Uw2wxXIFF
 WdowxS48jC0MQfhUG3LMo2ifMxhbM15lGvKQm3nd7+a7bQ57CLPrYd7DGTeOuOSWkwzK
 Y9fw==
X-Gm-Message-State: AOJu0YzLI2BrLRz4Q3HnwxKea5V86Qt1ZW7c+5hYwddOF8toq8X3RdZi
 HivKlls1MP+A3t8B0jABwU6WT3RN2a/O1wmXZKCKrJcoCtj+JOpQBf678w==
X-Google-Smtp-Source: AGHT+IGKyD7efYLOops5a/a09VdH9MnAVDB5nxqY8u3tkMxL4+zzET+yXqmmWIO6drW4YYfeUfyAXg==
X-Received: by 2002:a92:c261:0:b0:3a0:4d72:7f5e with SMTP id
 e9e14a558f8ab-3a0c8ca4694mr72584015ab.7.1726986454854; 
 Sat, 21 Sep 2024 23:27:34 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e10f0bsm52584385ab.30.2024.09.21.23.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 23:27:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 00:27:33 -0600
Message-Id: <20240922062733.965645-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726986455; x=1727591255; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JdfX20vcnVWtiwalqEouP8BxOcoyJeI7QKS84CwrAyw=;
 b=V79WeAu+M1DAt3tC4vExYNNkDaesXKg5tTVngtjjJsR9TujXTsvP/HzpA7LhE2ikdC
 ZmQ+QOq6U3rNvzUbJSysO1ZaRrVcy2TnO3xgkGUNGzxZvnh7fPjyemfRx2JRB/XE8tSI
 nGUPuJujPURZr0ALK2Buzf7BzCwiK4HRAFhuNrJz5edxhUMthQMNXHAcg7sfYToLKLgb
 kz1xXogAMqcCBkFFxdHwyYPNKVowZfsV1/vij7NcorJCmIUUONE9JzX+Cp0zWCV7kukU
 Jtoo69phJiA5zpoEd0/Nt1wVOox6+zjzoVwpCJn/wzfh7uaal4xIUOEu5l+RRV618A/Z
 rvow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V79WeAu+
Subject: [Buildroot] [PATCH 1/1] package/python-weasyprint: bump to version
 62.3
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
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index c22677cad0..01a3488739 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  2cb135e7c5318bb1652205035f083922  weasyprint-59.0.tar.gz
-sha256  223a76636b3744eaa4ab8a2885f50cf46cf8ebb1acb99b5276d02feccf507492  weasyprint-59.0.tar.gz
+md5  4d3fd0b160d17d5cb36c2f2c1c231723  weasyprint-62.3.tar.gz
+sha256  8d8680d732f7fa0fcbc587692a5a5cb095c3525627066918d6e203cbf42b7fcd  weasyprint-62.3.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index a1e3d23b75..06f41fcfb8 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 59.0
+PYTHON_WEASYPRINT_VERSION = 62.3
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/1d/69/11343bbb46d4f2a311677058e19cc2f7bc55a769b64c547a64ea1e2b6045
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/fd/22/2d76310cd2ea5bbf03c691a08d48626f49853b7261a51bbdc0f834d746ca
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
