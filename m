Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA86EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 07:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F09F4204E;
	Fri, 28 Jul 2023 07:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F09F4204E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4iv6h4LXcLTs; Fri, 28 Jul 2023 07:21:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F2ED42053;
	Fri, 28 Jul 2023 07:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F2ED42053
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03B681BF489
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 07:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEF7460F48
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 07:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEF7460F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id suGtXKd_Zyck for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 07:21:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23CF060F24
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 07:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23CF060F24
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10A6A8377C; Fri, 28 Jul 2023 07:21:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 09:21:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39610c8b3c7201d0a25a00c6707b724ff1aafce0
X-Git-Newrev: 1bd35cd712dc24e28184a14cfc5bf3f92d6baa31
X-Patchwork-Hint: ignore
Message-Id: <20230728072150.10A6A8377C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: update file,
 weston patch removed
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1bd35cd712dc24e28184a14cfc5bf3f92d6baa31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The weston patch was removed as part of commit
318f08715c3db7fbe76635384cbd4c615e1fe6b4 ("package/weston: bump to
version 12.0.1"), but .checkpackageignore was not updated accordingly.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/4758335423

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 38fdc63726..b636f66e81 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1563,7 +1563,6 @@ package/wampcc/0003-Broken-build-on-Windows.patch Upstream
 package/watchdogd/S01watchdogd Indent NotExecutable
 package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch Upstream
 package/webrtc-audio-processing/0001-Proper-detection-of-cxxabi.h-and-execinfo.h.patch Upstream
-package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch Upstream
 package/wget/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch Upstream
 package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch Upstream
 package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
