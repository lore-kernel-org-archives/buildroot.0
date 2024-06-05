Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEB2C27C53
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 14:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0C88605CC;
	Wed,  5 Jun 2024 14:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ua6vuBbG1pe9; Wed,  5 Jun 2024 14:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7762611DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7762611DE;
	Wed,  5 Jun 2024 14:18:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B8EA1BF23C
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EAFF61125
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TlXHVUPDvKn for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 14:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 56B6061034
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56B6061034
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56B6061034
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 14:18:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4213b94b7e7so6211805e9.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 07:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717597100; x=1718201900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vW4DRTSI0BWEtGbLD4robrFLCZfxpaSCOavddTcgAqA=;
 b=Q+4kaL31Y0jkOv+znn9TWVjnXR5P/KaeCoBUmJlH3iiAUgnpW4W9452E25q84S9X+C
 ZyakJB2XbgXP38UfZFOfR6w2ubMuY2VUoXztyjyeabjS8EbEE0//Yu1+PZfSCo2PK+qr
 ZI5st8wH8kv/VPyuFBlwxZ7fC22zTBCVcX59EXTNL291u+RSnuM61b4q/m67rK8/UbcD
 Yi1bIPlBUm5BzhkFHwLbyQD1D1wb2Jnka6zx86FvbsafZvv2JSE9lsGO3WatlHQxif3i
 +8EcvDBrYrgsjV9Tc50MMdprDQC93isSF4TjAuVrPBrx8ltH65Ruy7kIaV9lzSuliCY8
 1YbA==
X-Gm-Message-State: AOJu0YzHNNQI1prgleNyGBHAHFGir1gaJLMe3XSJW+B5B0Brd3W6o0uz
 6uFX9oBTBXPHyhwngn4PP3QWbA3c+UglA/FIAk6zaaIJOlqnayua35Iipg==
X-Google-Smtp-Source: AGHT+IHWlUVmhrhfr7+KeQP+JIKU1I5U1IA67oQbTqqM5Ns6lc+pA+7Cm97juWj0ebSDMAPOpIZD3Q==
X-Received: by 2002:a05:600c:5104:b0:41b:d6ca:eefa with SMTP id
 5b1f17b1804b1-42156337a76mr24687555e9.16.1717597100213; 
 Wed, 05 Jun 2024 07:18:20 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158149057sm24253925e9.36.2024.06.05.07.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 07:18:20 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 16:18:14 +0200
Message-ID: <22d94a4c664c0b69d7467400c9a78bcff51c51d1.1717597094.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717597094.git.yann.morin.1998@free.fr>
References: <cover.1717597094.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717597100; x=1718201900; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vW4DRTSI0BWEtGbLD4robrFLCZfxpaSCOavddTcgAqA=;
 b=iwDKSnvk/ptsYX7IjSPMQVjjjHViAnSlMKH2Yd3qOLJvTBJ9GtRyWdSSPSPQp3e2dB
 FqgzgD5Y3I+0PDKluKHFbu0OFTGonTpoaNkQ2VO6J1vvsJesIshwR+JNqQ7TAGHmJdHf
 iZELkAe/DntAvNDjSUPZJbpUxWTks4UbSJCgRcj6S3sY0Xbp8VQUgLh+VvI+u5kBsnku
 zQfnp+8pUxzOclGX/5KGnNb/lEuUmTuwMxhz4TQjiCZIUflPKku8IuOIQRlrgS1H1PDD
 qIk45qv1+GeVKJyCiKjvD/WeuScFTPKyewQDzcm/kH4Eq7qAAEwkf13vYXgZRgnm90Lt
 4KXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iwDKSnvk
Subject: [Buildroot] [PATCH 6/9] support/download/cvs: fix shellcheck
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore  | 1 -
 support/download/cvs | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8825d644ab..f8c5837e0a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1653,7 +1653,6 @@ support/dependencies/check-host-xzcat.sh Shellcheck
 support/dependencies/dependencies.sh Shellcheck
 support/download/bzr Shellcheck lib_shellscript.ConsecutiveEmptyLines
 support/download/cargo-post-process Shellcheck
-support/download/cvs Shellcheck
 support/download/dl-wrapper Shellcheck
 support/download/file Shellcheck
 support/download/go-post-process Shellcheck
diff --git a/support/download/cvs b/support/download/cvs
index 0c079e2403..b771caf280 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -40,12 +40,13 @@ shift $((OPTIND-1)) # Get rid of our options
 # 10 minutes should do the trick.
 _cvs() {
     if [ -z "${quiet}" ]; then
-        printf '%s ' timeout 10m ${CVS} "${@}"; printf '\n'
+        printf '%s ' timeout 10m "${CVS}" "${@}"; printf '\n'
     fi
     _plain_cvs "$@"
 }
 # Note: please keep command below aligned with what is printed above
 _plain_cvs() {
+    # shellcheck disable=SC2086  # We really want word splitting in CVS
     eval timeout 10m ${CVS} "${@}"
 }
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
