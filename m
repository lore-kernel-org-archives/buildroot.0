Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF8AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 16:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C75E78481B;
	Thu, 17 Mar 2022 16:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6tUnYKp2nZza; Thu, 17 Mar 2022 16:26:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 050F2847D5;
	Thu, 17 Mar 2022 16:26:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64D261BF27C
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 16:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5374D417C1
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 16:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=balena.io
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tuy6tG5N9nmH for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 16:26:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DA18417AB
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 16:26:23 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id h196so4717595qke.12
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=balena.io; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5gOM8dG6o1XznrYajaqyo0tjgLxWj7npZwNqlA0zMbk=;
 b=BYhkdj8qDxsGqjO0+sLDroBduk+AVtag0EDUTrG16rbPwMWLtYNDc0moNb8LmMViSY
 cqknoTBurAjUbsk4Qc3CYgSxWMLmEdwKJBL0xcuyi+yhxxnnuKWzVA9KfjJd910P/9mu
 8qr5dawzRSq213e/F+zZuOBJ/NS8FVntBTOzpBU8HC2J+LUGz1Xss86EGBiskAg2qCj9
 tIaWUjvE5W7+YKwdrZKjto19T6uB3wH/5zIYG47I3mDlax8uluF5uOCHNf/U2pHGgDbw
 oCe/0TgdGVpIzsUnobtXSOgoEq1x6b6LnshhpOZrsCEIoHomS/ohWU6PD+STzYUuO97Y
 1BhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5gOM8dG6o1XznrYajaqyo0tjgLxWj7npZwNqlA0zMbk=;
 b=IlQqWI+a0atVY/aNbG16axY/clWLfmDFo4qcTUMT9eMwCq+u/TaI8zt9OJ6dzK6lHt
 fpzzQnFfDgOpyklqi20aPkTklWoFy/26xEwOxmLfEtV5/eOS1tFochtPSTuCaM3HvlNt
 ViKAD3i8pnE/ShQhr13h+QxT8VJhWOA3VF2IKZYl6qCziiqm/6PnRPjERfBjdBkqptqM
 o6M5hYrzOcC/6pbF83odHDDtvxXnpyoesOF5dmh4UoLBXD2xghXDGMmnws7figUjY/y0
 gs+eTwbmHhk8LAwd69Y7nhoFu4iWNFOGvCoFcNavCN55JUDk3PkYEt3aHbyggEs9/vky
 6jbQ==
X-Gm-Message-State: AOAM532XeiMxefTfuM05h+JwzU5ciWad9sW/36T+HpuIMnGDCp7yg2vw
 ry6SV7w5G18QnnlaeQU6VvnBClFwb/dD4M6Y
X-Google-Smtp-Source: ABdhPJwN4bxeNmLfgqN4fQGIoXa6a8JYEFCZf5X1R2BpLlgi6g/DFFAm0fZbE0UUFavDWD8YunOBGg==
X-Received: by 2002:a37:acb:0:b0:67b:15f9:55b8 with SMTP id
 194-20020a370acb000000b0067b15f955b8mr3395542qkk.694.1647534381558; 
 Thu, 17 Mar 2022 09:26:21 -0700 (PDT)
Received: from system76.lan (198-48-234-199.cpe.pppoe.ca. [198.48.234.199])
 by smtp.gmail.com with ESMTPSA id
 i17-20020ac85e51000000b002e1cf062ef4sm3950552qtx.45.2022.03.17.09.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 09:26:21 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 12:25:30 -0400
Message-Id: <20220317162530.427876-1-kyle@balena.io>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/unbound: use system libevent
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
From: Kyle Harding via buildroot <buildroot@buildroot.org>
Reply-To: Kyle Harding <kyle@balena.io>
Cc: Kyle Harding <kyle@balena.io>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The file descriptor limit when using the builtin mini-event
cannot handle more than 1024 file descriptors.

https://unbound.docs.nlnetlabs.nl/en/latest/topics/performance.html?highlight=libevent#using-libevent

Signed-off-by: Kyle Harding <kyle@balena.io>
---
 package/unbound/unbound.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 1e6e0d99d7..782ed2b049 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -17,6 +17,7 @@ UNBOUND_CONF_OPTS = \
 	--with-pidfile=/var/run/unbound.pid \
 	--with-rootkey-file=/etc/unbound/root.key \
 	--enable-tfo-server \
+	--with-libevent=$(STAGING_DIR)/usr \
 	--with-libexpat=$(STAGING_DIR)/usr \
 	--with-ssl=$(STAGING_DIR)/usr
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
