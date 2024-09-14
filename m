Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE7EC02197
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 14:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A7D542595;
	Sat, 14 Sep 2024 14:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Rz7J_apTZnE; Sat, 14 Sep 2024 14:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D93064259C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D93064259C;
	Sat, 14 Sep 2024 14:01:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C73AB1BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FDDD6076F
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jL4vBGFoHOJn for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 14:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52F8660775
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52F8660775
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:00:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 500FB828E3; Sat, 14 Sep 2024 14:00:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:54:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28a53f8f55019f67a6f840cb4cfb1eb14028f8d1
X-Git-Newrev: 812bb30412cb87f3c05048b6a1030af0e4aab40b
X-Patchwork-Hint: ignore
Message-Id: <20240914140014.500FB828E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nvidia-driver: fix targeting typo
 in patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=812bb30412cb87f3c05048b6a1030af0e4aab40b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nvidia-driver/0001-use-LDFLAGS.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nvidia-driver/0001-use-LDFLAGS.patch b/package/nvidia-driver/0001-use-LDFLAGS.patch
index 9ce237f959..fe87cb0e3d 100644
--- a/package/nvidia-driver/0001-use-LDFLAGS.patch
+++ b/package/nvidia-driver/0001-use-LDFLAGS.patch
@@ -5,7 +5,7 @@ the default emulation is correct for the current architecture.
 
 However, that might not be the case when the toolchain default is not
 the same as the current arch. For example, if the toolchain defaults to
-i386 and is capable of x86_64, and we're targetting x86_64 (or the
+i386 and is capable of x86_64, and we're targeting x86_64 (or the
 opposite), the link would fail because the ld emulation is incorrect:
 
     .../i686-pc-linux-gnu-ld: Relocatable linking with relocations from
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
