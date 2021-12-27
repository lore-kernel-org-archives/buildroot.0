Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E6EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 13:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE52E60E5B;
	Mon, 27 Dec 2021 13:36:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id suhBJuGUD8l9; Mon, 27 Dec 2021 13:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4381460E5C;
	Mon, 27 Dec 2021 13:36:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCBDA1BF48C
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 13:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95EA881B58
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 13:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ICE7nAXAEekj for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 13:36:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C42B8148D
 for <buildroot@busybox.net>; Mon, 27 Dec 2021 13:36:17 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id x15so61904171edv.1
 for <buildroot@busybox.net>; Mon, 27 Dec 2021 05:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4EcQQ65Uej6esDbDSzIQOl2BT2YmkbSeYWlE17aNA4M=;
 b=nrAOMcARyQC1b9c8pLLCtJtjUcJALwC/K1QyWi3MZ+/Y3gGA0jq9/M1CGm+wVkRagZ
 o4viscp8S4B3I82MJp0mc6R1IOVEXcwUY1AR6C0S8SMOpvcjakUO+iFqK3jgVNHvjHzZ
 R+i4CD0xck20Br07vq603OTuoOoEgxSAQ7pz7lh/BBQLTUfICKoWJuiwdC4xQfFT2YwZ
 Nzey5Exa/SJ2zvk8sgwbZGO0PY6mpO5slXHXBkaAcP9xy1CoBA4AHHPqUYqSHVmLdh2T
 2quWECo9N3TWr3aqNp4firrurEcwtOhUNrekIrc0yDFOASU3/WiXatrRvpXhgOGLCFJj
 JCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4EcQQ65Uej6esDbDSzIQOl2BT2YmkbSeYWlE17aNA4M=;
 b=19ig16Vr6Qn36sN9AEDlkb7jKKImpChczhrwOB6/oumgqeLli2k0a8860fS2jxKrdl
 ErF3FNQb+qHjz9PhTLlJ8FnMtEE0gJHG0nSrkUqNyOnq/tDOMG8//zR7maH+pV+UcEC9
 0qN0pHkulQ8ByDinASXymY2VfR8CIuoEFv/TqawaZ2meTfevKWxa9efgFsQGQNj6mx5m
 c+GTyW8iDZ1TKaB3NmCfon9wj5Xw6c8Fp6M4IIjuF6clh/Hq0mV/zPJq2b46zsInALDO
 oeWZKmA68jYTvMbtVhS3jfksgv4UeBn4g/omSpEzvCxJKREJ3j4IqdWaTIdkigda+g1z
 o5Xw==
X-Gm-Message-State: AOAM530SKP+op+4AY4v2Ep42Z0VFY6ZIBw4EVP6cDjXWymOjhu6OIYlS
 4P3SZHOALRPs7IaqVuz96iRCDtg4Plg=
X-Google-Smtp-Source: ABdhPJy10v9ImMXk/gaNL/qcVotX0WOYD2JmxWzlNSPxw88u9eVJSSGzPn0dQGsnIeFqyyX5bY5wHw==
X-Received: by 2002:a17:906:f1c1:: with SMTP id
 gx1mr14429378ejb.554.1640612175681; 
 Mon, 27 Dec 2021 05:36:15 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id e18sm5120157ejs.78.2021.12.27.05.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 05:36:15 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 27 Dec 2021 14:36:07 +0100
Message-Id: <20211227133607.2165120-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.31
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libgtk3/0002-fix-introspection-check.patch | 2 +-
 package/libgtk3/0003-disable-atk-bridge.patch      | 2 +-
 package/libgtk3/libgtk3.hash                       | 4 ++--
 package/libgtk3/libgtk3.mk                         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libgtk3/0002-fix-introspection-check.patch b/package/libgtk3/0002-fix-introspection-check.patch
index 450505c91..b12e1a4fc 100644
--- a/package/libgtk3/0002-fix-introspection-check.patch
+++ b/package/libgtk3/0002-fix-introspection-check.patch
@@ -14,7 +14,7 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1650,7 +1650,10 @@
+@@ -1679,7 +1679,10 @@
  # GObject introspection
  ##################################################
 
diff --git a/package/libgtk3/0003-disable-atk-bridge.patch b/package/libgtk3/0003-disable-atk-bridge.patch
index 42de83b5b..09ede9661 100644
--- a/package/libgtk3/0003-disable-atk-bridge.patch
+++ b/package/libgtk3/0003-disable-atk-bridge.patch
@@ -7,7 +7,7 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1364,11 +1364,7 @@
+@@ -1375,11 +1375,7 @@
  # Check for Accessibility Toolkit flags
  ########################################
 
diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 149399868..c23abcb51 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.30.sha256sum
-sha256  ba75bfff320ad1f4cfbee92ba813ec336322cc3c660d406aad014b07087a3ba9  gtk+-3.24.30.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.31.sha256sum
+sha256  423c3e7fdb4c459ee889e35fd4d71fd2623562541c1041b11c07e5ad1ff10bf9  gtk+-3.24.31.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 80a2affd8..f298afade 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).30
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).31
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
