Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB60E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 22:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 154DE608FD;
	Sat, 28 Dec 2024 22:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Qju4P2lQZlz; Sat, 28 Dec 2024 22:32:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 336366090C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 336366090C;
	Sat, 28 Dec 2024 22:32:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AF85CA
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3C8B80CB5
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4Wuyemn8ZP7 for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 22:32:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 556EE80F2D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 556EE80F2D
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:32:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41E778711D; Sat, 28 Dec 2024 22:32:35 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 23:32:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffe409140b141cc500e269ef3640e9fdc7475723
X-Git-Newrev: 6beee86c0d953dd67549d27c1f684132bc052a31
X-Patchwork-Hint: ignore
Message-Id: <20241228223235.41E778711D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6opcua: fix 'qt6opcua' typo
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6beee86c0d953dd67549d27c1f684132bc052a31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6opcua/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt6/qt6opcua/Config.in b/package/qt6/qt6opcua/Config.in
index 68b73f7c50..9b5359dd4c 100644
--- a/package/qt6/qt6opcua/Config.in
+++ b/package/qt6/qt6opcua/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_QT6OPCUA
 	bool "qt6opcua"
 	select BR2_PACKAGE_QT6BASE_NETWORK
-	# qt6opcuda needs host-qt6opcua, and host-qt6opcua needs
+	# qt6opcua needs host-qt6opcua, and host-qt6opcua needs
 	# network support in qt6base.
 	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
