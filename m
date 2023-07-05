Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1B9EB64DA
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 16:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D46A741799;
	Wed,  5 Jul 2023 16:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D46A741799
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GwK8FttY0RpD; Wed,  5 Jul 2023 16:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCD57405C8;
	Wed,  5 Jul 2023 16:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCD57405C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 514131BF59F
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 16:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37600607BC
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 16:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37600607BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wdJexIkZimUR for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 16:29:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4669F60759
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4669F60759
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 16:29:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2DCC3A4C0EF9
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 18:29:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35380)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qH5No-0007zI-33
 for buildroot@buildroot.org; Wed, 05 Jul 2023 18:29:36 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  5 Jul 2023 18:29:36 +0200
Message-Id: <20230705162936.1258747-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688574577;
 bh=v8q23neke6OrWoLZy0FlRdso/SYNrODhsEgsNNr80Yw=;
 h=From:To:Subject:Date:From;
 b=v/7850pYgCc0osoAVQ6GlFDZQQKQK9/qEJqutzLFeoUBSFyCipcFkP5UVRWcqBEfd
 6EHFwtOu08YtvIB4w90D8i1wzgnlSd2b3wIfMjq4SwAGLpzNc3sLGV64AMFKvAt5xL
 3gp4awIE93SLzGSO8/SU7mmBmzy+QaxiPms00/G1U7qcYrxU5GswaZpTb2MrBj/x6n
 JzUwxMXwEAnrQC9E/0qc2aBoH0M6NyNtb+nJHXvS2/Y5fRr6zur1PDjRZfHrp3rXY9
 U9mMhjPMXz7TPw8dls6kB7T9zuFWBvFBHnC69g/8k1IyCy1F184XqDtuWbW92yc7mw
 MxzPLa9rBDthA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=v/7850pY
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.18.4
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
https://www.samba.org/samba/history/samba-4.18.4.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 05563d00cf..cc7eee620f 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.18.3.tar.asc
-sha256  c67e1453165a3918ffffad600236ca3966b47bde4798e89ae600ae3903ccc32c  samba-4.18.3.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.18.4.tar.asc
+sha256  6ba7b3503cc59c9ff4f6fcb1b510c2c855fff93e0b366ab891a32a4732e88e53  samba-4.18.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 75938e21a8..a14cc63c01 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.18.3
+SAMBA4_VERSION = 4.18.4
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
