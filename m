Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19B8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BDE882CD4;
	Mon, 16 May 2022 13:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ZGp29YJ_9o3; Mon, 16 May 2022 13:15:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3288D82CAC;
	Mon, 16 May 2022 13:15:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 302691BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EAB240B44
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IOORx08lkRwv for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:14:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C49B240396
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:14:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id m62so8666336wme.5
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9CY+maYti+Z38QsGI73Unog9022tdK4QYp4CsbDSJHM=;
 b=FAaWvvfkKygTGriEQLzCtO6mxbNKH10Iokuiz8eTdalCvHp+MXz4Uyt6PTAuyWFP3i
 6F4NLXr7IB8DqxybF1PP2YbON81L59+GlARHNRnK1msIBns7KLiu3PK9nsw/KdH2uD3n
 VzPGFxuy5PzAvNYeyO45NQ1TK263/+Sb+yC9ciayIZcvnEX+kqw2pCCazLFPJWlw1nnS
 DllYYYHBAy+Xlm7QABpLWR6Ms5TidKkw8gXb01gfhGIscZkkMjQHkOk14NGblIaBYYPc
 vAw1UawsGyJ1rMbaRweRgyvrPNAbAY2GKrVhmddTKq4l5g3ue2KtprKrzxE1YZz4NHk8
 WHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9CY+maYti+Z38QsGI73Unog9022tdK4QYp4CsbDSJHM=;
 b=Gz4flsS0C422mNVjk8JErAeaK0PiQxdlleWfhv1WbIof0lUqaTzTIByFhTpn9aJb4R
 SO/xsBMBWXHvvI3Wdb8xYp7M8LipMs7yY6HXZx/h4IzSpyaiOuDq9S/5pWE//6sNAj8G
 tJTkoduqvxKCmm0xqjCffkDfcCVEriOFXXFbIdoYyNWJ4tGWw1uf6atjnDNti3X9zQuY
 vIBX94v5X/ZIRk1qA7knA/YA+lg3IcBUPv73cpCCUyoiL8rnZoCeKhD4bokbKL8SkAj8
 nxR0cJ6WNX5TvBKEXbX2bcRXoKI45qJfH8YSrVhlDqjrwblfTD3mUEt3UZoKLksT7QAi
 01bw==
X-Gm-Message-State: AOAM5320Q+xFRU16H9YE5SmrGh0WdoU863Iv3GWTAnnV3NRFgD21btP4
 uArNDTZlkwyj9/Kgk2cqYAfy1Qcr1Gc=
X-Google-Smtp-Source: ABdhPJzL0xRCEJq9DryI7ovvDPxAB8cBXlYv6htj1JyQd67nHzk3R0MVISPhq6Sp3kYzinyp2bCGMA==
X-Received: by 2002:a05:600c:4e41:b0:397:104:b1d3 with SMTP id
 e1-20020a05600c4e4100b003970104b1d3mr6357317wmq.101.1652706841193; 
 Mon, 16 May 2022 06:14:01 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:14:00 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:23 +0200
Message-Id: <20220516131334.1910858-10-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 09/20] package/erlang-p1-yaml: bump version to
 1.0.32
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

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-yaml/erlang-p1-yaml.hash | 2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.hash b/package/erlang-p1-yaml/erlang-p1-yaml.hash
index 955a000930..89123dfd83 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.hash
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8f53308438e4d1613562acb586b4c4540569d8305097508c40e6f261fe4216cd  erlang-p1-yaml-1.0.28.tar.gz
+sha256  6d5c823dd895b736b98325d88893a63c054964d7bde9a8e150fc4df5f4165065  erlang-p1-yaml-1.0.32.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.mk b/package/erlang-p1-yaml/erlang-p1-yaml.mk
index e42ff5fe38..6acb6fe059 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.mk
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_YAML_VERSION = 1.0.28
+ERLANG_P1_YAML_VERSION = 1.0.32
 ERLANG_P1_YAML_SITE = $(call github,processone,fast_yaml,$(ERLANG_P1_YAML_VERSION))
 ERLANG_P1_YAML_LICENSE = Apache-2.0
 ERLANG_P1_YAML_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
