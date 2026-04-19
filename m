Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5745BEA719D
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 20:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B84560FFC;
	Sun, 19 Apr 2026 20:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frGy-gHT9lQm; Sun, 19 Apr 2026 20:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1185A60C23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776632026;
	bh=hCqGvjYurrgWOdz1G2mS92PtnoVVLxEdscyQw4UO08U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I0O38rGs11YMbNTcnd8uAXV8+SJmtL+5+J9UHEnQ4koi5ch39KipOF9cIRWGD4RXd
	 1AteoIy6O8mRn1Mqsh8IJIjrCHBSszVwus291Bq3n9QOBHij5kHInqfqUzs7v/LAgX
	 69nE4GGJTXOsZTqEt8UfeFVGNtNS/MoCG6DFtthznyC2uIN3HrEdN3k7Tce3owFl3a
	 qJ+FeuDFwQ5tzTRGAoH+ESwoFFkcQTVFIw/BOLEJA6Kb/ZagXLHG4onHRXxPoTkkJ3
	 GEz+PbBV+iKHwuT1wUBQyiBXYFWaMpa6MFm3UNKmg76HGT1S3fCaYuRQBuYHwkVFFX
	 dL+NR19KBeJLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1185A60C23;
	Sun, 19 Apr 2026 20:53:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D1F72B8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 20:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EFC860C23
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 20:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIIEWJR1UTsJ for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 20:53:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CA3160C05
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CA3160C05
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 20:53:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1B9D81F81; Sun, 19 Apr 2026 20:53:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 22:53:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf26c772804cbce53bca73be28a64279cc7a8017
X-Git-Newrev: ead0c6b1827b045bf830bac8db0b2dfe89602cb4
X-Patchwork-Hint: ignore
Message-Id: <20260419205342.E1B9D81F81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bubblewrap: bump version to 0.11.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ead0c6b1827b045bf830bac8db0b2dfe89602cb4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:

  https://github.com/containers/bubblewrap/releases/tag/v0.11.1

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bubblewrap/bubblewrap.hash | 4 ++--
 package/bubblewrap/bubblewrap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index b2b88ffe92..696c20ee07 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,6 +1,6 @@
 # Also checked GPG signature from
-# https://github.com/containers/bubblewrap/releases/tag/v0.11.0
-sha256  988fd6b232dafa04b8b8198723efeaccdb3c6aa9c1c7936219d5791a8b7a8646  bubblewrap-0.11.0.tar.xz
+# https://github.com/containers/bubblewrap/releases/tag/v0.11.1
+sha256  c1b7455a1283b1295879a46d5f001dfd088c0bb0f238abb5e128b3583a246f71  bubblewrap-0.11.1.tar.xz
 
 # Hash for license files:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index ea46d7a127..afbb29eab9 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.11.0
+BUBBLEWRAP_VERSION = 0.11.1
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
