Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE04CA5500
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 07:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2DAF40087;
	Wed, 13 Sep 2023 07:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2DAF40087
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4GZlSis48wsA; Wed, 13 Sep 2023 07:44:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C19E041A60;
	Wed, 13 Sep 2023 07:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C19E041A60
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58B0E1BF37C
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 07:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 245D6822FA
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 07:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 245D6822FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OGhOlMtergCZ for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 07:43:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AFA7822C2
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 07:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AFA7822C2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58D3686D9D; Wed, 13 Sep 2023 07:43:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 09:41:41 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 3c3d050a927d0d67fe009f37a37033defd6c52c2
X-Git-Newrev: 31a1e85dc1a4d90c4b71f9d8a60477232a9092d3
X-Patchwork-Hint: ignore
Message-Id: <20230913074305.58D3686D9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/cups: security
 bump version to 2.4.6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=31a1e85dc1a4d90c4b71f9d8a60477232a9092d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes CVE-2023-34241 (see [0] for details)

[0] https://github.com/OpenPrinting/cups/releases/tag/v2.4.6

The number of changes between 2.4.4 and 2.4.6 is really small, and
limited to bug fixes:

9d614a4b3184205294c55355a1d2eb54d4532ccd (tag: v2.4.6) Update CHANGES.md
6f6da74ec284e28c156f0b9f62f3bd610e61aa78 Fix use-after-free in cupsdAcceptClient() (fixes CVE-2023-34241)
3f12185ca9cbb5350a6370d6046066907b8abc12 Merge pull request #735 from AtariDreams/Fixer
f5281777c80cdf820a2a71c9e7f08b91f0e11160 Fix compilation on older macOS versions
ee82c5b18409def3ec1424ce2eb343aabb0ff0d1 Merge pull request #730 from zdohnal/cupssinglefile_24x
1504527b2415a4b67b0e3e17593b053f3628746f  cups/ppd-cache.c: Put cupsSingleFile into generated PPD
3be1d5da8fe9ee13aab5ee6ecc11b2f9387821a6 Prepare files for next release
c1f54ec966ccc5d5564eed95dcb540842af7b5ca (tag: v2.4.5) cups/cups.h: Update for 2.4.5
70dba05b7511a96476ea0ef8fe1d92c6500c6e61 Finish hotfix release 2.4.5
87f5cb7d8f0da8fa2835bb0aa3ca48b5e5a66a3f Merge pull request #727 from AtariDreams/hotfix
61aa0b259183fe59124566f08ecf649bb806cd24 Regression: Certificate data is corrupted during base64 conversion
7362f41c45d834564f876ffac536f59eece843ec Prepare files for next release

Signed-off-by: Clement Ramirez <ramirez.clement3@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit db46428e0ad00b6916fff2a41a33a45db8fb778f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/cups.hash | 2 +-
 package/cups/cups.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index cc6fe25446..501d8c12a6 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  209259e8fe8df9112af49f4e5765f50dad6da1f869296de41d6eaab1b98003cb  cups-2.4.4-source.tar.gz
+sha256  58e970cf1955e1cc87d0847c32526d9c2ccee335e5f0e3882b283138ba0e7262  cups-2.4.6-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  5320b6e3c252423e4153eb2dd63e57e3b630afb21139f44e43b02d85fe33e279  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 7bbea9a218..a3bb2f8dfc 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.4
+CUPS_VERSION = 2.4.6
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
