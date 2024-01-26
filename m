Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6766C47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 16:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E4CC42117;
	Fri, 26 Jan 2024 16:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E4CC42117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwyUahFi3Waf; Fri, 26 Jan 2024 16:05:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AF5B42135;
	Fri, 26 Jan 2024 16:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AF5B42135
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 931B61BF284
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B5F040556
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B5F040556
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MIzPBdasyI_A for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 16:04:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4298140518
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 16:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4298140518
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 220F186535; Fri, 26 Jan 2024 16:04:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 17:02:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8d9e75eb89898fac1a8200e78bca084635eefbc
X-Git-Newrev: 219178ef3eed5b3f4a5da0fe4af751e79d77e432
X-Patchwork-Hint: ignore
Message-Id: <20240126160447.220F186535@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xserver_xorg-server: security bump
 to version 21.1.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=219178ef3eed5b3f4a5da0fe4af751e79d77e432
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Switch to .tar.gz as the announcement mail only contained hashes for that:
https://lists.x.org/archives/xorg-announce/2024-January/003442.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index de93b11927..be636936e2 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-December/003436.html
-sha256  ceb0b3a2efc57ac3ccf388d3dc88b97615068639fb284d469689ae3d105611d0  xorg-server-21.1.10.tar.xz
-sha512  8135d9b7c0c71f427ba0a3b80741fee4f6ae195779399b73261a00858882f3516e367a08e2da1403734b04eacabae9aa231e5375eff23b57a3ff764e9caf8926  xorg-server-21.1.10.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-January/003442.html
+sha256  1aa0ee1adad0b2db7f291f3823a4ab240c7f4aea710e89f5ef4aa232b6833403  xorg-server-21.1.11.tar.gz
+sha512  e41bf71955691e66084a67fc20643632087f0326d5eddc31e6edd118d05005b8ab536738c181f4c352f331ec8fc8f23ae1b45f237592fa5d7eddbffe43638b08  xorg-server-21.1.11.tar.gz
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 4ac4283e4b..4a05582583 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.10
-XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
+XSERVER_XORG_SERVER_VERSION = 21.1.11
+XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.gz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
 XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
