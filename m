Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4946C02181
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4F2C84775;
	Sat, 14 Sep 2024 08:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywmUWCXBUx1a; Sat, 14 Sep 2024 08:24:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6375584814
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6375584814;
	Sat, 14 Sep 2024 08:23:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AECF1BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5202E60739
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQQbtBCCJ-A0 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E49D60656
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E49D60656
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BC4A86F5A; Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 10:19:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e868977128db012764e491b9b7dc4978efacbd0
X-Git-Newrev: c581396b9165cd690c65b446e37b4523c2127fb4
X-Patchwork-Hint: ignore
Message-Id: <20240914082254.8BC4A86F5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcddb: fix typo in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=c581396b9165cd690c65b446e37b4523c2127fb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcddb/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcddb/Config.in b/package/libcddb/Config.in
index f2bb827829..71797a2712 100644
--- a/package/libcddb/Config.in
+++ b/package/libcddb/Config.in
@@ -15,6 +15,6 @@ if BR2_PACKAGE_LIBCDDB
 config BR2_PACKAGE_LIBCDDB_INSTALL_CDDB_QUERY
 	bool "install cddb_query"
 	help
-	  cddb_query is an optionnal libcddb test program.
+	  cddb_query is an optional libcddb test program.
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
