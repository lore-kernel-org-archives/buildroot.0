Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D016BC47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C47261AE9;
	Thu,  4 Jan 2024 21:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C47261AE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NgDgknfU4BFD; Thu,  4 Jan 2024 21:28:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE2E860899;
	Thu,  4 Jan 2024 21:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE2E860899
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C01B1BF414
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 748CE61AE3
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 748CE61AE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vMcQdor8DFMZ for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:27:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 471A161AB3
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 471A161AB3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36E4084092; Thu,  4 Jan 2024 21:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jan 2024 22:20:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ff1235c8ddd33807f263736c46b91d9cc8a7af8
X-Git-Newrev: a4536589d3989e7324e61fd3f4ccbad547564f1c
X-Patchwork-Hint: ignore
Message-Id: <20240104212747.36E4084092@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exim: security bump version to
 4.97.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4536589d3989e7324e61fd3f4ccbad547564f1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2023-51766: https://seclists.org/oss-sec/2023/q4/348

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
