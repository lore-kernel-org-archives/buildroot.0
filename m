Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FAAC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 23:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCC974366F;
	Thu, 30 Nov 2023 23:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCC974366F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3K8IZFr7Dshv; Thu, 30 Nov 2023 23:10:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4495643680;
	Thu, 30 Nov 2023 23:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4495643680
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A2B71BF983
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD7ED846F0
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD7ED846F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z5e0bWyV2CYE for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 23:09:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC486846B8
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 23:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC486846B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBD5E876AF; Thu, 30 Nov 2023 23:09:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 23:42:27 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 31ddad909e1e0037a55ea1ba552399dd99c8a49b
X-Git-Newrev: 8b0ba84e38240aecbb08d32f2a3ee69c3a26ac6b
X-Patchwork-Hint: ignore
Message-Id: <20231130230901.CBD5E876AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/vlc: security
 bump to version 3.0.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b0ba84e38240aecbb08d32f2a3ee69c3a26ac6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix CVE-2023-47359: Videolan VLC prior to version 3.0.20 contains an
incorrect offset read that leads to a Heap-Based Buffer Overflow in
function GetPacket() and results in a memory corruption.

Fix CVE-2023-47360: Videolan VLC prior to version 3.0.20 contains an
Integer underflow that leads to an incorrect packet length.

https://code.videolan.org/videolan/vlc/-/blob/3.0.20/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d675873f4fe9b601719b08cdd8a901d73ec7f731)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.hash | 8 ++++----
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index ef381e5934..40529bd664 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,7 +1,7 @@
-# From https://get.videolan.org/vlc/3.0.19/vlc-3.0.19.tar.xz.sha256
-sha256  643e3294bafe922324663ca499515b7564f2794575fd7d2b7992d20896381745  vlc-3.0.19.tar.xz
-# From https://get.videolan.org/vlc/3.0.19/vlc-3.0.19.tar.xz.sha1
-sha1  6d162248a26fdd76a9d4e7e3d52f40d4326f72c1  vlc-3.0.19.tar.xz
+# From https://get.videolan.org/vlc/3.0.20/vlc-3.0.20.tar.xz.sha256
+sha256  adc7285b4d2721cddf40eb5270cada2aaa10a334cb546fd55a06353447ba29b5  vlc-3.0.20.tar.xz
+# From https://get.videolan.org/vlc/3.0.20/vlc-3.0.20.tar.xz.sha1
+sha1  b834516ab701bf6311980ed5d67b77c834fdebe7  vlc-3.0.20.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 729e928b4d..d0fc1744c0 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.19
+VLC_VERSION = 3.0.20
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
