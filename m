Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2288C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5389F404AB;
	Sat, 11 Dec 2021 20:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6sk1Fece9Lp; Sat, 11 Dec 2021 20:55:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D1344038E;
	Sat, 11 Dec 2021 20:55:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A9981BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1AE8824EF
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CElH3feQupC3 for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2767D84F36
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EB35D82965; Sat, 11 Dec 2021 20:48:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 21:00:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 806ec9f131c12da27cbf64185a780e819750b1f4
X-Git-Newrev: 3d565a831d7316ffbd182694b25674ab0101718b
X-Patchwork-Hint: ignore
Message-Id: <20211211204814.EB35D82965@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/clamav: drop first patch
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
Content-Type: multipart/mixed; boundary="===============1802054491325576068=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1802054491325576068==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3d565a831d7316ffbd182694b25674ab0101718b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

First patch is not needed since bump to version 0.99.1 in commit
2c8e5dd69f4f281b2b497ae7ec9ec95c47e7c80c and
https://github.com/Cisco-Talos/clamav/commit/689005317680854627b79c76ffa6e42a8160b0e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...roto.c-fix-build-error-due-to-missing-soc.patch | 34 ----------------------
 ...use-backtrace-if-using-uClibc-without-ba.patch} |  0
 2 files changed, 34 deletions(-)

diff --git a/package/clamav/0001-clamdscan-proto.c-fix-build-error-due-to-missing-soc.patch b/package/clamav/0001-clamdscan-proto.c-fix-build-error-due-to-missing-soc.patch
deleted file mode 100644
index daac677eaa..0000000000
--- a/package/clamav/0001-clamdscan-proto.c-fix-build-error-due-to-missing-soc.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 52fda6e6689e22866a39ec4273713fb6035c38b2 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Mon, 7 May 2018 23:14:46 +0200
-Subject: [PATCH] clamdscan/proto.c: fix build error due to missing sockaddr_un
- definition
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-proto.c: In function ‘dconnect’:
-proto.c:86:67: error: invalid application of ‘sizeof’ to incomplete type ‘struct sockaddr_un’
-             if (connect(sockd, (struct sockaddr *)&nixsock, sizeof(nixsock)) == 0)
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Upstream-status: http://lurker.clamav.net/message/20140928.130829.5494fd68.en.html
----
- clamdscan/proto.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/clamdscan/proto.c b/clamdscan/proto.c
-index 0205f6da0..d3396732f 100644
---- a/clamdscan/proto.c
-+++ b/clamdscan/proto.c
-@@ -42,6 +42,7 @@
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <sys/types.h>
-+#include <sys/un.h>
- #ifdef HAVE_SYS_SELECT_H
- #include <sys/select.h>
- #endif
--- 
-2.14.3
-
diff --git a/package/clamav/0002-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch b/package/clamav/0001-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch
similarity index 100%
rename from package/clamav/0002-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch
rename to package/clamav/0001-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch

--===============1802054491325576068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1802054491325576068==--
