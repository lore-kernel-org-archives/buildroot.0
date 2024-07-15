Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AB1C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0128440551;
	Mon, 15 Jul 2024 10:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rP-1BE9YHwz5; Mon, 15 Jul 2024 10:15:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DF2B405F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DF2B405F7;
	Mon, 15 Jul 2024 10:15:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E19DE1BF3FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC43880D91
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G6miXXvshFrr for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB44A80DC8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB44A80DC8
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7665986C43; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 12:14:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33b5412b7869bba90ffc63fa00da763a64c981a8
X-Git-Newrev: c53455ea4ffaaee050e1e43a3c15fa98324d5235
X-Patchwork-Hint: ignore
Message-Id: <20240715101424.7665986C43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine-chromium: bump
 version after qtwebengine bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=c53455ea4ffaaee050e1e43a3c15fa98324d5235
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit ca9e08277c473de1d0119768661ce0ba96559a7a ("package/qt5: bump
packages to latest kde submodule versions"), the version of Qt5 was
bumped to 5.15.14. This means that the version of qt5webengine being
built is now qtwebengine-v5.15.14-lts.tar.bz2.

However, qt5webengine-chromium is packaging a submodule of
qtwebengine, so we must keep them in sync, and therefore it should
have been updated.

The current version of qt5webengine-chromium,
0ad2814370799a2161057d92231fe3ee00e2fe98, was matching with
5.15.11-lts, but for 5.15.14-lts, we need to use
18c9261dc5b8aa57a0bdd5b62ce6f648cca1ef5e, as can be seen at:

  https://github.com/qt/qtwebengine/tree/v5.15.14-lts/src (thirdparty submodule)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash | 2 +-
 package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
index 103e27d889..270da153c6 100644
--- a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
+++ b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  14c0654d046fd1faf0204b79e33c091012a8f4df972777e5691875aa75d29a65  qtwebengine-chromium-0ad2814370799a2161057d92231fe3ee00e2fe98.tar.bz2
+sha256  fb0953b0cc7b980f128d5f66b8345eb4fbf2e05b70db3926958fb657953b64dc  qtwebengine-chromium-18c9261dc5b8aa57a0bdd5b62ce6f648cca1ef5e.tar.bz2
 
 # Locally calculated with:
 # for i in $(find * -type f \( -iname 'license*' -o -iname 'copying*' -o -name 'APPLE_LICENSE' -o -name 'Copyright' -o -path '*/license_texts/*' -o -path '*/licenses/*' \) -a -not -name '*.cc' -not -name '*.py' -not -name '*.pyc' -not -name '*.h' -not -name 'LICENSE.sha1' -not -name 'licensecheck.pl*' -not -name 'license.after' -not -name 'license.before' -not -path 'chromium/third_party/catapult/*') ; do echo -n "sha256  " ; sha256sum $i ; done | sort --key=3
diff --git a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk
index 2b061815b5..fc48945e0d 100644
--- a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk
+++ b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBENGINE_CHROMIUM_VERSION = 0ad2814370799a2161057d92231fe3ee00e2fe98
+QT5WEBENGINE_CHROMIUM_VERSION = 18c9261dc5b8aa57a0bdd5b62ce6f648cca1ef5e
 QT5WEBENGINE_CHROMIUM_SITE = $(QT5_SITE)/qtwebengine-chromium/-/archive/$(QT5WEBENGINE_CHROMIUM_VERSION)
 QT5WEBENGINE_CHROMIUM_SOURCE = qtwebengine-chromium-$(QT5WEBENGINE_CHROMIUM_VERSION).tar.bz2
 QT5WEBENGINE_CHROMIUM_PATCH_DEPENDENCIES = qt5webengine-chromium-catapult
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
