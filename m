Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39F4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 19:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68DA9415CD;
	Thu, 27 Jan 2022 19:23:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y6_TH4VPpyQI; Thu, 27 Jan 2022 19:23:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9438C41515;
	Thu, 27 Jan 2022 19:23:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89FC01BF3C3
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8500D403E0
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rfb2p4OjKH18 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 19:23:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C9A6403D6
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 19:23:43 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id e79so4822382iof.13
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 11:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l2HnWiIPKUlQVytfaTEOHfo27HSzFiX8l1gptvIENGM=;
 b=khxSScQG0YNzQacgWlAM6Sx+7F6i0oZ59hm/AuIyGK3Ra59Vkj1my0lk4f4f8GACVH
 tRmHccTq4Q/Dadx66J76keswxOXFLWfB0wukQscS6QVhJM+BhnO722gyiGfp70n0f30g
 eRp1Afgk9afVRO147VGwE8nEq1U+cFA3FTh2pD6m7MbODAWJuL5r006G9lk0o2P3EfXe
 2WY3e5BuSYWhkKJq3WQ6xMVQDSZH4pdhVBvPLmcuhbJdAjDb+Zp0czu5OaHsOquFhVq5
 N5P95IDTAzObGo4ggc+ut0w6v1wSfdNDU3CuGwa2WGcuivh9X1Jv3en++1aJEfD3HnwZ
 BOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l2HnWiIPKUlQVytfaTEOHfo27HSzFiX8l1gptvIENGM=;
 b=MaA4JZZm/T7w/WDaX4Od/uLSaz9GchZ9XnDwWn1fhNTi0Db26bWRK+HUjc0ttiZOBE
 83zDGzauA7AbRYiNvcIm5Qq71IxEXOAKSih9kupnibOeEo+6bxzRWHrLjHs10oOmXsSR
 ye4/P5qwInwAneh232Q49JV1TCPbr0e1pIr48zeWmVZ+7AB/cmPbiY5F2EzQFQMyFKuh
 DJ4yxMz3PSrLOUlUKrZxL0Or7Xlsh62Z82iyBewzQP6GPZc0xbDQJNgmkAdWvb8W/+Kt
 qF2drFlmIggGsmhfVJcRKCpS03w+oT/N+cIsOD1caQblAWMsphBMBe6kT+kU1MzkoHYI
 teFg==
X-Gm-Message-State: AOAM530lAii+HiwmI+cSG+vs6Vdsbc42HLkvJR9yw/X3GpZVex60nryb
 TEWP0cpXLu9qasGZqRMbVTJocNNEcpA=
X-Google-Smtp-Source: ABdhPJykm4z9c+5gfZe2p9OOUjiSrjJTSScNH3+wCZykoR5rpYRqE4fFGDykXHW5sUG6raWCdIm0cw==
X-Received: by 2002:a02:a385:: with SMTP id y5mr2523079jak.307.1643311421935; 
 Thu, 27 Jan 2022 11:23:41 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id f12sm669023ilj.47.2022.01.27.11.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 11:23:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 12:23:07 -0700
Message-Id: <20220127192311.1954197-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/5] package/serd: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/serd/Config.in |  8 ++++++++
 package/serd/serd.hash |  4 ++++
 package/serd/serd.mk   | 20 ++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/serd/Config.in
 create mode 100644 package/serd/serd.hash
 create mode 100644 package/serd/serd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fe8de1916e..6e40b0e9ae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1335,6 +1335,7 @@ F:	package/python-tomli/
 F:	package/python-weasyprint/
 F:	package/python-yarl/
 F:	package/python-zopfli/
+F:	package/serd/
 F:	package/zchunk/
 
 N:	James Knight <james.knight@collins.com>
diff --git a/package/Config.in b/package/Config.in
index e4ca195beb..decf523821 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1720,6 +1720,7 @@ menu "JSON/XML"
 	source "package/rapidjson/Config.in"
 	source "package/rapidxml/Config.in"
 	source "package/raptor/Config.in"
+	source "package/serd/Config.in"
 	source "package/tinyxml/Config.in"
 	source "package/tinyxml2/Config.in"
 	source "package/valijson/Config.in"
diff --git a/package/serd/Config.in b/package/serd/Config.in
new file mode 100644
index 0000000000..7633a979e2
--- /dev/null
+++ b/package/serd/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SERD
+	bool "serd"
+	help
+	  Serd is a lightweight C library for RDF syntax which
+	  supports reading and writing Turtle, TriG, NTriples, and
+	  NQuads.
+
+	  https://drobilla.net/software/serd.html
diff --git a/package/serd/serd.hash b/package/serd/serd.hash
new file mode 100644
index 0000000000..d64a2aa271
--- /dev/null
+++ b/package/serd/serd.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking signature
+# http://download.drobilla.net/serd-0.30.10.tar.bz2.sig
+sha256  affa80deec78921f86335e6fc3f18b80aefecf424f6a5755e9f2fa0eb0710edf  serd-0.30.10.tar.bz2
+sha256  e06562d6bcf0341b2ac2ad0f0ca36801d2ebf388d5ef297011625e4c36e963f0  COPYING
diff --git a/package/serd/serd.mk b/package/serd/serd.mk
new file mode 100644
index 0000000000..85b16f6866
--- /dev/null
+++ b/package/serd/serd.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# serd
+#
+################################################################################
+
+SERD_VERSION = 0.30.10
+SERD_SITE = https://download.drobilla.net
+SERD_SOURCE = serd-$(SERD_VERSION).tar.bz2
+SERD_LICENSE = ISC
+SERD_LICENSE_FILES = COPYING
+SERD_INSTALL_STAGING = YES
+
+SERD_CONF_OPTS += --largefile --no-coverage
+
+ifeq ($(BR2_STATIC_LIBS),y)
+SERD_CONF_OPTS += --static --no-shared --static-progs
+endif
+
+$(eval $(waf-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
