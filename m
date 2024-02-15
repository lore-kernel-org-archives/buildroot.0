Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC766C4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 22:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8040A402D0;
	Thu, 15 Feb 2024 22:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7aechrvjRNO; Thu, 15 Feb 2024 22:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 225C4403A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 225C4403A9;
	Thu, 15 Feb 2024 22:48:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8EE861BF2BE
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 22:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B5AC403A9
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 22:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t2KMtjjq2pNH for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 22:48:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 356F2402D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 356F2402D0
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 356F2402D0
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 22:48:20 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-59a8ee08c23so468100eaf.2
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 14:48:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708037299; x=1708642099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=99oKWp0D8ncnPqQHHcs0BJcm3Nlm7X05DXaV6uUKUfE=;
 b=JB/e3c9B9UtjsaeeotWmUZWMPGhgrOcdWYMdY3d5YcguEm8mElfiFxS0AGd825RG9B
 LxVRCyqeNwHd05+reMlVW4DBoUsb9oAxuvRy+GyJglGZihNurMpjAg/G+G09bV4CWuyY
 jmUyvLNvFPN8QrhWdnPhN5DWs3X8mGW/pVqkPgx8HPillYhcepLSP+qmS5Spar/XU2hQ
 cHSYNPqRw1uBv756nXFnSZfHSaSiwU9n0clKlA3gPXjySLA+oVic41wumLVwsGjwSwhu
 HiA0HaCCT66oB//VKfQp+6fSEanI6FzuuZQOtzL7NzWYL4DbOMQAXtfst0j8uLqBZ4Lb
 Llzg==
X-Gm-Message-State: AOJu0Yzwgcj1V9vYzwRIUEynBlTmZ0q17mL2kKTd+fbYY6ZndsoOR9EB
 GjoJEU2tjo74+Q/lG1bElQzvxkRigexZ0k5bUgpm4nsaFGAV1PWUcVXOj5pfz1M=
X-Google-Smtp-Source: AGHT+IHvmaq+fViJvOMdZdfC2bcl0ps9tU+Me3YsK8t/4DpQwm0rCLgvDjxn+p5D2IQXwIgI+XutDw==
X-Received: by 2002:a05:6358:5f13:b0:176:520c:c6a with SMTP id
 y19-20020a0563585f1300b00176520c0c6amr3499952rwn.9.1708037299148; 
 Thu, 15 Feb 2024 14:48:19 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 l2-20020a656802000000b005dc2ca5b667sm1688950pgt.10.2024.02.15.14.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 14:48:18 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 14:46:14 -0800
Message-Id: <20240215224614.3028380-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708037299; x=1708642099; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=99oKWp0D8ncnPqQHHcs0BJcm3Nlm7X05DXaV6uUKUfE=;
 b=e+Ag4nYoWVh/lFj9/MY7lZn2M3Y1rlpVuJXVYVURw+YuPq70wrpLAlHONpRSKAC2a3
 jowxvkNGlNXM2RggzSXbKJhkJgC/LtfULzSidyJupEGmjweN73e3DBWoDfd+mLwHEOa6
 UV0kBIIv2tZXJMpxZuY5dzZ1S4pbZqk6+MfTr5TrE8IClmAPpIcB6yiJTxcnMlc0cGm6
 zLPBL/Jy4nQ7gwdw9fsW47TBrAcKY7BYcjWd/VPGMY7gpBvbRIYpSNsaLMgqBCj1Tp9N
 wxrzsF/ditp5+TE/LonT/16brrsELJy8ChM60zCf7AtuCvwhdOCIJrYTjY4fa0iTW/26
 f9NQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=e+Ag4nYo
Subject: [Buildroot] [PATCH 1/1] package/{libuv,
 uvw}: bump version to libuv 1.47.0 and uvw 3.3.0
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Kadambini Nema <kadambini.nema@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change Log : https://github.com/libuv/libuv/blob/v1.x/ChangeLog#L92
             https://github.com/skypjack/uvw/releases/tag/v3.3.0_libuv_v1.47

Build test results:
 libuv.config
   BR2_PACKAGE_LIBUV=y
   BR2_PACKAGE_UVW=y

$./utils/test-pkg -k -c libuv.uvw.config -p uvw -p libuv
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: SKIPPED
6 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 package/uvw/uvw.hash     | 4 ++--
 package/uvw/uvw.mk       | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 1fd286d9e9..3a2904f247 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  94f101111ef3209340d7f09c2aa150ddb4feabd2f9d87d47d9f5bded835b8094  libuv-v1.46.0-dist.tar.gz
+sha256  72a187104662b47f2a2b204da39d2acb05cf22a4fcb13ceaebe3b0ed0c0e2e43  libuv-v1.47.0-dist.tar.gz
 sha256  16de0c32b265cb7d46a6d3bd614f259dd4d693a5e26b3407b04aae8d73041f0c  LICENSE
 sha256  262c44bd2cdba037e6d2a82fba15f5800d292bc993a6f5d6b6ea487744d02836  LICENSE-extra
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 76316484e4..a794ac1c8a 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,7 +6,7 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.46.0
+LIBUV_VERSION = 1.47.0
 LIBUV_SOURCE = libuv-v$(LIBUV_VERSION)-dist.tar.gz
 LIBUV_SITE = https://dist.libuv.org/dist/v$(LIBUV_VERSION)
 LIBUV_DEPENDENCIES = host-pkgconf
diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
index 2dc6e879e1..3f237d00f2 100644
--- a/package/uvw/uvw.hash
+++ b/package/uvw/uvw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bd5aed741765950074b1ea2507291dce81e528abdf56c406991ad4a27d8d1714  uvw-3.2.0_libuv_v1.46.tar.gz
-sha256  e2a4062818ab05e2a0908737ad49b7c01202247364e900167ac81105de8713f3  LICENSE
+sha256  aabb17d3d8f0b3481b44e981c889dd4a2a6a3f1a96a4d01055e669f4b7d37d0e  uvw-3.3.0_libuv_v1.47.tar.gz
+sha256  5e439d0ad6e1b16f2f14023872c49cb2cf1b62a172c30b864cb45a5aa6533454  LICENSE
diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
index 12149d43ca..23e5060c34 100644
--- a/package/uvw/uvw.mk
+++ b/package/uvw/uvw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UVW_VERSION = 3.2.0_libuv_v1.46
+UVW_VERSION = 3.3.0_libuv_v1.47
 UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
 UVW_INSTALL_STAGING = YES
 UVW_INSTALL_TARGET = NO
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
