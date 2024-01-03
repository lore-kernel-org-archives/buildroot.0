Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C196C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 07:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C059581E93;
	Wed,  3 Jan 2024 07:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C059581E93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ndum2u-k4Wd5; Wed,  3 Jan 2024 07:12:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C81781E45;
	Wed,  3 Jan 2024 07:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C81781E45
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75C3A1BF95D
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 07:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C2D740503
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 07:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C2D740503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ut06TJXojuJp for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 07:12:12 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01E9740A95
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 07:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01E9740A95
Received: from fli4l.lan.fli4l (p5b3a0630.dip0.t-ipconnect.de [91.58.6.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 26041A4C0367
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 08:12:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42648)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rKvQ9-000000001oW-3wzo
 for buildroot@buildroot.org; Wed, 03 Jan 2024 08:12:09 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 08:12:09 +0100
Message-Id: <20240103071209.6187-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1704265930;
 bh=fUag98ypB4KI+KDVA0asIKcL9szxd9VNSfkbJa2tnhY=;
 h=From:To:Subject:Date:From;
 b=kpLZf69hXzaNZfW9OM+qa0twKFtbp2hXM7hVfg8D9py++z9NF8h0LwnCVLcMqxmgJ
 +IkxlvmIHpNeRY72nRxYPGZgDsonvBHjDLHCU5sp3fQ7KTy0UuxnLI04Ln/mepvbNF
 dj/CLGmJa6VydkrfeABuEsHFpWHLUL5JcOKJi1IJYoneI2ArQYK/utWypnBXB9RQj3
 Q8fk63WqbS5sKkUwAMA1zICi53Mipi46Nq44asx4mLtxeN0cqamv8nhdGq1uYBaDo4
 fE5O6TkSA9L3q6vTX6I8kumNrsxtAEg1TfdqFYHzlVQZ5Q9vUyRR/dqNmUS+djpNwP
 aSDDHSklEPjBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=kpLZf69h
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: security bump version
 to 1.10.11
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
https://developer.signalwire.com/freeswitch/FreeSWITCH-Explained/Release-Notes/FreeSWITCH-1.10.x-Release-notes_25460878/#11011-release-date-22-dec-2023
https://github.com/signalwire/freeswitch/releases/tag/v1.10.11

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freeswitch/freeswitch.hash | 4 ++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 504be12090..3f16467e22 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,5 +1,5 @@
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.10.-release.tar.xz.sha256
-sha256  d2c702c7f4bd6eca539c3981cf859ad5c1846d9283829e24cd75686f2322b9df  freeswitch-1.10.10.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.11.-release.tar.xz.sha256
+sha256  7f9603a691220d9f47da42f3b19290b629b69dceb2eee56448f0a7cefcf9d1a1  freeswitch-1.10.11.-release.tar.xz
 # Locally computed
 sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 07d436cf0b..5b9dc49c9b 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.10.10
+FREESWITCH_VERSION = 1.10.11
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
