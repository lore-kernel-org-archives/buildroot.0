Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD638C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 10:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B1C242176;
	Fri,  5 Jan 2024 10:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B1C242176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lm0Ny0T_3NYl; Fri,  5 Jan 2024 10:56:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7FD8421CC;
	Fri,  5 Jan 2024 10:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7FD8421CC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18A291BF378
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E63F260FE9
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E63F260FE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wMPF7WlKNZMw for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 10:55:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6C9861474
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 10:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6C9861474
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A749E843B3; Fri,  5 Jan 2024 10:55:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 11:46:44 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 07c91947be2566176c7d2309f0896733e89d1305
X-Git-Newrev: 3a8bd9fdb96ea6192069b943e3e746605be78f88
X-Patchwork-Hint: ignore
Message-Id: <20240105105526.A749E843B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/xwayland:
 security bump to version 23.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a8bd9fdb96ea6192069b943e3e746605be78f88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fixes the following security issues:

- CVE-2023-5367 X.Org server: OOB write in
  XIChangeDeviceProperty/RRChangeOutputProperty

For details, see the advisory:
https://lists.x.org/archives/xorg-announce/2023-October/003430.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d6f0a8735e1071fa37790ea40d9cf75e59ee06b6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xwayland/xwayland.hash | 6 +++---
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index b62f404d40..12363a66bf 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-March/003376.html
-sha256  fb9461f5cb9fea5e07e91882311b0c88b43e8843b017ebac05eb5af69aa34c15  xwayland-23.1.1.tar.xz
-sha512  21c386847135c5cb4ac884926b0fbeb6ad21c9ee54752e0cdc8418e31a72872d81032159c1d91b8afb915aaaf65e80454342461d676996b2f3c535a37b0147f0  xwayland-23.1.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-October/003432.html
+sha256  9f7c0938d2a41e941ffa04f99c35e5db2bcd3eec034afe8d35d5c810a22eb0a8  xwayland-23.2.2.tar.xz
+sha512  f5b319fdace7d7c078544730ecd26afeb63b1a0c779fb097455147945df85af32d9e91501ebdb70209d48e8a3ead3b23be31e9d5118358ac17e699abb4b6ac07  xwayland-23.2.2.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 8550b61389..8eac602042 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 23.1.1
+XWAYLAND_VERSION = 23.2.2
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
