Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E306C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 20:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44F5060F11;
	Tue, 22 Feb 2022 20:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZjLAdMuATqn; Tue, 22 Feb 2022 20:41:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3866860F05;
	Tue, 22 Feb 2022 20:41:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D5F31BF33C
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 20:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5878740998
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 20:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ScRjNd1EvV86 for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 20:41:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F33640994
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 20:41:44 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 n13-20020a05600c3b8d00b0037bff8a24ebso59700wms.4
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 12:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8TO1zWwGf4hMOX5BmHHq33Rz8/VYB7bfkmnrY8hqyWs=;
 b=VDfA4gY54Jk/59fQIuqRG/R+SCg06M9eouSnEY1XKJzYin70w329MaWoq3U0P0mbiC
 zOuRMjvcBXXzpB/RdKzhAZ21N7463nMH53ojg1fVwNlG85FvUp1lJ9Vb56GRI/75yVnc
 OOoxvpPV2LsGm3pL/4BVGruRtKNGoDjTsX1JjxVm4T7pGJHvZccfhHJmoOXOfIpWgLjC
 dkqK0WXyORB5o/sKUEiUQ2PVU4nw7XdPT/XFSAqWCifOy80RswLML8yRFRwz//AE2T5R
 VBtBLQk5iUNihF59zOsUl4pMOQV/+SxV2M+64bMdooiYD/W7iBueJ0iSn3AvarKClDXq
 4fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8TO1zWwGf4hMOX5BmHHq33Rz8/VYB7bfkmnrY8hqyWs=;
 b=NNd0oaC4Uxa4PkmbIHPQ3wguJq5tEaNGa4qQweb3ZRBiu24fXN7TUSkUt8LcwNPPOJ
 C5op9TA7PvHQ9nq2QF6bOlB9Iih8sJnIP3poJ8ctlnpLlN7tjxzdg0MtLUSwE9Q/qNCS
 z4TaRRCHRug+cnOCz2VUlam9PttfVBGdDpIRx9FUaP1l8c0tnsG7g3OYtLwBV6tl2Xoj
 XRQYna3oYKMmuj/fNQPUwztx3ulgvgUI3TeEyf8r9uXCinr/4X+ip0Qn/qwsfWDUXVaC
 ZoVDorVGraoD5QIXNArlb/PQIqRiN+4pmV8roiv3DV/1XxYuWnVbWDX1MhtFUEFJI5Az
 k21Q==
X-Gm-Message-State: AOAM5312IBqHpsMiIINtPIbefNqnrsSVDx1RzFqKjCsU9BVFEcyAFpO6
 pTWaSTgmMa0jgO4nuln1rOLDhoQLrDU=
X-Google-Smtp-Source: ABdhPJySHjXaIqptjr/gzNGx8OZtQpnPCg2ZY1zyd8PhXmAljN4YMGNKjNbrjOYC21MDooNVn6Jt/g==
X-Received: by 2002:a7b:c955:0:b0:353:41b:cee1 with SMTP id
 i21-20020a7bc955000000b00353041bcee1mr4859742wml.18.1645562502598; 
 Tue, 22 Feb 2022 12:41:42 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id h2sm3213066wmm.27.2022.02.22.12.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 12:41:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 21:40:34 +0100
Message-Id: <20220222204034.3139362-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freerdp: security bump to version
 2.6.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

2.6.0 is an maintenance and security release.

https://github.com/FreeRDP/FreeRDP/releases/tag/2.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index e31b8d5b96..780061bdbb 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.5.0.tar.gz.sha256
-sha256  0fd9396068cda8e6d884d063a4993001f140f46c36464ccae261b9475050cd2b  freerdp-2.5.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.6.0.tar.gz.sha256
+sha256  a4ba0a75e30ed25fffc4cd4e89d0eb92e66894caeb6c78dc5e23b6b7c04f60fe  freerdp-2.6.0.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index c536f6cb1c..edbfb6801a 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.5.0
+FREERDP_VERSION = 2.6.0
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
