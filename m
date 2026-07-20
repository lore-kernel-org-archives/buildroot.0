Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B98C44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 20:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFA14406E3;
	Mon, 20 Jul 2026 20:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9o3SGEUFscX; Mon, 20 Jul 2026 20:17:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1AB8406F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784578620;
	bh=ctxY+Spq0O4Y5jN6b2M94pPGTYLzvz0KhKjGiQ/PhWM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K06qTtbTLkPiPwiNcvkwpyBNgF1tNbtaC46ShCao2tHu/s3SiGzds25nXnQEAVoyb
	 vyLxdMNdQGy53oUN96pTcMOH+mX0u/vBIhswWQSQLjM6JK00gY/MaRhabshy3QrYX1
	 QGayN2L3nzStwAnbjAyV6yqosXrFQRS+q87VILdOvjbi7c/TXkL8q7JDkNIqQcFCe3
	 HKJyGlCZrafPmzoljpYBEa2QFNgCwLmO1zfr1epaghQ8NvcnyVN+YBIyMtiOaGPBV6
	 a5ndg0+32gKi6SmA7WInMxBFEctYREcWG23eOsOIq7+gXvot74afCe4pnwp95FXdFD
	 yZpxmDjbL83lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1AB8406F5;
	Mon, 20 Jul 2026 20:17:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1299A132D
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 040D180CA2
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nw9qo3LN8P-E for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 20:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E8E280CAF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E8E280CAF
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:16:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48C1B89080; Mon, 20 Jul 2026 20:16:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Jul 2026 22:13:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a77d5547afd32123eee493d42eeacf041c5a980
X-Git-Newrev: f9687af626abefc7d7d7c81157dbf8997fd31005
X-Patchwork-Hint: ignore
Message-Id: <20260720201616.48C1B89080@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: use SPDX license
 identifier for bzip2 license
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f9687af626abefc7d7d7c81157dbf8997fd31005
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

"bzip2-1.0.4" is not a valid SPDX license identifier. The license text
in archival/libarchive/bz/LICENSE in the busybox source matches the
text associated with the bzip2-1.0.6 identifier [1].

[1] https://spdx.org/licenses/bzip2-1.0.6.html

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/busybox/busybox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 5b461c3a34..32a765c6a4 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -7,7 +7,7 @@
 BUSYBOX_VERSION = 1.38.0
 BUSYBOX_SITE = https://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
-BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
+BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.6
 BUSYBOX_LICENSE_FILES = LICENSE archival/libarchive/bz/LICENSE
 BUSYBOX_CPE_ID_VENDOR = busybox
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
