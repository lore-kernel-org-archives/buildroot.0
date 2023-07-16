Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072D5EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 09:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C4894038D;
	Sun, 16 Jul 2023 09:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C4894038D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8MP6aDWE2eiX; Sun, 16 Jul 2023 09:19:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C896C40272;
	Sun, 16 Jul 2023 09:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C896C40272
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C26071BF33E
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 09:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B10140985
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 09:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B10140985
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EURmSfW1DFQQ for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 09:19:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BE184097E
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 09:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BE184097E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 887BE8569E; Sun, 16 Jul 2023 09:19:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 11:17:41 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 829eec5dbfdc225f1279228b02f0c7856a7d8c5e
X-Git-Newrev: b2961a318dbb5c74ac229e7e287b6e3dd94e94e5
X-Patchwork-Hint: ignore
Message-Id: <20230716091953.887BE8569E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/samba4: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2961a318dbb5c74ac229e7e287b6e3dd94e94e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
