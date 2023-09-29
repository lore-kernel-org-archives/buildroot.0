Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A15E728CF
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 18:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61C474220A;
	Fri, 29 Sep 2023 18:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61C474220A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AY5o2Jb9Lgan; Fri, 29 Sep 2023 18:39:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04EAA42DFD;
	Fri, 29 Sep 2023 18:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04EAA42DFD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 179491BF3A3
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 18:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1F1860BD1
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 18:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1F1860BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cGVOvxUSkgxb for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 18:39:21 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2C9460BC4
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 18:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2C9460BC4
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B1397A4C0A3F;
 Fri, 29 Sep 2023 20:39:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46852)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qmIOH-0007cJ-1V;
 Fri, 29 Sep 2023 20:39:05 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 20:39:05 +0200
Message-Id: <20230929183905.1561844-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230929183905.1561844-1-bernd@kuhls.net>
References: <20230929183905.1561844-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1696012745;
 bh=chcur7zvBYyh0y/F2I+5y2/tYFFa3q67+TftgPvlW3I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DTCgGAziBnMpuRuFSDZsXqMlR4br9glCjYLAB6l55X/FhWLGzyb9HUdQjHUPZ/eoL
 PcS+146XcxhsNPn2VeFGV0+pWDIwkpiNDwYezqzNQkevt7l0wZn4RMtwZMKF+Uvytt
 YtI5c8Q1KcqVTBhQqfuLok7DPlnVP8nsVWyqID4UW9MPJCcZxq915ni0hdUjofK4Xe
 DShS7vXS5aI8SEnwOZr6nUgKJOPjddt/3fKq0aaCs+rd83lWUSt5jHGnZsnsZj1HEa
 SRS+2C1Ve3oe+t8DzWnXHo3qKcMUfuKGOGgXZERVfyKZH2rB1vcllUEUoQGazDoyko
 QaAFshAMcMksQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=DTCgGAzi
Subject: [Buildroot] [PATCH 2/2] package/intel-mediadriver: bump version to
 23.3.4
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index d2ef168a64..4a3b34a9c1 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  66bcce50e9ade800891d08ae3e6cac5aeda60c7ede945ab19e8d2a33e321d06e  intel-media-23.3.3.tar.gz
+sha256  0101a600d70fa423b224d8ab53d8359c880a697af7a32fcfae3c744518277773  intel-media-23.3.4.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index bdb4c699c0..27b8d3bf7d 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 23.3.3
+INTEL_MEDIADRIVER_VERSION = 23.3.4
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
