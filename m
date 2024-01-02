Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E963C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6F4A400CB;
	Tue,  2 Jan 2024 20:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6F4A400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZDCBRCDd2UkS; Tue,  2 Jan 2024 20:24:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4A7840A62;
	Tue,  2 Jan 2024 20:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4A7840A62
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 91A531BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68E9E4061F
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68E9E4061F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5DwAtmsr97l5 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:24:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BC6C400CB
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BC6C400CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A7B683CD6; Tue,  2 Jan 2024 20:24:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 21:23:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f618fb81ab3638995158a12d9bfd5c578f9d58c
X-Git-Newrev: 6b25c3dad2e340f944a977a5ea51ee9d1f8a63f6
X-Patchwork-Hint: ignore
Message-Id: <20240102202441.4A7B683CD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: enable ARC HS rel 3.10 in
 vanilla GCC 13+
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b25c3dad2e340f944a977a5ea51ee9d1f8a63f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For quite some time a special tuning for ARC HS release 3.10
was only implemented in ARC fork of GCC, thus there was a dependency
introduced back in the day, see [1].

But finally that tuning got merged upstream (see [2]) and
so could be used with vanilla GCC starting from version 13.1.

[1] https://git.buildroot.net/buildroot/commit/?id=770c9e5ce3de4ef1743948898a37e9a2ad76ca8f
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=7501eec65c60701f72621d04eeb5342bad2fe4fb

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index fd721088ec..ebdcdba62e 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -47,8 +47,6 @@ config BR2_GCC_VERSION_13_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_POWERPC_CPU_HAS_SPE
-	# ARC HS48 rel 31 only supported by gcc arc fork.
-	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 
 endchoice
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
