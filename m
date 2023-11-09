Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAF4C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 17:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92C364169E;
	Thu,  9 Nov 2023 17:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92C364169E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-WOh37F-Vcj; Thu,  9 Nov 2023 17:00:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A18004011D;
	Thu,  9 Nov 2023 17:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A18004011D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73F891BF215
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 17:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C0EA822D6
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 17:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C0EA822D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tTuHrGJ-tWnY for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 17:00:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 881E4822D4
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 17:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 881E4822D4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B20986E0C; Thu,  9 Nov 2023 17:00:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 17:56:24 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 3a00793d8fc00c04408eb17ce5e6dfb864bdfaea
X-Git-Newrev: 3b977a0f4d09203f7f4ee055aa46c1f9731e56df
X-Patchwork-Hint: ignore
Message-Id: <20231109170033.6B20986E0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/petitboot: fix
 menu comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b977a0f4d09203f7f4ee055aa46c1f9731e56df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

The comment should appear if threads aren't enabled, not when they are.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 4954b5140e17f298a32a8537ed2948351dc4f5b1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/petitboot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 0b4dc762bb..b534b4900e 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -26,6 +26,6 @@ comment "petitboot needs a uClibc or glibc toolchain w/ wchar, dynamic library,
 	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
-		BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC) || \
 		!BR2_PACKAGE_HAS_UDEV
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
