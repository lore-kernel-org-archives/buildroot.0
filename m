Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78F5EB64DA
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 17:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 427B1400D9;
	Tue,  4 Jul 2023 17:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 427B1400D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFNWR1mQGxbc; Tue,  4 Jul 2023 17:03:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78F8740AF0;
	Tue,  4 Jul 2023 17:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78F8740AF0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A92B11BF82F
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 17:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FEAD605A2
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 17:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FEAD605A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cCz58Kxtlf6F for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 17:03:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC874605A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC874605A1
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 17:03:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D7383A4C01A0
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 19:03:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49602)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qGjQe-0004PB-20
 for buildroot@buildroot.org; Tue, 04 Jul 2023 19:03:04 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  4 Jul 2023 19:03:03 +0200
Message-Id: <20230704170304.754954-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688490184;
 bh=ButWSr8G7/U2oXVdIlE1oZPP8YnRfN69BRt8kwejNzg=;
 h=From:To:Subject:Date:From;
 b=TjHnTapr1yiMBVc0DZaCXN3uwL7lxqP/76oZuAEvH45hhvW5FvJPv/RuQykp5tA/X
 edS/OcAJQrE24mBsYUBUKOyNGljPQZ8HcSriII9C8tRePD9rdvJ0fssaXuXfzNE2GV
 lfnJAH4BBHmzOsiwr2asP1JntQY0Aj3AY31dmH5OdvbaDzWDqKiGc4w4FC6R9EgUhv
 n/awSS9LK47iX5qvA2VD8zR68lTz5ov+Hcf8zW1NHZWWHtjYTiT0IeW3ZjqAxxMfPQ
 RoCv3HC7ALYHWbIPzyuK6mdSspALVzaMWFba3oKznVJviMR/Vddqz1niSWBMwzJgaJ
 HAecNvk9qTOnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=TjHnTapr
Subject: [Buildroot] [PATCH 1/2] package/libva: bump version to 2.19.0
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

Release notes: https://github.com/intel/libva/blob/v2.19-branch/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libva/libva.hash | 2 +-
 package/libva/libva.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 8173876bbd..b9dba9e91a 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9d666c70c12dfefcdd27ae7dea771557f75e24961d0ed4cb050d96fb6136f438  libva-2.18.0.tar.gz
+sha256  8cb5e2a9287a76b12c0b6cb96f4f27a0321bbe693df43cd950e5d4542db7f227  libva-2.19.0.tar.gz
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index dbb0b8f6e4..fd796cfd6a 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.18.0
+LIBVA_VERSION = 2.19.0
 LIBVA_SITE = $(call github,intel,libva,$(LIBVA_VERSION))
 LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
