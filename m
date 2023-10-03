Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E564E75457
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 12:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F772420A0;
	Tue,  3 Oct 2023 12:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F772420A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQdLpq2hBK4c; Tue,  3 Oct 2023 12:37:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E28B4209B;
	Tue,  3 Oct 2023 12:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E28B4209B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 752C01BF352
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 12:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5ABB6403C6
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 12:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ABB6403C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yjZBm1_yJ_Iv for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 12:37:01 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AE19403C4
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 12:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AE19403C4
Received: from fli4l.lan.fli4l (p54a1b0e1.dip0.t-ipconnect.de [84.161.176.225])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 98959A4C1040
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 14:36:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44690)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qnee3-0001el-19
 for buildroot@buildroot.org; Tue, 03 Oct 2023 14:36:59 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Oct 2023 14:36:59 +0200
Message-Id: <20231003123659.2704273-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1696336619;
 bh=l/nN6SesLYAhItZLojX6oRGLzjoTt7JRoPrDfk2D4Lc=;
 h=From:To:Subject:Date:From;
 b=0G6ARG0kYWo+nCCh4DHCvMRsOZC2P5o8pT2XBkMP5l4JWqmKbbW3StraL9syCOsL1
 +HVdNq3VgN6s+op/Ls3rEmOZdzatwdnC1icbohtSSCO+cX0DN670hZ+GrEqsqaHW17
 ntFoWI+jxkpiXpqbeH2d6h9Q4FY0saqvMdRUFdf0pr5EQWDjrgcmF8qfil1x8D5d4h
 jv5I2/wBMmPEjtDtEsZlOuvkP/trOOgOB9szUdUCyjTJmaph7IhPknaUx2mvWPE41W
 Swl1WbXlQ5/Tod8z4q58xNsf2Ldxm/RD4DTbo5CNgLHLbtTd9JAkQhNCsacgs6tQMm
 cxs/spd0ducag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=0G6ARG0k
Subject: [Buildroot] [PATCH 1/1] package/libsndfile: bump to version 1.2.2
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
https://github.com/libsndfile/libsndfile/releases/tag/1.2.1
https://github.com/libsndfile/libsndfile/releases/tag/1.2.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libsndfile/libsndfile.hash | 2 +-
 package/libsndfile/libsndfile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsndfile/libsndfile.hash b/package/libsndfile/libsndfile.hash
index be3ba41dc6..94d6f96335 100644
--- a/package/libsndfile/libsndfile.hash
+++ b/package/libsndfile/libsndfile.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  0e30e7072f83dc84863e2e55f299175c7e04a5902ae79cfb99d4249ee8f6d60a  libsndfile-1.2.0.tar.xz
+sha256  3799ca9924d3125038880367bf1468e53a1b7e3686a934f098b7e1d286cdb80e  libsndfile-1.2.2.tar.xz
 # Locally calculated
 sha256  ad01ea5cd2755f6048383c8d54c88459cd6fcb17757c5c8892f8c5ea060f6140  COPYING
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index d8d1725444..89eb4f3c1d 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSNDFILE_VERSION = 1.2.0
+LIBSNDFILE_VERSION = 1.2.2
 LIBSNDFILE_SOURCE = libsndfile-$(LIBSNDFILE_VERSION).tar.xz
 LIBSNDFILE_SITE = https://github.com/libsndfile/libsndfile/releases/download/$(LIBSNDFILE_VERSION)
 LIBSNDFILE_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
