Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2C2C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22FDA417DD;
	Wed, 30 Aug 2023 20:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22FDA417DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mIo-i39NUTLn; Wed, 30 Aug 2023 20:54:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68ABB417DF;
	Wed, 30 Aug 2023 20:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68ABB417DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49B861BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21F79417BF
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21F79417BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gnD57vBCI_MN for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:54:17 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50A53417DF
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50A53417DF
Received: from fli4l.lan.fli4l (p5b3a0af8.dip0.t-ipconnect.de [91.58.10.248])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 987ECA4C02CE;
 Wed, 30 Aug 2023 22:54:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37156)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qbSCR-00087b-17;
 Wed, 30 Aug 2023 22:54:03 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 22:54:02 +0200
Message-Id: <20230830205403.1205586-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1693428843;
 bh=2cXpdUe+qX5g1opeGXN/TyGnvmNgxw3ZhlQHBntx0rY=;
 h=From:To:Cc:Subject:Date:From;
 b=IMD/FCi8K8PBQwUdr5Kjy3zzN/lBB5rgRF9kalZ/aMDj8/UYWv1kcOlAWgAveKHyB
 DSuD7kEc8TtVn1A9pfX99cZPM+OfjpwKihcpjrr7pSaqZ3Q4/TFZXAw/euEomg3q7O
 sNwyWF3BRjrWZ8cPlxSSU8t0iYTyQs3aUeSAQl88HHqmIvFBumZR4Xe6BsQcEazwZo
 vBWu0UjeU9SuQBrjQ4gjSJ66HvJkb1+0M9HD2ZeXZjplkumCm3xv++FQWvY1GiXBNk
 UiYG1+z36th1LeHHqTubQUGSenCnpVfXQaw1DFw/NIt4Q697KAdDtQnqxGuFivDZiU
 H6hOfz7Yy/A0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=IMD/FCi8
Subject: [Buildroot] [PATCH/next 1/2] package/intel-mediadriver: bump
 version to 23.3.2
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
index 39aa23a973..012317db3d 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ce929da08ea917e4bb133ae67b5de42dce9c459b06a2670358a6ada00c48db58  intel-media-23.3.1.tar.gz
+sha256  6a0fc8513fb60e2e2fc2178a8fb0b25cb5dbacf52a645af9a9297fc5f43822ab  intel-media-23.3.2.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index a50bf8c068..53975eb735 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 23.3.1
+INTEL_MEDIADRIVER_VERSION = 23.3.2
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
