Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98092C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 07:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4668560BB1;
	Sun, 18 Sep 2022 07:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4668560BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sk_hWEErGaik; Sun, 18 Sep 2022 07:48:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7991160A7B;
	Sun, 18 Sep 2022 07:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7991160A7B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D7E71BF3BD
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 07:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77E69419E0
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 07:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77E69419E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KpWoeMypSEdX for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 07:48:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71FC4419D8
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 07:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71FC4419D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60AE7847C8; Sun, 18 Sep 2022 07:48:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 09:46:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e78bcf27d42721aea9ff9a3b3877d7e54daa0365
X-Git-Newrev: 5cd140ca8d40f58f3864b0f267e5e54e5756a45a
X-Patchwork-Hint: ignore
Message-Id: <20220918074816.60AE7847C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in.legacy: add missing select
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

commit: https://git.buildroot.net/buildroot/commit/?id=5cd140ca8d40f58f3864b0f267e5e54e5756a45a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5c89b00a2052 (package/gdb: remove support for 9.2) forgot to
select the legacy symbol when gdb 9.2 was previously enabled.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 631b31689b..5f7274e84b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -154,6 +154,7 @@ config BR2_PACKAGE_GPSD_OLDSTYLE
 
 config BR2_GDB_VERSION_9_2
 	bool "gdb 9.2 removed"
+	select BR2_LEGACY
 	help
 	  Support for GDB 9.2 has been removed. A new version has
 	  automatically been selected.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
