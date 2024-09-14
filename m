Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACBDC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7A1281D18;
	Sun, 15 Sep 2024 21:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxmim4Y706eE; Sun, 15 Sep 2024 21:37:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9883481DE1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9883481DE1;
	Sun, 15 Sep 2024 21:37:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 010311BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DEB3405BB
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VN5EQ-i9qEtW for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D09F640597
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D09F640597
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCD9283683; Sun, 15 Sep 2024 21:36:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 20:35:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b315dc5fbf40eb0a4ac60019bf9c67ef7c8e72e0
X-Git-Newrev: 7b888e08a2e253e15f6e9c668419b006a2f40e11
X-Patchwork-Hint: ignore
Message-Id: <20240915213636.BCD9283683@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zabbix: move Config.in comment to
 fix option indentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b888e08a2e253e15f6e9c668419b006a2f40e11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Config.in comment was before sub-options, so it was preventing
menuconfig from rendering sub-options indented under the main zabbix
option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zabbix/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
index 9ac668117d..4940f8ca8e 100644
--- a/package/zabbix/Config.in
+++ b/package/zabbix/Config.in
@@ -10,9 +10,6 @@ config BR2_PACKAGE_ZABBIX
 
 	  https://zabbix.com
 
-comment "zabbix need glibc"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-
 if BR2_PACKAGE_ZABBIX
 
 comment "zabbix server needs C++ and threads or wchar and dynamic libs"
@@ -81,3 +78,6 @@ comment "zabbix web UI requires PHP"
 endif
 
 endif
+
+comment "zabbix need glibc"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
