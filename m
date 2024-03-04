Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6092BC48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 11:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3274C81E53;
	Mon,  4 Mar 2024 11:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z3izakgPxX9I; Mon,  4 Mar 2024 11:57:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54D08820EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54D08820EF;
	Mon,  4 Mar 2024 11:57:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55E571BF2F3
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42D19820EF
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1sfusIkCxUOq for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 11:57:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E67181E53
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E67181E53
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 11:57:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51AAF880A6; Mon,  4 Mar 2024 11:57:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Mar 2024 12:51:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c39259aa35ff1376910e402e3b7f2449e1e133d3
X-Git-Newrev: 7cc49fc692c4b8e5ba9ab30ed1ed67d48b89c445
X-Patchwork-Hint: ignore
Message-Id: <20240304115721.51AAF880A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oracle-mysql: drop package
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

commit: https://git.buildroot.net/buildroot/commit/?id=7cc49fc692c4b8e5ba9ab30ed1ed67d48b89c445
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package has not seen any updates for ~10 years, E.G.  latest version
bump was in commit 42c56751fc55 (mysql: bump to version 5.1.73) and the
version contains multiple known vulnerabilities, so drop the package.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |   12 -
 Config.in.legacy                                   |    7 +
 package/mysql/Config.in                            |   20 -
 package/oracle-mysql/0000-ac_cache_check.patch     |  156 -
 .../0001-configure-ps-cache-check.patch            |   39 -
 .../oracle-mysql/0002-use-new-readline-iface.patch |   21 -
 .../0003-ac_stack_direction-is-unset.patch         |   15 -
 .../0004-Fix-gen_lex_hash-execution.patch          |   32 -
 .../0005-bison_3_breaks_mysql_server_build.patch   | 3310 --------------------
 .../oracle-mysql/0006-no-force-static-build.patch  |   18 -
 .../0007-dont-install-in-mysql-directory.patch     |  182 --
 .../oracle-mysql/0008-fix-type-conversion.patch    |   22 -
 package/oracle-mysql/0009-gcc7.patch               |   45 -
 .../oracle-mysql/0010-fix-build-without-zlib.patch |   52 -
 ...acros-alloca.m4-Remove-obsolete-Cray-supp.patch |   51 -
 package/oracle-mysql/S97mysqld                     |   39 -
 package/oracle-mysql/mysqld.service                |   13 -
 package/oracle-mysql/oracle-mysql.hash             |    6 -
 package/oracle-mysql/oracle-mysql.mk               |  140 -
 19 files changed, 7 insertions(+), 4173 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
