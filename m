Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B99C54E60
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 11:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E86881E53;
	Tue, 19 Mar 2024 11:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gR8ZvmQYGZYu; Tue, 19 Mar 2024 11:22:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25BDE81E42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25BDE81E42;
	Tue, 19 Mar 2024 11:22:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 120231BF95F
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 11:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1F0640308
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 11:22:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rmSE-YkSo4C4 for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 11:22:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20EF2406AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20EF2406AB
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 11:21:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FCFF8345D; Tue, 19 Mar 2024 11:21:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 12:18:13 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: e68e6a336e009bcb97c20b7a18ee30d809e47370
X-Git-Newrev: a0353ef806f34f5c47d89ed470c84902398ef1fd
X-Patchwork-Hint: ignore
Message-Id: <20240319112159.6FCFF8345D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/powertop: fix
 gettext build
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0353ef806f34f5c47d89ed470c84902398ef1fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fix gettext build raised since bump to version 2.15 in commit
d65b960859046be486ced6c490d3671bd1392661:

*** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.18 but the autoconf macros are from gettext version 0.20

Fixes: d65b960859046be486ced6c490d3671bd1392661
 - http://autobuild.buildroot.org/results/bb80a7842d18651e5069f3a91f06a9c23218d260

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6849d17cf4d65f3c8dcc986a7a68ce51619f8508)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/powertop/powertop.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index 0481caee07..a7a57939e0 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -20,6 +20,7 @@ POWERTOP_DEPENDENCIES = \
 POWERTOP_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 # 0001-add-disable-stack-protector-option.patch
 POWERTOP_AUTORECONF = YES
+POWERTOP_AUTOPOINT = YES
 POWERTOP_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
 POWERTOP_CONF_OPTS = --disable-stack-protector
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
