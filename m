Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5974C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 13:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8397D40815;
	Wed, 28 Feb 2024 13:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FL-1OV3kAbtY; Wed, 28 Feb 2024 13:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8479D4152A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8479D4152A;
	Wed, 28 Feb 2024 13:41:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 904041BF2C8
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 13:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E193608F7
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 13:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JB-nhdZapW3n for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 13:41:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8FB060870
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8FB060870
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 13:41:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF3E587BA1; Wed, 28 Feb 2024 13:41:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 14:34:38 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 0bb42e170d4247dc097df08b692a72b4410324c4
X-Git-Newrev: f2bc7c3e8a92607d02bca0089b3f529cc155dfdd
X-Patchwork-Hint: ignore
Message-Id: <20240228134102.AF3E587BA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/xwayland:
 security bump to version 23.2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2bc7c3e8a92607d02bca0089b3f529cc155dfdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fixes the following security issues:

1) CVE-2023-6816 can be triggered by passing an invalid array index to
DeviceFocusEvent or ProcXIQueryPointer.

2) CVE-2024-0229 can be triggered if a device has both a button and a
key class and zero buttons.

3) CVE-2024-21885 can be triggered if a device with a given ID was
removed and a new device with the same ID added both in the same
operation.

4) CVE-2024-21886 can be triggered by disabling a master device with
disabled slave devices.

5) CVE-2024-0409 can be triggered by enabling SELinux
xserver_object_manager and running a client.

6) CVE-2024-0408 can be triggered by enabling SELinux
xserver_object_manager and creating a GLX PBuffer.

For details, see the advisory:
https://lists.x.org/archives/xorg-announce/2024-January/003444.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b8d9e75eb89898fac1a8200e78bca084635eefbc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xwayland/xwayland.hash | 6 +++---
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index 533ef9de86..5bb26bf17e 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-December/003437.html
-sha256  eb9d9aa7232c47412c8835ec15a97c575f03563726c787754ff0c019bd07e302  xwayland-23.2.3.tar.xz
-sha512  37198aa2f06313a0cb2add51cc78f81b26a42f2c9d55a0d3eecf958777107ea5560961c128f2d0af055f7460ba10fadb1b9050251c2c50f2251b40ab517e79cd  xwayland-23.2.3.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-January/003443.html
+sha256  a99e159b6d0d33098b3b6ab22a88bfcece23c8b9d0ca72c535c55dcb0681b46b  xwayland-23.2.4.tar.xz
+sha512  ac3ff208cbef5bbe4637c335cfda226489c93b0a3768f2f4fb0201c588485ede38262fbce77ef1425b3d2a0be61b6580df53341c7b95e6072c8b6371ad29d187  xwayland-23.2.4.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 8f4bcd8117..c66dd471ac 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 23.2.3
+XWAYLAND_VERSION = 23.2.4
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
