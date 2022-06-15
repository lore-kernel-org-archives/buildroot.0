Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77989C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 21:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1358F415FC;
	Wed, 15 Jun 2022 21:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ersoAIRqvKpl; Wed, 15 Jun 2022 21:03:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C6D841526;
	Wed, 15 Jun 2022 21:03:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DBB61BF356
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 21:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2743E404C0
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 21:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pm3bhUC07sAb for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 21:03:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3477440476
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 21:03:51 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u8so16884694wrm.13
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 14:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rFhP0oyY5+q+ggBv+YTzgM6SCWmV51JOjU7owgjD0YI=;
 b=A4OrpCNgxuBSWrxSfNPrU+7URDSe0aPxuAn+SXUBIvMtTIup8J/FlDK7rYc4etEoN1
 S+6aUjRIAhEScv39OmmSLRXduA7ZAwtkmoF4BpQAPdMhSVblDwLgtdlS1FVae94P3zJb
 j8zO/B9gJ2pl3L9WL+LkNDtli4Rqx37O7PpaJz56CbUgERXVFQ1Kjm/WUZiJhWF7GpNq
 LsxYTFNE+58tZkYXNSKAzKwkXIkhf/8dfRI2CCrNE2uYaz7hl6EF0KjXVrUBF1j9XuAF
 TOTnmBG4BjxSX5xBNVzHaepOcPquOQlqPyBhUChfFA+tmODJum7k3YJkdvRmmfO+N2hw
 KNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rFhP0oyY5+q+ggBv+YTzgM6SCWmV51JOjU7owgjD0YI=;
 b=ZIEHQk7jT9xIdeTyTxNXbeiZmwzYSSOcNGte5H/PLhBJYwCHuSr8yfyl083wGHAXBu
 aNhnlCuKYY/B7g/KlFXHriaAlvHqW/X2Pdpy4L5B3/pYMfuoqQVACHu26T74k/oJeOHN
 a74SkM6a39dgb0y77iYMCSQHbL6dOUxE6HYttk3c2NqhAMqkTjoeYEYffdWYVfoabKB/
 jt+5eVLRj8y+D6KSiDywUoWlqrPPfT3DkXZ2yLYkAatJjqUAEyC+xu4Bxaj+ijool3ls
 mHdkyy1lBG7+E28kjXHRWjrdng/4ns6Nuhp1S8GvhkkBNvv6HvvVnwX6Qqt65ep5ZdST
 W03A==
X-Gm-Message-State: AJIora/AAC6j2an6dfwRVO7EikW80gxqr7wchvSqZP1ATifmulEtVm1Y
 ivMr13USRw3+5bTuuanRyrX5w9YkWnw=
X-Google-Smtp-Source: AGRyM1vDp3P6vaAMC3zYrZP2BPUMREcM2d/10vkHRR89SF3eo3lKQ6e1+DP1yEVaOzwA6Lc8maTasw==
X-Received: by 2002:a05:6000:2cb:b0:210:33e9:2ec7 with SMTP id
 o11-20020a05600002cb00b0021033e92ec7mr1464327wry.317.1655327029183; 
 Wed, 15 Jun 2022 14:03:49 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a05600c129300b0039c8a22554bsm52112wmd.27.2022.06.15.14.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 14:03:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Jun 2022 23:01:07 +0200
Message-Id: <20220615210107.120358-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qdecoder: security bump to version
 12.1.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a maintenance release includes important security updates that
fixes possible vulnerability in URL decoding (see the report attached
below). All the qDecoder users are recommended to upgrade to this
version as soon as possible.

Fix CVE-2022-32265

Update hash of COPYING (change in year and URL removed:
https://github.com/wolkykim/qdecoder/commit/51bdcc2c158f2a12a817e8ebcb18f56e3121a808
https://github.com/wolkykim/qdecoder/commit/745878212df963a7a8081f09a747730e74faae63)

https://github.com/wolkykim/qdecoder/releases/tag/v12.1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qdecoder/qdecoder.hash | 4 ++--
 package/qdecoder/qdecoder.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qdecoder/qdecoder.hash b/package/qdecoder/qdecoder.hash
index e3fb837597..05337777b4 100644
--- a/package/qdecoder/qdecoder.hash
+++ b/package/qdecoder/qdecoder.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3911576ad8766697a9c8c767458edc953ae686eb53cd31d21e38edd7831ed9aa  qdecoder-12.0.8.tar.gz
-sha256  17e647523e5c5c75fd02861dcf3ea91a146d918ab303460ee58135c9dd70904e  COPYING
+sha256  edd32bd5119d276afa9e01cd54a1c23049cad4e96dc6a8e48ac324580e085ebb  qdecoder-12.1.0.tar.gz
+sha256  41f34ba1ed6e5d8d3488992311f474cd3f614b82bada88ae53216946026cfae7  COPYING
diff --git a/package/qdecoder/qdecoder.mk b/package/qdecoder/qdecoder.mk
index 8cb5d3bc97..05ee657131 100644
--- a/package/qdecoder/qdecoder.mk
+++ b/package/qdecoder/qdecoder.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QDECODER_VERSION = 12.0.8
+QDECODER_VERSION = 12.1.0
 QDECODER_SITE = $(call github,wolkykim,qdecoder,v$(QDECODER_VERSION))
 QDECODER_LICENSE = BSD-2-Clause
 QDECODER_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
