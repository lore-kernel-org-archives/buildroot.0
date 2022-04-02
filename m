Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D536C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 08:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AFDE4018B;
	Sat,  2 Apr 2022 08:53:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8xLyo4nnnWz; Sat,  2 Apr 2022 08:53:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A90E400F8;
	Sat,  2 Apr 2022 08:53:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8001BF42C
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 08:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F9E881773
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 08:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sBgM6lZI7AHg for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 08:53:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64AD381699
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 08:53:40 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id c7so7373584wrd.0
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 01:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mSFMy2U4jSeoB6KU3t5L1+x7BoWa6AbbUiQ0TCK6hnc=;
 b=T/2lFxiBdTGt11bxg6jTjiYrYPsacBbszvKzZXP9vMJO0uh76EdnvVwQtNNhqGy/GI
 GFvlVm6AK5kmuJy+U+dj81vUf8et4Xw4Okz42oYXHq49wnk9pc22GpM0l9ii5+KFYDSy
 isc/dtGN3KNIawrQrk7uG4ZOueJIOg3r9utJmI0HGhPxjDRZYlKoqkmFCR6jn1FZRvdU
 tSnzOVE8R/QCxSSOFiA+WJk+6rrD8mACgLEww6t8iYeN2eri+DH6yYfTKtvcJ2+pABjk
 CjOQaOFyApxZHrck3zl6AYCRPQiQhiQ1QUoMOkCffQrSFEudnS9BFGCTe/TjSlBjsyR+
 U9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mSFMy2U4jSeoB6KU3t5L1+x7BoWa6AbbUiQ0TCK6hnc=;
 b=T4s76MTdYdkQKw/VF5MxICzTuWbXuGDqIAjDSzRtlPi5lxKMExQOTOWqJVbK92RAdy
 SAsX76mgmOCE3nHtQpb1jMBBbcGu6feEmBRyzWCrapto9kOw2N77WvesVXmp8xf/QStm
 ciSvJbFQF/GUNbaAAWFuoTnaRPkQDPMV0JYpigdsZX1La1bQFhKVepTupZvVuUYURabs
 mN+RjPLw6j3ZlObGbWpl50Xkgz2ft6S2669Pz0Du7hUWOUrUjaUXubO/GmIPHXHlx8RU
 dxpwawGDUD1I3Fjs1y7XDSlQinhHEkSQL516jcZ1Ep9GJdh9iVvGKqAhfstyj5Ckj0f4
 IslA==
X-Gm-Message-State: AOAM533a/HAce31Y7SIlsokq1jUu3ptlmZ4ciIjhAnUGmyzLKqGXwbzF
 n1qTXXDNjemkXyqkv2tLCM0EsPRHLZw=
X-Google-Smtp-Source: ABdhPJzgHvwTnDonJ6UiSQLzgse7N8vJSfG9L9DR2K7kL3spBhbHofQnjHrPc5qMzRY7X7+Y8FRVxg==
X-Received: by 2002:a05:6000:10cd:b0:203:d869:58e6 with SMTP id
 b13-20020a05600010cd00b00203d86958e6mr10458573wrx.683.1648889618424; 
 Sat, 02 Apr 2022 01:53:38 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 7-20020a05600c028700b0038cc9bfe6a4sm3726914wmk.37.2022.04.02.01.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 01:53:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Apr 2022 10:51:36 +0200
Message-Id: <20220402085136.1685563-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/quazip: bump to version 1.2
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of COPYING which has been "clearly marked" as the definitive
license source:
https://github.com/stachenov/quazip/commit/0d1aedb0fba343a196c124541b4d6938b16cf6ee

https://github.com/stachenov/quazip/releases/tag/v1.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/quazip/quazip.hash | 4 ++--
 package/quazip/quazip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
index 5eff5cfb3d..bcb16acdc0 100644
--- a/package/quazip/quazip.hash
+++ b/package/quazip/quazip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  54edce9c11371762bd4f0003c2937b5d8806a2752dd9c0fd9085e90792612ad0  quazip-1.1.tar.gz
-sha256  3aab586a5bdc8ffbbf033c7106550fd3e849fd8888e33cbc9bfd30a433c4b1cb  COPYING
+sha256  2dfb911d6b27545de0b98798d967c40430312377e6ade57096d6ec80c720cb61  quazip-1.2.tar.gz
+sha256  b455b21b0d31d6e51993f1fb7e0694c75fa0eb0519a9ea62e4815fcf48b140b0  COPYING
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 44645ec9b9..7731e59d94 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAZIP_VERSION = 1.1
+QUAZIP_VERSION = 1.2
 QUAZIP_SITE = $(call github,stachenov,quazip,v$(QUAZIP_VERSION))
 QUAZIP_INSTALL_STAGING = YES
 QUAZIP_DEPENDENCIES = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
