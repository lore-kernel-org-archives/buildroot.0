Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124B9C61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 19:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FB64407E9;
	Thu, 27 Aug 2026 19:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ggambYZimiv; Thu, 27 Aug 2026 19:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787858516;
	bh=KQJRUw3KJOrYr9q6batU8JV7aBCyt5JmH1r5eIARF88=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g84JCAPy2WIu7P+ymqdeT9wS0uaTHj3bLZcmPdujfPVPRB1rT1CaT3KBvaFN/FJzz
	 K0kLoshgiYf5oaRXmIEBOpoUVedAmk9TvZbW1/TCgNXSTKpiFzlQPR829/Q/dsJQ19
	 Ini6yV4ch9lLdl17jPAWI6U49BgppStzlrpsoLXtSDaGqgZU4nCYiq73Ps6DG6+85H
	 3zJMTbUpbtrk7InKMyoNWOneZkHSyzlAIhP7DfIFQ8rMZ4VLbEfNhg8msjIkBX6Ka6
	 VGDLnvqp1vUeoux4yIqg4H0OthuZqQeltfN8H5rgZHI+8D9WrO8E2cLKSaS7qvXMBv
	 JwPckvi+W2t0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A40E2407F3;
	Thu, 27 Aug 2026 19:21:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2915D75
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 262DD607E0
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yNBizgO54KFY for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 19:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A389605EE
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9ADC19202A; Thu, 27 Aug 2026 19:20:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 19:55:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 803cac2271f6c033f37ac2b76e88dce78354a110
X-Git-Newrev: b4949ce4c9f4718d66ea5a81cf33b2f1a5c0b0cc
X-Patchwork-Hint: ignore
Message-Id: <20260827192057.9ADC19202A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gobject: bump to 3.56
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b4949ce4c9f4718d66ea5a81cf33b2f1a5c0b0cc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version bump is required following the glib security version bump
to 2.88.3 [1] to fix a runtime issue due to GLib-2.0 backward
compatibility removal [2].

We prefer updating python-gobject to 3.56 stable release instead of
backporting complex commits from 3.55.x unstable release [3].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152329 (TestFirewalldSysVInit)
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152332 (TestFirewalldSystemd)

[1] e313a2d2590af689eb1f79e55b5a488154400da1
[2] https://gitlab.gnome.org/GNOME/glib/-/commit/e02603d44dd71fa7bcb07a1c5d64c5a91d3e93af
[3] https://gitlab.gnome.org/GNOME/pygobject/-/commit/74e4e0f40a66436a55c72d4a6e6058c1f91a7310

Runtime tested with TestGst1Python and TestFirewalld{Systemd,SysVInit}.

Cc: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 191b74b1e6..6b26e289e7 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.54/pygobject-3.54.5.sha256sum
-sha256  b6656f6348f5245606cf15ea48c384c7f05156c75ead206c1b246c80a22fb585  pygobject-3.54.5.tar.gz
+# from https://download.gnome.org/sources/pygobject/3.56/pygobject-3.56.3.sha256sum
+sha256  12760e4a0e3d04b6eb95e06f7a27e362c826d567ea613373a92c003b6c70d2d6  pygobject-3.56.3.tar.gz
 sha256  f4cac31434b287b10a70b81c62cfa973d250417f8f248c4c1b5566d061ecfb2f  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 9386b6fed8..310cde24a7 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GOBJECT_VERSION_MAJOR = 3.54
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).5
+PYTHON_GOBJECT_VERSION_MAJOR = 3.56
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).3
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
