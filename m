Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61666C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:31:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 363C061355
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 363C061355
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 086E040477;
	Mon, 18 Oct 2021 19:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dyF30t5C6BVa; Mon, 18 Oct 2021 19:31:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22A74402AB;
	Mon, 18 Oct 2021 19:31:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 499451BF319
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3DDF6081B
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZlz_pX_vkOR for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:27:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67EC9607C4
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:27:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 29622875E0; Mon, 18 Oct 2021 19:24:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:24:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0957cdb1d459f81b6ad61b7dc7dde94464f30661
X-Git-Newrev: 436378ecd5872e884839751eac2e487f952be4db
X-Patchwork-Hint: ignore
Message-Id: <20211018192438.29622875E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uhttpd: bump version to 15346de
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

commit: https://git.buildroot.net/buildroot/commit/?id=436378ecd5872e884839751eac2e487f952be4db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

  - 15346de client: Always close connection with request body in case of error

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uhttpd/uhttpd.hash | 2 +-
 package/uhttpd/uhttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uhttpd/uhttpd.hash b/package/uhttpd/uhttpd.hash
index 6f8b4a60f8..1e37b2b251 100644
--- a/package/uhttpd/uhttpd.hash
+++ b/package/uhttpd/uhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8a537a377c8dc1abda147a1e3feb3fe3e3633a9d30e4e37d378cc6309dace2f0  uhttpd-f53a63999784bcb7dc513e221f3f25dd3de2f35e-br1.tar.gz
+sha256  9ae10aaf6642b214e0a4ca47d6fd9693ac4b88d61e7d6446f0f0feb3a28ca510  uhttpd-15346de8d3ba422002496526ee24c62a3601ab8c-br1.tar.gz
 sha256  ce1803f83f776cc88661e303fede0e5ff52faf1d9f74508fadbecf7705b4c84d  uhttpd.h
diff --git a/package/uhttpd/uhttpd.mk b/package/uhttpd/uhttpd.mk
index 355a266d6b..ba8e13ccb8 100644
--- a/package/uhttpd/uhttpd.mk
+++ b/package/uhttpd/uhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UHTTPD_VERSION = f53a63999784bcb7dc513e221f3f25dd3de2f35e
+UHTTPD_VERSION = 15346de8d3ba422002496526ee24c62a3601ab8c
 UHTTPD_SITE = https://git.openwrt.org/project/uhttpd.git
 UHTTPD_SITE_METHOD = git
 UHTTPD_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
