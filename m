Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB44C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F41E581206;
	Wed,  1 May 2024 19:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pUbsZqMgeHR1; Wed,  1 May 2024 19:52:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BBC28128A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BBC28128A;
	Wed,  1 May 2024 19:52:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 151391BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0004D60BCC
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWrqBs81Lde2 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:52:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B4D760602
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B4D760602
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:52:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35BC68641F; Wed,  1 May 2024 19:52:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 21:51:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7931f78c16f08f7a850181ce4b316e2be7522f26
X-Git-Newrev: 16463a00affa0ba4814e583bcd544174528f371e
X-Patchwork-Hint: ignore
Message-Id: <20240501195256.35BC68641F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/coreutils: drop gmp optional
 dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=16463a00affa0ba4814e583bcd544174528f371e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgmp is included in coreutils (through bootstrap.conf) since bump to
version 9.0 in commit 2ee43bad85693d1c96e14f5b39ccb13a8982f50a and
https://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=13046444888a7e96f48d28fdd5a6ffe03d4ab036:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --enable-static, --enable-shared, --without-gmp

Fixes: 2ee43bad85693d1c96e14f5b39ccb13a8982f50a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coreutils/coreutils.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index e9cb7b67cb..846d4fa567 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -75,12 +75,6 @@ ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
 COREUTILS_CONF_OPTS += --with-libintl-prefix=$(STAGING_DIR)/usr
 endif
 
-ifeq ($(BR2_PACKAGE_GMP),y)
-COREUTILS_DEPENDENCIES += gmp
-else
-COREUTILS_CONF_OPTS += --without-gmp
-endif
-
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 COREUTILS_DEPENDENCIES += libcap
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
