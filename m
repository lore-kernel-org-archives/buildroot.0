Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2375C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FDFD814A0;
	Thu, 30 Dec 2021 20:17:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wGiE2lv5qtRN; Thu, 30 Dec 2021 20:17:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0220813C9;
	Thu, 30 Dec 2021 20:17:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 848051BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F362813C9
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iAHGg0nDFOns for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:17:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C23208136A
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:17:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 41A2F82DDE; Thu, 30 Dec 2021 20:11:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 21:15:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2ff09f5f9223150249ef2b4cbb2bb7a20c36bb9
X-Git-Newrev: 1b7017c62c7da42cb4123327ee93ce3ae1d92ec2
X-Patchwork-Hint: ignore
Message-Id: <20211230201108.41A2F82DDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/protobuf: drop dependency on
 binutils bug 21464
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b7017c62c7da42cb4123327ee93ce3ae1d92ec2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package build failure has been fixed by using -mcmodel=large that is
now available in external toolchains as well as buildroot toolchains. So
we can drop its dependency on binutils 21464.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/protobuf/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 30050950aa..46c820b9cf 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -24,7 +24,6 @@ config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	default y if BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 
 config BR2_PACKAGE_PROTOBUF
 	bool "protobuf"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
