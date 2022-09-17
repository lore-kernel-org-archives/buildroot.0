Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106ABECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 08:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A84E1419D2;
	Sat, 17 Sep 2022 08:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A84E1419D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vroRDTTMpJdR; Sat, 17 Sep 2022 08:51:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AB1D4196E;
	Sat, 17 Sep 2022 08:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AB1D4196E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F9E81BF82F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF50D401D8
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF50D401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AyfRSVD0a00C for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 08:51:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 279A040121
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 08:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 279A040121
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 17918840B5; Sat, 17 Sep 2022 08:51:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 10:17:47 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9e5f3cd861c3f2a924e42fa7b242d7dee5c0cf68
X-Git-Newrev: 7a4169c374d5878f7509177b6599c7f1bcf9ff29
X-Patchwork-Hint: ignore
Message-Id: <20220917085126.17918840B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] support/dependencies:
 check for find and xargs
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a4169c374d5878f7509177b6599c7f1bcf9ff29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit 7652817c93a02715e0d334d70118a0d8b6917ca6 updated the
documentation but forgot to update support/dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ba2659401feb5cc97cad501ab8b38268de578d3f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
