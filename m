Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA356C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 22:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53EA7418FE;
	Thu, 17 Mar 2022 22:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BLQRKFtk9mhE; Thu, 17 Mar 2022 22:40:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79DB5418BD;
	Thu, 17 Mar 2022 22:40:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84B611BF289
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 22:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C9A7841F5
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 22:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5xawxgRpCjsk for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 22:40:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60A16841F3
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 22:40:41 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h23so8815045wrb.8
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 15:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/q4BDRB4hIcltPTuKGcV4s7/f1zZgg8uYQJpbdWPp80=;
 b=DlTnGmp+Ki2/D68xgY6kHkKH2lYbTI+c4d4rpAhPEOcLR2yZlaq4PBv1D8uXwGxkkm
 n5m0VNotlsJyIkM9GcmH5VbZDQTFNdsM6nU5tVi6JFZC5PRs93owPgQ83OkNRokC5WKS
 XSq3adzWWQO/6QsXgmWdKfvcpaset516dkBmlRlh+DB2Z/jKEx7Vb17ahoaAZH321cQj
 l0iQcsEDS+tpH+w3uC62MgwMIxTx+1dFixrTzp4wVTTN+roUoDuIA+3CykBR4Gz+lpss
 iiMq1UsIy+iKqRCfnG1mHUfo4QRrjDolnNvtgMCnJ0MdjZ+8ZifNsXRSfnVrGodloJZ7
 dVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/q4BDRB4hIcltPTuKGcV4s7/f1zZgg8uYQJpbdWPp80=;
 b=gqIbPGHQbRLO6iLJYpPGt6MAmpuVW6CXdDgzAkAR5VMy9pmb2rWZtL1Wyo1CPBdUVa
 nW4ZF/tQW/7MHMj7fjnuxoS72THvdRijIKXTaeLoGFWduHPZFLkK4qLKvrtrSas4Grkl
 eSiCk1E5LxPU8oPOedYifhbvUl5zejpZ9D1aEADA2FYvrYmBeczRgjp92sdgSDrS+iN+
 TpEAgHmLREKUx0y+NSa2rpctg+EFaBoRz0B/3d8PdxfbiwYckvaXHCluVeyg6nSCXBbp
 zf6bF3uVo/ckElTLb1Z6IDEg4mnmbvcX0+o/wcqr7RXNWFrlmeDV+zl0qVXOi8znV8rP
 ZByg==
X-Gm-Message-State: AOAM533KMMGvVM6XxtoQsNLMFsud8wx1YzyyzReUHc3Nh/QZLq7zuDfD
 O319G+DpEk45FvAXDX5sl2zWAT8Xq/o=
X-Google-Smtp-Source: ABdhPJzMovI2xtSCc2f724IxWVUMZXpsUkLifda9noEVC1KrRZeTRfnVU8T9gQkONFILqzI9YfKZ1g==
X-Received: by 2002:adf:ed4e:0:b0:203:f12a:8680 with SMTP id
 u14-20020adfed4e000000b00203f12a8680mr2696876wro.373.1647556839159; 
 Thu, 17 Mar 2022 15:40:39 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a5d59ae000000b00203dcc87d39sm7770883wrr.54.2022.03.17.15.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 15:40:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 23:39:28 +0100
Message-Id: <20220317223928.508338-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/kvm-unit-tests: add s390x support
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
 Cyril Bur <cyrilbur@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

s390x is supported since
https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/commit/3934308046e5f113e19ed0ada002e2ec33335b8a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kvm-unit-tests/Config.in         | 1 +
 package/kvm-unit-tests/kvm-unit-tests.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index e470dd6157..a3d6756fb9 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
 		BR2_cortex_a17 || BR2_cortex_a17_a7
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_s390x
 
 config BR2_PACKAGE_KVM_UNIT_TESTS
 	bool "kvm-unit-tests"
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index d610442e03..2d05d08067 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -16,6 +16,8 @@ else ifeq ($(BR2_i386),y)
 KVM_UNIT_TESTS_ARCH = i386
 else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
 KVM_UNIT_TESTS_ARCH = ppc64
+else ifeq ($(BR2_s390x),y)
+KVM_UNIT_TESTS_ARCH = s390x
 else ifeq ($(BR2_x86_64),y)
 KVM_UNIT_TESTS_ARCH = x86_64
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
