Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009E1C77B73
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 08:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 989BD60B9A;
	Sun, 21 May 2023 08:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 989BD60B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BHAAZ3M8tR2T; Sun, 21 May 2023 08:25:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E48E560B4E;
	Sun, 21 May 2023 08:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E48E560B4E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A3371BF3D8
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 08:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3398481EE3
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 08:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3398481EE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5EvMhuwIT6K2 for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 08:25:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6689B81EDF
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6689B81EDF
 for <buildroot@busybox.net>; Sun, 21 May 2023 08:25:15 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3078fa679a7so4736496f8f.3
 for <buildroot@busybox.net>; Sun, 21 May 2023 01:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684657513; x=1687249513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7jFNLgNJofkcjON4OPlBFRppn38u6Ig1pQOou3F7WcU=;
 b=hFIL5vbuOqzHlxzu5QOYojvEOadEJI8mc7JjhwIvw9dS0yv/1GOm3F0OAgx/vdpx7w
 6huz22jXKZ4N8IDLt5gaS+NA1VYRdMLCnCreR+CF8nSgUZIpWNFvLMEuVqxPOjk/CK3N
 VMrGoT6vYFM2uH0CM6kL2aV/sTLNIb/UQKoqOZyVtHFAPmd0flo5bh38y0kupxI/QuNI
 qY4SD5NXtS1XOcHK3xJL0em74rdE/ywXxuGg5p3xp5yiv6PZI409SWiFJhmem5FlkXrS
 KK1R4OoLcwVH9M3+D8KmSbyjWHGj8ntHdOvHawcS8U9x8E4xsdqlZ9rCork/H1XaO0id
 +IsQ==
X-Gm-Message-State: AC+VfDxiIGYibbVuO3ekQ2cJeW7ND7rm5HJuDCKFwjaqupdPdw2ZXyzl
 J2OQwenuDudFIIkyqEncfoG67alWixU=
X-Google-Smtp-Source: ACHHUZ5SOY4fefPD59F7AumPOt1j/q/UmyaMa+OXc575BK+aQn+pjo13uWlr/xvzTkV+ZW4Ikp9Ytg==
X-Received: by 2002:adf:f7c6:0:b0:309:4ad6:b3ec with SMTP id
 a6-20020adff7c6000000b003094ad6b3ecmr5674290wrq.0.1684657513256; 
 Sun, 21 May 2023 01:25:13 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:e03:bd00:5ffe:deec:ec3f:c958])
 by smtp.gmail.com with ESMTPSA id
 21-20020a05600c029500b003f423f5b659sm4514823wmk.10.2023.05.21.01.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 01:25:13 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sun, 21 May 2023 10:25:09 +0200
Message-Id: <20230521082509.27215-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684657513; x=1687249513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7jFNLgNJofkcjON4OPlBFRppn38u6Ig1pQOou3F7WcU=;
 b=S8eynzSm5dqUMryg3bOe/Wr2d16d08vhJvcJ3MJmmP+AjCV0LgMZKn8xTRX4e5zc5X
 dpV7PcpfvrVJG/JwHlvLEIxh/hojkC1qknpy/wo6HmX+QioNHH/4gbxxeryJNN2dtOR0
 +ASSzavF7JGA9qlR0lnpZZ4LWWs5eQgOuGbA//dtkk+zY0YmH91jgA9EZ8EavxI5nepu
 +X++68VlGu9N49dbDeXQZXozmmIOrfUHM3jQkR61nlgAlpy1ghwX1OrHwqmURUwUp9Ha
 ML3W2oTvhwToma8Q15X9Z6ulVbL0Ayo/L2tYtpEUA242Ly7FBfCWq1IOjRFFOkGrzJ0K
 TBBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=S8eynzSm
Subject: [Buildroot] [PATCH 1/1] package/python-pybind: bump to version
 2.10.4
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-pybind/python-pybind.hash | 2 +-
 package/python-pybind/python-pybind.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index 971eceaa07..154ca6d986 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  5d8c4c5dda428d3a944ba3d2a5212cb988c2fae4670d58075a5a49075a6ca315  python-pybind-2.10.3.tar.gz
+sha256  832e2f309c57da9c1e6d4542dedd34b24e4192ecb4d62f6f4866a737454c9970  python-pybind-2.10.4.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index 1fd106b981..b96089e8c5 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 2.10.3
+PYTHON_PYBIND_VERSION = 2.10.4
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
