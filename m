Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48FFCE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95E0941742;
	Thu, 19 Sep 2024 09:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id As9srTvqmQdK; Thu, 19 Sep 2024 09:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6886B4172F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6886B4172F;
	Thu, 19 Sep 2024 09:16:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A43A1BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D058084396
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KQqg8nFWL_j for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBE5584948
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBE5584948
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D62CE83C4D; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:28 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: b0bfaa8d5ae53ac24896d3ce9bd2d6badb813190
X-Git-Newrev: 74c4478ea9ec07656af7204bbe2f2f1538e60220
X-Patchwork-Hint: ignore
Message-Id: <20240919091452.D62CE83C4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/fcgiwrap: fix
 explicitly typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=74c4478ea9ec07656af7204bbe2f2f1538e60220
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 05b18efb7ba4b3d17ed4b4f46525768477630016)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fcgiwrap/0001-use-LIBS-from-configure.patch | 2 +-
 package/fcgiwrap/fcgiwrap.mk                        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fcgiwrap/0001-use-LIBS-from-configure.patch b/package/fcgiwrap/0001-use-LIBS-from-configure.patch
index 12563c4275..3f8606945f 100644
--- a/package/fcgiwrap/0001-use-LIBS-from-configure.patch
+++ b/package/fcgiwrap/0001-use-LIBS-from-configure.patch
@@ -1,7 +1,7 @@
 Makefile.in: Use LIBS from configure rather than specifying -lfcgi manually.
 
 libfcgi needs libm and fcgiwrap does not use libtool or pkgconf to
-detect libfcgi, so we need to add -lm explicitely when using static
+detect libfcgi, so we need to add -lm explicitly when using static
 libs.  Buildroot does this by providing LIBS=-lm to configure when
 needed.  However fcgiwrap does not use Automake and its Makefile.in
 ignores LIBS from configure.  Fix it with this patch.
diff --git a/package/fcgiwrap/fcgiwrap.mk b/package/fcgiwrap/fcgiwrap.mk
index 62c4c1369d..4845f013fa 100644
--- a/package/fcgiwrap/fcgiwrap.mk
+++ b/package/fcgiwrap/fcgiwrap.mk
@@ -20,7 +20,7 @@ FCGIWRAP_CONF_OPTS += --without-systemd
 endif
 
 # libfcgi needs libm and fcgiwrap does not use libtool or pkgconf to
-# detect libfcgi, so we need to add -lm explicitely when using static
+# detect libfcgi, so we need to add -lm explicitly when using static
 # libs.
 ifeq ($(BR2_STATIC_LIBS),y)
 FCGIWRAP_CONF_OPTS += LIBS=-lm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
