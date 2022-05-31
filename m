Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E9EC43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08D106101E;
	Tue,  7 Jun 2022 19:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZUQ_pSqJ1JOJ; Tue,  7 Jun 2022 19:28:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 035B161031;
	Tue,  7 Jun 2022 19:28:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05AD91BF475
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B084408CB
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3PXBkZRvFpP for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E6FD405E7
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 31A6586E21; Tue,  7 Jun 2022 19:04:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 10:26:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4adef845d150ae09300b6722bfacfbd17fa2e47e
X-Git-Newrev: bfab22cb1727e8b3fbb07339feb18e322584bf3d
X-Patchwork-Hint: ignore
Message-Id: <20220607190457.31A6586E21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-p1-acme: bump version to
 1.0.16
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bfab22cb1727e8b3fbb07339feb18e322584bf3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

and remove the unnecessary patch.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...g.script-remove-extra-dependency-to-base6.patch | 26 ----------------------
 package/erlang-p1-acme/erlang-p1-acme.hash         |  2 +-
 package/erlang-p1-acme/erlang-p1-acme.mk           |  2 +-
 3 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/package/erlang-p1-acme/0001-rebar.config.script-remove-extra-dependency-to-base6.patch b/package/erlang-p1-acme/0001-rebar.config.script-remove-extra-dependency-to-base6.patch
deleted file mode 100644
index a27730e23c..0000000000
--- a/package/erlang-p1-acme/0001-rebar.config.script-remove-extra-dependency-to-base6.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From a2422fdf4097d1f5f8c8f88bbe08b9a0f3c35fe6 Mon Sep 17 00:00:00 2001
-From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Wed, 25 Nov 2020 22:38:22 +0100
-Subject: [PATCH] rebar.config.script: remove extra dependency to base64url
-
-Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
----
- rebar.config.script | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rebar.config.script b/rebar.config.script
-index a63895e..41b2970 100644
---- a/rebar.config.script
-+++ b/rebar.config.script
-@@ -62,7 +62,7 @@ Cfg2 = case IsRebar3 of
-                [{plugin_dir, filename:join([filename:dirname(SCRIPT),"plugins"])},
-                 {plugins, [override_deps_versions]}] ++
-                 ModCfg(CONFIG, [deps], fun(V) ->
--                   V ++ [{base64url, ".*", {git, "git://github.com/dvv/base64url.git", {tag, "v1.0"}}}]
-+                   V
-                 end, [])
-        end,
- 
--- 
-2.29.2
-
diff --git a/package/erlang-p1-acme/erlang-p1-acme.hash b/package/erlang-p1-acme/erlang-p1-acme.hash
index af13e88b1a..7cecb6dfc0 100644
--- a/package/erlang-p1-acme/erlang-p1-acme.hash
+++ b/package/erlang-p1-acme/erlang-p1-acme.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e17ba49f45b72200470bc2f176b315bec1028d07a4817859052f98c0a7259632  erlang-p1-acme-1.0.9.tar.gz
+sha256  58d4b7e97e677bd5a8aa3c1e52514a37cfa0985cad8b5f45cd05889843c4fdd9  erlang-p1-acme-1.0.16.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-acme/erlang-p1-acme.mk b/package/erlang-p1-acme/erlang-p1-acme.mk
index 21c155e206..c9cd1c4f33 100644
--- a/package/erlang-p1-acme/erlang-p1-acme.mk
+++ b/package/erlang-p1-acme/erlang-p1-acme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ACME_VERSION = 1.0.9
+ERLANG_P1_ACME_VERSION = 1.0.16
 ERLANG_P1_ACME_SITE = $(call github,processone,p1_acme,$(ERLANG_P1_ACME_VERSION))
 ERLANG_P1_ACME_LICENSE = Apache-2.0
 ERLANG_P1_ACME_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
