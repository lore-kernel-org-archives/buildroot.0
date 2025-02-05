Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46812C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E080985C7D;
	Fri, 28 Feb 2025 17:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEanN_KOVIAu; Fri, 28 Feb 2025 17:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF43885C7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF43885C7A;
	Fri, 28 Feb 2025 17:16:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E72A1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B03B443DB7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AmXDh2wJGPSu for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0B2C41A20
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0B2C41A20
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C55A686780; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 16:38:26 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9f9b3db3406ea0937e3cb4e7b80b7f3f90caf181
X-Git-Newrev: 3c17ddc28169f2ca2104437892b808df5136efe4
X-Patchwork-Hint: ignore
Message-Id: <20250228163035.C55A686780@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/spice: bump version to
 0.15.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c17ddc28169f2ca2104437892b808df5136efe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log since 0.15.0, see:
https://gitlab.freedesktop.org/spice/spice/-/releases/v0.15.1
https://gitlab.freedesktop.org/spice/spice/-/releases/v0.15.2

This commit also adds a comment in the hash file that the sha256 is
taken from upstream.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spice/spice.hash | 3 ++-
 package/spice/spice.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/spice/spice.hash b/package/spice/spice.hash
index b228f213a5..c678f9b114 100644
--- a/package/spice/spice.hash
+++ b/package/spice/spice.hash
@@ -1,3 +1,4 @@
+# From https://www.spice-space.org/download/releases/spice-server/spice-0.15.2.tar.bz2.sha256
+sha256  6d9eb6117f03917471c4bc10004abecff48a79fb85eb85a1c45f023377015b81  spice-0.15.2.tar.bz2
 # Locally calculated
-sha256  b320cf8f4bd2852750acb703c15b72856027e5a8554f8217dfbb3cc09deba0f5  spice-0.15.0.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 608a9413fe..0997903791 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPICE_VERSION = 0.15.0
+SPICE_VERSION = 0.15.2
 SPICE_SOURCE = spice-$(SPICE_VERSION).tar.bz2
 SPICE_SITE = http://www.spice-space.org/download/releases/spice-server
 SPICE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
