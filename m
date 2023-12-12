Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECDBC4332F
	for <buildroot@archiver.kernel.org>; Tue, 12 Dec 2023 22:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4989B41BBB;
	Tue, 12 Dec 2023 22:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4989B41BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IYTAEsoMO41j; Tue, 12 Dec 2023 22:14:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D92C41BCD;
	Tue, 12 Dec 2023 22:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D92C41BCD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 325FF1BF2A2
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 22:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A16382CEC
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 22:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A16382CEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RXtnoIOqPbPp for <buildroot@lists.busybox.net>;
 Tue, 12 Dec 2023 22:13:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 641BD82CD3
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 22:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 641BD82CD3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DEEE87B1C; Tue, 12 Dec 2023 22:13:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Dec 2023 22:54:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8e1aca0de4186b8578d128c333c100b89da194a
X-Git-Newrev: 36a9ec8921b6b6c0359ca6e4afd529f8473bab89
X-Patchwork-Hint: ignore
Message-Id: <20231212221336.4DEEE87B1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xserver_xorg-server: security bump
 to version 21.1.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=36a9ec8921b6b6c0359ca6e4afd529f8473bab89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2023-5367 X.Org server: OOB write in
  XIChangeDeviceProperty/RRChangeOutputProperty

- CVE-2023-5380: Use-after-free bug in DestroyWindow

- CVE-2023-5574: Use-after-free bug in DamageDestroy

For details, see the advisory:
https://lists.x.org/archives/xorg-announce/2023-October/003430.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 092a640f04..ccd7cc74fa 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-March/003377.html
-sha256  38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152  xorg-server-21.1.8.tar.xz
-sha512  6104b3620ed2e1e27d9a8e963388bbe8785a764585b1bc03dbf5d719a92894773dda580d377ca18ceeab353e65a5d23cc947bab84a4012f9dd1eca31cac36937  xorg-server-21.1.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-October/003431.html
+sha256  ff697be2011b4c4966b7806929e51b7a08e9d33800d505305d26d9ccde4b533a  xorg-server-21.1.9.tar.xz
+sha512  9044e1b9222616fb63aea444b75f4ca6582edb7d899018f8ea30359e57edf04b1555e69397ebc4d288f7e36d6b82a54dde3895f11d414573d229e908ac17bfe8  xorg-server-21.1.9.tar.xz
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index ede03d024c..cf0e688c36 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.8
+XSERVER_XORG_SERVER_VERSION = 21.1.9
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
