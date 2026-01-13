Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67541D30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3046260FEB;
	Tue, 13 Jan 2026 21:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPXrD-ZZXd1l; Tue, 13 Jan 2026 21:00:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5763F61006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338012;
	bh=7IwIt9po+q/dfUhp0InpXW571BoOWlSBfoigMmNENRo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l7I6GTvXOBS1mHt7mDM353dHsDlPjyeN3UxijxMgVLcDO5M0qubxoJKlID2CPKRF7
	 lqsrD52w7aLaWc/+TffquplfThW+HbH/7ii2/1AEta7677cXD03wJH5wX4QcvnM96y
	 vf46vmLQAeiVRbIt7tcFO6I63KBBCbHj/5Snw77y1A3c12ZYlrOVzfZaIQbpXSIBFh
	 eYsmeDam5JIC1DBn3M5iCD26LZfKeEC7hGcmS4xkWtU8cpwZapqIQX1dJstZQVo/x+
	 q/1e0q7Tcpn5v+O9gpN70ZFV9eBa+68XQ+o2JJ3LbBNk1AK7qO75NuKf5OLzOkVDTq
	 vF1Nmt7u1RBqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5763F61006;
	Tue, 13 Jan 2026 21:00:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 738D51CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A9E9407A4
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qIXyLKVzS1F for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F87C407A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F87C407A3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C96E81382; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e98f026f9b036f5bf9df644f49632a9799bda18
X-Git-Newrev: 9f01acb3cefdfcc3884e635a53fc644337797463
X-Patchwork-Hint: ignore
Message-Id: <20260113205847.9C96E81382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xrandr: bump version to
 1.5.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9f01acb3cefdfcc3884e635a53fc644337797463
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-November/003551.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xrandr/xapp_xrandr.hash | 6 +++---
 package/x11r7/xapp_xrandr/xapp_xrandr.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.hash b/package/x11r7/xapp_xrandr/xapp_xrandr.hash
index a407326bb8..62314c9fd2 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.hash
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003270.html
-sha256  c8bee4790d9058bacc4b6246456c58021db58a87ddda1a9d0139bf5f18f1f240  xrandr-1.5.2.tar.xz
-sha512  b536e8f1e04094894aa52ae496725c58691b043860b3327c41d737b07b642a939733321b62f698032b11ba857208a6177600a3ca3295ff1be6ade4341cdc2747  xrandr-1.5.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-November/003551.html
+sha256  f8dd7566adb74147fab9964680b6bbadee87cf406a7fcff51718a5e6949b841c  xrandr-1.5.3.tar.xz
+sha512  2096afb9040ca18005aaf744401df40bdb8e8c8c06ffc97b927e63131800a4dc40cec063bdb5f38cd74b3d24b25fbed258c16cb6c73161efea44b3065b15c100  xrandr-1.5.3.tar.xz
 # Locally computed
 sha256  0dd9a3d62c48dd7b87790029e39fb5e11756d33fded3bc1644e11585c87b2038  COPYING
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index d6b39b51d0..563383f844 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XRANDR_VERSION = 1.5.2
+XAPP_XRANDR_VERSION = 1.5.3
 XAPP_XRANDR_SOURCE = xrandr-$(XAPP_XRANDR_VERSION).tar.xz
 XAPP_XRANDR_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XRANDR_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
