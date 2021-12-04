Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC0DC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 20:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E39A60A83;
	Sat,  4 Dec 2021 20:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3fwwsr9Pg2DV; Sat,  4 Dec 2021 20:09:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F292F60A81;
	Sat,  4 Dec 2021 20:08:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E69C81BF861
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E220E4055F
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bA26RAl0cgA8 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 20:08:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA07F40490
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 20:08:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B5ED590BCB; Sat,  4 Dec 2021 20:03:52 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 21:08:02 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 737d4092f93a08d749697099daca57414a3a9961
X-Git-Newrev: 250d36c86f0e104fd978f60e1e004d976a00159a
X-Patchwork-Hint: ignore
Message-Id: <20211204200352.B5ED590BCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/iwd: bump to version
 1.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=250d36c86f0e104fd978f60e1e004d976a00159a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Changelog (since 1.19, from [1]):

  ver 1.20:
    Fix issue with handling Hotspot 2.0 requirements.
    Add support for evict_nocarrier setting during roaming.
    Add support for experimental NetworkConfigurationAgent API.

[1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 008a2db011..58224170e6 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  dd65a8795f6127fb1b9e29f2092686b0590a0d3738c2b90c792ccd320deaf966  iwd-1.19.tar.xz
+sha256  7d51e2ccabe7c500e44061ac725dbd4f6b0fb518b5e3de1681063d0f15d3050f  iwd-1.20.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index afa6e3bdeb..7b122811c5 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.19
+IWD_VERSION = 1.20
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
