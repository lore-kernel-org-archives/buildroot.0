Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC75C02181
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F4E484810;
	Sat, 14 Sep 2024 08:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id old-0bp9eQla; Sat, 14 Sep 2024 08:23:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5812C84809
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5812C84809;
	Sat, 14 Sep 2024 08:23:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5EA2F1BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0D5C6068A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOoYU2p0pAVs for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:22:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5438B6075B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5438B6075B
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:22:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5125A86F59; Sat, 14 Sep 2024 08:22:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 10:19:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6599d68a66a242cfae9d484da2f7fdaa50c3aa31
X-Git-Newrev: 893602e69d1cd728a24c2cad6b877cb0c3da51cd
X-Patchwork-Hint: ignore
Message-Id: <20240914082255.5125A86F59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxcrypt: fix insecure typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=893602e69d1cd728a24c2cad6b877cb0c3da51cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxcrypt/libxcrypt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index d39186eecb..60901988ac 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -15,7 +15,7 @@ LIBXCRYPT_INSTALL_STAGING = YES
 LIBXCRYPT_CONF_OPTS = --disable-werror
 HOST_LIBXCRYPT_CONF_OPTS = --disable-werror
 
-# Disable obsolete and unsecure API
+# Disable obsolete and insecure API
 LIBXCRYPT_CONF_OPTS += --disable-obsolete_api
 HOST_LIBXCRYPT_CONF_OPTS += --disable-obsolete_api
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
