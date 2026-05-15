Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839CACD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B7718425B;
	Fri, 15 May 2026 13:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSPCwFqAYqQv; Fri, 15 May 2026 13:29:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 784898427E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851740;
	bh=snJ+rRoz0L3GC9q26TcEUaDqrl8K6tc3by/JfJjAe2k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qdCcbS8CTCDlITDRQDR/7gcmh+nhGb5ZaHiKvkdcwpmYnPQjPg2s4JATtxl0/1CE5
	 f5VXFA9LvUvwydQLG7bJGWmAcMDBk0QUqg4KCyJybVa/7YwY4JSJKbV/qZtauMFhOz
	 kYOUEmFtoYXEBM7PO1sKaXfhruYq8gEY9pl31pP6eIJXxDybq1YPeIU2/Qr00CdB2k
	 eF1oBmTqxArrplV/BWLkgonWtrzq79YhA0kejfnW4FtPwyUm/ExKcV6Cf37L+aCMAI
	 gTERXemKbEc9zONfNZmydwXQkecxviCiejIlckUWeyRHY+EOi3dcyVGoJTGUKianT3
	 wmhWerNaWfiNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 784898427E;
	Fri, 15 May 2026 13:29:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1199736F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB71561569
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HU7px_1yDsfE for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 176246156D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 176246156D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69FE586354; Fri, 15 May 2026 13:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 14:27:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 761c4f74a9d631ee1c02118012c3d8d93eaaf1e9
X-Git-Newrev: 35aaa01cfa813cce78f299fb7f04040dece815c6
X-Patchwork-Hint: ignore
Message-Id: <20260515132817.69FE586354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libpjsip:
 security bump version to 2.17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/35aaa01cfa813cce78f299fb7f04040dece815c6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/pjsip/pjproject/releases/tag/2.17

Fixes the following CVEs:

CVE-2026-25994, CVE-2026-26203, CVE-2026-26967, CVE-2026-29068,
CVE-2026-28799, CVE-2026-32942, CVE-2026-32945, CVE-2026-33069,
CVE-2026-34235, CVE-2026-40614, CVE-2026-40892, CVE-2026-41416,
CVE-2026-41415, CVE-2026-42225.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit e1f77168d11cb5992166610283a631c8bc777b96)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libpjsip/libpjsip.hash | 2 +-
 package/libpjsip/libpjsip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index 65f52bf3b1..5f8e4b0eda 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3af2e481d51aaa095897820fa2ee26c30e530590c6ca56d23e4133bbdad369eb  pjproject-2.16.tar.gz
+sha256  065fe06c06788d97c35f563796d59f00ce52fe9558a52d7b490a042a966facce  pjproject-2.17.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 38adeff626..449e44586d 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.16
+LIBPJSIP_VERSION = 2.17
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
 LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
