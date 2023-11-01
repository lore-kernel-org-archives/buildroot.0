Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61FAC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 15:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B18484C2D;
	Wed,  1 Nov 2023 15:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B18484C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WNu2B7wpynKg; Wed,  1 Nov 2023 15:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE78484C33;
	Wed,  1 Nov 2023 15:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE78484C33
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B17E61BF20D
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 15:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 969F64177A
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 15:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 969F64177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o9A4i5KGzumQ for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 15:59:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A319740363
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 15:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A319740363
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A7B486344; Wed,  1 Nov 2023 15:59:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 16:58:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99d78b52a04119646e286081e07247cc74300e0b
X-Git-Newrev: cdb49b908be7f39a6075cd7d8511acdd2186d2b1
X-Patchwork-Hint: ignore
Message-Id: <20231101155907.8A7B486344@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcm2835: bump to version 1.73
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

commit: https://git.buildroot.net/buildroot/commit/?id=cdb49b908be7f39a6075cd7d8511acdd2186d2b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

1.72 Added examples/smi/smi.c showing how to use new SMI bus support,
      courtesy Benoit Bouchez. Added support for disabling
      documentation genetration with "./configure --with-docs=no",
      courtesy of Christian Zuckschwerdt.
 1.73 Fixed some inconsistent indenting in bcm2835.c that triggers
      warnings for some people. Added Timeout checks to
      bcm2835_i2c_write() in case of IO problems. New reason cade
      BCM2835_I2C_REASON_ERROR_TIMEOUT added. Patch courtesy Simon
      Peacock.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bcm2835/bcm2835.hash | 2 +-
 package/bcm2835/bcm2835.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bcm2835/bcm2835.hash b/package/bcm2835/bcm2835.hash
index 2cdc35fcee..802f34335b 100644
--- a/package/bcm2835/bcm2835.hash
+++ b/package/bcm2835/bcm2835.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  564920d205977d7e2846e434947708455d468d3a952feca9faef643abd03a227  bcm2835-1.71.tar.gz
+sha256  e67a986462618988a5a86752e36e3ebdd7c5cae66940ff7330aea243b2762525  bcm2835-1.73.tar.gz
 sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  COPYING
diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
index 4870aa10ba..dcf21cb5f0 100644
--- a/package/bcm2835/bcm2835.mk
+++ b/package/bcm2835/bcm2835.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCM2835_VERSION = 1.71
+BCM2835_VERSION = 1.73
 BCM2835_SITE = https://www.airspayce.com/mikem/bcm2835
 BCM2835_LICENSE = GPL-3.0
 BCM2835_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
