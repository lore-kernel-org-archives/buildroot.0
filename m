Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AA8C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Dec 2023 21:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4E7B81926;
	Sun, 17 Dec 2023 21:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4E7B81926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dPtXFxNDmWEG; Sun, 17 Dec 2023 21:36:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0185681948;
	Sun, 17 Dec 2023 21:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0185681948
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 432C01BF37F
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 21:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C19440936
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 21:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C19440936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P6n055C7yz8w for <buildroot@lists.busybox.net>;
 Sun, 17 Dec 2023 21:36:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CDC440930
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 21:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CDC440930
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA02C87B2E; Sun, 17 Dec 2023 21:36:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 Dec 2023 22:35:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea59fd8827d93689dfc418a8d6413bbc4aad7890
X-Git-Newrev: 16fc7372512dd9bd199c394bfa54d74e852cc1b4
X-Patchwork-Hint: ignore
Message-Id: <20231217213617.EA02C87B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tree: update _SITE URL
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
Content-Type: multipart/mixed; boundary="===============4790456269529025350=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4790456269529025350==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=16fc7372512dd9bd199c394bfa54d74e852cc1b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current TREE_SITE URL doesn't work anymore.
Moreover the README states:
"
The main distribution site for tree is here:
http://oldmanprogrammer.net/source.php?dir=projects/tree

Backup GIT sites are:
https://gitlab.com/OldManProgrammer/unix-tree
https://github.com/Old-Man-Programmer/tree

Old site for as long as it lasts:
http://mama.indstate.edu/users/ice/tree/
ftp://mama.indstate.edu/linux/tree/
"

Use http://oldmanprogrammer.net/tar/tree/ for TREE_SITE

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tree/Config.in | 2 +-
 package/tree/tree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tree/Config.in b/package/tree/Config.in
index 234995f109..4821b58960 100644
--- a/package/tree/Config.in
+++ b/package/tree/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_TREE
 	  dircolors if the LS_COLORS environment variable is set and
 	  output is to tty.
 
-	  http://mama.indstate.edu/users/ice/tree/
+	  http://oldmanprogrammer.net/source.php?dir=projects/tree
 
 comment "tree needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/tree/tree.mk b/package/tree/tree.mk
index 83a427b74d..479a172a72 100644
--- a/package/tree/tree.mk
+++ b/package/tree/tree.mk
@@ -6,7 +6,7 @@
 
 TREE_VERSION = 2.1.1
 TREE_SOURCE = tree-$(TREE_VERSION).tgz
-TREE_SITE = http://mama.indstate.edu/users/ice/tree/src
+TREE_SITE = http://oldmanprogrammer.net/tar/tree
 TREE_LICENSE = GPL-2.0+
 TREE_LICENSE_FILES = LICENSE
 

--===============4790456269529025350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4790456269529025350==--
