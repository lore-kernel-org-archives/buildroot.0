Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DDAC48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02BF34187D;
	Thu, 29 Feb 2024 15:52:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZQxW7tbhfvRa; Thu, 29 Feb 2024 15:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE45741898
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE45741898;
	Thu, 29 Feb 2024 15:52:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C1CB1BF980
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16E904190A
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:33:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d46ezDV17szr for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E37EC41908
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E37EC41908
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:33:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFFD087D71; Thu, 29 Feb 2024 15:33:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:21:03 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f807faa33250aae48b883404d5adf52fd4bc96e5
X-Git-Newrev: 75faae5b6bcffa81d44a743d3ae8cea308be81b6
X-Patchwork-Hint: ignore
Message-Id: <20240229153304.CFFD087D71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/sysstat: update
 upstream location
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

commit: https://git.buildroot.net/buildroot/commit/?id=75faae5b6bcffa81d44a743d3ae8cea308be81b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit 35a2cb02277acae94f018a0d22138dc9de005fdf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
