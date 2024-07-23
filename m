Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35656C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 21:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07003600C7;
	Tue, 23 Jul 2024 21:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMSYlfBkXEoy; Tue, 23 Jul 2024 21:05:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23AB1605C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23AB1605C8;
	Tue, 23 Jul 2024 21:05:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C68291BF2F9
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3EE060645
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YWxGk7GvLLD for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 21:05:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EB12605C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EB12605C8
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 21:05:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 079BA8738D; Tue, 23 Jul 2024 21:05:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 23:05:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28be64c1e0ad0ba014257cda116c2f07236d0d4b
X-Git-Newrev: 380cdf5c95f2e962b63269d8cf45a8939275d8e0
X-Patchwork-Hint: ignore
Message-Id: <20240723210544.079BA8738D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: fix largefile option
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

commit: https://git.buildroot.net/buildroot/commit/?id=380cdf5c95f2e962b63269d8cf45a8939275d8e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo in --enable-largefile added by commit
25254458bde6befcbf93b746d994f94665741c42

Fixes: 25254458bde6befcbf93b746d994f94665741c42

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xz/xz.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index e295144ed1..8dfd76f8b9 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -38,7 +38,7 @@ XZ_CONF_OPTS = \
 	--enable-sandbox=auto \
 	--enable-symbol-versions \
 	--enable-rpath \
-	--enable-largfile \
+	--enable-largefile \
 	--enable-unaligned-access=auto \
 	--disable-unsafe-type-punning \
 	--disable-werror \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
