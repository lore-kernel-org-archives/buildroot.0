Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9641EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 499C360F3B;
	Thu, 19 May 2022 14:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gqJJNrs43J4o; Thu, 19 May 2022 14:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 643FA60EAC;
	Thu, 19 May 2022 14:09:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 808D51BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E9F160EAC
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F4dXVy4YZJAg for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6A9E60C0A
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:36 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u27so6522031wru.8
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SjNqkBwD16cS2zgxreItlMMN+LzUFcdy8M+i9idmRj8=;
 b=DLATH5WIFLLgtooKS6GesPrZ4ai1B1L6Jtl/4wZOxbWCCfsh1JLZJQEp/I4jOCppeC
 Ahb0d2IGASPzkU1KUvz+OCeVyB6lBso6acz5AJiwPKQt3h+dkL/FrZdH0ckHINdYWZ4q
 RiSsDlCTH9t2xzd3gwJ6UDKksZSdOwS84YWPiXDgLD3zeGTGiFG6V3Izw1pElKDOBnsG
 ytLVzu9VmQSxQ/TTCFfSmLW/COBqw+TivaboBZ16RJL20oGA0MCSyRRQ5PjURTLYPWEi
 8udJLbWD/7nrQMSBsD2MU0Wj5KtlHvYXSotIbNhwG1bQWLk5YH5+6pU01KZFmdo1QJLg
 z0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjNqkBwD16cS2zgxreItlMMN+LzUFcdy8M+i9idmRj8=;
 b=OPajwnTK3DFDog4/Gu61FAIgiS/B2P+jFa+DU9cf7szfi0b7DqF77F5MlcmISamMNY
 +vVC1s81y+xfUsGmmabG8JhRwaBYGQiceOaQEsgWWIvK+oFFY2IIJr86TEcjj1p2sPft
 Cy+A1d1xHljPUxecchPJON8ZXMbgFhvwzws7SH1LhtZZZPKWGPy0R45TlrsHiPjZZ3VP
 1Wy1zLeHwsMz4pOu9A7gzcUzzYMGzPVWKyMiZM/wiIeXFxxLwNyw7ygAMwGqFmPUTeFU
 roB6WIfUZHjDVWjeK0OQlKFpgHx2hzG/+KXKWKkMTwyqWOC9HFy6zlQa2f/cteRZxkFL
 MyCg==
X-Gm-Message-State: AOAM533w1AMC+dt4KKboKB5THzCg+lOOoBmkMaHfSdpL0hjyUHsd5iqI
 eDsrijCjubr7GM2qkiErAAyLNw+nmsA=
X-Google-Smtp-Source: ABdhPJziSRJ4EsHQ59DUx0LGi8c2fMV91/JIasRCqCBPUvwh7Kvhi/EfQHrsGVaVm/glR5bVT1mWHA==
X-Received: by 2002:a05:6000:798:b0:20e:6477:a4c8 with SMTP id
 bu24-20020a056000079800b0020e6477a4c8mr4332969wrb.435.1652969314679; 
 Thu, 19 May 2022 07:08:34 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:34 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:07:55 +0200
Message-Id: <20220519140810.1953601-6-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 05/20] package/erlang-p1-tls: bump version to
 1.1.13
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The copyright year in the license file has been updated to 2022, hence
the new hash for the license.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-tls/erlang-p1-tls.hash | 4 ++--
 package/erlang-p1-tls/erlang-p1-tls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-tls/erlang-p1-tls.hash b/package/erlang-p1-tls/erlang-p1-tls.hash
index 475223b986..32d90ef7a0 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.hash
+++ b/package/erlang-p1-tls/erlang-p1-tls.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  97fd0a398751fc63b28df016e92a08ea98d083f7d5e3f32380a92de1ee86ca0e  erlang-p1-tls-1.1.9.tar.gz
-sha256  6cd4871db940d055cf272c12c10e0c08febdc94362e404390758fde34b4ce01a  LICENSE.txt
+sha256  5377671fed74a61518a742bc52d73941039d6e3c6e192133c7feaf5a83e1275b  erlang-p1-tls-1.1.13.tar.gz
+sha256  a401e98a7eef1c741b3e8b1a46a21730b4a1bc7020e4ec1a8c2a44dbd7f0ba5d  LICENSE.txt
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index 9e7d4c7c73..1f79bf90c1 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_TLS_VERSION = 1.1.9
+ERLANG_P1_TLS_VERSION = 1.1.13
 ERLANG_P1_TLS_SITE = $(call github,processone,fast_tls,$(ERLANG_P1_TLS_VERSION))
 ERLANG_P1_TLS_LICENSE = Apache-2.0
 ERLANG_P1_TLS_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
