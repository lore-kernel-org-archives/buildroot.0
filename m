Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05EAC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 18:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56AF6409F5;
	Wed,  9 Mar 2022 18:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vSPFWygdjpia; Wed,  9 Mar 2022 18:00:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42828404FC;
	Wed,  9 Mar 2022 18:00:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CAD8E1BF287
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 18:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C76C260D61
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 18:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9E2-M3Zn0bXm for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 18:00:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6946060B14
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 18:00:17 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e24so4279710wrc.10
 for <buildroot@buildroot.org>; Wed, 09 Mar 2022 10:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3KL9ZxMjtFwPQheS9wtpO9C03789ZrvNPgoltiMNqVA=;
 b=MHhzXmAQ6tLquCTMz8rieR9VXcc5kejHy/OtMAzZLWIvAjFL2uC9RdpcOjo/On/5l/
 LQV1mR9QkwbryZ5GJWAGkfOUtAspUHwesGi9D47x8UeBzGIjo+MilWWY7HzS0IEVJuTZ
 tpBNvA41u1FwgGhlsBoqkmI6Vm2toIygyIwzkTAPVBdVxtqz83bR9zQwvqSYS1qaMLPs
 r2K+IWcD5KHpeqnRMbjUKean/+MXsK8NL4MW9RjIok3F7cZX9Be3H64ehNOp+hBIyPMx
 7bSOWTfWrzFlo9X6vtxckwwOhuSi+FNEerMsyMU3ShW0Fmud3pZ9WMPzBLkGXNr3Yrdo
 va8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3KL9ZxMjtFwPQheS9wtpO9C03789ZrvNPgoltiMNqVA=;
 b=NavtJWUeV6kfsFIpPg00sQtNvKgjyeIqLAdVzNKtEc6OMG3FLLQMDx081ecVBf5uiH
 Ic10zKIPZcmGmKegpcIiyqAS8L12sRgcEtXjmW/nH/ogBZ+ABP7ckc9btxqGdZOjuCns
 mSu+Rm0r73z6iMT+Lhxf4wmLmT/p5zDYAoWlzgHOc//Q/WJsIaDag/GLMYG5a/hoJZZY
 gvkNnT1XH4UybyNFvFL0AZ5NsG2+bpc2N3CkmKQcRnkMbNodJ6LCNIzrsdphovIXx7K3
 pHu4yHXbyb3EJ3H4CWBCAHWGZ6bfCYcrCvYovzZITH55TX+B62/wFl1xFTaEV1s3J8uE
 CX8g==
X-Gm-Message-State: AOAM533BUEvx19DTX0CSUUJ9sSnro/64WHYY7cKal4dGxZlHuy8ngM2H
 idjKocmLQ+ldJP2TeM0ieaN3ZBekN3I=
X-Google-Smtp-Source: ABdhPJyfTFmdGKwp3WY26Gb5eZ87VS2HdMh+NJisVkue3dH898fhfZsvLRkCykLkUAv9aL+6fsumww==
X-Received: by 2002:adf:ebd0:0:b0:1e3:f9b:7b77 with SMTP id
 v16-20020adfebd0000000b001e30f9b7b77mr580116wrn.691.1646848815485; 
 Wed, 09 Mar 2022 10:00:15 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a05600c4e4100b00389cb5ab3bcsm3318318wmq.32.2022.03.09.10.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 10:00:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 18:59:31 +0100
Message-Id: <20220309175931.538771-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/ola: drop autoreconf
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OLA_AUTORECONF has been set since re-introduction of package in commit
16ff948444c3978d63f483344a3d92d994c64312 but it is not needed as no
patches are touching Makefile.am or ola.m4 anymore

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix typo in title

 package/ola/ola.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 5090076175..1874350784 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -9,7 +9,6 @@ OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VE
 OLA_LICENSE = LGPL-2.1+ (libola, libolacommon, Python bindings), GPL-2.0+ (libolaserver, olad, Python examples and tests)
 OLA_LICENSE_FILES = COPYING GPL LGPL LICENCE
 OLA_INSTALL_STAGING = YES
-OLA_AUTORECONF = YES
 
 # util-linux provides uuid lib
 OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex host-ola
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
