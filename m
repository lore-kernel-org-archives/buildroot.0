Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7609ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 12:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C46F6123B;
	Fri, 16 Sep 2022 12:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C46F6123B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AI9WreoInIqz; Fri, 16 Sep 2022 12:25:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72B7061220;
	Fri, 16 Sep 2022 12:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72B7061220
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8255D1BF2E5
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C11861028
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C11861028
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IeqU4az8zgVe for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 12:23:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76D0B61220
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 12:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76D0B61220
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6683383D2B; Fri, 16 Sep 2022 12:23:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 14:23:14 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: fcf2ef8c5ea5a21fe769d8074cccb109f7379662
X-Git-Newrev: 86e5503e8d0b53f8f9d5fd4114b2e6dd9495fc3c
X-Patchwork-Hint: ignore
Message-Id: <20220916122357.6683383D2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/snort: fix sparc
 build with BR2_OPTIMIZE_FAST
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

commit: https://git.buildroot.net/buildroot/commit/?id=86e5503e8d0b53f8f9d5fd4114b2e6dd9495fc3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix the following sparc build failure with BR2_OPTIMIZE_FAST raised
since bump to version 2.9.19 in commit
65ed981ce0135379b7faeb69519f4e3e666c0717:

cc1: error: argument to '-O' should be a non-negative integer, 'g', 's' or 'fast'

Fixes:
 - http://autobuild.buildroot.org/results/e1a330e1a899fcdf4900e9156d62c90813321e30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5ea5ac0c60bb91af0e50302253ac2a576d3cf2ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snort/0008-Fix-NO-OPTIMIZE.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/snort/0008-Fix-NO-OPTIMIZE.patch b/package/snort/0008-Fix-NO-OPTIMIZE.patch
new file mode 100644
index 0000000000..936973fdd6
--- /dev/null
+++ b/package/snort/0008-Fix-NO-OPTIMIZE.patch
@@ -0,0 +1,24 @@
+Fix NO_OPTIMIZE
+
+Fix the following build failure when NO_OPTIMIZE is enabled (e.g. on
+sparc) and -Ofast:
+
+cc1: error: argument to '-O' should be a non-negative integer, 'g', 's' or 'fast'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e1a330e1a899fcdf4900e9156d62c90813321e30
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Nura snort-2.9.19.orig/configure.in snort-2.9.19/configure.in
+--- snort-2.9.19.orig/configure.in	2022-08-09 20:21:00.236777320 +0200
++++ snort-2.9.19/configure.in	2022-08-09 20:29:02.260993315 +0200
+@@ -1694,7 +1694,7 @@
+ 
+ # Set to no optimization regardless of what user or autostuff set
+ if test "x$NO_OPTIMIZE" = "xyes"; then
+-    CFLAGS=`echo $CFLAGS | sed -e "s/-O./-O0/"`
++    CFLAGS=`echo $CFLAGS | sed -e "s/-O[0-9a-z]*/-O0/"`
+ 
+     # in case user override doesn't include -O
+     if echo $CFLAGS | grep -qve -O0 ; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
