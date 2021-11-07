Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F9EC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:34:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCD9F6115A
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCD9F6115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0A8D400D8;
	Sun,  7 Nov 2021 20:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S-jbKuMaEtJd; Sun,  7 Nov 2021 20:34:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E4644024F;
	Sun,  7 Nov 2021 20:34:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2098E1BF28A
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 105A180D59
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VIMPyEZd5OQL for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 20:34:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5848E80D2D
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 20:34:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7E2A38B509; Sun,  7 Nov 2021 20:30:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Nov 2021 21:33:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc54ac17f8060134f93d1b8965d297b3f91e575a
X-Git-Newrev: 29226854e14fcba655b3e6380b6f5ef27615b420
X-Patchwork-Hint: ignore
Message-Id: <20211107203038.7E2A38B509@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdbi-drivers: bump to
 0bfae6c43134cf58dc89364328545982ca297abb
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

commit: https://git.buildroot.net/buildroot/commit/?id=29226854e14fcba655b3e6380b6f5ef27615b420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to 0bfae6c43134cf58dc89364328545982ca297abb to fix the following
build failure with postgresql raised since commit
f032973fc56ba4a73d95927384d2a5d185f2ddce which removed
https://sourceforge.net/p/libdbi-drivers/libdbi-drivers/ci/7a8e24ec1cf763226f4be31ba1018d888d4989f3

checking for MySQL support... no
checking for PostgreSQL support... yes
checking for pg_config... no

Fixes:
 - http://autobuild.buildroot.org/results/89f58005b3a4d50384803fe6f07ea3049935959c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-By: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdbi-drivers/libdbi-drivers.hash | 2 +-
 package/libdbi-drivers/libdbi-drivers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libdbi-drivers/libdbi-drivers.hash b/package/libdbi-drivers/libdbi-drivers.hash
index 38d66f90d1..b805bb0283 100644
--- a/package/libdbi-drivers/libdbi-drivers.hash
+++ b/package/libdbi-drivers/libdbi-drivers.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  564438dda6af59af8c66cda9fa378ce86b1393fd31a7b0f1ba98af641a34a428  libdbi-drivers-b0c7ac0ef2e733e858c9870139944eeaf7b66984-br1.tar.gz
+sha256  80a1befb044238a89b2d0dbd40881aa6c75bf99d3a7a6c016c657ea26df7792c  libdbi-drivers-0bfae6c43134cf58dc89364328545982ca297abb-br1.tar.gz
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libdbi-drivers/libdbi-drivers.mk b/package/libdbi-drivers/libdbi-drivers.mk
index d86f32dafc..af8db79581 100644
--- a/package/libdbi-drivers/libdbi-drivers.mk
+++ b/package/libdbi-drivers/libdbi-drivers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDBI_DRIVERS_VERSION = b0c7ac0ef2e733e858c9870139944eeaf7b66984
+LIBDBI_DRIVERS_VERSION = 0bfae6c43134cf58dc89364328545982ca297abb
 LIBDBI_DRIVERS_SITE = https://git.code.sf.net/p/libdbi-drivers/libdbi-drivers
 LIBDBI_DRIVERS_SITE_METHOD = git
 LIBDBI_DRIVERS_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
