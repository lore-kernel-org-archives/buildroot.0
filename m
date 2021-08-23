Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890E1C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 21:13:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1454F61265
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 21:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1454F61265
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DADCF60664;
	Mon, 23 Aug 2021 21:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KaAAPYTk-AsD; Mon, 23 Aug 2021 21:13:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 440A360669;
	Mon, 23 Aug 2021 21:13:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 028C11BF32D
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 21:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F22DF400F1
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 21:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gsoWRscNc9At for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 21:13:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40E4C400CD
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 21:13:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9B65B8DA89; Mon, 23 Aug 2021 21:12:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 23 Aug 2021 23:12:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e94aeed1a97f5b66b9a8dc4f0133451b7b7b34f
X-Git-Newrev: 8ead0594060dde5ae92653c9937a4160baf28d85
X-Patchwork-Hint: ignore
Message-Id: <20210823211253.9B65B8DA89@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-lunix: fix sys/sysctl.h
 detection
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ead0594060dde5ae92653c9937a4160baf28d85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sysctl.h has been removed from glibc since version 2.32.

Fixes: http://autobuild.buildroot.net/results/749a11d5289c6fec3b2f236b9073fc1ab730d090/
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lua-lunix/0003-fix-sysctl-detection.patch | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/lua-lunix/0003-fix-sysctl-detection.patch b/package/lua-lunix/0003-fix-sysctl-detection.patch
new file mode 100644
index 0000000000..18656b1921
--- /dev/null
+++ b/package/lua-lunix/0003-fix-sysctl-detection.patch
@@ -0,0 +1,24 @@
+sys/sysctl.h was removed with glibc 2.32
+
+Fetched from: https://github.com/wahern/lunix/pull/20/files
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ lunix-rel-20170920/src/unix.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lunix-rel-20170920/src/unix.c b/lunix-rel-20170920/src/unix.c
+index 272820a..fa00876 100644
+--- a/lunix-rel-20170920/src/unix.c
++++ b/lunix-rel-20170920/src/unix.c
+@@ -165,7 +165,7 @@
+ #endif
+ 
+ #ifndef HAVE_SYS_SYSCTL_H /* missing on musl libc */
+-#define HAVE_SYS_SYSCTL_H (defined BSD || GLIBC_PREREQ(0,0) || UCLIBC_PREREQ(0,0,0))
++#define HAVE_SYS_SYSCTL_H (defined BSD || (__GLIBC__ && !GLIBC_PREREQ(2,32)) || UCLIBC_PREREQ(0,0,0))
+ #endif
+ 
+ #ifndef HAVE_STRUCT_IN_PKTINFO
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
