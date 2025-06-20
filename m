Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6F9C7115C
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 17:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BBCD417D4;
	Fri, 20 Jun 2025 17:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nshwrG4TT_Y9; Fri, 20 Jun 2025 17:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FB374163E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FB374163E;
	Fri, 20 Jun 2025 17:09:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE82E154
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 17:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBAED60AD8
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 17:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMRIVRkllqxV for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 17:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92E9E60AAE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92E9E60AAE
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 17:09:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EC8A84000; Fri, 20 Jun 2025 17:09:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Jun 2025 19:02:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5948b4dd7bd154effa50717df15fcb10ce807d81
X-Git-Newrev: c17ce037930400f181d23af312bc64215fffdbc5
X-Patchwork-Hint: ignore
Message-Id: <20250620170941.7EC8A84000@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/clamav: bump version to 1.4.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c17ce037930400f181d23af312bc64215fffdbc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://blog.clamav.net/2024/08/clamav-140-feature-release-and-clamav.html
https://blog.clamav.net/2024/09/clamav-141-132-107-and-010312-security.html
https://blog.clamav.net/2025/01/clamav-142-and-108-security-patch.html
https://blog.clamav.net/2025/06/clamav-143-and-109-security-patch.html

Note: release notes of clamav version 1.4.1, 1.4.2 and 1.4.3 are
marked upstream as security maintenance releases. This Buildroot
commit is not marked as security fix because those security patches
were already applied in the v1.0.x series. See version bumps
to v1.0.7 [1], v1.0.8 [2] and v1.0.9 [3].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/6a506262e4d7bb1b0bc3b9ab3de9f14dfebd78dc
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/caa2fac892e01929148eb169dfc83d59ad806a79
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/09f6aa642d9a5255899581b4af6edef62e52deae

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add note about security in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 5989682671..5f83d57661 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  5d3a20633bd589f612a71905a4fb50c1ee857cfbe6c72644368cac0030a1eeb4  clamav-1.0.9.tar.gz
+sha256  d874cabf3d4765b35b518ef535658a1e6ec74802006a1d613f9f124aa1343210  clamav-1.4.3.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 0a88cc1b9f..93ddfaae5b 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.0.9
+CLAMAV_VERSION = 1.4.3
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
