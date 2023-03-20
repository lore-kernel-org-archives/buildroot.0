Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E769C6FD1D
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 12:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E612E4053C;
	Mon, 20 Mar 2023 12:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E612E4053C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WOXxwV_hJJBs; Mon, 20 Mar 2023 12:39:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 338FB403A2;
	Mon, 20 Mar 2023 12:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 338FB403A2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B9FAA1BF3FC
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 12:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A153A404CA
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 12:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A153A404CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5wgY-0vrSJES for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 12:39:30 +0000 (UTC)
X-Greylist: delayed 00:29:57 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5A4D403A2
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch
 [185.125.25.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5A4D403A2
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 12:39:30 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
 by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4PgCxZ0TbdzMqFjT;
 Mon, 20 Mar 2023 13:01:06 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4PgCxY55gJzMtb1d; Mon, 20 Mar 2023 13:01:05 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 20 Mar 2023 13:01:01 +0100
Message-Id: <20230320120101.595396-1-nicolas.serafini@ik.me>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ik.me;
 s=20200325; 
 t=1679313665; bh=2ExQUEnVVz/dYCfOzomV29HdMG9OMMt+/ZuGcaFGgU8=;
 h=From:To:Cc:Subject:Date:From;
 b=M/Hh4/09XxRXPiRCWMjtuT8tCQH87TMgSIrJBf1mpdeTy2SHlDbsG0+6G+GM8/P0R
 KpJUvB/o0zMMZ9S2BvpehQPrEPbhDO2PsYyAJl583EUtvQsbwUMidm2eHmmj66/SVD
 k4xcauqlmQeaLQkz+QvD2+JumWl4uMg+NylfdJWc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.a=rsa-sha256
 header.s=20200325 header.b=M/Hh4/09
Subject: [Buildroot] [PATCH] package/exiv2: bump version to 0.27.6
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
From: Nicolas Serafini via buildroot <buildroot@buildroot.org>
Reply-To: Nicolas Serafini <nicolas.serafini@ik.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated the link to the sources on github, the previous link no longer
exists.

Release notes:
https://github.com/Exiv2/exiv2/releases/tag/v0.27.6

Signed-off-by: Nicolas Serafini <nicolas.serafini@ik.me>
---
 package/exiv2/exiv2.hash | 2 +-
 package/exiv2/exiv2.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index a405d2611b..c871277801 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  35a58618ab236a901ca4928b0ad8b31007ebdc0386d904409d825024e45ea6e2  exiv2-0.27.5-Source.tar.gz
+sha256  4c192483a1125dc59a3d70b30d30d32edace9e14adf52802d2f853abf72db8a6  exiv2-0.27.6-Source.tar.gz
 sha256  a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66  COPYING
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 2a91c71c8f..869f8e48dd 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 0.27.5
+EXIV2_VERSION = 0.27.6
 EXIV2_SOURCE = exiv2-$(EXIV2_VERSION)-Source.tar.gz
-EXIV2_SITE = https://exiv2.org/builds
+EXIV2_SITE = https://github.com/Exiv2/exiv2/releases/download/v$(EXIV2_VERSION)
 EXIV2_INSTALL_STAGING = YES
 EXIV2_LICENSE = GPL-2.0+
 EXIV2_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
