Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A47E78499
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 22:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15DBC403F8;
	Sun,  1 Oct 2023 22:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15DBC403F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I3Xk8RlpCZSD; Sun,  1 Oct 2023 22:13:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F87540363;
	Sun,  1 Oct 2023 22:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F87540363
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FC371BF283
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 22:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECD7E820BE
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 22:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECD7E820BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFhZBhiHxV3N for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 22:12:59 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98333820BD
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 22:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98333820BD
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99de884ad25so2211639766b.3
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 15:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696198377; x=1696803177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=npM/ad58aUlc8C6+1Xi36ZIgGBMTRe9sczuWDtXpQvs=;
 b=HKb7MMBnGGRHIc3ChVbPdqe+X8eR0nqMlliITSaSb/soTR7lWMUtXjpGwn2dPhmf7+
 F4qg4rBL9dtqa6nvYtSbx/0x0XrvpL1y6ftU22GN4ib4PKq0G+1ros7PzmwFL2M2OPKG
 dLRqRkr4fYkvJ/+1nWUg2vxIkdUg/+QakeM/M074RylnNowUrjhwUrxr3xyOrKNxO6Rh
 mxU1lSD9QWJjjokYRRE5R8e6gjXteVUulFx0BhKWXHar5pPG5zoPj4CnWznfDpdMnCjk
 WQv5JgMR7+Pu1oCvBTVHw2rWgU/kpTbUMBOis9KmyhaE5NLc2zcUKdXVTnZxcbuny5D2
 TEtg==
X-Gm-Message-State: AOJu0YylsaNq/yeyipwzzjmd60K6qm3XTe4ExbvTVVoVKrPz2Kwwz4Xe
 jJF4djZN67dTUMyx77K+F0J3HoaeBbTOXA==
X-Google-Smtp-Source: AGHT+IFOQabMSGrOhssYWjYOGtlKT0mZUEUV42GJqop7Sec9+lInzAdQ9jMc+851OPeudMjVyjherQ==
X-Received: by 2002:a17:906:7496:b0:9b2:d018:20b2 with SMTP id
 e22-20020a170906749600b009b2d01820b2mr7996917ejl.39.1696198377025; 
 Sun, 01 Oct 2023 15:12:57 -0700 (PDT)
Received: from saeedkazemi-ThinkPad.abbrnd.local
 (2a02-a46f-1ab1-1-eb36-98a8-bfc3-7d40.fixed6.kpn.net.
 [2a02:a46f:1ab1:1:eb36:98a8:bfc3:7d40])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a170906051300b009937e7c4e54sm16019481eja.39.2023.10.01.15.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 15:12:56 -0700 (PDT)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 00:08:41 +0200
Message-Id: <20231001220841.2586827-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696198377; x=1696803177; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=npM/ad58aUlc8C6+1Xi36ZIgGBMTRe9sczuWDtXpQvs=;
 b=Qd4iwDC7SM5b1EefIhlwGs4Zy5eKXPf1/+P63jDVJ6zgqhSZHscclFPE1n3tPkBUnw
 PjvRqzcUrfs2CLq16jI+tz9zrc1xpuW46iOOKL/9j+OKdpH1mgwB9lnetaXFzs310L5h
 r0hJgEF+R9XdlLWAGL31kCsrZmU6KBU3+6q9Esz/wUQKZCYCTZ7u5fDeKe84pNCM10+J
 5x3WayjQsgSNCurk9SLKNARO2Tvz1F8a7WKrIGZlQAY2+hk6RSjmpPocTX4JxlejDuJ+
 LCtkCxi4J0o4McvzH9a00Mlj0bWvfz2tnpnV1FYi5PfxiwYUh5dCRdbEPAlMHqreJzCc
 PTZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Qd4iwDC7
Subject: [Buildroot] [PATCH 1/1] package/procs: new package
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
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

procs is a modern replacement for ps written in Rust

https://github.com/dalance/procs.git

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 DEVELOPERS               |  3 +++
 package/Config.in        |  1 +
 package/procs/Config.in  |  8 ++++++++
 package/procs/procs.hash |  3 +++
 package/procs/procs.mk   | 12 ++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/procs/Config.in
 create mode 100644 package/procs/procs.hash
 create mode 100644 package/procs/procs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c45e7315da..45ea078406 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2626,6 +2626,9 @@ F:	package/agent-proxy/
 N:	Ryan Wilkins <ryan@deadfrog.net>
 F:	package/biosdevname/
 
+N:	Saeed Kazemi <kazemi.ms@gmail.com>
+F:	package/procs/
+
 N:	Sam Lancia <sam@gpsm.co.uk>
 F:	package/lrzip/
 
diff --git a/package/Config.in b/package/Config.in
index 009f7ba186..c7681c22e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2729,6 +2729,7 @@ menu "System tools"
 	source "package/powerpc-utils/Config.in"
 	source "package/procps-ng/Config.in"
 	source "package/procrank_linux/Config.in"
+	source "package/procs/Config.in"
 	source "package/psmisc/Config.in"
 	source "package/pwgen/Config.in"
 	source "package/quota/Config.in"
diff --git a/package/procs/Config.in b/package/procs/Config.in
new file mode 100644
index 0000000000..946fa68c63
--- /dev/null
+++ b/package/procs/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PROCS
+	bool "procs"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  procs is a modern replacement for ps written in Rust
+
+	  https://github.com/dalance/procs.git
diff --git a/package/procs/procs.hash b/package/procs/procs.hash
new file mode 100644
index 0000000000..1c2fb5c3d5
--- /dev/null
+++ b/package/procs/procs.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  643b7ba4b769ee9f336d441ecdac779c3d52e5719a15c14bb0acb3609ce1cd99  procs-0.14.0.tar.gz
+sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
diff --git a/package/procs/procs.mk b/package/procs/procs.mk
new file mode 100644
index 0000000000..a074ee1311
--- /dev/null
+++ b/package/procs/procs.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# procs
+#
+################################################################################
+
+PROCS_VERSION = 0.14.0
+PROCS_SITE = $(call github,dalance,procs,v$(PROCS_VERSION))
+PROCS_LICENSE = MIT
+PROCS_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
