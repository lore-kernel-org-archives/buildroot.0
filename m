Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E735C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 07:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1467182BF4;
	Tue, 25 Jan 2022 07:59:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xtFSBzT6JMI5; Tue, 25 Jan 2022 07:59:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6456282AC6;
	Tue, 25 Jan 2022 07:59:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9ACD51BF2CC
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46A0E60FA4
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aywydotHGRDX for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E12060B72
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AAC6082774; Tue, 25 Jan 2022 07:49:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 08:41:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7b9413056ccc1a359375c756c3f3c4e7e96e344
X-Git-Newrev: 206ce351619e401cc7d7e53f1baad7b20d3d2da5
X-Patchwork-Hint: ignore
Message-Id: <20220125074920.AAC6082774@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: indicate how the CPU
 variants are ordered
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

commit: https://git.buildroot.net/buildroot/commit/?id=206ce351619e401cc7d7e53f1baad7b20d3d2da5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They are loosely ordered according to the ordering of the gcc
documentation. It is not entirely correct as the generic x86-64,
x86-64-v2, x86-64-v3 and x86-64-v4 are listed before i386 in the gcc
documentation, but this nevertheless gives a good explanation for the
overall ordering of the list.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.x86 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index cae5502051..27f2bfcd4c 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -22,6 +22,9 @@ config BR2_X86_CPU_HAS_AVX2
 config BR2_X86_CPU_HAS_AVX512
 	bool
 
+# This list of CPU architecture variant is (loosely) ordered according
+# to the gcc documentation at
+# https://gcc.gnu.org/onlinedocs/gcc-11.2.0/gcc/x86-Options.html
 choice
 	prompt "Target Architecture Variant"
 	default BR2_x86_i586 if BR2_i386
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
