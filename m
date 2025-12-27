Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE50E92723
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 23:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E77BD60817;
	Sat, 27 Dec 2025 23:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRzj1hSvcaRV; Sat, 27 Dec 2025 23:40:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0017860843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766878808;
	bh=JFHZCWpLpePzipQvxIAaPCciji16b6Tmz6hCo9YHqh4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T1txjvC2xXckTEVnvxlnilPe8nuMdpEy/ZN2Ru1YGjJvas1vtS5fk92FWMl88znp+
	 WX7SrUC/7VHnScnHgo/i9yUCiKLlMGvMzb5aEfVQGTcMwoyW/OFLcwIyL8nwwd13Zw
	 fs6lkvzP1VmxvpW1FftVWishs/lMutVHV1ctE3GRo9xLcIzlDHQ0IqDYaeOWtQaJ+6
	 GYiFPcQ3Wbe4TFpgf/VaiURZQJJUK3Spi6gItvZ47n8bwMvTcZvGCxw0m7SqzL58sh
	 2VKvA+pfJGMwfq5EPaXfiMI1G31JTpVF4IfJEqhDlrBpxJBatm9i1RL8/jMU/8yZ0B
	 rziYmxNuiLWJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0017860843;
	Sat, 27 Dec 2025 23:40:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A525D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 214F180F54
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jWMCyrvmu4NB for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 579C280F90
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 579C280F90
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3294787901; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 00:15:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c687f2fcf50b5aedfc91f6b2c042405235e58396
X-Git-Newrev: 446fea34aa5d41976f4b60aaa2ae7b7ad21536ed
X-Patchwork-Hint: ignore
Message-Id: <20251227233954.3294787901@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/matchbox-keyboard: switch to gz
 tarball
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=446fea34aa5d41976f4b60aaa2ae7b7ad21536ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched _SOURCE to .gz, upstream does not provide bz2 tarballs
anymore. This means in fact _SOURCE can be dropped, as it's now the
default value.

No autobuild errors recorded due to previous download error with
matchbox-lib.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/matchbox-keyboard/matchbox-keyboard.hash | 2 +-
 package/matchbox-keyboard/matchbox-keyboard.mk   | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/matchbox-keyboard/matchbox-keyboard.hash b/package/matchbox-keyboard/matchbox-keyboard.hash
index 43ace650a4..1cc657edc4 100644
--- a/package/matchbox-keyboard/matchbox-keyboard.hash
+++ b/package/matchbox-keyboard/matchbox-keyboard.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  44fc6dc6075090d6f8e43f8667cf8a85bed59b7221a5ee81843454c66e352790  matchbox-keyboard-0.1.1.tar.bz2
+sha256  dd3e9494a9499a3bf3017c8c1e6572a4e91deb20e219717db17c0977750b8bcb  matchbox-keyboard-0.1.1.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
 sha256  bba6fd8976fa5c669ddc1378a3d8d49a74263d4d39efb9a90cefb3583a813ecc  applet/applet.c
diff --git a/package/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox-keyboard/matchbox-keyboard.mk
index a1e3c61543..776ee8ee29 100644
--- a/package/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox-keyboard/matchbox-keyboard.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 MATCHBOX_KEYBOARD_VERSION = 0.1.1
-MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.bz2
 MATCHBOX_KEYBOARD_SITE = \
 	http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-keyboard/snapshot
 MATCHBOX_KEYBOARD_LICENSE = LGPL-2.1, GPL-2.0+ (applet.c)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
