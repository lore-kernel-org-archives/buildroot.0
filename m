Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380AEC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 18:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 003114035A;
	Sat,  3 Aug 2024 18:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aXMTsfGcQ373; Sat,  3 Aug 2024 18:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC0D740395
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC0D740395;
	Sat,  3 Aug 2024 18:29:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A30E1BF364
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1620B60648
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CiPqKiDR1xW7 for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 18:29:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 222346059F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 222346059F
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 18:29:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16B5C83C5D; Sat,  3 Aug 2024 18:29:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Aug 2024 20:26:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5356754d1e11174274553f2f7329edd7e8c7fd68
X-Git-Newrev: 45651cdb851bcd5af06bb94d824b078b03d4f187
X-Patchwork-Hint: ignore
Message-Id: <20240803182913.16B5C83C5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml2: security bump version to
 2.12.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=45651cdb851bcd5af06bb94d824b078b03d4f187
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2024-34459 (2.12.7) & CVE-2024-40896.

Release notes:
https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.7.news
https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.8.news
https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.9.news

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 086bb41098..73fd0ecedf 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.6.sha256sum
-sha256  889c593a881a3db5fdd96cc9318c87df34eb648edfc458272ad46fd607353fbb  libxml2-2.12.6.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.9.sha256sum
+sha256  59912db536ab56a3996489ea0299768c7bcffe57169f0235e7f962a91f483590  libxml2-2.12.9.tar.xz
 # License files, locally calculated
 sha256  7fb0a66f3989f9bd5c7e5438a3de02cd4a7a47dde0aea2f7ea2ba2ff454ee6a4  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index e7ed6fb752..b69722b21d 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.12
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).6
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).9
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
