Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6CCC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 22:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC8EA83E1D;
	Wed, 16 Feb 2022 22:19:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R4TpVfyo76ei; Wed, 16 Feb 2022 22:19:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D47C83E1B;
	Wed, 16 Feb 2022 22:19:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DDC81BF59C
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 22:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A69960FC0
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 22:18:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0NxdX8BIAuto for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 22:18:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B9B660B4B
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 22:18:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BA78C83785; Wed, 16 Feb 2022 22:11:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 23:17:53 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 1c5f3083c71764bb1f6997deb5e98ebf298c8e2d
X-Git-Newrev: c060023e10786641e7d9d9994ddc65ac88e756a2
X-Patchwork-Hint: ignore
Message-Id: <20220216221116.BA78C83785@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x]
 package/python-sqliteschema: drop python-six dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=c060023e10786641e7d9d9994ddc65ac88e756a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

python-six is not a dependency since version 1.0.0 and
https://github.com/thombashi/sqliteschema/commit/3aae6a0bb6d4b11ef2c83cb23a796a320ea422da
which dropped python 2 support

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 66192c66b9421b95f6cc45a46264c0193a873c58)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-sqliteschema/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-sqliteschema/Config.in b/package/python-sqliteschema/Config.in
index 8383647129..b8fed33c49 100644
--- a/package/python-sqliteschema/Config.in
+++ b/package/python-sqliteschema/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_PYTHON_SQLITESCHEMA
 	bool "python-sqliteschema"
-	depends on BR2_PACKAGE_PYTHON3 # python-mbstrdecoder
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
