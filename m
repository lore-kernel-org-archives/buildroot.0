Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B8AC004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45B1B40549;
	Sat, 21 Jan 2023 13:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45B1B40549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HxsvmcJawD2J; Sat, 21 Jan 2023 13:25:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FBFC4048A;
	Sat, 21 Jan 2023 13:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FBFC4048A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 406901BF40B
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA83E4059C
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA83E4059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NM9hCBQCYyzk for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:16:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5A96404C3
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5A96404C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DDC586948; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:59:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8da8773aa1598bbed5c76f01d8492ef384f4afde
X-Git-Newrev: 86b0605de12023c930f530ebb32125556d265a0e
X-Patchwork-Hint: ignore
Message-Id: <20230121131610.9DDC586948@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/metacity: switch to https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=86b0605de12023c930f530ebb32125556d265a0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/metacity/metacity.hash | 2 +-
 package/metacity/metacity.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/metacity/metacity.hash b/package/metacity/metacity.hash
index 583db0f204..2aca099038 100644
--- a/package/metacity/metacity.hash
+++ b/package/metacity/metacity.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/metacity/2.25/metacity-2.25.1.sha256sum
+# From https://download.gnome.org/sources/metacity/2.25/metacity-2.25.1.sha256sum
 sha256  fb2ede4ac02d7da08d3c3323fb76afaf945c8cccc07cb2d3a4b7f44fb49f1c47  metacity-2.25.1.tar.bz2
 
 # Locally computed
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index f5a6d4afd9..5756658300 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -8,7 +8,7 @@
 METACITY_VERSION_MAJOR = 2.25
 METACITY_VERSION = $(METACITY_VERSION_MAJOR).1
 METACITY_SOURCE = metacity-$(METACITY_VERSION).tar.bz2
-METACITY_SITE = http://ftp.gnome.org/pub/gnome/sources/metacity/$(METACITY_VERSION_MAJOR)
+METACITY_SITE = https://download.gnome.org/sources/metacity/$(METACITY_VERSION_MAJOR)
 METACITY_LICENSE = GPL-2.0+
 METACITY_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
