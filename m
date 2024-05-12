Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AF9C25B5F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BB034010C;
	Sun, 12 May 2024 07:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2s9xOiiN9Kf9; Sun, 12 May 2024 07:53:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43E684011A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43E684011A;
	Sun, 12 May 2024 07:53:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23D981BF473
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E74B83FE4
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRB82KGQjqPG for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:53:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A18083FAF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A18083FAF
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:53:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DA3D87051; Sun, 12 May 2024 07:53:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 09:53:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 880066bad68bf881cc0636cd51c177625d4fa837
X-Git-Newrev: ebe64a69110928c69d1573281f99b8a3204e9c35
X-Patchwork-Hint: ignore
Message-Id: <20240512075318.2DA3D87051@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tbtools: add hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebe64a69110928c69d1573281f99b8a3204e9c35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8d5b3aac435880333833d4a3909b1818fe8af045 forgot to add a hash
file. Moreover, also update TBTOOLS_VERSION to match what is returned by
https://release-monitoring.org/project/372327

Fixes: 8d5b3aac435880333833d4a3909b1818fe8af045

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tbtools/tbtools.hash | 3 +++
 package/tbtools/tbtools.mk   | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
new file mode 100644
index 0000000000..ebd838ebe1
--- /dev/null
+++ b/package/tbtools/tbtools.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  e5ddbcb3dcf6315a1fe6fe2d4846b5208e75f24e626d43a0ea68358e8b15dba7  tbtools-0.3.2-cargo2.tar.gz
+sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
index 94340616db..36bfcd7f49 100644
--- a/package/tbtools/tbtools.mk
+++ b/package/tbtools/tbtools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TBTOOLS_VERSION = v0.3.2
-TBTOOLS_SITE = $(call github,intel,tbtools,$(TBTOOLS_VERSION))
+TBTOOLS_VERSION = 0.3.2
+TBTOOLS_SITE = $(call github,intel,tbtools,v$(TBTOOLS_VERSION))
 TBTOOLS_LICENSE = MIT
 TBTOOLS_LICENSE_FILES = LICENSE
 TBTOOLS_DEPENDENCIES = udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
