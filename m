Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E467C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 12:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD1CD405C1;
	Mon,  6 Dec 2021 12:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C664b8bTEPqW; Mon,  6 Dec 2021 12:04:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4626E40432;
	Mon,  6 Dec 2021 12:04:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9339F1BF3C0
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 12:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 833DE60C0A
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 12:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d61oLJkmFMkf for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 12:03:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2BEF60A91
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 12:03:40 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id s11so9924728ilv.3
 for <buildroot@buildroot.org>; Mon, 06 Dec 2021 04:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dlqKXgl6HaMiinhTJXatrY4SuZUsehjC0zTBciLWVQY=;
 b=fo74X3PGAeqls+/K+KvolvZmSy1aJmJuCgtetpsIG/+Ll746PRrtHbZFbuC2yRtB0h
 rlTjszEcTrI+a65MV7tjy9N797RVFc/pGc0eai3FZs2mm0Uki69/15kIuDiQlEtjwUMr
 jZdcTUuXJYExlyt3yn4STKcNpXgXoh01JUTKgApX/MAT3lvyoO8Sqq01g32ip603/UEZ
 hwlZHG4vfhMmbtFNFqE6tmMjXaJFC/75vEhLyNPlNgqfSzH9MyKDxilHZSeqCtPdQho2
 hyT4kc0G1/KsDWQfn/wZKXvpOIWEHNAfhpLmmkjbE1NzXDQuRo+ftY7KqEWiuouMDPIe
 eYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dlqKXgl6HaMiinhTJXatrY4SuZUsehjC0zTBciLWVQY=;
 b=HqdNBorWz9uQKAuCYs++3DvXHOZM2WXNCwVvOOIZTGMcZf7GYM2pEEzjccs5YP0ui7
 m94DBbGaUbKiyybpPxGjRr+UMhDlpNeD0VGh+lIioBUQ6X0OZC09UZ2C/yPjPVwWqnSW
 RnhN+6WgYsteckXh2FtHBTe8bZYxcuYl3xMY8E9UJiWVS38wPcwTqt1gqpmMVAIoeWXS
 an9WKlTfxWYsT7TFDZLurE+P8wHoE3YjWtxvJvAFTyDoKp82mXrEVCnliwAHUwzcD6Lp
 ixut5NIwIeq+FZphtNqoLLX70W1g9zgOzzX+PasYzfc0J4OaZ0y47oGHCIiVjJ3Ix2LW
 WEHg==
X-Gm-Message-State: AOAM533mkW/8muuMCt9Jwp073DxDvIE5LQiVPZGi4ynaHvc0oMNFHgXD
 HBnzPyXYobDiFYjHTzCKBgJDd+HNpxY=
X-Google-Smtp-Source: ABdhPJyg377OyWT1QLncPeyhY66FjVbfGf9QSbKW9zpdNKfPblZccw9RFTVXHQgi3u3BCZuteGGv4w==
X-Received: by 2002:a05:6e02:2163:: with SMTP id
 s3mr28964789ilv.70.1638792219675; 
 Mon, 06 Dec 2021 04:03:39 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id u4sm7153406ilv.66.2021.12.06.04.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 04:03:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Dec 2021 05:03:23 -0700
Message-Id: <20211206120325.3120351-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211206120325.3120351-1-james.hilliard1@gmail.com>
References: <20211206120325.3120351-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/6] package/python-packaging: enable host build
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will be required by host-python-pypa-build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-packaging/python-packaging.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index 6b54d2416d..e2fb9b120b 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -10,5 +10,8 @@ PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/df/86/aef78bab3a
 PYTHON_PACKAGING_SETUP_TYPE = setuptools
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
+HOST_PYTHON_PACKAGING_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_PACKAGING_DEPENDENCIES = host-python-pyparsing
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
