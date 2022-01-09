Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AABC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 18:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78381405AB;
	Sun,  9 Jan 2022 18:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sbYka9tBAhaD; Sun,  9 Jan 2022 18:31:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 918E640575;
	Sun,  9 Jan 2022 18:31:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0434C1BF291
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6A28812CC
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:31:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WSXI1wdyVDLg for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 18:31:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C08C812C4
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 18:31:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 38C4E82DB5; Sun,  9 Jan 2022 18:25:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 19:31:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf9dcd3b08fd88ef21550f75dc57de212fcea26c
X-Git-Newrev: ee8ccad5d7cbb4981e6960d5712e9936eb28724e
X-Patchwork-Hint: ignore
Message-Id: <20220109182532.38C4E82DB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: add mysql_config to
 MARIADB_CONFIG_SCRIPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee8ccad5d7cbb4981e6960d5712e9936eb28724e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add mysql_config to MARIADB_CONFIG_SCRIPTS, this won't fix any build
failure at the moment but will avoid possible issues in the future

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index d08b768a2e..db967ca3ed 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -14,6 +14,7 @@ MARIADB_CPE_ID_VENDOR = mariadb
 MARIADB_SELINUX_MODULES = mysql
 MARIADB_INSTALL_STAGING = YES
 MARIADB_PROVIDES = mysql
+MARIADB_CONFIG_SCRIPTS = mysql_config
 
 MARIADB_DEPENDENCIES = \
 	host-mariadb \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
