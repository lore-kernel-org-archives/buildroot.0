Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5B8C001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 22:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D8EE8145D;
	Tue,  8 Aug 2023 22:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D8EE8145D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8OxPVji--DOv; Tue,  8 Aug 2023 22:18:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4644281455;
	Tue,  8 Aug 2023 22:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4644281455
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5212F1BF966
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3914F8141D
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3914F8141D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P6nI-UPXn9zh for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 22:18:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FB8D8141B
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 22:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FB8D8141B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E52D84F2D; Tue,  8 Aug 2023 22:18:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 00:12:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ca41303efbada05fa0acf577ca86bd8f1a7eb15
X-Git-Newrev: 159e469f53a1220249e8df41e287668a3d726678
X-Patchwork-Hint: ignore
Message-Id: <20230808221841.5E52D84F2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sngrep: add CPE ID
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=159e469f53a1220249e8df41e287668a3d726678
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

irontec:sngrep is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/558A213D-A36B-4ED8-8671-2C38110F47FD?namingFormat=2.3&orderBy=CPEURI&keyword=sngrep&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sngrep/sngrep.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index eedb99492f..0e344550d3 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -9,6 +9,7 @@ SNGREP_SITE = \
 	https://github.com/irontec/sngrep/releases/download/v$(SNGREP_VERSION)
 SNGREP_LICENSE = GPL-3.0+
 SNGREP_LICENSE_FILES = LICENSE
+SNGREP_CPE_ID_VENDOR = irontec
 SNGREP_AUTORECONF = YES
 SNGREP_DEPENDENCIES = libpcap ncurses host-pkgconf
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
