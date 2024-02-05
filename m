Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728DFC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 14:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1206340A18;
	Mon,  5 Feb 2024 14:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1206340A18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yHFy6HknIV5k; Mon,  5 Feb 2024 14:27:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D85AC40151;
	Mon,  5 Feb 2024 14:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D85AC40151
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 468CF1BF2B1
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18A9360F0B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18A9360F0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p__hXXNxVpS5 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 14:27:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D07A60E96
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D07A60E96
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38F9D86C99; Mon,  5 Feb 2024 14:27:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 15:27:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f62d1ad32a2d1903840be8416b7d5b5f419fa86e
X-Git-Newrev: 35a2cb02277acae94f018a0d22138dc9de005fdf
X-Patchwork-Hint: ignore
Message-Id: <20240205142727.38F9D86C99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysstat: update upstream location
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

commit: https://git.buildroot.net/buildroot/commit/?id=35a2cb02277acae94f018a0d22138dc9de005fdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The http://pagesperso-orange.fr service being down,
http://pagesperso-orange.fr/sebastien.godard/ is no longer
accessible (or more precisely serves some HTML junk), meaning that we
currently cannot download the tarball of sysstat from the official
upstream location, and we always fallback to sources.buildroot.net.

This commit therefore updates to use the new upstream location on
github.io. The 12.6.1 release is available there, with the same hash,
so we can just point to the new upstream location.

Fixes:

ERROR: while checking hashes from package/sysstat//sysstat.hash
ERROR: sysstat-12.6.1.tar.xz has wrong sha1 hash:
ERROR: expected: a730982e0c2d4964a0022c1509f3ea0a345402bc
ERROR: got     : d64a079729f2ff5b304294d68fbc041a46c4966d
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysstat/Config.in  | 2 +-
 package/sysstat/sysstat.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysstat/Config.in b/package/sysstat/Config.in
index 442b787684..efb640fd43 100644
--- a/package/sysstat/Config.in
+++ b/package/sysstat/Config.in
@@ -36,4 +36,4 @@ config BR2_PACKAGE_SYSSTAT
 	   * TTY device activity
 	   * Power management statistics
 
-	  http://pagesperso-orange.fr/sebastien.godard/
+	  https://sysstat.github.io/
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index ca05ec50d8..ec0c666157 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -6,7 +6,7 @@
 
 SYSSTAT_VERSION = 12.6.1
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
-SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
+SYSSTAT_SITE = https://sysstat.github.io/sysstat-packages
 SYSSTAT_CONF_OPTS = --disable-file-attr
 SYSSTAT_DEPENDENCIES = host-gettext $(TARGET_NLS_DEPENDENCIES)
 SYSSTAT_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
