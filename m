Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7025C25B75
	for <buildroot@archiver.kernel.org>; Sun, 26 May 2024 20:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA28D60852;
	Sun, 26 May 2024 20:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtVuA4Lw8JHu; Sun, 26 May 2024 20:47:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5890C608FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5890C608FD;
	Sun, 26 May 2024 20:47:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE5901D1446
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 20:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ADD240282
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 20:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xgt-LNKsVoHq for <buildroot@lists.busybox.net>;
 Sun, 26 May 2024 20:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C4CE402E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C4CE402E1
 for <buildroot@buildroot.org>; Sun, 26 May 2024 20:46:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 373F9815FE; Sun, 26 May 2024 20:46:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 26 May 2024 22:44:17 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 7dfb9a9ce9e60ebc06793b7183b2b7e9c407c72a
X-Git-Newrev: 033a9a64a6f9db0bc5f0313d1b24f8d385316874
X-Patchwork-Hint: ignore
Message-Id: <20240526204659.373F9815FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/dovecot/Config.in: source argument needs quotation marks
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

commit: https://git.buildroot.net/buildroot/commit/?id=033a9a64a6f9db0bc5f0313d1b24f8d385316874
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following error/warnings with kconfig from linux-6.9-rc5:

  package/dovecot/Config.in:36: syntax error
  package/dovecot/Config.in:36:warning: ignoring unsupported character '/'
  package/dovecot/Config.in:36:warning: ignoring unsupported character '/'
  package/dovecot/Config.in:36:warning: ignoring unsupported character '.'
  package/dovecot/Config.in:36: invalid statement

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ff70f9ee4c7ea08471ce6aca948f5ae83e4e011d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 20b08b62be..ad1b827612 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -32,7 +32,7 @@ config BR2_PACKAGE_DOVECOT_SQLITE
 	help
 	  Enable SQLite support.
 
-source package/dovecot-pigeonhole/Config.in
+source "package/dovecot-pigeonhole/Config.in"
 
 endif # BR2_PACKAGE_DOVECOT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
