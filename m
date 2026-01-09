Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017FBD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAC2B60BEA;
	Tue, 13 Jan 2026 19:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8-q-nDK65pg; Tue, 13 Jan 2026 19:36:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E92A160BF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333006;
	bh=TmCMA2ycFwPkyY6sW76rpKl5vNUXABaRGODzyOru8NA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TaqRoJvYKluVWpJUGy69vjLeru8Z63dOPGCN1SdgZl+ortiKAxwKJQVNeOrmR2beg
	 6MrxZjCcmjRQpiXkOhGZjQIR294HCvSDtzdw6X5wQ0U7x5RTi1o/PYCyZjCRttWo61
	 Hu2ifMBwE3R+g3OEOxSIMptpclZ9kEe4C+KcUKbBWBWeCvvc4WJjsIbPtw9PDL6fCL
	 x2QRDLCBIw4ghqr9cBxCjMs5eNKZwvMma1FaRyYzVm9uZHaYb6viC9UNnWAhbljYy/
	 5Hoc55gJhEbgUqcqm6A5kqaQpp1glvtRp1thVu0IbtTMPgjzbWeqxqGVkVy45+Cin4
	 2BrDB0LDSXnaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E92A160BF2;
	Tue, 13 Jan 2026 19:36:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 323E0231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCA7C4056B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mS7aKQwW9I37 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2424E403FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2424E403FE
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15FDC8854B; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:02:40 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 34399ef8c270caef1235405f2427c0b4edfec58a
X-Git-Newrev: f7dec4b0d2a85bfda308ee6f0461b992051a14ba
X-Patchwork-Hint: ignore
Message-Id: <20260113193617.15FDC8854B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/liburiparser:
 security bump version to 1.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7dec4b0d2a85bfda308ee6f0461b992051a14ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

https://github.com/uriparser/uriparser/blob/uriparser-1.0.0/ChangeLog

Added sha256 hash provided by upstream.

Fixes CVE-2025-67899.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3ef90e752b4c3eb35c2715bde8750cb9ed3005fb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/liburiparser/liburiparser.hash | 3 ++-
 package/liburiparser/liburiparser.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index bed9c8ee9b..f8d7124b7f 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,3 +1,4 @@
+# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.0
+sha256  154a3f649d80a78d5095fc461ec032ffb45f5ed3619edec923ac68cff29a088d  uriparser-1.0.0.tar.xz
 # Locally calculated
-sha256  85645df1bb220a3867c42f8adeba4f6a4b2fdc1563e91ad7d9f92d14d3dd377d  uriparser-0.9.9.tar.xz
 sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING.BSD-3-Clause
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index 66ec72409c..731739e582 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 0.9.9
+LIBURIPARSER_VERSION = 1.0.0
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
