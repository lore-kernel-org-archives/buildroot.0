Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F79EC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 13:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8EF181A5F;
	Sun, 21 Aug 2022 13:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8EF181A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82ScwaUXQUN9; Sun, 21 Aug 2022 13:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB42081A4E;
	Sun, 21 Aug 2022 13:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB42081A4E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4FA1BF30D
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 13:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16B44409F9
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 13:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16B44409F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QrZM65hB8cg for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 13:50:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25A71409F5
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 13:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25A71409F5
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 105A787A2D; Sun, 21 Aug 2022 13:35:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Aug 2022 15:50:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d05fa7b3bdde2b2c34747778a4d15e8c16575cfe
X-Git-Newrev: ba2659401feb5cc97cad501ab8b38268de578d3f
X-Patchwork-Hint: ignore
Message-Id: <20220821133553.105A787A2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies: check for find and
 xargs
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba2659401feb5cc97cad501ab8b38268de578d3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7652817c93a02715e0d334d70118a0d8b6917ca6 updated the
documentation but forgot to update support/dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/dependencies/dependencies.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index d69d97afaa..2b678ae8c4 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -163,7 +163,7 @@ fi
 
 # Check that a few mandatory programs are installed
 missing_progs="no"
-for prog in perl tar wget cpio unzip rsync bc cmp ${DL_TOOLS} ; do
+for prog in perl tar wget cpio unzip rsync bc cmp find xargs ${DL_TOOLS} ; do
 	if ! which $prog > /dev/null ; then
 		echo "You must install '$prog' on your build machine";
 		missing_progs="yes"
@@ -177,6 +177,10 @@ for prog in perl tar wget cpio unzip rsync bc cmp ${DL_TOOLS} ; do
 			echo "  bzcat is usually part of the bzip2 package in your distribution"
 		elif test $prog = "cmp" ; then
 			echo "  cmp is usually part of the diffutils package in your distribution"
+		elif test $prog = "find" ; then
+			echo "  find is usually part of the findutils package in your distribution"
+		elif test $prog = "xargs" ; then
+			echo "  xargs is usually part of the findutils package in your distribution"
 		fi
 	fi
 done
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
