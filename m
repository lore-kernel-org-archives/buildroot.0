Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF0FC6FA86
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 08:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5D5D4196E;
	Sat, 17 Sep 2022 08:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5D5D4196E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UTr_2jGIclSl; Sat, 17 Sep 2022 08:51:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9590941936;
	Sat, 17 Sep 2022 08:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9590941936
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 83ED11BF82F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E05041936
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E05041936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ceO0fS4xhyS for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 08:51:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5765141866
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 08:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5765141866
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 44CAA83FDA; Sat, 17 Sep 2022 08:51:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 10:17:53 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: bddf53b7ab05072db580fae99a3ce5673993d6ee
X-Git-Newrev: d53114a569e0b7c4e37f9770d58e5149b79e820c
X-Patchwork-Hint: ignore
Message-Id: <20220917085117.44CAA83FDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] support/dependencies:
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

commit: https://git.buildroot.net/buildroot/commit/?id=d53114a569e0b7c4e37f9770d58e5149b79e820c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
