Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5A2C072A2
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 20:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B69E60F5E;
	Wed, 15 Nov 2023 20:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B69E60F5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQ9MBVJgJu0u; Wed, 15 Nov 2023 20:31:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F32F560BED;
	Wed, 15 Nov 2023 20:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F32F560BED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78C2B1BF599
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 20:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5468D408E6
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 20:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5468D408E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sXMA4e0E19tu for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 20:31:23 +0000 (UTC)
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E524401E1
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 20:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E524401E1
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 3MXfrCWcVHntA3MXfrgeMt; Wed, 15 Nov 2023 21:31:20 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 15 Nov 2023 21:31:18 +0100
Message-Id: <20231115203118.3578238-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115203118.3578238-1-giulio.benetti@benettiengineering.com>
References: <20231115203118.3578238-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOQTWhKHGw3gheVm649opjm9dUwK+B5mJlImQF4gyJxwZl/94UsD6mtKm1Sz4i3TxjnSc7WcDBdLkrGT9n8HCB8zOgLxo8o2i0Mz2a3b+bcMSV38EBfj
 Btz6KGrtT01igXFv/qd3V+GITQQHsJVZUBY0ohN7UV1m7Ru0KIHFhAqMJi/QmvbkPmOeZ4KLnuYkNUfl5BnS3F39XvDsy7+ZXuME8cXfHomLWAlzRKIFQ5Up
 aEOnD2Wx/8mqch9hkXAoru94vIAC+kJg8+x6GOaSL/jYVtAps2qUXtDOIkSXvKLiJ6UzLqUhVsUtFWvx3K1pBlN9aq2f2hsff/bCW6Zu84cpbKTL/LeOfBsu
 jAeq1+kZ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1700080280; bh=RYBLDrEmM7G3HUgw/CybtzYtPkDZyYePD+F7E+qs/R8=;
 h=From:To:Subject:Date:MIME-Version;
 b=lEB8s4b5AebpudblBDjF6GInIdbwYCJGMQ7Fhv6HTCp5YVZzJaLg1CP5gWdEo7LH8
 UG4bpNTP8AmH/VedGWZGwCHGtyxvUSUOZe7jXMOva1ooReEhqMm+91dWElEc1fHYUc
 UEtoOkFw0ogz40I8P+S7/VOJ0NGMpxo8rnysFm/SSSXcEgvvlUI4nfl1zZZhKoESyU
 u26sB7NyNeI7QD7DhyURUhjxRtOEIXqjF2TgF0OtfWCOSEcvIh9FpeqvfR1UNhtPgg
 KGd+t5O88bVyFg7ItL6npIMlBy4rSSOcgYlOu65v62qwKfrHeDpXL56hM2K1MPRU4P
 Sa6i3ZNFn3bow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=lEB8s4b5
Subject: [Buildroot] [PATCH] package/rtl8723ds: bump to 2023-11-14 version
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It supports up to Linux 6.7.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723ds/rtl8723ds.hash | 2 +-
 package/rtl8723ds/rtl8723ds.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index e94a7b40ef..f2829d3f04 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  672787c3f3d1f795b750cd74de8ca34bb661b8ae60f5aa50fb279ec08ff3f05f  rtl8723ds-ec85dc6b9f72bfe413bff464ed01a272e29c8dbe.tar.gz
+sha256  4f3006ffc1604854edbd6d25ad468ca57f6bcfd7814e4dab57725f144f00aa94  rtl8723ds-52e593e8c889b68ba58bd51cbdbcad7fe71362e4.tar.gz
 sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index f62ce2bf6c..2536450d80 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = ec85dc6b9f72bfe413bff464ed01a272e29c8dbe
+RTL8723DS_VERSION = 52e593e8c889b68ba58bd51cbdbcad7fe71362e4
 RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 RTL8723DS_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
