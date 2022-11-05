Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF46C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E71A5410AC;
	Mon, 20 Feb 2023 21:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E71A5410AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BAkz81a3SfhY; Mon, 20 Feb 2023 21:02:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72AF4429CE;
	Mon, 20 Feb 2023 21:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72AF4429CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D0211BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9806A61073
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9806A61073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GF7tyNtR3dsJ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F35A61048
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F35A61048
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D469828C8; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 22:48:14 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ceb51d1463acb6918fbb825dc56b2a2b48ab8674
X-Git-Newrev: 3441f3c5d66111af18f83ad585a2f0abb096ee7c
X-Patchwork-Hint: ignore
Message-Id: <20230220205147.2D469828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/guile: fix Config.in
 comment dependency
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
