Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A7BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 11:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CEB780B21;
	Tue, 22 Feb 2022 11:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8bPpZVhtlIPC; Tue, 22 Feb 2022 11:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 464C480AC1;
	Tue, 22 Feb 2022 11:33:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EC0E1BF865
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 11:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D87F60A9C
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 11:33:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LcTh1oQxKqKe for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 11:33:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5091F6006A
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 11:33:30 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id r13so18903828ejd.5
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 03:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fEFbHnKDqeJPeb6+PNf0ubCvUy9oSnjdpS2ZamqXx/c=;
 b=HBXU4JZHB79H/UedJqdLf8jYhyqm4dz9KtdnFyOkOeXWaUhJb5+jftRfjdXtNbBWGX
 8fnpWOjs+Fg+QM5/IwqBEqoHtoZqrJtFevhAx0a4Ip/FV+dYeIMz6jGWhps+U4ioc+zk
 z5ds+CarEjh9j4mUJBMyamv4B4axlvLUyMg1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fEFbHnKDqeJPeb6+PNf0ubCvUy9oSnjdpS2ZamqXx/c=;
 b=VDOMpEKDwrDEZrsX/Z0JwMZttvJBNvRMdXshpAt/cPPPJ3FIyDVigMyBtMTSHz6Ntk
 7GLskeKWNCn1+Bm7Ebu8Bd3rIjZq9u557oxD4r5Duy3cX3O5xvE9qEc7/7Sr3DyghKck
 /lcmGlVHdDib9jXS3s12qyXIZ5PiYtURH7oJh+I0PkxGAHDk9N+dZ0hSLP1FZqvkoaMq
 RgYOsMBaeMAfE4b/JepX+f3Pc01gidKWyZJBVe+UVpsrLc4n+zsEKnuY8rRjY9qvepLX
 bfMk/CBIPqMuOYblGHk2/hvFusVmnPmiACVc75CPZEXd56jSP1qMyGCTIAiTWvltAnrf
 x9WQ==
X-Gm-Message-State: AOAM532rE++EJ/U+vjt0QywkZ5JJVVhR3IZUDWzJ3k3uahMAcLbxSYwc
 WCzJwnR4HXMBGN4DFvAfpbJLdQR/tbTS0A==
X-Google-Smtp-Source: ABdhPJzyBj8JK7AoQDnlr/zYsgIQ1oyV82AgLnYBU1Zrgo4Gy6LMf0PBM7wuE587aiSLZq86Ouidrw==
X-Received: by 2002:a17:906:4d51:b0:6b8:78e0:565a with SMTP id
 b17-20020a1709064d5100b006b878e0565amr18789660ejv.587.1645529608453; 
 Tue, 22 Feb 2022 03:33:28 -0800 (PST)
Received: from localhost.localdomain (host185127038042.static.fidoka.tech.
 [185.127.38.42])
 by smtp.gmail.com with ESMTPSA id kw5sm6303108ejc.140.2022.02.22.03.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 03:33:28 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 12:33:26 +0100
Message-Id: <20220222113326.2608582-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-can: bump to version 4.0.0
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
 package/python-can/python-can.hash | 2 +-
 package/python-can/python-can.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index 5330e5899c..91b685cc17 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,4 +1,4 @@
 # sha256 from https://pypi.org/pypi/python-can
-sha256	2d3c223b7adc4dd46ce258d4a33b7e0dbb6c339e002faa40ee4a69d5fdce9449  python-can-3.3.4.tar.gz
+sha256	59d92846ffb981e634e9e0f2d14a6b4967a875e3869bd2ba168c92c4db6b8b5d  python-can-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index 1ab813e2c9..9284a9cf99 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 3.3.4
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/97/dd/5e5ae96db41ba57dde127e0600c3d324239ed692e167296c5fdb992cbf41
+PYTHON_CAN_VERSION = 4.0.0
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/1f/f7/a643cba269d59e108fe4c1854a8e71d5cdadadd4de1b9c8862b190171122
 PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
