Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDF1C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED6C8409AA;
	Tue, 23 Aug 2022 20:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED6C8409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dz1lLLRK1NtO; Tue, 23 Aug 2022 20:21:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2C304071B;
	Tue, 23 Aug 2022 20:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2C304071B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E08E1BF5A8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3945A8135A
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3945A8135A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A_yFzV3yvZTd for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 20:21:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F78D81375
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 20:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F78D81375
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 37D3E87BC0; Tue, 23 Aug 2022 20:06:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 22:20:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6bfa3f744d1dabd99ac74cf8008fb0cdfecdcb8
X-Git-Newrev: 6bd0cc0cb8a9a3016ca4970a21ebbf7f497dfe96
X-Patchwork-Hint: ignore
Message-Id: <20220823200636.37D3E87BC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: disable gcc D front-end with
 gcc 12
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

commit: https://git.buildroot.net/buildroot/commit/?id=6bd0cc0cb8a9a3016ca4970a21ebbf7f497dfe96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"The D front-end is now itself written in D, in order to build GDC, you
will need a working GDC compiler (GCC version 9.1 or later)." [1]

So we have to check if a D compiler is available on the host.

Fixes:
http://autobuild.buildroot.org/results/36a/36aa22e458d53ab8687b3a79ffeb65b18e8ac6e7/host-gcc-final-12.1.0/build

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=5fee5ec362f7a243f459e6378fd49dfc89dc9fb5

http://lists.busybox.net/pipermail/buildroot/2022-August/648841.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index ba2a2ee072..4dc981d196 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -77,6 +77,10 @@ config BR2_GCC_SUPPORTS_DLANG
 	default y if BR2_riscv && !BR2_RISCV_64
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	# "The D front-end is now itself written in D, in order to build GDC, you
+	# will need a working GDC compiler (GCC version 9.1 or later)."
+	# https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=5fee5ec362f7a243f459e6378fd49dfc89dc9fb5
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_12
 
 config BR2_GCC_VERSION
 	string
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
