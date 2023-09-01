Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F812CA0FE9
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 10:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 831B460BAB;
	Fri,  1 Sep 2023 10:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 831B460BAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0olQGP5s_Rly; Fri,  1 Sep 2023 10:30:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2DB560B10;
	Fri,  1 Sep 2023 10:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2DB560B10
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19D371BF4E7
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 10:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E74C483A7E
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 10:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E74C483A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zQsmlRcrs0KW for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 10:30:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEAAA83A56
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 10:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEAAA83A56
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAABC8678E; Fri,  1 Sep 2023 10:30:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Sep 2023 12:28:26 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 3923a4fac8c9e501b5fd94eea98bd7e842b31876
X-Git-Newrev: c43d60b7dd0badc83f989c7e085a1fb717739304
X-Patchwork-Hint: ignore
Message-Id: <20230901103039.BAABC8678E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] .checkpackageignore:
 update after rtl8192eu update
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

commit: https://git.buildroot.net/buildroot/commit/?id=c43d60b7dd0badc83f989c7e085a1fb717739304
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Commit f445c6355817e7 (package/rtl8192eu: bump to version 2023-06-23 on
branch 5.11.2.1) dropped 0002-Fix-conflicting-get_ra-on-PowerPC.patch but
forgot to update .checkpackageignore, leading to gitlab failures:

.checkpackageignore:1381: ignored file package/rtl8192eu/0002-Fix-conflicting-get_ra-on-PowerPC.patch is missing

https://gitlab.com/buildroot.org/buildroot/-/jobs/4996203885

Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 48c5b27d59..7560c09137 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1378,7 +1378,6 @@ package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.p
 package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch Upstream
 package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch Upstream
 package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch Upstream
-package/rtl8192eu/0002-Fix-conflicting-get_ra-on-PowerPC.patch Upstream
 package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch Upstream
 package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch Upstream
 package/rtmpdump/0001-include-limits.h.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
