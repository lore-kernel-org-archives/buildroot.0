Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D8EC4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5796281E32;
	Sat,  5 Nov 2022 21:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5796281E32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2MW8Ae8iGrVw; Sat,  5 Nov 2022 21:49:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8120281831;
	Sat,  5 Nov 2022 21:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8120281831
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D29B1BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2542C408CB
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2542C408CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ILlD9_Hx4Zi for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:49:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37713408BD
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37713408BD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25AA387E99; Sat,  5 Nov 2022 21:49:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 22:48:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ceb51d1463acb6918fbb825dc56b2a2b48ab8674
X-Git-Newrev: 3441f3c5d66111af18f83ad585a2f0abb096ee7c
X-Patchwork-Hint: ignore
Message-Id: <20221105214919.25AA387E99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/guile: fix Config.in comment
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=3441f3c5d66111af18f83ad585a2f0abb096ee7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The main guile option depends on
BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS, but this was not accounted
for in the Config.in comment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/guile/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/guile/Config.in b/package/guile/Config.in
index 3cf0ec863b..eeeeaf4035 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_GUILE
 	  http://www.gnu.org/software/guile
 
 comment "guile needs a uClibc or glibc toolchain w/ threads, wchar, dynamic library"
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
