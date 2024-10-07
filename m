Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408EECFB45D
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 20:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63AFE80D6B;
	Mon,  7 Oct 2024 20:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MXfj-hF1cJ9O; Mon,  7 Oct 2024 20:28:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60A2E80D73
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60A2E80D73;
	Mon,  7 Oct 2024 20:28:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BC311BF46D
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 20:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 886EC80D73
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 20:28:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMLN5QbHm_ih for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 20:28:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6CBB480D6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CBB480D6B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CBB480D6B
 for <buildroot@buildroot.org>; Mon,  7 Oct 2024 20:28:31 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 377E4B0053E;
 Mon,  7 Oct 2024 22:28:27 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  7 Oct 2024 22:28:22 +0200
Message-ID: <20241007202822.722991-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728332908;
 bh=LW0OnX5lEjyAs1jOFO+NzvSYNVqQQa53bICWRewhPPY=;
 h=From:To:Cc:Subject:Date:From;
 b=OgXPZ64rHwj7FPEiGqMSacDmEiKrkrBzBw1KX4ytzU2/Djhau6kA9sA4O6JELWluV
 JqBb8k98hSsXRjtk0NG0XtBTTWJqclMTN6LYSdmXhWkav5nc4LXRekRbRmRenMAXSf
 LNK9rS4uyL+dohBQ2g63eL42quOjnzH4vOAsYi+cCUc/Dmsktw+ofGQdbuYZCvtEck
 6jVVI2V5Siu0kAwRYSWiQ6LkGq7zzQm8+aFII1Px9NKvqcoy4vPJHgibdoHck/D6ko
 UkvHFtSaqJi2c1YHhIokoaKIh659YtcYxd7oL//1IcxJklRvudSja/Sig8GaUw9qiv
 4lIP0D+3KfeFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OgXPZ64r
Subject: [Buildroot] [PATCH 1/1] package/libjxl: bump to version 0.11.0
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes since v0.10.3, see:
https://github.com/libjxl/libjxl/releases/tag/v0.11.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8014840254
---
 package/libjxl/libjxl.hash | 2 +-
 package/libjxl/libjxl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libjxl/libjxl.hash b/package/libjxl/libjxl.hash
index 4eaadf957c..1778acf2e9 100644
--- a/package/libjxl/libjxl.hash
+++ b/package/libjxl/libjxl.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  e0191411cfcd927eebe5392d030fe4283fe27ba1685ab7265104936e0b4283a6  libjxl-0.10.3.tar.gz
+sha256  7ce4ec8bb37a435a73ac18c4c9ff56c2dc6c98892bf3f53a328e3eca42efb9cf  libjxl-0.11.0.tar.gz
 sha256  8405932022a556380c2d8c272eff154a923feb197233f348ce5f7334fb0a5ede  LICENSE
 sha256  91915f8ae056a68a3c5bdf05d9f6f78bb6903e27a8ca3a8434c9e4ac87300575  PATENTS
diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index b7fe3e1b52..6fc9ca5a6e 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJXL_VERSION = 0.10.3
+LIBJXL_VERSION = 0.11.0
 LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
 LIBJXL_LICENSE = BSD-3-Clause
 LIBJXL_LICENSE_FILES = LICENSE PATENTS
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
