Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21C2CD8CBF
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8EAA85606;
	Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXT31_kQIt4l; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25822855C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010097;
	bh=C+a4us/94Pu9R0DpVStEpFQPIBmj52nY4vb8v/LpDvA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UlYglM0f4xfvqK2BmtCn9kk6Teyou3PgybAkag83OYjD2wMZbJNuhaCvp1lfrCgTi
	 OnbhnQzL5pHxsuVVzkhEk8t79cAJA8bUjOQhhK16dFDQoCz/NkQTKXkDoIL+O5u2+r
	 q4WPEnQnQLJMbJOYCo5Y7udO2futCSYkKJpg2P4c19yWTNgvHNLQHlH5OzXPpiiKCv
	 Qpz7EZwk0s1B9i4relASlcYH0u4vAF++SefoZb9J+V8tmjJS7zQbQUpzQVu8XWqOP2
	 e7bJL7Iuc13TosrcBbHZjpy9ISMcU1YIbAMEV55lCJiTuCGfQMetDJqTgz/8l1M89n
	 D54PY5/4DknUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25822855C8;
	Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F1BDC196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3B496F691
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMnJgl-wkcHM for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 318916F690
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 318916F690
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C16487E7E; Tue,  9 Jun 2026 13:01:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 11:39:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c5730ebb5e8b9a67433aa9997e5cfd6cae18cfe
X-Git-Newrev: b335d2237cc154f15f45ba5641557c0a59e9a9aa
X-Patchwork-Hint: ignore
Message-Id: <20260609130107.6C16487E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlb: bump version to 0.3.26
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b335d2237cc154f15f45ba5641557c0a59e9a9aa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/hughsie/libxmlb/blob/0.3.26/NEWS

Switched to xz tarball and tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libxmlb/libxmlb.hash | 3 ++-
 package/libxmlb/libxmlb.mk   | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libxmlb/libxmlb.hash b/package/libxmlb/libxmlb.hash
index 0f91486a03..5a202ebfbf 100644
--- a/package/libxmlb/libxmlb.hash
+++ b/package/libxmlb/libxmlb.hash
@@ -1,3 +1,4 @@
+# From https://github.com/hughsie/libxmlb/releases/tag/0.3.26
+sha256  a18bc447fff0dd0d76a2e6cd4a603b4712047c027f9bbbdc31ebc25f0e2c1ed9  libxmlb-0.3.26.tar.xz
 # Locally computed:
-sha256  7050a3e43c4e1f53020cfbdfcb6fd5dc664c6c240faceb5ae3c8830423918262  libxmlb-0.3.19.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libxmlb/libxmlb.mk b/package/libxmlb/libxmlb.mk
index 1d5d339e4f..34e7233f4b 100644
--- a/package/libxmlb/libxmlb.mk
+++ b/package/libxmlb/libxmlb.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBXMLB_VERSION = 0.3.19
-LIBXMLB_SITE = $(call github,hughsie,libxmlb,$(LIBXMLB_VERSION))
+LIBXMLB_VERSION = 0.3.26
+LIBXMLB_SITE = https://github.com/hughsie/libxmlb/releases/download/$(LIBXMLB_VERSION)
+LIBXMLB_SOURCE = libxmlb-$(LIBXMLB_VERSION).tar.xz
 LIBXMLB_LICENSE = LGPL-2.1+
 LIBXMLB_LICENSE_FILES = LICENSE
 LIBXMLB_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
