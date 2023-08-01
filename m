Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2708BC04A94
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCCC760C03;
	Tue,  1 Aug 2023 21:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCCC760C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iicbAAq4sAKE; Tue,  1 Aug 2023 21:13:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4C9B61154;
	Tue,  1 Aug 2023 21:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4C9B61154
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A6861BF408
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9290A40218
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9290A40218
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1igIHcIVNTId for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:12:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82A0B4189E
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82A0B4189E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E87584000; Tue,  1 Aug 2023 21:12:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Aug 2023 23:11:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec9d16b90415a1bf55de61cee5ee28bf749bfcf4
X-Git-Newrev: 35656482d3b74ab12a6c2395ac9ca61b60a2fd49
X-Patchwork-Hint: ignore
Message-Id: <20230801211256.6E87584000@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: switch to 2.40.x as the
 default version
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

commit: https://git.buildroot.net/buildroot/commit/?id=35656482d3b74ab12a6c2395ac9ca61b60a2fd49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that 2.41 has been released, let's use 2.40.x as the default
binutils version.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 6d2b436d6b..7a54660c46 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -10,7 +10,7 @@ config BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_39_X if !BR2_arc
+	default BR2_BINUTILS_VERSION_2_40_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
 	  Select the version of binutils you wish to use.
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 48a036651c..ecb00077d6 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2020.09-release
 else
-BINUTILS_VERSION = 2.39
+BINUTILS_VERSION = 2.40
 endif
 endif # BINUTILS_VERSION
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
