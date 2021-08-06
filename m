Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D60C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:06:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50BE861186
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50BE861186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18E0960B32;
	Fri,  6 Aug 2021 21:06:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n8jyP-XWEbIt; Fri,  6 Aug 2021 21:06:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6915660B08;
	Fri,  6 Aug 2021 21:06:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E4501BF3AF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75514401CF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id APve1JJ00Me0 for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 21:03:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77C294046F
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 21:03:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B80228C701; Fri,  6 Aug 2021 21:02:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Aug 2021 22:27:35 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: ecba2d0b6c26f20f34ef648504497bca401200fc
X-Git-Newrev: 7458efcaa144c15315e8ac62ab8b6261863a3763
X-Patchwork-Hint: ignore
Message-Id: <20210806210256.B80228C701@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/nmap: fix ncat on
 Unix socket
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

commit: https://git.buildroot.net/buildroot/commit/?id=7458efcaa144c15315e8ac62ab8b6261863a3763
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Starting with nmap 7.91, ncat segfaults on an attempt to use it for a
Unix-domain socket (`ncat -U path`). The fix has been committed to nmap
in r38121.

Signed-off-by: Alexey Neyman <stilor@att.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2f99483a59edc4e0ad9482551b3af2d8f4be1793)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nmap/0002-ncat-unix-socket.patch | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/nmap/0002-ncat-unix-socket.patch b/package/nmap/0002-ncat-unix-socket.patch
new file mode 100644
index 0000000000..b6484ebeea
--- /dev/null
+++ b/package/nmap/0002-ncat-unix-socket.patch
@@ -0,0 +1,30 @@
+ChangeLog:
+
+o [Ncat][GH#2154] Ncat no longer crashes when used with Unix domain sockets.
+
+Backported from: r38121
+
+Signed-off-by: Alexey Neyman <stilor@att.net>
+
+Index: ncat/ncat_main.c
+===================================================================
+--- a/ncat/ncat_main.c	(revision 38120)
++++ b/ncat/ncat_main.c	(revision 38121)
+@@ -846,7 +846,7 @@
+             targetaddrs->addr.un.sun_family = AF_UNIX;
+             strncpy(targetaddrs->addr.un.sun_path, argv[optind], sizeof(targetaddrs->addr.un.sun_path));
+             targetaddrs->addrlen = SUN_LEN(&targetaddrs->addr.un);
+-            o.target = argv[optind];
++            o.sslservername = o.target = argv[optind];
+             optind++;
+         } else
+ #endif
+@@ -865,7 +865,7 @@
+                 targetaddrs->addr.vm.svm_cid = long_cid;
+ 
+                 targetaddrs->addrlen = sizeof(targetaddrs->addr.vm);
+-                o.target = argv[optind];
++                o.sslservername = o.target = argv[optind];
+                 optind++;
+             }
+         } else
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
