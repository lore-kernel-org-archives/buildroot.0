Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73861C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 08:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DCCD81D7D;
	Sun, 24 Apr 2022 08:47:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rX5rbAnA-YQ7; Sun, 24 Apr 2022 08:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18AF081D24;
	Sun, 24 Apr 2022 08:47:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64DDE1BF3C1
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 08:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51EE6410B1
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 08:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1qiN1iTVa13 for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 08:47:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07B3040935
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 08:47:48 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id x18so16837393wrc.0
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 01:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AdlTzgeywAV0rlndYH0dWBXNC908TDCwi8R0S6VJfvM=;
 b=T7dDVq6f4xSRbalwDCkXnzrob0rVeCXzvm8pXYjNpwYQYF354RsBWeV+LX2XNV3kmc
 PbExJXaxjFkgA3/jULhuJyc/sI7QskalwqyY++2IGfVqj96QiekKPtgl6Oe5fta4t5Xb
 XFaNSfwdijJQJ9d/LmT710Wl6C2Xzx5bZhulJZxATXihLt3OazgTVW9C9mhvBVskGAmX
 6btsaOfhdwob99yB8pJXWfxJ4ZPYw4qm7VZicodz4c43tQHesIdvNtaWN+npYyR6BGZs
 FOW07I2docq/zWKx9I/k+QpUg5OqbvJhbhIbZ6q6KBrc6e4+Ww5wDwX6vx9idpI4lH7s
 2x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AdlTzgeywAV0rlndYH0dWBXNC908TDCwi8R0S6VJfvM=;
 b=K8/omsNH7tMRqWQv2RMKpnFp9vqdJIAnre74+MJx4TVGZwfMnVhO4d7VGx75TBIPV5
 +oPB0RAcmkuccOZv5yTcO9oTXIrn3I9onRpZ7Y5zwmb/CLVWc4K6Chw+HousdD5e3wXd
 GyaU4/CDRSKyUVmu3/gR/ipVTCmEFnxWA0MGJ+O84NyvDEkybAS2d7nXuXs+V3HG8J64
 sy7K8cqivqmJWLA2SVDkXvEkAekwoCA+xiBIFVxiPgE3a0sJ4NtGK6mpmwlwM14rHM2y
 MeBlCfUTaZ3yjiGHQxRxDb1YCtE8f5alNPV7skiVWhYEBnAI+YsA5gUVwLFYuBoaupRw
 yUJQ==
X-Gm-Message-State: AOAM533YAkHq/R3Tyq1xnb1rMHgQlRsbIxfPDJex2Yt05E7tg7XUkozJ
 qE2gq+j5La8Sute7eAnLOqvu8/7QL+E=
X-Google-Smtp-Source: ABdhPJxygGwdXaTQ1fp/b/uQaKZ5cZA7jViyYGXdp0tFAbpgLQnST4y8qh/4DnAAXfGIiQRZ9PWJxw==
X-Received: by 2002:a5d:5942:0:b0:207:9abd:792a with SMTP id
 e2-20020a5d5942000000b002079abd792amr10191290wri.118.1650790066895; 
 Sun, 24 Apr 2022 01:47:46 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r184-20020a1c2bc1000000b00392af6f0ab0sm5796967wmr.18.2022.04.24.01.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 01:47:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 10:45:38 +0200
Message-Id: <20220424084538.2740476-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/omniorb: fix openssl build
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add host-pkgconf dependency to fix the following build failure with
openssl raised since commit 9d519412d65e13e4a7ffbb83edd8d1e4b2dfe4b7:

/nvmedata/autobuild/instance-25/output-1/per-package/omniorb/host/bin/m68k-buildroot-linux-uclibc-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -Wall -Wno-unused -fexceptions  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I.. -I./.. -I../../../../../include/omniORB4/internal -I../../../../../include/omniORB4/internal -D_OMNIORB_SSL_LIBRARY -D__OMNIORB4__ -I../../../../../stub -D_REENTRANT -I/usr/include -I. -I. -I../../../../../include -I../../../../../include -D__OSVERSION__=2 -D__linux__ -D__m68k__ -o static/sslActive.o sslActive.cc
m68k-buildroot-linux-uclibc-g++: WARNING: unsafe header/library path used in cross-compilation: '-I/usr/include'
In file included from /usr/include/stdlib.h:55,
                 from /usr/include/openssl/crypto.h:14,
                 from /usr/include/openssl/bio.h:20,
                 from /usr/include/openssl/ssl.h:18,
                 from ../../../../../include/omniORB4/sslContext.h:48,
                 from sslActive.cc:32:
/usr/include/bits/floatn.h:75:70: error: unknown machine mode '__TC__'
   75 | typedef _Complex float __cfloat128 __attribute__ ((__mode__ (__TC__)));
      |

Fixes:
 - http://autobuild.buildroot.org/results/47b1906eb7dd122a81191d14ad663c5931cbfade

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/omniorb/omniorb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index b44ec53fd5..d6434735cf 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -25,7 +25,7 @@ HOST_OMNIORB_CONF_OPTS += --disable-longdouble
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OMNIORB_CONF_OPTS += --with-openssl
-OMNIORB_DEPENDENCIES += openssl
+OMNIORB_DEPENDENCIES += host-pkgconf openssl
 else
 OMNIORB_CONF_OPTS += --without-openssl
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
