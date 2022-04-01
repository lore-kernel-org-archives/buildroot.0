Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B40C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 21:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 924F860F28;
	Fri,  1 Apr 2022 21:27:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3aylOWcPNne2; Fri,  1 Apr 2022 21:27:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2C2460DE5;
	Fri,  1 Apr 2022 21:27:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FEA01BF29D
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 21:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80D4D4017E
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 21:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HAToMljLodE5 for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 21:27:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44B2540111
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 21:27:42 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h23so5963295wrb.8
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 14:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BIy+q5YERQdhQyLgrsoMvVSz6zUMmA612bMm8Y4cKec=;
 b=jdYjRF548PY4mYb6nO9TmppThWej8EH3O2VtpwL3Iazu5cpxJcqC9bfEDq2Qf0e+FM
 jLk0bZP+l18gZX6CTjhfJcwusPIKwgRfs9bb++RIRXC1kxRXGKqZTZnLXJ8OjMjWEr0G
 9OUKIR+ZJEHR9jfKp0FRKpx+lPeprdYNymBVH8WkyJQHp8fsVtFDsZkHumZSWohB/fWF
 wCiy458wUCFJXQw7/+1F6pUEvhFVzzPdljY9Hi9BGBwHv0gTzFoaWrp5Rx0VjrkyOssL
 zNVaBPqwps7dxXWN1bH80IsTr+pUE1LUE5Nmy8HJ32uKgZPK0pmbPn6YmRG+twDdjNpM
 ZsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BIy+q5YERQdhQyLgrsoMvVSz6zUMmA612bMm8Y4cKec=;
 b=YGbX7mCUYiOpZ1NWQ5mGUbNFGQkGX5sliyfTMsbfw8LgN532H2Y9310gRHbPGLSnjK
 0dKEPF0fuYdVngBk8ULOoocDZzIH/4Pb3CJPKRoOBURaQXjyZU5tpwsx+qJHeDl4Ajh9
 iu0M1h0rIFfvaHJA1FknhZ6IV7HcIYRICEbKzeZ2YNebVjs9QeiN5oXqAC25NCQg62pO
 usLRj5z2HkOwb/SeO5qvaXbsZLG4ZqwyXjXzKoEQrxuxA8hUdKEgJTTwvoTS3whN2f8u
 x13Sm9c0kTc9zeAZV9nFgbwUS8fitsVXSDOXSxZC9fq5Mv8CkFyH+QL3KX+vWmXH7B2g
 D3tQ==
X-Gm-Message-State: AOAM5317W0fAoDvjpB7ky9ML4oJ4+2N2U1NCdiQtL8wCE8tfB9UAqHSQ
 LLo5cSnDDrguyCDnLeYbo/XD3jft5ZI=
X-Google-Smtp-Source: ABdhPJxiNP041IFMDkkGKF4EqAF/1OJq65ZzDKzocOiaqoi7FRWkCPJfYShslYWh9acg/9HutUUEuw==
X-Received: by 2002:a05:6000:f:b0:203:d97a:947 with SMTP id
 h15-20020a056000000f00b00203d97a0947mr9253037wrx.654.1648848460274; 
 Fri, 01 Apr 2022 14:27:40 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a5d5912000000b00205a7d0c6a3sm2952205wrd.69.2022.04.01.14.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 14:27:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Apr 2022 23:26:06 +0200
Message-Id: <20220401212606.1059177-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libnids: drop
 $(LIBNIDS_VERSION).tar.gz
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop unneeded $(LIBNIDS_VERSION).tar.gz added by commit
f8aefa8807ecaf219b0dc7988e6bd14c70c9c761

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnids/libnids.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
index 57e68654dc..40620eca57 100644
--- a/package/libnids/libnids.mk
+++ b/package/libnids/libnids.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBNIDS_VERSION = 1.26
-LIBNIDS_SITE = $(call github,MITRECND,libnids,$(LIBNIDS_VERSION),$(LIBNIDS_VERSION).tar.gz)
+LIBNIDS_SITE = $(call github,MITRECND,libnids,$(LIBNIDS_VERSION))
 LIBNIDS_LICENSE = GPL-2.0
 LIBNIDS_LICENSE_FILES = COPYING
 LIBNIDS_CPE_ID_VENDOR = libnids_project
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
