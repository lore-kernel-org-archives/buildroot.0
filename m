Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A372C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2868E83196;
	Fri, 28 Feb 2025 17:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBdZIL9OoWHS; Fri, 28 Feb 2025 17:15:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99360832E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99360832E7;
	Fri, 28 Feb 2025 17:15:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D154711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6380042FC8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SHVxtVQk_gr for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEFE843906
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEFE843906
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4A447FDF9; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 16:38:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7dbbd815f5d48e12f3aa634916b748d0b2fcb522
X-Git-Newrev: 9f9b3db3406ea0937e3cb4e7b80b7f3f90caf181
X-Patchwork-Hint: ignore
Message-Id: <20250228163035.B4A447FDF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/whois: bump to version
 5.5.23
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f9b3db3406ea0937e3cb4e7b80b7f3f90caf181
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log, see:
https://github.com/rfc1036/whois/blob/v5.5.23/debian/changelog

This commit also adds the sha1 hash published in the Debian source dsc
file.

The _SITE url is also updated to the new snapshot, and to use the https
protocol.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/whois/whois.hash | 5 +++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index fb140fa198..06237b65d4 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,6 @@
-# From http://snapshot.debian.org/archive/debian/20221017T031443Z/pool/main/w/whois/whois_5.5.14.dsc
-sha256  bf9c2cb307d5419b34ad401eecf2820b8f69660db41cf0762e5da71fa2df68e8  whois_5.5.14.tar.xz
+# From https://snapshot.debian.org/archive/debian/20241116T203634Z/pool/main/w/whois/whois_5.5.23.dsc
+sha1  18227c0efec651c31fe764cdc3af17f5389bcc21  whois_5.5.23.tar.xz
+sha256  35c04e46bd8435f46e446a817728b5fae2f0a389033a9383e5e20bb6e8fba14a  whois_5.5.23.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index e98add4e6a..ca76b22e6d 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.14
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20221017T031443Z/pool/main/w/whois
+WHOIS_VERSION = 5.5.23
+WHOIS_SITE = https://snapshot.debian.org/archive/debian/20241116T203634Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
