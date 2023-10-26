Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8010FC25B67
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 17:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 154444012D;
	Thu, 26 Oct 2023 17:34:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 154444012D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iMxa8g1KvJhx; Thu, 26 Oct 2023 17:34:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF638416A4;
	Thu, 26 Oct 2023 17:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF638416A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9DDC1BF976
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 17:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBC5484036
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 17:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBC5484036
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iYqt_xts2E_l for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 17:34:44 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CB3B84032
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 17:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CB3B84032
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AE4A2A4C09B9
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 19:34:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52682)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qw4Fm-0006W8-1M
 for buildroot@buildroot.org; Thu, 26 Oct 2023 19:34:42 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 19:34:42 +0200
Message-Id: <20231026173442.4149220-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1698341682;
 bh=M2tupDmwuo3MKxrxLzlPjfVkx2EOncAndSfQk2efxak=;
 h=From:To:Subject:Date:From;
 b=oZ386IhaeVKtd0SuXL4K9Lcjg0FmvzcUaDLy5ejUiU2ZCLvZHN0u5Sd+YBnAeWRxS
 EA57Zl6q4k2dh4sD/8lOU5ReY//CE63q2ddH3jk46RJKLnmSxp6GjzOZHngrtd+UcL
 gQni4HUjJfcwoo7edONONz3s6k2vxzvt3q6W+eXc3AVHZfYFzel9qiFBLQGASvtQc7
 Gl8pg5+3DBYB0y4STC3PR+f4j/vmwZ+LmEW1OxRh3/TtnABesZ97ERCjRohBxQcrtF
 PbplANI9yAEukeh5XcCWNGehQOo84O0PDLCd3IbMeoJp0ra4M8z3AS5UCBYJIV1vac
 2h2eL/Jq+e9WA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=oZ386Iha
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump version to
 1.0.4
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

Release notes:
https://blog.clamav.net/2023/10/clamav-121-113-104-010311-patch.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index c140a2df07..cb4f67156c 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8779458dc31fdee1232eb8986f092d25568b39f5d337c0cbcd9c1abb5dc2886b  clamav-1.0.3.tar.gz
+sha256  3d6b99644874558b7de5faf9b340737a9bbc1083878fcd95a49f989c7c980146  clamav-1.0.4.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index e1e0fa8c63..c9012261fa 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.0.3
+CLAMAV_VERSION = 1.0.4
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
