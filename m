Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4E7C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 10:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFB5A613EC;
	Wed, 10 Jan 2024 10:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFB5A613EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m7tnZSQs2cVM; Wed, 10 Jan 2024 10:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E689A61408;
	Wed, 10 Jan 2024 10:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E689A61408
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CADC61BF354
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C71741C6C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C71741C6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xrEdMlqmKrbA for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 10:26:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6F824151C
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 10:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6F824151C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A579985538; Wed, 10 Jan 2024 10:26:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 11:19:01 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 573f5a6f7241c804a2d909520908df35fea2a55f
X-Git-Newrev: 280aa23da67c1f301bf06dd8352d3fd551ed476d
X-Patchwork-Hint: ignore
Message-Id: <20240110102650.A579985538@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/x11r7/xwayland:
 security bump to 23.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=280aa23da67c1f301bf06dd8352d3fd551ed476d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

According to
https://lists.x.org/archives/xorg-announce/2023-December/003437.html:

  This release contains the fixes for CVE-2023-6377 and CVE-2023-6478
  in today's security advisory:
  https://lists.x.org/archives/xorg-announce/2023-December/003435.html

The release has only 10 commits compared to 23.2.2, all of which being
fixes, two of them being the security fixes. So it seems like bumping
the version is a reasonable trade-off vs. backporting the security
fixes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 078b8558b9e25917db680fdeb8d9c64db9aafc8e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xwayland/xwayland.hash | 6 +++---
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index 12363a66bf..533ef9de86 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-October/003432.html
-sha256  9f7c0938d2a41e941ffa04f99c35e5db2bcd3eec034afe8d35d5c810a22eb0a8  xwayland-23.2.2.tar.xz
-sha512  f5b319fdace7d7c078544730ecd26afeb63b1a0c779fb097455147945df85af32d9e91501ebdb70209d48e8a3ead3b23be31e9d5118358ac17e699abb4b6ac07  xwayland-23.2.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-December/003437.html
+sha256  eb9d9aa7232c47412c8835ec15a97c575f03563726c787754ff0c019bd07e302  xwayland-23.2.3.tar.xz
+sha512  37198aa2f06313a0cb2add51cc78f81b26a42f2c9d55a0d3eecf958777107ea5560961c128f2d0af055f7460ba10fadb1b9050251c2c50f2251b40ab517e79cd  xwayland-23.2.3.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index b0bff19be5..8f4bcd8117 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 23.2.2
+XWAYLAND_VERSION = 23.2.3
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
