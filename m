Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50433C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:45:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B9AD61040
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B9AD61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF5A183AE5;
	Tue,  3 Aug 2021 21:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8FcZEdmOXghH; Tue,  3 Aug 2021 21:45:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10ACB83AFC;
	Tue,  3 Aug 2021 21:45:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 987AB1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6619B83ABB
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a0n3G2SwuoXE for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B625683AA7
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0C32787B09; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 30 Jun 2021 23:07:40 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2eaa6d0f36291f49ab56a734a4851a6ffe8e8803
X-Git-Newrev: 95c09d121987ef3503beacc088d2b21f8566f1f4
X-Patchwork-Hint: ignore
Message-Id: <20210803210958.0C32787B09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libselinux: fix build
 with gcc 4.8
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=95c09d121987ef3503beacc088d2b21f8566f1f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix build failure with gcc 4.8 which is raised since bump to version 3.2
in commit b7ff47516ea01436c53b4d1e2b7a5b595ef3ed80

Fixes:
 - http://autobuild.buildroot.org/results/37eb0952a763256fbf6ef3c668f6c95fbdf2dd35

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-utils-getseuser.c-fix-build-with-gcc-4.8.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/libselinux/0003-libselinux-utils-getseuser.c-fix-build-with-gcc-4.8.patch b/package/libselinux/0003-libselinux-utils-getseuser.c-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..645e84b236
--- /dev/null
+++ b/package/libselinux/0003-libselinux-utils-getseuser.c-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,47 @@
+From 5c4ddfc88f0a7f10a5e9edddbdbe8e8ef1f9945e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 10 Jun 2021 07:38:02 +0200
+Subject: [PATCH] libselinux/utils/getseuser.c: fix build with gcc 4.8
+
+Fix the following build failure with gcc 4.8 which is raised since
+version 3.2 and
+https://github.com/SELinuxProject/selinux/commit/156dd0de5cad31e7d437c64e11a8aef027f0a691
+
+getseuser.c:53:2: error: 'for' loop initial declarations are only allowed in C99 mode
+  for (int i = 0; i < n; i++)
+  ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/37eb0952a763256fbf6ef3c668f6c95fbdf2dd35
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/SELinuxProject/selinux/pull/289]
+---
+ libselinux/utils/getseuser.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/utils/getseuser.c b/utils/getseuser.c
+index ce1b7b27..34f2e887 100644
+--- a/utils/getseuser.c
++++ b/utils/getseuser.c
+@@ -9,7 +9,7 @@ int main(int argc, char **argv)
+ {
+ 	char *seuser = NULL, *level = NULL;
+ 	char **contextlist;
+-	int rc, n;
++	int rc, n, i;
+ 
+ 	if (argc != 3) {
+ 		fprintf(stderr, "usage:  %s linuxuser fromcon\n", argv[0]);
+@@ -50,7 +50,7 @@ int main(int argc, char **argv)
+ 	if (n == 0)
+ 		printf("no valid context found\n");
+ 
+-	for (int i = 0; i < n; i++)
++	for (i = 0; i < n; i++)
+ 		printf("Context %d\t%s\n", i, contextlist[i]);
+ 
+ 	freeconary(contextlist);
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
