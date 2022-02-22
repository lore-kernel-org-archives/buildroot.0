Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D941C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 11:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB39760ACC;
	Tue, 22 Feb 2022 11:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BPT9z_k2hLXx; Tue, 22 Feb 2022 11:34:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F033260A9C;
	Tue, 22 Feb 2022 11:34:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29E041BF865
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 11:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 181A84099E
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 11:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mHn9SK11ohmS for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 11:34:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4641B403D8
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 11:34:09 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id p9so41968700ejd.6
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 03:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=atWtehyW0Vzf57bXZ5JK8Bqx/cgBw4ecS0NYUO5Lg1s=;
 b=JrspsOti/ghh345wjn4NeuSLMMej9/UmZ4W4nPRXL74zSJ6vq1fr1Nh5g9B/NJRNEN
 rDqPz+L4QxwkJ+EFO58Df9xYhkz2xFsD4/wLlvI1iE6mkNLY1W1ZCndx3gUInkvTFd8T
 cHd+oNH3jvbGw6QnFc4vHpPASVdFfmwV5v9Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=atWtehyW0Vzf57bXZ5JK8Bqx/cgBw4ecS0NYUO5Lg1s=;
 b=WFnW9Zs/eGIPUnhM8Vbml3gCIyF4cv6aRjugK+RtnfbHMHqou/kcUwMMglORAuaH5o
 2RsyBlHrdEWJgLxQlgY1OALDmpzAlWdQDkADlYg5PMQVmfHDW/h3Z4yojjkIdfZm+3cp
 OP+z3lRfquSpUwTcRyt/tKhWvptiXgJwplvoQgUWmwN+LzRg4BDjG7wG5xJrNCUmRqyy
 wl4jZDbsJcuMWIEbbfiWOWmQbVeomZeayOHajEwnF/b+zD+N0Ks7QWtd+1dFbzJ7kxkf
 aSAgS9Db4WnvlrXLwU5/PmBXaSpnjL0pJRRz6sszBrjcFIaI8XzWW2My5lBUVsIlkL1Z
 kQrA==
X-Gm-Message-State: AOAM531oiaW6L7++SEYlYBjQVI6/d+JZAQ016FDmvPDl7W0AZDdKQ4xC
 nTOuabsX5N6S6Y3r5ZwZCzBM48DmC+n4XA==
X-Google-Smtp-Source: ABdhPJwXyW47rvCRZuPI3CfQ7SJ0i1fudkAx2dyRIryj4FaGQVO2e04S5hik6oUyiBolvmMwlk91Pw==
X-Received: by 2002:a17:906:edb5:b0:6b8:1a5a:f3a0 with SMTP id
 sa21-20020a170906edb500b006b81a5af3a0mr19777651ejb.501.1645529647443; 
 Tue, 22 Feb 2022 03:34:07 -0800 (PST)
Received: from localhost.localdomain (host185127038042.static.fidoka.tech.
 [185.127.38.42])
 by smtp.gmail.com with ESMTPSA id p24sm7783054edi.78.2022.02.22.03.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 03:34:07 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 12:34:04 +0100
Message-Id: <20220222113404.2609626-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-web2py: bump to version 2.22.3
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
 package/python-web2py/python-web2py.hash | 2 +-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index 2ef52b0a5c..5830b71701 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256 44556376468139de874e9c29c9ef56e60ecd5f7536c7bee46d74b1f9d4178825  python-web2py-2.21.1.tar.gz
+sha256 a779adc5626999c854e9abc976296c2c1059bf6988a421c0bfba923f9b08d8cb  python-web2py-2.22.3.tar.gz
 sha256 2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 3e453282a9..b1897978af 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = 2.21.1
+PYTHON_WEB2PY_VERSION = 2.22.3
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
