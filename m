Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F8CE75453
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 12:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F3A34208B;
	Tue,  3 Oct 2023 12:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F3A34208B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URkbwdJ-vliQ; Tue,  3 Oct 2023 12:22:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F3E9420AA;
	Tue,  3 Oct 2023 12:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F3E9420AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EB351BF352
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 12:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27D2E61168
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 12:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27D2E61168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lf6_R4JCHGIM for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 12:22:04 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BDB061148
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 12:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BDB061148
Received: from fli4l.lan.fli4l (p54a1b0e1.dip0.t-ipconnect.de [84.161.176.225])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 269D3A4C00A8
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 14:22:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38528)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qnePY-0007Wb-2y
 for buildroot@buildroot.org; Tue, 03 Oct 2023 14:22:00 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Oct 2023 14:22:00 +0200
Message-Id: <20231003122200.2677353-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1696335721;
 bh=3cpdIqphuhnzUVRHG8L981dpPsatz5NpkyufqpqeIHI=;
 h=From:To:Subject:Date:From;
 b=MTpgLM2gxeAm4A8uZtsjvbP7IJadPd+moMK7cbIP2g6L2Bxpg3ELh1mZkKfiSSkuY
 GNldEN9tYcwliJuusP9hXXVO2AMG7sJUhxYOihuKKm2a/8bm4s64cj3p9DqsCLyQz4
 8N2sLClPMtLPI4AT4purM9hFcjZ6hi33ia7NkMG+xWLjvFfHOJWt361EkzN5pAmtO0
 WduMQg54czaiASzbPy7gaH2FM50id/m7RnrWrls0nY4x7PIHbyvV4Y72UWj0l+nmwu
 3kUeuPwCN2rK0D8aD8VvOxYvISlPsQZ7rG3zdqFKJCVtKpuxeD/5PDW9i2qW6PPz1n
 QheadeO701hYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=MTpgLM2g
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 23.3
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
http://stellarium.org/release/2023/09/25/stellarium-23.3.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/stellarium/stellarium.hash | 2 +-
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index e0ee61d2b6..a2f511a283 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,4 +1,4 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha256  3aee154d0de3ed484e3e6fee027cf73e6dd0a677b3ea1af348b225ac02339008  stellarium-23.2.tar.xz
+sha256  179420e9e9f11278b78dc54e14458452c92055cc8923538748c8a0f961714fc2  stellarium-23.3.tar.xz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 43c99413dd..94ad4e1352 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 23.2
+STELLARIUM_VERSION = 23.3
 STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
