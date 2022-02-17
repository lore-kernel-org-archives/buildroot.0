Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06039C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 00:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F61640A4E;
	Thu, 17 Feb 2022 00:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzODU7G9vfMz; Thu, 17 Feb 2022 00:53:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F3724019C;
	Thu, 17 Feb 2022 00:53:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DB2B1C1135
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 00:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19DB060B4B
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 00:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_PcL5_Qcdd9 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 00:53:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 474C460B00
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 00:53:47 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id n5so1123558ilk.12
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 16:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z0LkGb7ajdwumbxUoFPEeZv5PNARekrXKSsJvUKF6d0=;
 b=ApXFlE/elBm7Y++AQAHxLnMjQI23VPJtsNQ12Cc30HnnVr0aBNNjT5283oM8EftkSz
 tADTH+eg+NlixyoyS9j8rIDzRgg+JNGNcbDfatpLItMOhto1RdSJahfLC70zeR/nGCcE
 K8Tcj4KZbiuMnABxQWgkLMML3bCyRZrX1VBRJj80PZUOOF11ukma2WlHPRMhXmNxc03a
 nymRS/PDFKezptUaua+EAC/asZTAZPf2wm8vEOjlHiUtCZwe8F0wkc8hg3d2dd5eQeQm
 yKU2QUcWQd5oFYra2HUUTJ30orJIcK/ue2RChWcG31iRP6vk0rkHA15xLBXPSrhivy4X
 Ecng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z0LkGb7ajdwumbxUoFPEeZv5PNARekrXKSsJvUKF6d0=;
 b=FBaX21dVATjw/P5Oyo/61Xa02QSY8civwOKrGvmKLC/PU89aNLvZa/GrSE5AKyFmpE
 AUM9Vmao03685vlQD70wniRDswM6j6VLBM3Uz6AAf63AMa0WBHnqNc+xAqvnhzNwcYXM
 Q3XSvpkc9gy4ItzcVNFI4C56+yaj9OzE3kCuWiVMsSA9H3y4Uv1XjM6jSqWN+f7NC8pW
 PFZHB3ejfR94buTqAYVtkvALUpJAaTGeOqhlMX2X+a7VTT7XWJx6zCkFC1KEJZjBKnFx
 MU2whNxzJ5W0tJVfxwfSG4dkDbUHUe1oUbZbgUbt7S4db4CFVVAMqCMPdY5SfBZnZKer
 6L8A==
X-Gm-Message-State: AOAM531rFAmx1iyODBNXHdaAvyv44/wtPtvWlK6NLHeL+11OJY3C6Gex
 aettgKzbvf4JKYknj5fgbhFJE+Dr7/o=
X-Google-Smtp-Source: ABdhPJwV/WkL9CowMGt8vv1icZ8L0C2hlU3JlSDY3sWwmzSjGYkzG9jg7gU80n+d7XBK9EdxeegbQQ==
X-Received: by 2002:a05:6e02:1c22:b0:2b9:dcbb:e810 with SMTP id
 m2-20020a056e021c2200b002b9dcbbe810mr312856ilh.262.1645059226081; 
 Wed, 16 Feb 2022 16:53:46 -0800 (PST)
Received: from james-x399.localdomain (97-118-156-98.hlrn.qwest.net.
 [97.118.156.98])
 by smtp.gmail.com with ESMTPSA id 5sm935333ilq.59.2022.02.16.16.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 16:53:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 17:53:44 -0700
Message-Id: <20220217005344.2357385-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bpftool: bump to version 6.7.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/8bf/8bfc2abe3ab7a0b53aa717c800a4c7a3c964f426

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/bpftool/bpftool.hash | 2 +-
 package/bpftool/bpftool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bpftool/bpftool.hash b/package/bpftool/bpftool.hash
index c7d4ae250e..2e414b8eb8 100644
--- a/package/bpftool/bpftool.hash
+++ b/package/bpftool/bpftool.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c868cb85bf44195ec6cd20649c3db4f7aff64a38d950a1c2911d981fb2d7042c  bpftool-a7f0e7f057283ae8af3de4578bcb8b7ee80b7144-br1.tar.gz
+sha256  e4ce219d3b87dd70d8dbfb8f02bd356f70c010f739f17baca1c8912199a8a72b  bpftool-v6.7.0-br1.tar.gz
 sha256  7c588754d5e81e92e2a12e47cf78949d485c9c22b4850f12d21b3835c85947d1  LICENSE
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0
diff --git a/package/bpftool/bpftool.mk b/package/bpftool/bpftool.mk
index 4276f91958..8742917253 100644
--- a/package/bpftool/bpftool.mk
+++ b/package/bpftool/bpftool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BPFTOOL_VERSION = a7f0e7f057283ae8af3de4578bcb8b7ee80b7144
+BPFTOOL_VERSION = v6.7.0
 BPFTOOL_SITE = https://github.com/libbpf/bpftool
 BPFTOOL_SITE_METHOD = git
 BPFTOOL_GIT_SUBMODULES = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
