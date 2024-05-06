Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD528C25B5C
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 19:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85EA74148D;
	Mon,  6 May 2024 19:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4i2fTUqm1GqB; Mon,  6 May 2024 19:02:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA3F341464
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA3F341464;
	Mon,  6 May 2024 19:02:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 361461BF909
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 621FB81E84
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9upZwDwgdqSw for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 19:02:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95D9C81E8B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95D9C81E8B
 for <buildroot@buildroot.org>; Mon,  6 May 2024 19:02:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CA768679F; Mon,  6 May 2024 19:02:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 20:59:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4abda655e6148cc3607101cb24933706fb2b6801
X-Git-Newrev: ff70f9ee4c7ea08471ce6aca948f5ae83e4e011d
X-Patchwork-Hint: ignore
Message-Id: <20240506190223.7CA768679F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dovecot/Config.in: source argument
 needs quotation marks
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff70f9ee4c7ea08471ce6aca948f5ae83e4e011d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following error/warnings with kconfig from linux-6.9-rc5:

  package/dovecot/Config.in:36: syntax error
  package/dovecot/Config.in:36:warning: ignoring unsupported character '/'
  package/dovecot/Config.in:36:warning: ignoring unsupported character '/'
  package/dovecot/Config.in:36:warning: ignoring unsupported character '.'
  package/dovecot/Config.in:36: invalid statement

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dovecot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index c94421526f..034dcc175f 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -33,7 +33,7 @@ config BR2_PACKAGE_DOVECOT_SQLITE
 	help
 	  Enable SQLite support.
 
-source package/dovecot-pigeonhole/Config.in
+source "package/dovecot-pigeonhole/Config.in"
 
 endif # BR2_PACKAGE_DOVECOT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
