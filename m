Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B05C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 10:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FA0D40983;
	Fri,  5 Jan 2024 10:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FA0D40983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G9r4pN3gjzsk; Fri,  5 Jan 2024 10:58:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A016940995;
	Fri,  5 Jan 2024 10:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A016940995
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FB711BF378
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3457283DB3
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3457283DB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xp4hFJ13agCy for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 10:56:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CF2783D9A
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 10:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CF2783D9A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D931843FA; Fri,  5 Jan 2024 10:56:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 11:51:24 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 2b89d893b4e58f38c8297b173551ff5718b8a1cb
X-Git-Newrev: 4a1dfdc494259e93b26af941a430e87f19369609
X-Patchwork-Hint: ignore
Message-Id: <20240105105642.6D931843FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/xwayland:
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a1dfdc494259e93b26af941a430e87f19369609
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
