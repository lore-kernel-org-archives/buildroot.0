Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E41C54E41
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 15:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0E1860E5D;
	Tue,  5 Mar 2024 15:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kb_qwDn3iq5F; Tue,  5 Mar 2024 15:59:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF79760E9D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF79760E9D;
	Tue,  5 Mar 2024 15:59:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1FFB1BF2A9
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 15:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E9CB40535
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 15:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8wkTemxdKy3 for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 15:59:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 465EC403AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 465EC403AC
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 465EC403AC
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 15:59:30 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33e4f15710aso256696f8f.2
 for <buildroot@buildroot.org>; Tue, 05 Mar 2024 07:59:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709654368; x=1710259168;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9dZshQsx4WK6mGxVttzSJ/YKpeOhEeF0/I+ynQr8pbc=;
 b=Y48lLjV8FUCc97c4ilZev1BvIRfqHZXcMgSnOcLfO9fMtAvsATzmhHjmCUqIJH14jG
 p/o6aNTsyjneJadCFuhD2Tymh19RWHDsOz/WlYgq9NgkGa6UQWW+4RuHeA1XOiQ3mTbr
 zgNoi5TohqTgAuqRHnKVEaEz/JsxMpsXEj4toEBK+alRE2hK2b6KM4KnSD2FDAUVzkEq
 HzSc6dIl+GXcXhEvBZyrp3YOEnd5lVDsHbVxHLPsDnVVL2ZoItMbvLslEoo1drFUQWyG
 5uoaOnjqWdkUVBvMNyC+eE4vZkQbJrNYnTYH5RbZDSR11qrZ4Iezc8srk7eh6EFdQO1U
 ka1Q==
X-Gm-Message-State: AOJu0YwLHZSTGjkmgt6TN7kv7b73jjcivsJrdwkH1N8DKNVMrpJ5ryMB
 i1fIOXAN+WIdjHDdXN8FpO8+CoEcf01s007e49x8KJJZjeYL0CS6nosBeF1z
X-Google-Smtp-Source: AGHT+IFt8G9k9LRaSweoSZaoDxWceVHjhAyanGRdAK4SCx5WIMTQKj3T0WjgEn5Sx5Pzii/52Vh4/A==
X-Received: by 2002:adf:ed43:0:b0:33e:90f:4f6e with SMTP id
 u3-20020adfed43000000b0033e090f4f6emr9076762wro.37.1709654368226; 
 Tue, 05 Mar 2024 07:59:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 jn3-20020a05600c6b0300b004128e903b2csm20886949wmb.39.2024.03.05.07.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 07:59:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 16:59:20 +0100
Message-ID: <20240305155921.1818567-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709654368; x=1710259168; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9dZshQsx4WK6mGxVttzSJ/YKpeOhEeF0/I+ynQr8pbc=;
 b=k8gCCvaZ715cJ0sHFcXA5vFVEflq3ERjXGOVieLW8PKTdjqNNYgd3Fc2Jw8Wt55hs3
 6IAtWxtSbToDlLt16javx3NaPstYjC8RrM6TjvePMKKqQ2y1+USbTnxXpmIImMyzFnWA
 Za7s3k0CeDmlR1Z76w/IEl5Sl4EWsEX8iy6aoI5G7iZCzCDBQEAkqWl6JRBOkcq6YQnU
 ggRVvTf78W99DUJAgk1LZBfvrgplSJauwpx/7WLV49+3L2oklrhzf8qjDVa4HwUvXFpj
 y71z+OB1tBnwdCvsMAc5gKvgDKqb6hb9PawaS5eGn7t7t1p6HbME983wsKStQ1amnLk0
 RPjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k8gCCvaZ
Subject: [Buildroot] [PATCH 1/2] package/ell: bump to version 0.63
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

https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog?h=0.63

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 8bc61ee293..f5ded676c3 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  c21ba3530d530c736f9b3e6acc954d4404c1ce4abaf2a4694e46ecec17653fa0  ell-0.61.tar.xz
+sha256  7397c76996d7646b9917ebf016cd67586b10166295af2e0e18cdb5b8f6659965  ell-0.63.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 300c1eee88..f43dbdb5f7 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.61
+ELL_VERSION = 0.63
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
