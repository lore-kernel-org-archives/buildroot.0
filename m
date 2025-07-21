Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68ED1C83F26
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 21:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25DC4428BE;
	Mon, 21 Jul 2025 21:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9e2uMSD42SJ; Mon, 21 Jul 2025 21:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC7C742896
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC7C742896;
	Mon, 21 Jul 2025 21:01:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C1E22127
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9225614B7
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkGmpZ1qlMsj for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 21:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBD556F1BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBD556F1BA
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:01:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD85D869C4; Mon, 21 Jul 2025 21:01:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Jul 2025 22:54:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54ee4a71c0b3c775067dca517a3780f31cc7f257
X-Git-Newrev: 2dd7a4a374a0e585777422f2900d893a6cfcbc42
X-Patchwork-Hint: ignore
Message-Id: <20250721210132.CD85D869C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8821au: fix build failure with
 Linux 6.15
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2dd7a4a374a0e585777422f2900d893a6cfcbc42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Benetti Engineering just took over Larry Finger(lwfinger)'s repository [0]
rtl8821au since Larry unfortunately passed away[1](RIP) and there are
pending PRs that will never be checked as stated here. So basically move
github user to benetti-engineering-sas and update version with latest that
fixes build failure with Linux version 6.15. And of course let's update
package's URL due to the moving.

[0]: https://github.com/lwfinger/rtl8812au/issues/32
[1]: https://lwn.net/Articles/979419/

Fixes:
still not occured.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8821au/Config.in      | 2 +-
 package/rtl8821au/rtl8821au.hash | 2 +-
 package/rtl8821au/rtl8821au.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rtl8821au/Config.in b/package/rtl8821au/Config.in
index 3d7bbf643d..66e7334148 100644
--- a/package/rtl8821au/Config.in
+++ b/package/rtl8821au/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_RTL8821AU
 	help
 	  rtl8821au wifi driver
 
-	  https://github.com/abperiasamy/rtl8812AU_8821AU_linux
+	  https://github.com/benetti-engineering-sas/rtl8821au
diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index 56e5609ebd..e79e32ff3d 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fde8ca9735a6c9c4c907fb6f565185a59b04bcfa78feb2309941cc09d49c4ac7  rtl8821au-8ea0ed9da764448c7310a27744ab5814289f35a8.tar.gz
+sha256  fd02814e2ab5435cf4213aaf876d28dedccc0bec8c91ed768336727276c5eae6  rtl8821au-d0a49ba401a8661ef0cdc4cf8850bc7c927a062c.tar.gz
 sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index 9a92696437..9ecbbbb0b2 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = 8ea0ed9da764448c7310a27744ab5814289f35a8
-RTL8821AU_SITE = $(call github,lwfinger,rtl8812au,$(RTL8821AU_VERSION))
+RTL8821AU_VERSION = d0a49ba401a8661ef0cdc4cf8850bc7c927a062c
+RTL8821AU_SITE = $(call github,benetti-engineering-sas,rtl8821au,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
