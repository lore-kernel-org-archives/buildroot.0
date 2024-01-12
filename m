Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E66AC4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 17:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27CE88466A;
	Fri, 12 Jan 2024 17:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27CE88466A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HGzNn3DeGR_t; Fri, 12 Jan 2024 17:38:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E94E84670;
	Fri, 12 Jan 2024 17:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E94E84670
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45AC61BF309
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F18060B3C
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F18060B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cg1pXFO6dVQ3 for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 17:37:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CBF060BC3
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 17:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CBF060BC3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CEE385F33; Fri, 12 Jan 2024 17:37:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 18:26:06 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d09f050988bfad55d0f9e16b1765597d55069729
X-Git-Newrev: 906bd817d5bb71d8be848113b14231a843fa1410
X-Patchwork-Hint: ignore
Message-Id: <20240112173721.2CEE385F33@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/exim: security
 bump version to 4.97.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=906bd817d5bb71d8be848113b14231a843fa1410
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes CVE-2023-51766: https://seclists.org/oss-sec/2023/q4/348

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a4536589d3989e7324e61fd3f4ccbad547564f1c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 6336a40427..a3822302fb 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  428150e67c494fa14fe5195d81b972c1b23e651ee4f9f2ff1788250266d31e9c  exim-4.97.tar.xz
+sha256  bd782057509a793593508528590626d185ea160ce32cb34beda262e99cefdfa9  exim-4.97.1.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  b28cbb49fa7e143dfcc94e004d57cf98a1945013e676cd103c1ee4cf52933d49d378baa13bea2663353dba97745d6b2ab8b7b66cde870788a2d85d7abd716968  exim-4.97.tar.xz
+sha512  eab7ca28b37f1635c48f5e963ab69fcbad539b2c35a84286ecaad7d7ff5210bbefce86452302e08099afdc0710f9cb7ca6d9b152b0ba88a19292f7c5541e0cfc  exim-4.97.1.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 23d888e6f2..fb9eecd71b 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.97
+EXIM_VERSION = 4.97.1
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
