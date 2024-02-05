Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50408C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6F184012F;
	Mon,  5 Feb 2024 21:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6F184012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ANqqcMtUv-Y; Mon,  5 Feb 2024 21:28:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5B2040AFF;
	Mon,  5 Feb 2024 21:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5B2040AFF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D8F5D1BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B372460ECE
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B372460ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63xDmp4gfVMF for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:28:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F16B860E2E
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F16B860E2E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D248F86DFB; Mon,  5 Feb 2024 21:28:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 22:26:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f27b0322a5019c4016d2800ccc1b586eb6af7bd5
X-Git-Newrev: 840849afff07f91668f88570c5055eaf6687deb2
X-Patchwork-Hint: ignore
Message-Id: <20240205212811.D248F86DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wlroots: update patch with
 upstream status
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

commit: https://git.buildroot.net/buildroot/commit/?id=840849afff07f91668f88570c5055eaf6687deb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch has been
rejected upstream, and the initial pull request was moved to the
freedesktop gitlab. Update the patch to reflect these changes.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                            | 1 -
 package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2fc974e2f2..31ed5bb5cc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1395,7 +1395,6 @@ package/wilc-driver/0005-Fix-cast-warnings.patch Upstream
 package/wipe/0001-musl.patch Upstream
 package/wireless_tools/0001-remove-bzero.patch Upstream
 package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch Upstream
-package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch Upstream
 package/woff2/0001-CMake-Handle-multiple-libraries-being-returned-for-B.patch Upstream
 package/wpa_supplicant/0001-build-re-enable-options-for-libwpa_client.so-and-.patch Upstream
 package/wpa_supplicant/ifupdown.sh Shellcheck
diff --git a/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch b/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch
index 0ba078708a..0e1ae9d87a 100644
--- a/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch
+++ b/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch
@@ -5,8 +5,10 @@ Subject: [PATCH] Add feature macros to more C files
 
 These source files use "struct timespec", which is POSIX 1993.09.
 
-Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+Upstream: Rejected (Upstream does not want these workarounds)
+see: https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/2493
 
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
 [Retrieved from: https://github.com/swaywm/wlroots/pull/2493]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
