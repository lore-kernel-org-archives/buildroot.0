Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E206CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:29:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F7E161108
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F7E161108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 036B660767;
	Thu, 14 Oct 2021 20:29:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QMCKLZ9bnW0H; Thu, 14 Oct 2021 20:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 636996070F;
	Thu, 14 Oct 2021 20:29:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 276191BF599
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12E3B40460
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:29:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6IG3GXSu_cgw for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 20:29:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0542D40566
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 20:29:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DD9FE8D23A; Thu, 14 Oct 2021 20:26:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 22:28:57 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: b1e32fa954faae7dce51ebee48981af3ace3c0ba
X-Git-Newrev: 5075370f6f92d07ea4124eab7fbbf3925ac2660f
X-Patchwork-Hint: ignore
Message-Id: <20211014202634.DD9FE8D23A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/systemd: security
 bump to version 247.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=5075370f6f92d07ea4124eab7fbbf3925ac2660f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following security issues:

- CVE-2020-13529: An exploitable denial-of-service vulnerability exists in
  Systemd 245.  A specially crafted DHCP FORCERENEW packet can cause a
  server running the DHCP client to be vulnerable to a DHCP ACK spoofing
  attack.  An attacker can forge a pair of FORCERENEW and DCHP ACK packets
  to reconfigure the server.
  https://talosintelligence.com/vulnerability_reports/TALOS-2020-1142

- CVE-2021-33910: Denial of Service (Stack Exhaustion) in systemd (PID 1)
  https://blog.qualys.com/vulnerabilities-threat-research/2021/07/20/cve-2021-33910-denial-of-service-stack-exhaustion-in-systemd-pid-1

Update hash of README for a change of IRC network:
-        #systemd on irc.freenode.org
+        #systemd on irc.libera.chat

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.hash | 4 ++--
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 20cd922259..4ed5e96d4f 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,6 +1,6 @@
 # sha256 locally computed
-sha256  2869986e219a8dfc96cc0dffac66e0c13bb70a89e16b85a3948876c146cfa3e0  systemd-247.3.tar.gz
+sha256  629b8c895efa000b921092c7a565680c66dcd0ec74ed11cb2dd2b6701492675d  systemd-247.9.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
-sha256  6f22d19d35b00f35e0444e0bc9139e6d3bdf7277978f89c4e175e37b18c43f3d  README
+sha256  996b2bd286a6832b4c8cbab8e662d371e2fd061a2e14925bc6099d805f12c7a3  README
 sha256  83bb6bd9ccd2cf5230cb1807ed16258289768dc4d9cb80069a814e04415a1275  tools/chromiumos/LICENSE
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 74c561e67e..21e8c48ed7 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 247.3
+SYSTEMD_VERSION = 247.9
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
