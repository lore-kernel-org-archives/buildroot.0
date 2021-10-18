Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90CCC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:31:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ECC661354
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5ECC661354
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DA6B40490;
	Mon, 18 Oct 2021 19:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Kcxly-Ok38A; Mon, 18 Oct 2021 19:31:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4A7440471;
	Mon, 18 Oct 2021 19:31:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3228F1BF319
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FC8360654
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7q8oh6Qaydri for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:27:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 616136078A
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:27:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1F566875DD; Mon, 18 Oct 2021 19:24:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:24:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce43767c08cbbf525d839d3fffacb3afb665a9fe
X-Git-Newrev: 0957cdb1d459f81b6ad61b7dc7dde94464f30661
X-Patchwork-Hint: ignore
Message-Id: <20211018192438.1F566875DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ubus: bump version to a72457b
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

commit: https://git.buildroot.net/buildroot/commit/?id=0957cdb1d459f81b6ad61b7dc7dde94464f30661
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

  - 2537be0 cmake: add a possibility to set library version
  - 4becbd6 ubusd: convert tx_queue to linked list
  - c736e47 ubusd: add per-client tx queue limit
  - a8cf678 ubusd: protect against too-short messages
  - 4fc532c ubusd: fix tx_queue linked list usage
  - b743a33 ubusd: log ACL init errors
  - 2099bb3 libubus: use list_empty/list_first_entry in ubus_process_pending_msg
  - ef03848 libubus: process pending messages in data handler if stack depth is 0
  - a72457b libubus: increase stack depth for processing obj msgs

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ubus/ubus.hash | 2 +-
 package/ubus/ubus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index 15e67b53ed..2b7181e5d2 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0d2abb7212ad1ac0ac641d52f62e212bb090a1bbaeae975a78f44ab08d3e3c23  ubus-d1d9ddf98d39b0bdc055060fb962335439445690-br1.tar.gz
+sha256  275d184006f2f60c9b0172d8fd0ccc8952f182960c0d3d0945be640873c1bef6  ubus-a72457b61df045d3c499a6211362b751710590d7-br1.tar.gz
 sha256  a3caa6c0e90c87b7c97c2ac3d0c0d416082ef777215faec2e9b24ea6e68f6988  ubusd_acl.h
diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
index 09668f7dd2..fa856fb36a 100644
--- a/package/ubus/ubus.mk
+++ b/package/ubus/ubus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBUS_VERSION = d1d9ddf98d39b0bdc055060fb962335439445690
+UBUS_VERSION = a72457b61df045d3c499a6211362b751710590d7
 UBUS_SITE = https://git.openwrt.org/project/ubus.git
 UBUS_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
