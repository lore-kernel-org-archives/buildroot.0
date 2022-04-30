Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64F2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E296404E5;
	Sat, 30 Apr 2022 18:58:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h_enKIsAwpwa; Sat, 30 Apr 2022 18:58:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72A3D404F6;
	Sat, 30 Apr 2022 18:58:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA7561BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65CD641620
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zz-5Kyws3qJK for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6180841624
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EBEBE84B62; Sat, 30 Apr 2022 18:44:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 20:40:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b03e8e693a62256289adb8db715622c3447d34ad
X-Git-Newrev: 854e18cc2579f21a53617667055bfe49192a3908
X-Patchwork-Hint: ignore
Message-Id: <20220430184417.EBEBE84B62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tor: bump version to 0.4.7.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=854e18cc2579f21a53617667055bfe49192a3908
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://forum.torproject.net/t/stable-release-0-4-7-7/3108

Added sha256 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tor/tor.hash | 3 ++-
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 16e01c80a9..8f37dd6219 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,4 @@
+# From https://dist.torproject.org/tor-0.4.7.7.tar.gz.sha256sum
+sha256  3e131158b52b9435d7e43d1c47ef288b96d005342cc44b8c950bb403851a5b44  tor-0.4.7.7.tar.gz
 # Locally computed
-sha256  94ccd60e04e558f33be73032bc84ea241660f92f58cfb88789bda6893739e31c  tor-0.4.6.10.tar.gz
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 78a6de66dc..3b470a80d8 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.6.10
+TOR_VERSION = 0.4.7.7
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
