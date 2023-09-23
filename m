Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C24CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 11:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3364840184;
	Sat, 23 Sep 2023 11:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3364840184
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJ_lKK8LSxFZ; Sat, 23 Sep 2023 11:48:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74F38405BD;
	Sat, 23 Sep 2023 11:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74F38405BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2567F1BF5E9
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 11:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B7CB820A9
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 11:48:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B7CB820A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5vqAB7wVBkYU for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 11:48:53 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 195EF820A7
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 11:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 195EF820A7
Received: from fli4l.lan.fli4l (p5b3a0af9.dip0.t-ipconnect.de [91.58.10.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05CA5A4C0313
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 13:48:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36206)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qk17y-0001OL-2Z
 for buildroot@buildroot.org; Sat, 23 Sep 2023 13:48:50 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 13:48:49 +0200
Message-Id: <20230923114850.1477656-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695469731;
 bh=RnThy06iju7lnJxBh4gq/LaODLPIfHybUmYvS303MYo=;
 h=From:To:Subject:Date:From;
 b=E7AMorZdNvEtfWIfr8p/u05x77LLbZpVNSiRKROPO60lVTQh0uZb0EIXVHLpRYp9l
 YwAWBuCoXxMwgfYR7mkawOObb5OCexb6uQn83uB69PvBnY1GNK2LVOrFD3nMK9DcgW
 e+/DPJ2g3l9eSkfiG9rsUag1neCWgkfKbWb8iSqE22/xp13rvcVY4J66ZGq6sl5TCl
 N7kCJykLOVNON8GedXqzDbPpQa6rIV0rVPb0vhj4yitILt6KgexXbKpOPFE4FItBkd
 rg+hcVH7kK0XyQV1If0iiEG0nYmyFUFMRY69z4zH9E26uCNwFU0T2IomTcu9aWDQoK
 td1qf4dc9Y9hw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=E7AMorZd
Subject: [Buildroot] [PATCH 1/2] package/libva: bump version to 2.20.0
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

Release notes: https://github.com/intel/libva/blob/v2.20-branch/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libva/libva.hash | 2 +-
 package/libva/libva.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index b9dba9e91a..2fffe8701f 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8cb5e2a9287a76b12c0b6cb96f4f27a0321bbe693df43cd950e5d4542db7f227  libva-2.19.0.tar.gz
+sha256  117f8d658a5fc9ea406ca80a3eb4ae1d70b15a54807c9ed77199c812bed73b60  libva-2.20.0.tar.gz
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index fd796cfd6a..9e9d5d698c 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.19.0
+LIBVA_VERSION = 2.20.0
 LIBVA_SITE = $(call github,intel,libva,$(LIBVA_VERSION))
 LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
