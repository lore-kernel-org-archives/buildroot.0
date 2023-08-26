Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A969C83F11
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05CC6405F4;
	Sat, 26 Aug 2023 18:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05CC6405F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1n0x0alvZ9MC; Sat, 26 Aug 2023 18:48:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37A9C405DC;
	Sat, 26 Aug 2023 18:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37A9C405DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 303621BF37C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE88C60B3C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE88C60B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rznMZ1EDPwTJ for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:48:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2E9560D76
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2E9560D76
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEE158636D; Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 19:38:14 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 96466e31910a1b1f59686d962e7714a706b18cbd
X-Git-Newrev: 54be53a189006f46aa627640d936df381ef6e00a
X-Patchwork-Hint: ignore
Message-Id: <20230826184802.DEE158636D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/samba4: add
 optional dependency to libunwind
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

commit: https://git.buildroot.net/buildroot/commit/?id=54be53a189006f46aa627640d936df381ef6e00a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Upstream added configure options for libunwind in commit
https://github.com/samba-team/samba/commit/14feb93d481011765f62614ab49b304e17e4f6fd

Fixes:
http://autobuild.buildroot.net/results/63c/63c469106e9daa198f77d8da7a5bb123edcce0f7/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bca9d7e58a23fc8c4a27be7971ace1fc84526d22)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 2799dbe2f7..4489c28d2b 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -93,6 +93,13 @@ else
 SAMBA4_CONF_OPTS += --without-libarchive
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+SAMBA4_CONF_OPTS += --with-libunwind
+SAMBA4_DEPENDENCIES += libunwind
+else
+SAMBA4_CONF_OPTS += --without-libunwind
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 SAMBA4_CONF_ENV += NCURSES_CONFIG="$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)"
 SAMBA4_DEPENDENCIES += ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
