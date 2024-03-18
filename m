Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1253EC54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 11:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFE99409B9;
	Mon, 18 Mar 2024 11:45:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wYLypWG3yyKT; Mon, 18 Mar 2024 11:45:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 737D5408B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 737D5408B8;
	Mon, 18 Mar 2024 11:45:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 182F21BF954
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 11:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0676560591
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 11:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DGSEJJr3Lafh for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 11:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA12D600B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA12D600B3
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 11:45:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6912082940; Mon, 18 Mar 2024 11:45:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 12:38:29 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 85dba7acde679e1820f3ca3f2f9cf1117383f8a2
X-Git-Newrev: 3c376e54341169770aafe875d849a0fd328d7e3a
X-Patchwork-Hint: ignore
Message-Id: <20240318114504.6912082940@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/poco: bump to
 version 1.13.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c376e54341169770aafe875d849a0fd328d7e3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This bump will fix the following build failure raised since bump of
expat to version 2.6.0 in commit
9dad5e7d7f7bc03e648621b9be6974e7ae39a467 thanks to
https://github.com/pocoproject/poco/commit/75f7042b70092e79c6b770b18d033a061c84e2c5:

src/ParserEngine.cpp: In member function 'void Poco::XML::ParserEngine::init()':
src/ParserEngine.cpp:510:17: error: 'XML_SetBillionLaughsAttackProtectionMaximumAmplification' was not declared in this scope; did you mean 'setBillionLaughsAttackProtectionMaximumAmplification'?
  510 |                 XML_SetBillionLaughsAttackProtectionMaximumAmplification(_parser, _maximumAmplificationFactor);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://github.com/pocoproject/poco/blob/poco-1.13.2-release/CHANGELOG

Fixes: 9dad5e7d7f7bc03e648621b9be6974e7ae39a467
 - http://autobuild.buildroot.org/results/7fad881f85d3b89abdee35388088965f05ead277

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 433c4fd38b15efcf74b410e5068e2e51eeba6e46)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poco/poco.hash | 2 +-
 package/poco/poco.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 9a7981171a..0a1e900b3f 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  71ef96c35fced367d6da74da294510ad2c912563f12cd716ab02b6ed10a733ef  poco-1.12.4.tar.gz
+sha256  c01221870aa9bccedf1de39890279699207848fe61a0cfb6aeec7c5942c4627f  poco-1.13.2.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 2d0233a8ce..f8c2a658de 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.12.4
+POCO_VERSION = 1.13.2
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
