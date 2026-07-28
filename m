Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C971C54F4C
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 14:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 123FB608D4;
	Tue, 28 Jul 2026 14:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2dU0Pg2JTod; Tue, 28 Jul 2026 14:01:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03CCA608D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785247299;
	bh=Ek3D/Hj3Fh1CZGF2kdnfAiVpi7ueNSoN2T8wDUeG7Do=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UjtNYoz3FomcnNS9xmhczc/KTQ9nIgryPavhk996xXlfmoJ6KJoAWCpG/XLYV1MeO
	 wpgi5Dgyr9dzyjBPuyzgWrM1+nT200TjoXiW/WkjSTqWG4MaM81a1in36/uZjtPc/w
	 en+8BGi29359aD4ed4WOiKCJUaDq34Pbyzep+BBUBLuZEsBFHzsyJysfgBnFGzfPfC
	 EGhT9yd4+VSMuBUcqbb6fstMCzhAk+OmSjgd6hDtxDhhq0Yru0xo7bA9gePwd+7m39
	 w1oCtMy7Lb9pArnXFfrK4tijnV+nMjr+tgPLWEje9LUmkw73P37y+OjLoECfm7IIjT
	 rxKItCyr0zwbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03CCA608D7;
	Tue, 28 Jul 2026 14:01:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F19D3788
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 14:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E30F0608C8
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 14:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSAqVnJmfX1w for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 14:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89191608D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89191608D7
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 14:00:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C52358B40F; Tue, 28 Jul 2026 14:00:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 15:57:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0946c924686a451053df1954bf95ab1e785fede3
X-Git-Newrev: c3aa6774563d20901fd1370f51ef105180665b54
X-Patchwork-Hint: ignore
Message-Id: <20260728140016.C52358B40F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pango: bump version to 1.58.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c3aa6774563d20901fd1370f51ef105180665b54
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://download.gnome.org/sources/pango/1.57/pango-1.57.0.news
https://download.gnome.org/sources/pango/1.57/pango-1.57.1.news
https://download.gnome.org/sources/pango/1.58/pango-1.58.0.news

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 41aa793184..c5ca12c50b 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/pango/1.56/pango-1.56.4.sha256sum
-sha256  17065e2fcc5f5a5bdbffc884c956bfc7c451a96e8c4fb2f8ad837c6413cb5a01  pango-1.56.4.tar.xz
+# From https://download.gnome.org/sources/pango/1.58/pango-1.58.0.sha256sum
+sha256  bc5bad6213ad4886a47d1e80292fd850b64159b50db67917a43d9ea80ee2298a  pango-1.58.0.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 671705d0b3..69a68bc0ad 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PANGO_VERSION_MAJOR = 1.56
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).4
+PANGO_VERSION_MAJOR = 1.58
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).0
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = https://download.gnome.org/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
