Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEB9C4320E
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:33:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD2E560FE6
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD2E560FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B2ED407BD;
	Thu, 26 Aug 2021 22:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U6Z-NVGFs5Rz; Thu, 26 Aug 2021 22:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74338407A1;
	Thu, 26 Aug 2021 22:33:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 111371BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D797E407B6
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zJvkucOdtYnR for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8925407CE
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 085DF8DC50; Thu, 26 Aug 2021 22:01:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 23 Aug 2021 23:12:57 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2e94aeed1a97f5b66b9a8dc4f0133451b7b7b34f
X-Git-Newrev: 8ead0594060dde5ae92653c9937a4160baf28d85
X-Patchwork-Hint: ignore
Message-Id: <20210826220133.085DF8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua-lunix: fix
 sys/sysctl.h detection
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
