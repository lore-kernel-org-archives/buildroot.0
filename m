Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B27C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 07:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8431940A5D;
	Sun, 24 Apr 2022 07:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bYcGUqLHiNxC; Sun, 24 Apr 2022 07:20:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84281405FC;
	Sun, 24 Apr 2022 07:20:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 273991BF3C3
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 07:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15BF481AC1
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 07:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xUR28_yzx9fz for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 07:20:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBF3281A95
 for <buildroot@busybox.net>; Sun, 24 Apr 2022 07:20:42 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id x18so16688343wrc.0
 for <buildroot@busybox.net>; Sun, 24 Apr 2022 00:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ONzmKj1P9kdeExQC1SjgXhMTu0SIcuACHbbIkBIDstk=;
 b=AtYFySvMN6/K2FnixUAWNaHZhBIqtS2wCC3pannwID1tMVQdzub4Jo1qxPFlmLeuME
 JkZ935s/2vQ+xfGB5wMw4W4bDiyjsRVTm8tCApINlORzRkl494QOrvYZ0Ib4opqeEfer
 yQV/d9H4bkX/kM+F0ZP9UAkxX7Ove3qpUvEnaZWI7A2oI8GmtaaAicat1j3qRfgYhH8V
 OK1L+S8oYPUZxkaf1oFIzotzQtOto7x4GC57Z26B+YemuHcWDpUWFi26/RgCvwJ556yd
 mZXFUigXhHqlQFzlFOUtT5G8sFEVjKchzIcRKhP2jXVQiHBvzJKjlXKp9vc8NavNEKI5
 iy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ONzmKj1P9kdeExQC1SjgXhMTu0SIcuACHbbIkBIDstk=;
 b=1PIg8EDVQa+YB4u6Ys0jOEVzkgZGr3uNxl7uoKRZWVSEnIOHT/eg4Q0cLr4U0IFOHL
 eJap4KkCeVVddsx9s/4ATz4xXpDjZ6YRZatwPvHPK2rljHqiKPYEXLtLg07FzhhnM2fx
 s92vOnXzIpRgZmSD4uT3y7Zp35Ib6A2bSbD4ymGyqwouEuQV1Twhk0MAkCgRoQd3AGbe
 ubeHerqOPuMxlfqsIZy9iWsjmzVSrfr1GJEqSUoRCjkd5dhSPahc6fyqCa/G/wSPMiuw
 UuAc0eo3Jy21ZCMfxIsfSpFGd7U2W4SN6AWB43XiVzx6PEDwAXteGoVVqfSvBtzsFBeJ
 EaSg==
X-Gm-Message-State: AOAM530CRY3MB0INZKWBZ+04/9eRe3r+0BAHHYl0RumJox+LultdlvWW
 sJImCoIySTYL6XAo3lr38WQqQdQ3FmI=
X-Google-Smtp-Source: ABdhPJxCg5RfrnsU9LyCsko8JdE+6gTvmubkoPFq2b2Qc549/l+yOhUJLkM6Sfj5IXVBN6BHPKAmMw==
X-Received: by 2002:a05:6000:1d86:b0:20a:91e6:c2d0 with SMTP id
 bk6-20020a0560001d8600b0020a91e6c2d0mr9748246wrb.530.1650784840365; 
 Sun, 24 Apr 2022 00:20:40 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfeb8f000000b002060d26c211sm6197248wrn.114.2022.04.24.00.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 00:20:39 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 24 Apr 2022 09:20:16 +0200
Message-Id: <20220424072016.3459504-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libressl: bump to version 3.5.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch | 2 +-
 package/libressl/Config.in                                  | 2 ++
 package/libressl/libressl.hash                              | 2 +-
 package/libressl/libressl.mk                                | 2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
index 98fe250f6..1c59aec72 100644
--- a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
+++ b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
@@ -20,7 +20,7 @@ diff --git a/include/openssl/ssl.h b/include/openssl/ssl.h
 index 46f24b2ea..4048a6e63 100644
 --- a/include/openssl/ssl.h
 +++ b/include/openssl/ssl.h
-@@ -411,11 +411,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
+@@ -408,11 +408,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
  #define SSL_OP_NO_TLSv1					0x04000000L
  #define SSL_OP_NO_TLSv1_2				0x08000000L
  #define SSL_OP_NO_TLSv1_1				0x10000000L
diff --git a/package/libressl/Config.in b/package/libressl/Config.in
index 600829cb9..aa42c21a9 100644
--- a/package/libressl/Config.in
+++ b/package/libressl/Config.in
@@ -6,4 +6,6 @@ config BR2_PACKAGE_LIBRESSL_BIN
 	  Install the openssl binary to the target file system. This is
 	  a command line tool for doing various cryptographic stuff.
 
+	  https://www.libressl.org/
+
 endif
diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index e92399871..c3590798d 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  ff88bffe354818b3ccf545e3cafe454c5031c7a77217074f533271d63c37f08d  libressl-3.4.3.tar.gz
+sha256  56feab8e21c3fa6549f8b7d7511658b8e98518162838a795314732654adf3e5f  libressl-3.5.2.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 0bb468ced..c9c484d5d 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.4.3
+LIBRESSL_VERSION = 3.5.2
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
