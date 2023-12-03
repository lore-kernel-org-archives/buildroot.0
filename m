Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C04C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DD8A41575;
	Sun,  3 Dec 2023 16:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DD8A41575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lChP1mbVqgwy; Sun,  3 Dec 2023 16:40:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6661A40864;
	Sun,  3 Dec 2023 16:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6661A40864
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD39A1BF471
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96188408DA
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96188408DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bKR9ZJtwD4jN for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:40:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6ADA340467
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ADA340467
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5522587783; Sun,  3 Dec 2023 16:40:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 17:40:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e6e16a6d1803956b0c10e0d92608980888d0ebd3
X-Git-Newrev: 7ceebff5b94f6a179e8ef77d467b1af0cc1bc477
X-Patchwork-Hint: ignore
Message-Id: <20231203164047.5522587783@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/elfutils: drop -lfts
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ceebff5b94f6a179e8ef77d467b1af0cc1bc477
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As spotted by Yann E. Morin in
https://patchwork.ozlabs.org/project/buildroot/patch/20231022154133.1619344-1-bernd@kuhls.net,
-lfts is not needed since bump to version 0.183 in commit
ef92e86e845134868011cb0b801509a0755f855e and
https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=da855fc9cd415c288bfcb9de1f3d5eb329de0557

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elfutils/elfutils.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 45df971071..24eb168894 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -51,7 +51,6 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 ELFUTILS_DEPENDENCIES += musl-fts argp-standalone
-ELFUTILS_LDFLAGS += -lfts
 endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
