Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358C8E77180
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 21:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F39C56FBCB;
	Thu, 12 Dec 2024 21:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfs3RWCSNW7m; Thu, 12 Dec 2024 21:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4BA4703DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4BA4703DB;
	Thu, 12 Dec 2024 21:34:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 132F3115A
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A3EE84942
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmbpe0pAiX1S for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 21:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 794F684A74
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 794F684A74
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7378686ED3; Thu, 12 Dec 2024 21:33:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 21:07:19 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e61b83c61bbcbea74c37ff7aae990fefdc64ec86
X-Git-Newrev: 8016537b7d1ac17c625b8a922689bd27342d9c0e
X-Patchwork-Hint: ignore
Message-Id: <20241212213337.7378686ED3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/open62541: fix
 'resources' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=8016537b7d1ac17c625b8a922689bd27342d9c0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b2d2ea4300520dcf88fd3efbfcacbe228058439e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/open62541/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/open62541/Config.in b/package/open62541/Config.in
index 296be1578d..a5c07d5043 100644
--- a/package/open62541/Config.in
+++ b/package/open62541/Config.in
@@ -88,7 +88,7 @@ config BR2_PACKAGE_OPEN62541_PUBSUB_DELTAFRAMES
 	  The PubSub messages differentiate between keyframe (all
 	  published values contained) and deltaframe (only changed
 	  values contained) messages. Deltaframe messages creation
-	  consumes some additional ressources.
+	  consumes some additional resources.
 
 config BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL
 	bool "publish/subscribe information model"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
