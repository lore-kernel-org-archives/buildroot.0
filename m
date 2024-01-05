Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4491DC47079
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE6174376B;
	Fri,  5 Jan 2024 13:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE6174376B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6_NPtJRwu74; Fri,  5 Jan 2024 13:05:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF30D4376E;
	Fri,  5 Jan 2024 13:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF30D4376E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 906A61BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7712461499
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7712461499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ehjiu3lKz5q5 for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:03:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FC58614FD
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FC58614FD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F6D984559; Fri,  5 Jan 2024 13:03:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 13:20:51 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: e37071ceafe5b6f551fdbac83643ffb3d8972603
X-Git-Newrev: df95958b0609948f51e1cac856ff6deb6fc08e1e
X-Patchwork-Hint: ignore
Message-Id: <20240105130336.8F6D984559@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/tree: update
 _SITE URL
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
Content-Type: multipart/mixed; boundary="===============9089635622654778718=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9089635622654778718==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=df95958b0609948f51e1cac856ff6deb6fc08e1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
(cherry picked from commit 16fc7372512dd9bd199c394bfa54d74e852cc1b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 

--===============9089635622654778718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9089635622654778718==--
