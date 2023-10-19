Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5A3CDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 20:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A0BD60AB3;
	Thu, 19 Oct 2023 20:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A0BD60AB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gqEWms1p3Mft; Thu, 19 Oct 2023 20:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AD7E61119;
	Thu, 19 Oct 2023 20:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AD7E61119
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 504AE1BF2EA
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 20:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27B1943130
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 20:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27B1943130
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8WPUC9LOi_wU for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 20:32:46 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C34A740106
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 20:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C34A740106
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1F697A4C00C6;
 Thu, 19 Oct 2023 22:32:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60298)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qtZhB-00027o-2p;
 Thu, 19 Oct 2023 22:32:41 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 22:32:41 +0200
Message-Id: <20231019203241.2335161-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697747562;
 bh=xy/n1vqolLPka40jIuYahypFOcLAaZy3+RBJQLCNkwM=;
 h=From:To:Cc:Subject:Date:From;
 b=RS8qpv5qt8U68i76NywFH+0nyIj7SESDSlfP9gfywKXutgXl97awIc/ADelIfgnZ8
 485teEacYke/9UYRiMBGj4dWvidntNMh0gcFbFRYRxw9l0U2Ll1ohNkJu58iQA1wMO
 pwEg1AJwJjIaIItdmrWBh0S7oPbsFDhoQmrrL9SLKZ72HxAnQOldHGUScPjWQbAaR9
 8flwjpGywuKbSMzYjE+y6M5LghEXTuZ+MQmLvmoHkRENeQDEFhps+t9djSQotEJmTu
 xIeK2jAgKJMd75kfG0BWAm6ngg7LfduELlWBEBjYFUteCzAnqt/BL02oDWPGUAD8Hq
 5jNbcAOQF25+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=RS8qpv5q
Subject: [Buildroot] [PATCH 1/1] package/intel-mediadriver: bump version to
 23.3.5
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
index 4a3b34a9c1..93930f07f2 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0101a600d70fa423b224d8ab53d8359c880a697af7a32fcfae3c744518277773  intel-media-23.3.4.tar.gz
+sha256  67fd15654bb3c596feb8c85e81221de5632e11f598421c35adc4453d727f0130  intel-media-23.3.5.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 27b8d3bf7d..58cc83fc27 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 23.3.4
+INTEL_MEDIADRIVER_VERSION = 23.3.5
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
