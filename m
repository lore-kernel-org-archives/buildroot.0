Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D52CFB43F
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 21:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 571B2810BA;
	Sun,  6 Oct 2024 21:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdCMCXfR64RH; Sun,  6 Oct 2024 21:25:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E2DC810BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E2DC810BB;
	Sun,  6 Oct 2024 21:25:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEB8D1BF40F
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 21:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB392810BB
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 21:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EXvf4OPQyuX for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 21:24:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90B56810BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90B56810BA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90B56810BA
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 21:24:57 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 16128B0059A;
 Sun,  6 Oct 2024 23:24:52 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  6 Oct 2024 23:24:47 +0200
Message-ID: <20241006212447.883788-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728249894;
 bh=xCFfVR/afJx0tZSl8p/fijg7oZ/EcSyFTr+zhTx1hlk=;
 h=From:To:Cc:Subject:Date:From;
 b=VG15dLUHOk/WLZtHpaetnsPuXFMYdTe/zL04M0S65qRDN5kmqVATrqp2TkHMmxUHy
 6c28mY9vHWUoNMcpMMnNe+NGUZ4Zd0f6yfDwxnJvO4SaBcDoeOHydcwpwj1vjUoVEc
 +JgtYrZw4UHVaeA4Z5G6zN2pBsw81i0itdFi+fPVIB1lpt5zvVnY6s696MoCIdkUNa
 sy1A5IpJKGN4U4sXfFG0FplRNQ/yDkdaVJKHpObTez6vJAJDxvVwNtaN41lk9A/3zy
 3V/enJqFxk28oMJc9sPlMXqbKPqxp7CeyPlYWNh8h1yPhlRgru+lWBJ0EdNlC6/Dux
 QbsLu4o2u5evQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VG15dLUH
Subject: [Buildroot] [PATCH 1/1] package/hwloc: bump to version 2.11.2
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
Cc: Steven Noonan <steven@uplinklabs.net>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 2.9.3, see:
https://github.com/open-mpi/hwloc/blob/hwloc-2.11.2/NEWS#L20

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8005231294
---
 package/hwloc/hwloc.hash | 6 +++---
 package/hwloc/hwloc.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
index 8010b857f0..f85508b7a6 100644
--- a/package/hwloc/hwloc.hash
+++ b/package/hwloc/hwloc.hash
@@ -1,5 +1,5 @@
-# From https://www.open-mpi.org/software/hwloc/v2.9/
-sha1  76b49087619b46d71e18bd1131d35a5ccf5de791  hwloc-2.9.3.tar.bz2
-sha256  5c4062ce556f6d3451fc177ffb8673a2120f81df6835dea6a21a90fbdfff0dec  hwloc-2.9.3.tar.bz2
+# From https://www.open-mpi.org/software/hwloc/v2.11/
+sha1  8c15d9707c2390bcdc564df11395a36c8fc775be  hwloc-2.11.2.tar.bz2
+sha256  f7f88fecae067100f1a1a915b658add0f4f71561259482910a69baea22fe8409  hwloc-2.11.2.tar.bz2
 # Locally computed
 sha256  d79a936a42f3c6cb7c8375a023d43f4435f4664d3a5a2ea6b4623cff83c7fc06  COPYING
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 8fe9e648a7..0d03757d83 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HWLOC_VERSION_MAJOR = 2.9
-HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).3
+HWLOC_VERSION_MAJOR = 2.11
+HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).2
 HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
 HWLOC_SITE = https://download.open-mpi.org/release/hwloc/v$(HWLOC_VERSION_MAJOR)
 HWLOC_LICENSE = BSD-3-Clause
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
