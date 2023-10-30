Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8689BC4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 10:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FB5A4F596;
	Mon, 30 Oct 2023 10:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FB5A4F596
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o0ImAp3vcRI1; Mon, 30 Oct 2023 10:11:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 225924F4BF;
	Mon, 30 Oct 2023 10:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 225924F4BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E3D31BF955
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62CE7437FB
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62CE7437FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dnDdHQ8DIayj for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 10:11:22 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3203D4329B
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 10:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3203D4329B
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qxPEr-00ErHG-Ga; Mon, 30 Oct 2023 11:11:17 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 1c6ca52d;
 Mon, 30 Oct 2023 10:11:15 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 12:11:05 +0200
Message-ID: <20231030101115.2214402-2-aperez@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030101115.2214402-1-aperez@igalia.com>
References: <20231030101115.2214402-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9rMEmlJ/g+xgCzBnxRoVdRCH7Wx55cCcJ3Fa2LBm/wM=; b=C1VdHLlXyREJBemSATKTnRgPxA
 9YmJMhkRE1apq7FTN4TMo3IU0upQqKSFiarMYMMD3bXbzT1BjBrtNyG2q3ScO4+7R+CIOrUnrpBIg
 B3u5lJyrkWv4PH1UU4SUFCyONKVE+EJ7jxDwE4B3JQBi9gG48bIzOsg4Qg7i/Pl3xk52co2anqC4f
 F3gIst+Eoxbspd6b1FDUWjwtmeAOBxC/6ewnZ/bsb+QvbmJbfKeic2Je54caW5V0xzSkh3ng1waZL
 lLLExEnje84kPQAw2RRo4UQlbQUBPig8hCS1HTa/CyOqVwV1F8ndUfx/QQK/xrDTzhfqTXIEuvNXV
 pp6m+jRA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=C1VdHLlX
Subject: [Buildroot] [PATCH 1/3] package/wlroots: bump to version 0.16.2
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to version 0.16.2, which brings in support for a few new Wayland
protocols, and improved input device and scene graph APIs. Applications
which use wlroots might need to be adapted, and at least rebuilt. The
only packages in Buildroot which use wlroots at the moment are the Cage
and Sway compositors, to be updated in follow-up patches.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wlroots/wlroots.hash | 4 ++--
 package/wlroots/wlroots.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index 04bbd65e43..8ab05393b1 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,5 +1,5 @@
-# Generated locally, after checking https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.15.1/downloads/wlroots-0.15.1.tar.gz.sig
-sha256  5b92f11a52d978919ed1306e0d54c9d59f1762b28d44f0a2da3ef3b351305373  wlroots-0.15.1.tar.gz
+# Generated locally, after checking https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.16.2/downloads/wlroots-0.16.2.tar.gz.sig
+sha256  83e9a11605f23d4bf781ab1947089483d9ec3f7e9ba65398e0609593b77d44aa  wlroots-0.16.2.tar.gz
 
 # Hashes for license files:
 sha256  ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 5b930a51be..b478e57abb 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.15.1
+WLROOTS_VERSION = 0.16.2
 WLROOTS_SITE = https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$(WLROOTS_VERSION)/downloads
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
