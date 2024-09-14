Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1ECC02189
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEFB3846DB;
	Sat, 14 Sep 2024 09:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLCjM_2ta8ek; Sat, 14 Sep 2024 09:13:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AEAE84187
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AEAE84187;
	Sat, 14 Sep 2024 09:13:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FA611BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E4E4605F5
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYVf1pJ8p1U6 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:13:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47965605F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47965605F1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:13:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 322C986FCE; Sat, 14 Sep 2024 09:13:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 11:12:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 400973657202e2820704ff31d540dafc27bd8671
X-Git-Newrev: 436e39913e725eaf96a02555acc09c5a4d303b38
X-Patchwork-Hint: ignore
Message-Id: <20240914091311.322C986FCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] system: change label for BR2_INIT_NONE
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

commit: https://git.buildroot.net/buildroot/commit/?id=436e39913e725eaf96a02555acc09c5a4d303b38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the label reads "None", but it can be a bit misleading.
Indeed, since its inception in 0c00636e8bbc (system/init: add option for
no init system), what it really meant was "none of the above", as
briefly laid out in the commit log for 0c00636e8bbc (typo included):

    Can be usefull if a local package provides an init procedure.

This was later refined in 4d185e5ec51b (system: add help entry to "none"
init system), which explained:

    Add a comment that states the user has to provide his own init
    system, either via a package or a rootfs overlay.

So, change the label to better reflect that.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index ca19270fde..b4171321f9 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -146,7 +146,7 @@ comment "systemd highly recommends Linux >= 4.15"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 
 config BR2_INIT_NONE
-	bool "None"
+	bool "Custom (none)"
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
 	help
 	  Buildroot will not install any init system. You will
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
