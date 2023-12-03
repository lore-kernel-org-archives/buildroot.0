Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBD2C10DC1
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67861418F9;
	Mon,  4 Dec 2023 20:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67861418F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bH-_dT6Zd8by; Mon,  4 Dec 2023 20:25:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB71B418F4;
	Mon,  4 Dec 2023 20:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB71B418F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90AA41BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5174A61002
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5174A61002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OmVhul6qVIYC for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AB0360FC9
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AB0360FC9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48B99879B8; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 17:40:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6e16a6d1803956b0c10e0d92608980888d0ebd3
X-Git-Newrev: 7ceebff5b94f6a179e8ef77d467b1af0cc1bc477
X-Patchwork-Hint: ignore
Message-Id: <20231204201330.48B99879B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elfutils: drop -lfts
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
