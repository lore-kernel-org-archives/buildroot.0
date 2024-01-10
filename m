Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B182DC47258
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5512B436EF;
	Wed, 10 Jan 2024 20:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5512B436EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pCFLiHWdMkUu; Wed, 10 Jan 2024 20:19:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F3D2437D3;
	Wed, 10 Jan 2024 20:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F3D2437D3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20DAA1BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0153436E5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0153436E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOHUESEmfHha for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:16:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24DBB43731
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24DBB43731
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2261885CC4; Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:10:08 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: caafa2d5d7392895bb2f6e639a324bf2d8eee262
X-Git-Newrev: b2a8693a8dc8821a094615a290d141a605f9384a
X-Patchwork-Hint: ignore
Message-Id: <20240110201652.2261885CC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/tinyssh: security
 bump to version 20240101
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2a8693a8dc8821a094615a290d141a605f9384a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

- License changed from public domain to CC0:
  https://github.com/janmojzis/tinyssh/commit/39dfb96613660d67ced44cc3995a08797e6c999a
- Mitigates CVE-2023-48795:
  https://github.com/advisories/GHSA-45x7-px36-x8w8

https://github.com/janmojzis/tinyssh/releases/tag/20230101
https://github.com/janmojzis/tinyssh/releases/tag/20240101

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f83443e2fc4e44a8deb38d35a27975bb34ca380e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinyssh/tinyssh.hash | 4 ++--
 package/tinyssh/tinyssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tinyssh/tinyssh.hash b/package/tinyssh/tinyssh.hash
index 462ffb9002..bdb1504234 100644
--- a/package/tinyssh/tinyssh.hash
+++ b/package/tinyssh/tinyssh.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  234656fc8d369608eb5d0f3a26280e0e38e2e6b134cfc610b6e24bce176acd4f  tinyssh-20220801.tar.gz
-sha256  b5dc19477e29f4111e1c16cd89ec0782f5a07b1a30e3bdb7c155425b81b12c46  LICENCE
+sha256  d2cd49d0e5e8bdb808d86f07f946a0cfbf2dc9a449a4b8243a82be267d852b62  tinyssh-20240101.tar.gz
+sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENCE
diff --git a/package/tinyssh/tinyssh.mk b/package/tinyssh/tinyssh.mk
index 1472f7ead1..80b6ccb850 100644
--- a/package/tinyssh/tinyssh.mk
+++ b/package/tinyssh/tinyssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TINYSSH_VERSION = 20220801
+TINYSSH_VERSION = 20240101
 TINYSSH_SITE = $(call github,janmojzis,tinyssh,$(TINYSSH_VERSION))
-TINYSSH_LICENSE = Public Domain, CC0-1.0
+TINYSSH_LICENSE = CC0-1.0
 TINYSSH_LICENSE_FILES = LICENCE
 
 define TINYSSH_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
