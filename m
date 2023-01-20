Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5720BC05027
	for <buildroot@archiver.kernel.org>; Fri, 20 Jan 2023 07:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAF1C41165;
	Fri, 20 Jan 2023 07:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAF1C41165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KHn_lzHdNLNS; Fri, 20 Jan 2023 07:51:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CE1C405AB;
	Fri, 20 Jan 2023 07:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CE1C405AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9554B1BF2A7
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 07:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E5B06120A
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 07:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E5B06120A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FGJnLPoeFiN1 for <buildroot@lists.busybox.net>;
 Fri, 20 Jan 2023 07:51:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DC776118B
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 07:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DC776118B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 883DB87D65; Fri, 20 Jan 2023 07:51:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Jan 2023 08:50:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0dfd717f3ff888b4ab6d8c40bb6a01a939370cb
X-Git-Newrev: 9d18ef6a0cbe81c01118f12c72eb99c09fce0994
X-Patchwork-Hint: ignore
Message-Id: <20230120075151.883DB87D65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/git: security bump to version
 2.39.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d18ef6a0cbe81c01118f12c72eb99c09fce0994
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- fixes CVE-2022-41903 and CVE-2022-23521

For details see [1].

[1] https://lore.kernel.org/git/xmqq7cxl9h0i.fsf@gitster.g/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
[Peter: Mark as security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 57a77b2810..75398896e5 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  ba199b13fb5a99ca3dec917b0bd736bc0eb5a9df87737d435eddfdf10d69265b  git-2.39.0.tar.xz
+sha256  40a38a0847b30c371b35873b3afcf123885dd41ea3ecbbf510efa97f3ce5c161  git-2.39.1.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 9918d4c1ef..1d728e1964 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.39.0
+GIT_VERSION = 2.39.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
