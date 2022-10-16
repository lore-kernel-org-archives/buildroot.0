Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655AAC433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 15:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12F3F8266C;
	Sun, 16 Oct 2022 15:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12F3F8266C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id otjAchxH6rl5; Sun, 16 Oct 2022 15:07:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B54582446;
	Sun, 16 Oct 2022 15:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B54582446
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11BCD1BF2FA
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B362940372
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B362940372
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NeZL94kicjV7 for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 15:04:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 514D240442
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 15:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 514D240442
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 465FF86709; Sun, 16 Oct 2022 15:04:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 17:02:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edbdad93979ce8521653b4031235fd0fa9d438c9
X-Git-Newrev: e7c5529e9c080e4f860ef3276aa9ed9e01b3fa42
X-Patchwork-Hint: ignore
Message-Id: <20221016150425.465FF86709@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdnet: needs host-pkgconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7c5529e9c080e4f860ef3276aa9ed9e01b3fa42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-pkgconf is needed since bump to version 1.16.1 in commit
c8ed72c15d39cc6c676485bff8955ac5f4258138 and
https://github.com/ofalk/libdnet/commit/3a651c615e1201b5fe9413f8dc5b1671d5e5049a:

checking for Check... ./configure: line 14123: syntax error near unexpected token `CHECK,'
./configure: line 14123: `   PKG_CHECK_MODULES(CHECK, check)'

Fixes:
 - http://autobuild.buildroot.org/results/e1ff5ca46e83db2c722f782387dbb7402b8d459e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdnet/libdnet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 1e75dae323..dc56b892b4 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -14,6 +14,7 @@ LIBDNET_CONF_OPTS = \
 	--with-gnu-ld \
 	--with-check=no
 LIBDNET_CONFIG_SCRIPTS = dnet-config
+LIBDNET_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBDNET_PYTHON),y)
 LIBDNET_DEPENDENCIES += host-python-cython python3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
