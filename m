Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF506C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 615114088C;
	Sat,  5 Feb 2022 22:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6ThltojAmgH; Sat,  5 Feb 2022 22:55:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A4E140889;
	Sat,  5 Feb 2022 22:55:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BCCF1BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 284B58188B
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KadGZDH83Kp5 for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:55:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC0D9817FD
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:55:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id ADA9E82AA2; Sat,  5 Feb 2022 22:47:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 23:34:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf7c819f1ea0dd699d886dba1b7db177acc90b1a
X-Git-Newrev: 66192c66b9421b95f6cc45a46264c0193a873c58
X-Patchwork-Hint: ignore
Message-Id: <20220205224746.ADA9E82AA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqliteschema: drop
 python-six dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=66192c66b9421b95f6cc45a46264c0193a873c58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-six is not a dependency since version 1.0.0 and
https://github.com/thombashi/sqliteschema/commit/3aae6a0bb6d4b11ef2c83cb23a796a320ea422da
which dropped python 2 support

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
