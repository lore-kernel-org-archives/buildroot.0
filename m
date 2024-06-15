Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E24BC27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 19:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45B3E40A45;
	Sat, 15 Jun 2024 19:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3MYFSPOx-RK; Sat, 15 Jun 2024 19:04:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52B2640A15
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52B2640A15;
	Sat, 15 Jun 2024 19:04:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 192281BF2FC
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8A0D4044D
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRMAjapP36L1 for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 19:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D55C405FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D55C405FD
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 19:04:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 044D687F0B; Sat, 15 Jun 2024 19:04:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 20:39:20 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 9a780d2acaf54e7798c74448d50f4d9e7331a96e
X-Git-Newrev: f3a29033a7202ddf90c1cc70cc90f00c3ac63685
X-Patchwork-Hint: ignore
Message-Id: <20240615190416.044D687F0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/composer: fix
 improperly scoped variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3a29033a7202ddf90c1cc70cc90f00c3ac63685
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes: ef57da23b9950a8820c64c268672265f233cfb00

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 139e47861724cfdd82f4e77396e34c43f7f4825f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/composer/composer.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/composer/composer.mk b/package/composer/composer.mk
index 9bfabc28af..5ade9ccccf 100644
--- a/package/composer/composer.mk
+++ b/package/composer/composer.mk
@@ -9,8 +9,8 @@ COMPOSER_SOURCE = composer-$(COMPOSER_VERSION).phar
 # Here, we pass a dummy URL parameter in order to control the name the file
 # will have once downloaded.
 # Otherwise, the names will clash ifever we update the version.
-BASE_SITE = https://getcomposer.org/download/$(COMPOSER_VERSION)/composer.phar
-COMPOSER_SITE = $(BASE_SITE)?n=f/$(COMPOSER_SOURCE)
+COMPOSER_BASE_SITE = https://getcomposer.org/download/$(COMPOSER_VERSION)/composer.phar
+COMPOSER_SITE = $(COMPOSER_BASE_SITE)?n=f/$(COMPOSER_SOURCE)
 COMPOSER_LICENSE = MIT
 COMPOSER_LICENSE_FILES = LICENSE
 COMPOSER_CPE_ID_VENDOR = getcomposer
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
