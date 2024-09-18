Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6548FCDD556
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 21:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 077BA615C5;
	Wed, 18 Sep 2024 21:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zN9BSgmC0_w; Wed, 18 Sep 2024 21:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A00C615A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A00C615A6;
	Wed, 18 Sep 2024 21:02:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D13D01BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 21:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD08C40223
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 21:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9V4yfUOaogYg for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 21:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9C78400F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9C78400F5
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 21:02:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B137B82318; Wed, 18 Sep 2024 21:02:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 22:59:31 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 00cc46208b1dc5f91c1510a679e2024af1f24d85
X-Git-Newrev: 34ba07104040a68aa932d9c490eeec66421cffcf
X-Patchwork-Hint: ignore
Message-Id: <20240918210222.B137B82318@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/clamav: security
 bump version to 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=34ba07104040a68aa932d9c490eeec66421cffcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes CVE-2024-20505 & CVE-2024-20506:
https://blog.clamav.net/2024/09/clamav-141-132-107-and-010312-security.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6a506262e4d7bb1b0bc3b9ab3de9f14dfebd78dc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index b2b7bfb987..8e8351cf00 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  12dcd842b6c46e5a9fdf2f5c16304efafe53310ac4605990465651b0c42227b2  clamav-1.0.6.tar.gz
+sha256  f4d67240a8b2e882e18f864529040084617de066cdab9b7684951ace6ea6f3cf  clamav-1.0.7.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index eb3abaa21c..d748a33db7 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.0.6
+CLAMAV_VERSION = 1.0.7
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
