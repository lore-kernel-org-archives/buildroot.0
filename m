Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B158C7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 07:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAFB3409AC;
	Mon,  5 Jun 2023 07:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAFB3409AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wxs6Kr0zocK1; Mon,  5 Jun 2023 07:33:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92FDD4099F;
	Mon,  5 Jun 2023 07:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92FDD4099F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFE981BF356
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2E2B40569
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2E2B40569
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eVmUQBnjC5hv for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 07:33:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78AC940598
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78AC940598
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 07:33:44 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-33b36a9fdf8so18113485ab.2
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 00:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685950423; x=1688542423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B73rckci1qGYpUa10lOO6krehZ7+mPibL+JX/COg/Kc=;
 b=TF+ZZjdnih7sHqLXYsIvGMeWe8nngCGaDfw1oVPB9KkZsswoWXuCPsWRDPid+JbCvb
 u8NltlqVE0wOeDtFZ6b9fmMG58eciMkBrledkyF1wu5+nnl2ugbOY1VkZRGYuYIfsCUy
 /9oyZO76MUbx+Q37tBOs6c8KIBJ7NvGan3XKGdLGj+BnFzruB3fEZoceMtC3eBiGZ0Xk
 34Vve2VkQlQdCS5aeQw2O6+FruvYeYT45mzGhh/yLca8OW1ACc4G5aAH2HvbfeJRJugZ
 k88+k2FI5u//hddKXWJdDlszm+z/I86AMe9tWkT5w9C+ezXK2ntZrcCgy/eZTj/8/WTA
 jJVg==
X-Gm-Message-State: AC+VfDx7+9ovcK0BenKjQ+o1xGOQHxujPVwbWzQrtK2l9emvXx6VhYnC
 uQqTRTvR9N/M6BM3L6gA4ljwUCGe6LXHow==
X-Google-Smtp-Source: ACHHUZ7m3LKprf44j1QqLbVYJvxPcB4ELuhAto0ikTDI0EqGW1fK3ZpFohD3x2rjvuT7+lu3IdQgPQ==
X-Received: by 2002:a92:d20f:0:b0:33b:f0a0:8dea with SMTP id
 y15-20020a92d20f000000b0033bf0a08deamr17662219ily.26.1685950423384; 
 Mon, 05 Jun 2023 00:33:43 -0700 (PDT)
Received: from james-x399.localdomain (71-33-129-69.hlrn.qwest.net.
 [71.33.129.69]) by smtp.gmail.com with ESMTPSA id
 w25-20020a029699000000b003e8a17d7b1fsm2110398jai.27.2023.06.05.00.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 00:33:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 01:33:24 -0600
Message-Id: <20230605073324.1889371-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685950423; x=1688542423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B73rckci1qGYpUa10lOO6krehZ7+mPibL+JX/COg/Kc=;
 b=fOjKRUwVRg/4q0yG3Xz2xTYrRyvUvmEHo4d7jSNZD1egE6PLx61bxujq6bu0ffZoqZ
 MV0XA16hPCO7Od6+xbwSaeDMU/lTZm6sz/cG75snhQDojAKmQ9MRO0GBjQuW4X1ZbtW8
 AMmHqMwEHJTJoVxiZVG4P0m233c3uyP0Fin9KuLo5n8Lb1PzSBknDsR4Jp22eFF03QUi
 q64Jxo6VRtdc+vH/3xRKK2wmuP5stTSe1MK/IG6+sSwrOHU5R89L3bM3Tuzvo5Nvzd4i
 PrIUfzPpov9pIYGig7XFkyPvBZqogx0bZWTQ3KTtJj26FqEfuhe79VHBL6aAX4JjjJKi
 qvkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fOjKRUwV
Subject: [Buildroot] [PATCH 1/1] package/python-requests: bump to version
 2.31.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-requests/python-requests.hash | 4 ++--
 package/python-requests/python-requests.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index b6f696000b..c4aeabb25d 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests/json
-md5  09b752e0b0a672d805ae54455c128d42  requests-2.28.2.tar.gz
-sha256  98b1b2782e3c6c4904938b84c0eb932721069dfdb9134313beff7c83c2df24bf  requests-2.28.2.tar.gz
+md5  941e175c276cd7d39d098092c56679a4  requests-2.31.0.tar.gz
+sha256  942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d2791656dbd6ad1e1  requests-2.31.0.tar.gz
 # Locally computed sha256 checksums
 sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 8f9f4b2db4..2c74db3711 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_VERSION = 2.28.2
+PYTHON_REQUESTS_VERSION = 2.31.0
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/9d/ee/391076f5937f0a8cdf5e53b701ffc91753e87b07d66bae4a09aa671897bf
+PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/9d/be/10918a2eac4ae9f02f6cfe6414b7a155ccd8f7f9d4380d62fd5b955065c3
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
