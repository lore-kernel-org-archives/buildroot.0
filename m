Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5ADC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 18:53:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B92060EFE
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 18:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B92060EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4899083D5B;
	Thu, 21 Oct 2021 18:53:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZExFqVRVeIkU; Thu, 21 Oct 2021 18:53:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90D6F83D51;
	Thu, 21 Oct 2021 18:53:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21A811BF8B4
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 18:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E06D408C4
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 18:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oaNCWI_ny9xu for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 18:53:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5833D408C0
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 18:53:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2F7BF882AE; Thu, 21 Oct 2021 18:50:05 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 20:51:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d904c4d22d97b3d263cfbfde9da8fab5717032ff
X-Git-Newrev: 9450b53c8e06f1b5a75840b82c0f4663a5d75c45
X-Patchwork-Hint: ignore
Message-Id: <20211021185005.2F7BF882AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajit: back to mainline and bump
 to 05f1984e
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

commit: https://git.buildroot.net/buildroot/commit/?id=9450b53c8e06f1b5a75840b82c0f4663a5d75c45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because upstream was inactive, we switched to the moonjit fork in commit
2ca0accc. Now, the moonjit fork is abandonned and Mike Pall resumed
their activity on LuaJIT. Therefore, we can move back to mainline.

There is no new upstream release yet, so take a commit from git. The
official site https://luajit.org/git/luajit.git doesn't offer tarball
downloads, so use the github mirror instead.

The moonjit part is no longer in the COPYRIGHT file (obviously). Also,
compared to the 2.0.5 release, the URLs in the file have been changes to
https. Therefore, the hash is updated.

Also, switch the hash file to two spaces.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/luajit/Config.in   | 2 +-
 package/luajit/luajit.hash | 4 ++--
 package/luajit/luajit.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index eb3eb01998..e4e1249240 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -27,7 +27,7 @@ config BR2_PACKAGE_LUAJIT
 	  ABI-compatible to the standard Lua interpreter and can be
 	  deployed as a drop-in replacement.
 
-	  https://github.com/moonjit/moonjit
+	  https://luajit.org/luajit.html
 
 if BR2_PACKAGE_LUAJIT
 
diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 532ec0b294..1497ee9df4 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 c3de8e29aa617fc594c043f57636ab9ad71af2b4a3a513932b05f5cdaa4320b2  luajit-2.1.2.tar.gz
+sha256  b1b19f92451a661ba1167ee0b259299616cb3a1cdaf5ab05d7ccffaffeb4a0fb  luajit-05f1984e1a862e4b3d3c3b370c773492e2edf84a.tar.gz
 
 # Locally calculated
-sha256 aa64a7706ded773011b933f4230d7b35ba662598197f82ac2c7bca62abdaa4d7  COPYRIGHT
+sha256  43fc251179d900f9948e51dd3cc93733d1219f2db060faaa0c8100ad054f54d8  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index defa21dd3f..fbbd8ebc70 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 2.1.2
-LUAJIT_SITE = $(call github,moonjit,moonjit,$(LUAJIT_VERSION))
+LUAJIT_VERSION = 05f1984e1a862e4b3d3c3b370c773492e2edf84a
+LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
