Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA970E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 12:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50D9580D91;
	Sun, 21 Dec 2025 12:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LyBygoDSW2Oq; Sun, 21 Dec 2025 12:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 760F18174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766319196;
	bh=17ioiQ0QJCMlPyLQJl2Ncn7gtO//RVRKJwYk48ITFqM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oQ0GDZNsE/U2mcwJ91MmZF7Y+su7Cr3rK+gkiMc3G0SD8Ap8GyyCIE1CphmsDHu9T
	 lYprAQ2+9MvHMxKTW+Of9EuGHW+9VpN+nFKhu+7pef8kbr9CA3uq+RgfClr5QWwiiH
	 wg7GZQ84AoSjtd3dcTQ3MzJkinQ7TdO1bFyrCO9hzlvzYur63DSCVN0anaX2p+37yD
	 uJjYFXAQMQj2QfX4/GVJ7xKfT7lv1KlwGKfCc9eBOwvNhpWsmImUIrfZwZIRb8YusC
	 1s81+uQkpSIwEHRFbHN77x/GKPor/GWs+sH47oMd6ajl+tNBLayeloaii2OajBK0AG
	 gimx+g+XfzKEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 760F18174A;
	Sun, 21 Dec 2025 12:13:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 66A2A195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D0E460E37
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WA-wdb8sLXm for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 12:13:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DDE260BDE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DDE260BDE
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:13:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D1CF8642A; Sun, 21 Dec 2025 12:13:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 13:12:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12c45e812ded547662d936be2e8c45c83a3bfa65
X-Git-Newrev: 99585db1e896d7a75e204335af86f0725a30d357
X-Patchwork-Hint: ignore
Message-Id: <20251221121314.6D1CF8642A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/drbd-utils: bump version to 9.33.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=99585db1e896d7a75e204335af86f0725a30d357
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/LINBIT/drbd-utils/blob/v9.33.0/ChangeLog

This new version also fixes build failures with gcc >= 15.

Fixes:
https://autobuild.buildroot.net/results/abd/abd9fe3f8b8051b8fac278bcd56e1c11aa056737/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add comment about gcc-15 build failure]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/drbd-utils/drbd-utils.hash | 2 +-
 package/drbd-utils/drbd-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/drbd-utils/drbd-utils.hash b/package/drbd-utils/drbd-utils.hash
index 9bdfd69538..c9db5b6587 100644
--- a/package/drbd-utils/drbd-utils.hash
+++ b/package/drbd-utils/drbd-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  730d68b9ee48df7b2e3ddff38bf54a5bc405651bac0ece180b4f22a468e543b3  drbd-utils-9.21.4.tar.gz
+sha256  223fe07d0b646e991b33ba9ea41468f9a66f903562e7da766dd0fc6b4ea33db9  drbd-utils-9.33.0.tar.gz
 sha256  1ca3e8f71b7de618968e7ea9fe47822d9e704dc476aef8544033abedec355225  COPYING
diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index c1035191f1..657f9fafd8 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DRBD_UTILS_VERSION = 9.21.4
+DRBD_UTILS_VERSION = 9.33.0
 DRBD_UTILS_SITE = http://pkg.linbit.com/downloads/drbd/utils
 DRBD_UTILS_LICENSE = GPL-2.0+
 DRBD_UTILS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
