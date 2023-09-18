Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7F1CD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 07:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AD99408E4;
	Mon, 18 Sep 2023 07:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AD99408E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iV0ZLl1bIOxl; Mon, 18 Sep 2023 07:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E0CB408E6;
	Mon, 18 Sep 2023 07:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E0CB408E6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEE491BF3C9
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 07:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 812CC81318
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 07:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 812CC81318
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6EeFkvZ4mqgi for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 07:59:43 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DEA981287
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 07:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DEA981287
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-502a4f33440so6731232e87.1
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 00:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695023980; x=1695628780;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eNXHuFFVB0Ojb7gq7TcrgbahOnPeuHxC5IwJJStfTJo=;
 b=huDvqNqytWKID3tT/gsnLY4gSTzSVWDlz2WQwCKM3mtlrK1ruFHFdL/WxfRP7o6qxr
 t9HuS08+0cAXB4eH9SKhuejYzrLZl4U17bECrgiNat+hn6+zf7F4e3Ht4M13SZow3qoO
 xdBRZRYQoAdMJHNgquUSmv6hVwagnvKVXcq+J2UZzr4uaJQ3O9IWj7iAv4sRuUU0j3ho
 +kb6SyTgYF+pUvX0FKpk6UxYgDzwqv7iIHLDjLCq4Y2qSUfodnbODhQZhZe5ukSAIjQ8
 VOD/+ENRizzuWgfwWsazkSCs6FKiUU6s1uESIxSipoRgt+WbkX0iMgPO0j0+v3pxu1mK
 Gi2w==
X-Gm-Message-State: AOJu0YwqFFqS/NtjMEH4lRhAOy2mCIoDkqkxkgW+KEdNd8OtGTSiHGHG
 hk9rusBe+6VP0lnwUcYBFGh3OmR8wf4Wwio+r4EHlg==
X-Google-Smtp-Source: AGHT+IFQdos8m6MQ3MocSgWUoq9AfNEaQdpzgG6QXwAMRftfDNJaZgIQ8mI4EH7qXEmmwbrXrV0yiQ==
X-Received: by 2002:a05:6512:ba0:b0:503:17e1:a062 with SMTP id
 b32-20020a0565120ba000b0050317e1a062mr2058469lfv.15.1695023980317; 
 Mon, 18 Sep 2023 00:59:40 -0700 (PDT)
Received: from angelo-ThinkPad-T470p.amarulasolutions.com
 (host185138219236.static.fidoka.tech. [185.138.219.236])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a170906199800b0099364d9f0e9sm6081807ejd.102.2023.09.18.00.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 00:59:39 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 09:59:36 +0200
Message-Id: <20230918075936.785341-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695023980; x=1695628780;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eNXHuFFVB0Ojb7gq7TcrgbahOnPeuHxC5IwJJStfTJo=;
 b=ZZQVf832IUmsgcYRF2dKl3i8xiAy7GS60Yot0p+GlALNj0yCzfblFzONmipd4vhGkU
 uhvsOPWT5g8BOishIXskM9jWzHwxfS718liFCl9exzvyl7ZPKX9C0zzhR1/F97NqyJOi
 NG9lWeoa6MLSdgHY+JZD3nVhhHTTdhaRTuMdk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZZQVf832
Subject: [Buildroot] [PATCH] package/python-can: bump to version 4.2.2
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-can/python-can.hash | 4 ++--
 package/python-can/python-can.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index 73be230201..35e752ea54 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-can/json
-md5  d8365b7a09e49f47dac0da75d8518808  python-can-4.1.0.tar.gz
-sha256  3f2b6b0dc5f459591d171ee0c0136dce79acedc2740ce695024aa3444e911bb9  python-can-4.1.0.tar.gz
+md5  26d799fe952cb590fba03f3d26ee66a4  python-can-4.2.2.tar.gz
+sha256  6ad50f4613289f3c4d276b6d2ac8901d776dcb929994cce93f55a69e858c595f  python-can-4.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index ba98337d5d..012c82682c 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 4.1.0
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/90/55/898e69e37d5d4692bf21ba8750e095493d2ecbb29be7394d5cb735f0ab0f
+PYTHON_CAN_VERSION = 4.2.2
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/dd/f1/327caaf05b6bca594250053058a2adac537a88dfb5c41bb5498cfda9de78
 PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
