Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C317C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 22:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D222160B4C;
	Sat, 18 Dec 2021 22:36:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lP0NwAQ3dr8E; Sat, 18 Dec 2021 22:36:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3452960B45;
	Sat, 18 Dec 2021 22:36:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67C2A1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 570DB60B44
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jC0ztuNhhGaL for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 22:36:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EFDC60B42
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 22:36:03 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s1so6091632wra.6
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 14:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jVVKx6md/OrKH5ti9WHxVVqDVy/m+I+WY4usjBP8fSw=;
 b=JBSI+47RdWeFRbgKibmoHfFS8eLB1FMyXrr4acRRKZ/Zd/gzRQe9ENmb4yyUQJ5ndJ
 TtyJFkXwfaeSHXyr78uw+60XY4+UXnPzsIT9fKVECI84UskRS70ifE+segvQoHd8LyoD
 fS+6L9PpMJIHopNabkoxl/FDYpewQKWfTcBcUSPlebhuLAFG7tqZ+7d4G/JcPD7eVxE+
 xMBj/IsofSkb4FQqXJl3jMrPq2Bo9kLENvYKYtAdCbu9e2Y8WeckymJ2D/EmUk3Q7OXV
 fck/+UMTH/hYSKwXT68/AOiQ7PC1A9uwtcbSWv65W4MHIhOWFz+ldJv9zRcB7OV6sRY5
 GEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jVVKx6md/OrKH5ti9WHxVVqDVy/m+I+WY4usjBP8fSw=;
 b=OK4l2gS4F3OEa4wxPUM2QwiPjUV8BXj+dBSrM4RJ/5r3v+bhQ927Es80OTIwNugGsd
 toIgdCmYWT5yozavliuhraXIo8m36tNIsLKj1h93+uxb6KCJBKGZi4Gol1sLIAlB+gUw
 57KqtBVIrZ0ndmaas7a0kfW8xufiGqw7ErGF/GL+aw0i7jroytb4z4xeluJm9lvOu2Ch
 PxGCJuB+snQOdV0IQfR5iI5gfC24IozWHsZRvMjIhjyglSFrlZ0n4SooBtudCZsoVxG/
 FpSzBYBVvyrx4jq/VTqvHWWj0RFmjQdigBZJhpMqX63wRcsawoYib1dO+uye6Msj8EBd
 gjSg==
X-Gm-Message-State: AOAM532qfo+Rqxao+YgFV18HEcWPSJnRfDEy1mtGcKnPSdKqatJw/+JB
 0DueAMqrQiG43rZPnJ5dvMQVOxFjtDXZNQ==
X-Google-Smtp-Source: ABdhPJx4kmIfiVLZlcHY6tYqm1lpe1SorwdUfb2Bsgb+4clgekRGl1XlG3fkW4C8AlAOAHc8bw3QuQ==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr7252428wrz.666.1639866961579; 
 Sat, 18 Dec 2021 14:36:01 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id g13sm14561905wrd.57.2021.12.18.14.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 14:36:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 23:35:34 +0100
Message-Id: <20211218223534.578115-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libopenaptx: fix license
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Yunhao Tian <t123yh.xyz@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License is GPL-3.0+, not GPL-3.0 since the addition of the package in
commit 1e4050b2d0372e1b47b57cc4210e3da5cb8ec3de

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libopenaptx/libopenaptx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenaptx/libopenaptx.mk b/package/libopenaptx/libopenaptx.mk
index f768dca1db..49e89d871c 100644
--- a/package/libopenaptx/libopenaptx.mk
+++ b/package/libopenaptx/libopenaptx.mk
@@ -6,7 +6,7 @@
 
 LIBOPENAPTX_VERSION = 0.2.1
 LIBOPENAPTX_SITE = https://github.com/pali/libopenaptx/releases/download/$(LIBOPENAPTX_VERSION)
-LIBOPENAPTX_LICENSE = GPL-3.0
+LIBOPENAPTX_LICENSE = GPL-3.0+
 LIBOPENAPTX_LICENSE_FILES = COPYING
 LIBOPENAPTX_INSTALL_STAGING = YES
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
