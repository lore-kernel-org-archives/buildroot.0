Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49324C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 11:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E800B84391;
	Thu, 10 Mar 2022 11:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HI21Occm4889; Thu, 10 Mar 2022 11:41:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F12698438C;
	Thu, 10 Mar 2022 11:41:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BBE9F1BF868
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA8088438C
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:40:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ES7PvW3dzPVD for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 11:40:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F33584374
 for <buildroot@busybox.net>; Thu, 10 Mar 2022 11:40:56 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 l1-20020a05600c4f0100b00389645443d2so3209784wmq.2
 for <buildroot@busybox.net>; Thu, 10 Mar 2022 03:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=35Fmc7jv5JBkbqukiHtq0uiXu4UOUcT068rmdi1qS7o=;
 b=lXN3fTJWm1ZPrFT6XqHgluBeaoGgUKMmIxuQoNti8OwzPDQzBiuhu+KXRSONhFO2qB
 TA9SRXplRXkspc/D4bjnZpg4C8bD2BertLd0VxuL52uZFSldV8wF4Fr7uln33Ct5vgif
 zG8jAFouhxh2NpR1zzY9wLIJIgQDTCvQ2u8OSk2MI/MEX90gW0BUUOMdSsxC57s33jX1
 ydCZpExrvPCnS/ZE2oOzISRu0gxB5YIXQXqvaN7ALRTDy1BwOEY0ljoAOR9gqJMvzlxu
 3E0juFVvHJyT7SXZUgbv426wAk8JACltVIZG4vClWx6BHxh+VeEEwISGCaEqDAnrTgaa
 IWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=35Fmc7jv5JBkbqukiHtq0uiXu4UOUcT068rmdi1qS7o=;
 b=gMQMPrQQGuO9prVnog3uxxeRb4KcIRE9h4Y2qo94QxmT4EOcaTfqiXWr6+9EpHWq2g
 Yry71lPHr/C3EYm8U0hsYjnFF7mx3WTfaG4UzFmHbaOlpOgXn/wCgCPNPJVpw1JTZtlM
 BYeLY6VO7+Tpfjya6r7LnohBiG2YqThJ6V+1+qfG/NjKvFjwoyxJY2Vuv59tIk0Gjdy7
 eH0booSO34QIK6A6cXQ255TOuPmWr0JtL84NlOwwlTALJaugGzlV63jVOEbTnXlLIMqS
 y2o/pwIlJwFVzCNcQYIMxoJCCQBPLCToveMAWam8Tun/bIOldWgvooLaI01veAO5qbhz
 B0Pg==
X-Gm-Message-State: AOAM533w3wRYJQUVxgBkcTZOghQK0Zc+cPRwG+wE989g1a3WmAAHM/Iv
 yRDpeQmC3e9eSpEVzeGweMdC0oWcIOk=
X-Google-Smtp-Source: ABdhPJylT9IyT3qgoqhmEgPTe6UilMDoONQWGVlc4pw9WPNwasuVlYNpH58CtlTmEMo6q1SbQtOKDg==
X-Received: by 2002:a1c:f413:0:b0:37b:d1de:5762 with SMTP id
 z19-20020a1cf413000000b0037bd1de5762mr3255516wma.108.1646912454264; 
 Thu, 10 Mar 2022 03:40:54 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 y10-20020adfee0a000000b001f0639001ffsm5985923wrn.9.2022.03.10.03.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:40:53 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu, 10 Mar 2022 12:40:47 +0100
Message-Id: <20220310114047.919725-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libgcrypt: bump to version 1.10.0
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
 .../0001-configure.ac-add-an-option-to-disable-tests.patch  | 2 +-
 package/libgcrypt/libgcrypt.hash                            | 6 ++----
 package/libgcrypt/libgcrypt.mk                              | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
index 4ef02fba6..e32f93863 100644
--- a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
+++ b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
@@ -44,7 +44,7 @@ diff --git a/configure.ac b/configure.ac
 index e8c8cd39..1a6b61e5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3198,6 +3198,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
+@@ -3230,6 +3230,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
  AM_CONDITIONAL([BUILD_DOC], [test "x$build_doc" != xno])
  
  
diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 23562d0ed..2ea4d74c2 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,7 +1,5 @@
-# From https://www.gnupg.org/download/integrity_check.html
-sha1  1bccc8393482fa1953323ff429c6b5ba5676eb1a  libgcrypt-1.9.4.tar.bz2
 # Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.9.4.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.0.tar.bz2.sig
 # using key 6DAA6E64A76D2840571B4902528897B826403ADA
-sha256  ea849c83a72454e3ed4267697e8ca03390aee972ab421e7df69dfe42b65caaf7  libgcrypt-1.9.4.tar.bz2
+sha256  6a00f5c05caa4c4acc120c46b63857da0d4ff61dc4b4b03933fa8d46013fae81  libgcrypt-1.10.0.tar.bz2
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index e5fdfcfc8..c6c88f607 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.9.4
+LIBGCRYPT_VERSION = 1.10.0
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
