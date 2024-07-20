Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1703C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6BD1403D9;
	Sat, 20 Jul 2024 21:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkxpFTg1MvA8; Sat, 20 Jul 2024 21:03:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 870E1403D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 870E1403D4;
	Sat, 20 Jul 2024 21:03:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EFEA1BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AB61403D9
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8NEl6BjDBaq for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DC75403F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DC75403F6
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:03:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56B4B86D97; Sat, 20 Jul 2024 21:03:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 23:03:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 321e065516a64198f586632bd83411767d98fe6c
X-Git-Newrev: e66a1a5e864ba78f78b01ea373bbb6ad31f0cba4
X-Patchwork-Hint: ignore
Message-Id: <20240720210313.56B4B86D97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtkiostream: fix version
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

commit: https://git.buildroot.net/buildroot/commit/?id=e66a1a5e864ba78f78b01ea373bbb6ad31f0cba4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update GTKIOSTREAM_VERSION to make it compatible with what is returned
by https://release-monitoring.org/project/373420/

Fixes: fab48302865e5c0c98d91b696bc90e75e38189bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gtkiostream/gtkiostream.hash | 2 +-
 package/gtkiostream/gtkiostream.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gtkiostream/gtkiostream.hash b/package/gtkiostream/gtkiostream.hash
index 90c754f48c..225504be1b 100644
--- a/package/gtkiostream/gtkiostream.hash
+++ b/package/gtkiostream/gtkiostream.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  44e8d921d462005cd330a1c24e5bd8061175b90ae53f537dbf73f59b74f6e01b  gtkiostream-v1.8.0.tar.gz
+sha256  44e8d921d462005cd330a1c24e5bd8061175b90ae53f537dbf73f59b74f6e01b  gtkiostream-1.8.0.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  gpl.txt
diff --git a/package/gtkiostream/gtkiostream.mk b/package/gtkiostream/gtkiostream.mk
index 36905d7e7d..970644d6df 100644
--- a/package/gtkiostream/gtkiostream.mk
+++ b/package/gtkiostream/gtkiostream.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GTKIOSTREAM_VERSION = v1.8.0
-GTKIOSTREAM_SITE = $(call github,flatmax,gtkiostream,$(GTKIOSTREAM_VERSION))
+GTKIOSTREAM_VERSION = 1.8.0
+GTKIOSTREAM_SITE = $(call github,flatmax,gtkiostream,v$(GTKIOSTREAM_VERSION))
 GTKIOSTREAM_LICENSE = GPL-2.0+
 GTKIOSTREAM_LICENSE_FILES = gpl.txt
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
