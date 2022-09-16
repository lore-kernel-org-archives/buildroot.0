Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1277CC54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 12:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A822F41644;
	Fri, 16 Sep 2022 12:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A822F41644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5OLDry9xGhVv; Fri, 16 Sep 2022 12:24:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C408641635;
	Fri, 16 Sep 2022 12:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C408641635
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D310E1C2745
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF1A983443
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF1A983443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N6v1KTisI3-o for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 12:23:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D473783417
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 12:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D473783417
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C282883D12; Fri, 16 Sep 2022 12:23:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 14:23:23 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3fa2a869740e365b1800146106f1e6f3d5e902a9
X-Git-Newrev: 7164554c1fd671b48ea2f96fe5516e49aef412fd
X-Patchwork-Hint: ignore
Message-Id: <20220916122350.C282883D12@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/snort: fix sparc
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

commit: https://git.buildroot.net/buildroot/commit/?id=7164554c1fd671b48ea2f96fe5516e49aef412fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
