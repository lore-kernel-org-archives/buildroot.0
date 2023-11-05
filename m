Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB05C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 18:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F77981CAD;
	Sun,  5 Nov 2023 18:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F77981CAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6MjokO5EyYCE; Sun,  5 Nov 2023 18:31:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A54081D4F;
	Sun,  5 Nov 2023 18:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A54081D4F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D48E1BF4D6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12F82418E0
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12F82418E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MlZYy0dNYp5D for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 18:31:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 297A841901
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 18:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 297A841901
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED7D3867EF; Sun,  5 Nov 2023 18:31:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Nov 2023 18:13:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1a47904b635c3c4c3b5656e58c0c575c1674993
X-Git-Newrev: 4954b5140e17f298a32a8537ed2948351dc4f5b1
X-Patchwork-Hint: ignore
Message-Id: <20231105183143.ED7D3867EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/petitboot: fix menu comment
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4954b5140e17f298a32a8537ed2948351dc4f5b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comment should appear if threads aren't enabled, not when they are.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/petitboot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 3d3c798c25..bd50ff65a0 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -25,5 +25,5 @@ comment "petitboot needs a toolchain w/ wchar, dynamic library, threads, udev /d
 	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
-		BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_PACKAGE_HAS_UDEV
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
