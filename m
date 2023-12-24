Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B6CC46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 22:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C63B281E0B;
	Sun, 24 Dec 2023 22:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C63B281E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gG_lmBxmDQfU; Sun, 24 Dec 2023 22:25:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2181B81CA5;
	Sun, 24 Dec 2023 22:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2181B81CA5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDF6B1BF380
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 22:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD61A40018
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 22:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD61A40018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osxRlxMhi8br for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 22:24:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2794404DB
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 22:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2794404DB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FA4E8296A; Sun, 24 Dec 2023 22:24:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 23:22:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4163b67c376bbfc81d41e4162ea05b65a9110661
X-Git-Newrev: 31c169f556d3bf644eae357f7b6781300d60f173
X-Patchwork-Hint: ignore
Message-Id: <20231224222403.8FA4E8296A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sway/Config.in: Add a help note
 about the default terminal
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

commit: https://git.buildroot.net/buildroot/commit/?id=31c169f556d3bf644eae357f7b6781300d60f173
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default terminal used by sway is the foot terminal. Add a note in
the Config.in explaining that if a user is using the default sway config,
it is recommended to also enable the foot package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sway/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index e97777ac87..4f6d9fb215 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -21,6 +21,10 @@ config BR2_PACKAGE_SWAY
 	select BR2_PACKAGE_XKEYBOARD_CONFIG # runtime
 	help
 	  i3-compatible Wayland compositor
+	  Note:
+	    The default sway config uses the foot package as the
+	    default terminal. If you plan on using the default
+	    config, it is recommended to select the foot package!
 
 	  https://github.com/swaywm/sway
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
