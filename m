Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B712C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1495081A18;
	Sun,  9 Jan 2022 11:33:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GGLxZKpgf-Bp; Sun,  9 Jan 2022 11:33:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 689D381A15;
	Sun,  9 Jan 2022 11:33:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 172961BF370
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05CCC81A15
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rK2WcoYZv3xG for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:33:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18E1C8199D
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:33:28 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v6so21155611wra.8
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 03:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wnicRo7X13BK7lZxg6yQ0NrTM5UGh5Z6k7SHDRqwqeA=;
 b=pMDH35ZEJ17RgF7ekSkCa/RsvJ2tMUmPrgRaF3CGwXnb0NHJgwHmH1wD5rIHnot1b0
 JkgreKdbLzWJuo4fdHBwVvBDF3wbAdSUiWh7L2WGnCTX51IoFqiHU6vtst1dxQmOQx81
 n8GQEUloZJRafO4OB6z5lkiSRjAhA+WTYcABgxE15QVyEJuxEVr/BNJcAqrL9s8QWnfb
 r8fiwL7gYBKzjMKQHUMksfKj0OVdYawEUdMTc1g+JR3aUZYuRr+HMsW+bSD7CpTrbyM6
 zdpKjraKkEDA9QW9Z45wLec3tKooxpVlFHKFNo0FM+KySeiupIwxGl84GljLFo2DhCvs
 2GZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wnicRo7X13BK7lZxg6yQ0NrTM5UGh5Z6k7SHDRqwqeA=;
 b=USMg2ghRqAoCocCovmMXesuUnkEO4LlO1H8e3qgv9pmLWkxD6Mk//9ldcqerPIst25
 05YGuu5h+kunsbMst0vmFxGdh7LoImzKdgkqqvoTFNxSCBMWkldTSs33tdSlJFVLrU9/
 66AfsMx3LgX5LpZw8WwrdXGg4rDmYHIPDx4mNy8HasaZPVmTrYFCAMEX+fDUkZfGJ19n
 FcfKB3AJ/ARkRBAoLYu2cORIhHLcpy60MI/vN4uhdQTTmdbTC1XTMjBzqteixqFT1fTf
 Vck7hp05JnjzJsalX89OH+lOTCNnSQVUkno/RZCGmk/7Fnl9YyxQt1dfEMHfOcNP0/lx
 k4LQ==
X-Gm-Message-State: AOAM532lCHRRd4av8hdK8dyemoN9kVEVnpSrBiD3FVL7oDWqgKoQx77H
 ApVfN6536MO6FI+OPkotJeIE6tvdiTc=
X-Google-Smtp-Source: ABdhPJxqhEC2GIYfDMJ+BkEMYo7kKs0Y63kUpDPvdfnjOyYWIxQKf+S1ggid+dL6JxlnDTfMx3y37Q==
X-Received: by 2002:adf:d843:: with SMTP id k3mr63158698wrl.303.1641728006086; 
 Sun, 09 Jan 2022 03:33:26 -0800 (PST)
Received: from gilles-Gazelle-Professional.. (138.23.87.79.rev.sfr.net.
 [79.87.23.138])
 by smtp.gmail.com with ESMTPSA id y4sm3953038wrd.50.2022.01.09.03.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 03:33:25 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 12:33:12 +0100
Message-Id: <20220109113312.755637-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/xapian: bump to version 1.4.19
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/xapian/xapian.hash | 4 ++--
 package/xapian/xapian.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
index 192032e6db..e570f7e2f2 100644
--- a/package/xapian/xapian.hash
+++ b/package/xapian/xapian.hash
@@ -1,5 +1,5 @@
-# From https://lists.xapian.org/pipermail/xapian-discuss/2021-January/009856.html
-sha256  196ddbb4ad10450100f0991a599e4ed944cbad92e4a6fe813be6dce160244b77  xapian-core-1.4.18.tar.xz
+# From https://lists.xapian.org/pipermail/xapian-discuss/2022-January/009934.html
+sha256  1fca48fca6cc3526cc4ba93dd194fe9c1326857b78edcfb37e68d086d714a9c3  xapian-core-1.4.19.tar.xz
 
 # locally computed
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
index 4f40babcf9..464e5478df 100644
--- a/package/xapian/xapian.mk
+++ b/package/xapian/xapian.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPIAN_VERSION = 1.4.18
+XAPIAN_VERSION = 1.4.19
 XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
 XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
 XAPIAN_LICENSE = GPL-2.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
