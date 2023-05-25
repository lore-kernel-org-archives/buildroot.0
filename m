Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D54BC77B7E
	for <buildroot@archiver.kernel.org>; Thu, 25 May 2023 21:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AF8942C3D;
	Thu, 25 May 2023 21:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AF8942C3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MR5TyvuPWiXM; Thu, 25 May 2023 21:07:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFE9842C25;
	Thu, 25 May 2023 21:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFE9842C25
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFB341BF360
 for <buildroot@lists.busybox.net>; Thu, 25 May 2023 21:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7A7C42C25
 for <buildroot@lists.busybox.net>; Thu, 25 May 2023 21:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7A7C42C25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5q6I_Do9dY-p for <buildroot@lists.busybox.net>;
 Thu, 25 May 2023 21:07:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2020E40135
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2020E40135
 for <buildroot@buildroot.org>; Thu, 25 May 2023 21:07:26 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f603d4bc5bso686585e9.3
 for <buildroot@buildroot.org>; Thu, 25 May 2023 14:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685048845; x=1687640845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mF9zQfvA0qq0K1yrLJ13MWFE4csvwcMiB49JmlS+cl4=;
 b=lsR7fBJ3Tu894F7Or6ZoKVP9cvsiifL+QPsAqaMJ0Ouvd8KkxizrZv+97LXdl+oxEr
 ww3LoWBQpx0Q2dSSHP6Tjw2sMYzY/PccqFC+/ebQZGcR7rH7Off6lrZ+BNxp59LB5lkz
 xbvmPAl8TlI2zsIeVkJEjNwpww9yY3/25jYH5wbaIzmUPIAT1/c83fDVYz8WG2+HZPZl
 U7lW4Pj3OPuJlq2L3PLydO7gEL08z85DEZ7EfS7Gj92rHrNctsO2krzm2HOgebOkpYa3
 rmgkpddCVapDtikY3j/EKeClRHf61qy608A5Fdb5DknVweIsjg6FNoORHNsOHO2pITdn
 pkow==
X-Gm-Message-State: AC+VfDzgRJ91kbB11djEOUiYDSnkFw3yJt6CQby8h1b//JU6pZccdNnr
 R0aV42satIpnomYahr08pr6zCp3+WMbPx36/n7M=
X-Google-Smtp-Source: ACHHUZ6etDQHxDpmPD62XSWW2vMhi5w7CGtfz5X4ygYXpogR8X7i4BBqYyeycp9CqCh6K6iNGivbzA==
X-Received: by 2002:a5d:4b03:0:b0:30a:8c0b:3209 with SMTP id
 v3-20020a5d4b03000000b0030a8c0b3209mr3345064wrq.9.1685048845016; 
 Thu, 25 May 2023 14:07:25 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 o8-20020adfcf08000000b00306c5900c10sm2952866wrj.9.2023.05.25.14.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 14:07:24 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 25 May 2023 23:07:22 +0200
Message-Id: <20230525210722.1386181-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1685048845; x=1687640845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mF9zQfvA0qq0K1yrLJ13MWFE4csvwcMiB49JmlS+cl4=;
 b=pqOAPH3gbLfSImLaa2o7DZXkOQAiXiEJU3MQPG4Yx9h8kkPuw2CnOI54gyOrnGRn5S
 R6yXZ5S5JxONuOOPWwLsz6ruhxNduiR6A0am2ykbVpTqq9OV0oCUuIqi6dGKqXpbxEE+
 NbegFQqPFcr0sjZssQR9/HZsB+IqfcDeK0EnfaBH2sBEiyI2L+LGKvLRuGr6GGpqcXFB
 jam/cmx/T7hG8JkylSLLi0hxQm0F6f+dtJH4O3xnUYK1ATUMNF8hPOqnE/UauXXgkRe2
 MqbbKaZLns1a0ojXIqmDpvjxGttyrTBMVfSVvLuGTEdyf8pZJXNjlP5LucXekoyYXcTX
 QI9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=pqOAPH3g
Subject: [Buildroot] [PATCH] package/crudini: fix python 3.10 warning due to
 pipes import
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The TestCrudiniPy3 test fail due to a python 3.10 warning due to pipes
import in crudini.

Indeed, pipes is deprecated since python 3.10 and slated for removal
in python 3.13.

Backport an upstream patch fixing the warning.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819049

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../0001-prefer-shlex-over-pipes.patch        | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/crudini/0001-prefer-shlex-over-pipes.patch

diff --git a/package/crudini/0001-prefer-shlex-over-pipes.patch b/package/crudini/0001-prefer-shlex-over-pipes.patch
new file mode 100644
index 0000000000..16296f619f
--- /dev/null
+++ b/package/crudini/0001-prefer-shlex-over-pipes.patch
@@ -0,0 +1,41 @@
+From d81b703f3e8e29c1547386135c7e9ca539c1f054 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
+Date: Tue, 2 Aug 2022 14:40:37 +0100
+Subject: [PATCH] prefer shlex over pipes
+
+pipes is deprecated since python 3.10
+and slated for removal in python 3.13
+
+[Romain backport to 0.9.3]
+Upstream: https://github.com/pixelb/crudini/commit/e1650941054822faad4cda788bff6fe364eb4ca3
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ crudini | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/crudini b/crudini
+index 669596b..a136241 100755
+--- a/crudini
++++ b/crudini
+@@ -17,15 +17,17 @@ import getopt
+ import hashlib
+ import iniparse
+ import os
+-import pipes
++import re
+ import shutil
+ import string
+ import tempfile
+ 
+ if sys.version_info[0] >= 3:
++    import shlex as pipes
+     from io import StringIO
+     import configparser
+ else:
++    import pipes
+     from cStringIO import StringIO
+     import ConfigParser as configparser
+ 
+-- 
+2.34.3
+
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
