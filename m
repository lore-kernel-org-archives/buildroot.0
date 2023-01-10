Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEB5C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6958541991;
	Wed, 11 Jan 2023 09:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6958541991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1DVAAz3uzFj7; Wed, 11 Jan 2023 09:27:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58C334193C;
	Wed, 11 Jan 2023 09:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58C334193C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E3081BF2B3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D13140AAD
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D13140AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2qnJS59vqWXc for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:25:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5711040B9E
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5711040B9E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5542587817; Wed, 11 Jan 2023 09:25:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Jan 2023 22:47:44 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: a69e24cf2044f0ff29acef53a41041750cfc6e7e
X-Git-Newrev: 536d5c7792dd2881f6f08f0894dafabb8e6bf78c
X-Patchwork-Hint: ignore
Message-Id: <20230111092533.5542587817@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/i2pd: really
 install configuration files
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

commit: https://git.buildroot.net/buildroot/commit/?id=536d5c7792dd2881f6f08f0894dafabb8e6bf78c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

While applying [1] the commit "fffbd2c9f7 i2pd: new package"
unintentionally removed completely the post-install hooks, so
I2PD_INSTALL_CONFIGURATION_FILES is declared but never called.

Fix the install of configuration files by adding the defined symbol to
the post-install hooks.

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20180327212401.5173-1-fontaine.fabrice@gmail.com/

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fa581bb3e6b45da2b7a0cfb9e5d6f869a7cd9b05)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/i2pd/i2pd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index b99212be47..ad268a235c 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -44,6 +44,7 @@ define I2PD_INSTALL_CONFIGURATION_FILES
 	mkdir -p $(TARGET_DIR)/var/lib/i2pd
 	cp -a $(@D)/contrib/certificates $(TARGET_DIR)/var/lib/i2pd
 endef
+I2PD_POST_INSTALL_TARGET_HOOKS += I2PD_INSTALL_CONFIGURATION_FILES
 
 define I2PD_USERS
 	i2pd -1 i2pd -1 * /var/lib/i2pd - - I2P Daemon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
