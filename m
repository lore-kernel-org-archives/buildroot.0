Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F02C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 08:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EB0B40A88;
	Sun, 24 Apr 2022 08:21:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0A8HV1vLQJ84; Sun, 24 Apr 2022 08:21:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2046F402BC;
	Sun, 24 Apr 2022 08:21:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBA331BF3C1
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 08:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D85EF60692
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 08:21:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z63qrsJYWPWt for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 08:21:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82905605AD
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 08:21:46 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id b19so16713386wrh.11
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 01:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9uVIqcJAvtpL/4vZZGo5La8mmMpZ1PJy2LThDrZ/MrQ=;
 b=cBWj3jz7vmhwXsxq6aRQAHdy1p37P91aOmXYZG3oUuAYc6Z0isgOcfQTYDZaz/lFKE
 fjXKFgX6uBWKB7Sss36EyAZVI0vZ4YmrdLinMMzuJCHIC/w8dxwFumPsOLVY+lrOaWRv
 IeCrM+PfYcQuwgxpCByuaQSTzQXsRZq9Ows2uhMA8Td3kU5To9viA1Qoo5o95y3bjzUq
 XxkgJjJe2Y3gwgzgAcQQzk24pRNfJMjrraGSD3YqFPuxWZoKQBjAFhfNgcajW0/fnv26
 B4LFJVOnHpKMff8CWblhQYtjOXG5YeIHLnSzHqz2Fu+1XO7IpsKF7LB3oYHw7Rp+Z2zg
 /0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9uVIqcJAvtpL/4vZZGo5La8mmMpZ1PJy2LThDrZ/MrQ=;
 b=JG911hIdg2dmB0K+qaTEeID4BoSCb2+v2d2t6lapEj/Eq2PtlKyXTSLr77qpqB3Zou
 lJvE4kbo1c8y6u3+JaafV2ceqMa3q/lfMZ4psWwFBS+GKouErSUFHv9EUkRgifvVepdd
 gyIRuymA5Y70hrzst7Ya42x3jUzdu9cLy/XGtH38WvYkpCmSfPlOlLZmAcuxeG1Dt3tC
 5W9RMNRC6bFqzsPIH/ITkUxLbmTlZSjGLzPfp7zbmPZPS48goVU7VN6nTX0QY5EIcVEd
 pH1INmqby6BwyJ5790pEh55oaOgcusyn6bEe0PE4/xWes+fXumcbB3Q5TTmanpMO0HOS
 YboA==
X-Gm-Message-State: AOAM5337oH16kDylRNh8mjlKWF1tPpeZgv5McVar3smnUSOjJEmYM/1P
 QKj2Dvl+1v02zKDsfXarCkQct3e2Dm4=
X-Google-Smtp-Source: ABdhPJycOa2r7Bh18FgM1ozP1GrOQPNdrrgl+8oXeXDy/6eIFKeSX1JSUXLK4FkoJUNvI5+JDHJrag==
X-Received: by 2002:a5d:5311:0:b0:20a:d007:b499 with SMTP id
 e17-20020a5d5311000000b0020ad007b499mr5455587wrv.258.1650788504485; 
 Sun, 24 Apr 2022 01:21:44 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k65-20020a1ca144000000b003929a64ab63sm8888584wme.38.2022.04.24.01.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 01:21:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 10:19:03 +0200
Message-Id: <20220424081903.3535909-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qpdf: link with -latomic if needed
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Link with -latomic if needed to avoid the following build failure since
bump to version 10.5.0 in commit
b5352c2177011ca389cbb7c68e78447549cbdaaa and
https://github.com/qpdf/qpdf/commit/c5c1a028cdd3cf345046c46963fb0fdacfb2c33c:

/nvmedata/autobuild/instance-20/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-20/output-1/build/qpdf-10.5.0/libqpdf/build/.libs/libqpdf.a(QPDF.o): in function `QPDF::QPDF()':
QPDF.cc:(.text+0x4e44): undefined reference to `__atomic_fetch_add_8'

Fixes:
  - http://autobuild.buildroot.org/results/b69e6e380c47bc64c6555899c2f61f57bdae7ecc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qpdf/qpdf.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index 8e0769059d..a58781f4f1 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -32,4 +32,8 @@ else
 QPDF_CONF_OPTS += --disable-crypto-openssl
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+QPDF_CONF_ENV += LIBS=-latomic
+endif
+
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
