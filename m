Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97240EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CC6360EF2;
	Sat,  1 Jul 2023 14:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CC6360EF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 66ZDxhd115ME; Sat,  1 Jul 2023 14:09:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E57160E64;
	Sat,  1 Jul 2023 14:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E57160E64
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 775CF1BF349
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E53560E64
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E53560E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K4xqBmpFCRYN for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:09:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93711600B8
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93711600B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81C4B85C93; Sat,  1 Jul 2023 14:09:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 16:08:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccb6a80e90fad08150a22566d17e98fe0d465ee0
X-Git-Newrev: bca9d7e58a23fc8c4a27be7971ace1fc84526d22
X-Patchwork-Hint: ignore
Message-Id: <20230701140936.81C4B85C93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: add optional dependency to
 libunwind
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

commit: https://git.buildroot.net/buildroot/commit/?id=bca9d7e58a23fc8c4a27be7971ace1fc84526d22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream added configure options for libunwind in commit
https://github.com/samba-team/samba/commit/14feb93d481011765f62614ab49b304e17e4f6fd

Fixes:
http://autobuild.buildroot.net/results/63c/63c469106e9daa198f77d8da7a5bb123edcce0f7/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
