Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7400CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 21:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C6E8416A6;
	Sat, 23 Jul 2022 21:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C6E8416A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfGqKrnI7SXF; Sat, 23 Jul 2022 21:05:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23C5F4049B;
	Sat, 23 Jul 2022 21:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23C5F4049B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D53071BF419
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC68660FFC
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC68660FFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vvzb52XyxVnh for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 21:05:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89FA660FB9
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89FA660FB9
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 21:05:27 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 r188-20020a1c44c5000000b003a34ac64bdfso180581wma.1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C+y7To/QTp9XgeMD6uDyZlmbVXfkQCTv09woJy3PyR0=;
 b=NaDf5qMHGQ2g7mgtzSQ6LAR2XAY8d5nGPiKiSPIbJOid9dXV9cvkcHsZv24AU6iXYE
 VQ2BCV6Wk+rajB8GlI5eEd8D0SmH7t2/9hrCiF+zHFedO1P/6NcWyFXzuZarsV4cYEO6
 2CdYnI88nq/U2/gJzVzcnB3pVl9Bi64CPWyC04witOCOCFzOlyM9iCe8w0w752pivosv
 RY3qbdiFi6CxDFLAe1bEMQg8NxKZAOpaAtL96pG1P2PJEjVs1Loq2ZktbGVsxnv/1F1V
 xUZ4vchvOCgsPvOA5Hdm2f27NbFml3xupm96hQTMaa/aJ9OFgzaXSJ654EIIOBEaoghM
 jOpA==
X-Gm-Message-State: AJIora84MWhWpwVkwGaeguWLBlMi9yDvXs8zV351/xCBsKYuM60vXHf/
 Cew/iNu9h7b8R/HDY/kskz7zCaOt5edanQ==
X-Google-Smtp-Source: AGRyM1teeofjXenQqH9Jv8wShjvhL4KzgypP6Q/Z4T4RqvMp+XGumocz0WwWGTTOpz5wzfJs8Qw4Qg==
X-Received: by 2002:a05:600c:2652:b0:3a3:2a3e:a2de with SMTP id
 18-20020a05600c265200b003a32a3ea2demr15364021wmy.174.1658610325438; 
 Sat, 23 Jul 2022 14:05:25 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 bn1-20020a056000060100b0021e71894692sm2418442wrb.91.2022.07.23.14.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 14:05:25 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 23:05:23 +0200
Message-Id: <20220723210523.293598-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C+y7To/QTp9XgeMD6uDyZlmbVXfkQCTv09woJy3PyR0=;
 b=S5k6lrkWD7SU+Y4pONERTa62vcFwivqgCjAOsFRzVNBIxiMAhywr80vYzsqsOyvrDz
 4U/VR4SOZ+/JtRyskrJYr/2aUod+28A8zwhTzxPDOQOgzpS27QxUDWBygakimUFjbH/q
 1OHWYuohDOgjNIjtatS8bgxi+b+DCjAJgrGZftRz8GiKV8cWF04AVK3Tksr3JVLsbmZl
 MvE4S+54spusSFCxAc7DiUFQi9FaYJFmpf0mifcgJeh0BhYkGXcAboA+tCw/+/gTuJLW
 JX1+DrriNYFwLrfyUzCwUwPgD79zEJ8ncIe5m91niSYM/lIfjjsd2l2800dj/ToKeTTN
 +Szw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=S5k6lrkW
Subject: [Buildroot] [PATCH] package/mender: remove single hyphen command (2)
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
Cc: Romain Naour <romain.naour@smile.fr>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Single hyphen commands has been removed since Mender 3.0.0 [1]

The hyphen was added back while fixing check-pkg and shellcheck warnings [2]

[1] https://github.com/mendersoftware/mender/commit/fd838ec1b08f3d429b1d81607e9c35a87a104ee6
[2] 0b350cf7569005d3eec6bb55a3acd4688d2fbd4e

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Adam Duskett <aduskett@gmail.com>
---
We still have a patch adding a simple Mender runtime testing that would
catch such issue:

http://patchwork.ozlabs.org/project/buildroot/patch/20220106144301.1022644-1-romain.naour@smile.fr/
---
 package/mender/S42mender | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender/S42mender b/package/mender/S42mender
index 29008beca0..0f2077d089 100644
--- a/package/mender/S42mender
+++ b/package/mender/S42mender
@@ -5,7 +5,7 @@
 DAEMON="mender"
 DAEMON_PATH="/usr/bin/mender"
 PIDFILE="/var/run/${DAEMON}.pid"
-DAEMON_ARGS="-daemon"
+DAEMON_ARGS="daemon"
 
 start() {
 	# If /var/lib/mender is a symlink to /var/run/mender, and
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
