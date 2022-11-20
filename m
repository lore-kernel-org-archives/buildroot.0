Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0019C4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 09:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 885B340463;
	Sun, 20 Nov 2022 09:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 885B340463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pEdJqLIp3Ia7; Sun, 20 Nov 2022 09:05:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B20DC40143;
	Sun, 20 Nov 2022 09:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B20DC40143
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83E011BF40E
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B224400E7
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B224400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EHThke6SDqBW for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 09:05:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99B3140143
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 09:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99B3140143
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 887A283EB6; Sun, 20 Nov 2022 09:05:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 10:03:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f901a90f57927bf09ccac2dc145c77688501cfe2
X-Git-Newrev: 0cc7c63f91ffadb0835bb57cdb7bfffdf7803add
X-Patchwork-Hint: ignore
Message-Id: <20221120090517.887A283EB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xterm: security bump to patch 376
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cc7c63f91ffadb0835bb57cdb7bfffdf7803add
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

CVE-2022-45063: xterm before 375 allows code execution via font ops, e.g.,
because an OSC 50 response may have Ctrl-g and therefore lead to command
execution within the vi line-editing mode of Zsh:

https://www.openwall.com/lists/oss-security/2022/11/10/1

Additionally, patch 376 fixes a null pointer access issue:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1022942

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xterm/xterm.hash | 2 +-
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index 3f6ec765ce..12cd2e639b 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  32f888277b19e28ebc0a3112bff000607c07bed0679caa0beebb36f9cad484f5  xterm-371.tgz
+sha256  1e5bb7aad068fb31d6d3cbb77f80c7ad1526cd4c956a4ddcf2c5cf28af5334e1  xterm-376.tgz
 # Locally calculated
 sha256  9521ef761474cd31ea406f56a751646a7b42a9287cdc6f2f8e52ed4c4d2a73e7  COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 95984f1cf9..d01b608d99 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 371
+XTERM_VERSION = 376
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
