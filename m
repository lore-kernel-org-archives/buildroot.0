Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A740C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 18:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 460F5820DD;
	Sun,  5 Nov 2023 18:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 460F5820DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b202uwgfqWyf; Sun,  5 Nov 2023 18:32:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8089181CE9;
	Sun,  5 Nov 2023 18:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8089181CE9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69E5C1BF947
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41FC1408EF
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41FC1408EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGQWsrnWscAV for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 18:31:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DCC940A38
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 18:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DCC940A38
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1466A867F1; Sun,  5 Nov 2023 18:31:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Nov 2023 18:24:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12e964302174dd299a6ce48fb3f6c349c45dd718
X-Git-Newrev: a97c1925b2e710f19b7ea6f95e8f14eaae1743d3
X-Patchwork-Hint: ignore
Message-Id: <20231105183144.1466A867F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kexec-lite: introduce
 BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=a97c1925b2e710f19b7ea6f95e8f14eaae1743d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will make it easier to handle packages that want to select
kexec-lite.

It also fixes the current inconsistency in the comment: it was not
displayed for powerpc64le.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/kexec-lite/Config.in | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
index 5beaec6418..89184b0b7c 100644
--- a/package/kexec-lite/Config.in
+++ b/package/kexec-lite/Config.in
@@ -1,6 +1,11 @@
+config BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+
 config BR2_PACKAGE_KEXEC_LITE
 	bool "kexec-lite"
-	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	depends on BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS # dtc, elfutils
 	depends on BR2_USE_WCHAR # elfutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
@@ -18,6 +23,6 @@ config BR2_PACKAGE_KEXEC_LITE
 	  https://github.com/antonblanchard/kexec-lite
 
 comment "kexec-lite needs a toolchain w/ wchar, dynamic library, threads"
-	depends on BR2_powerpc || BR2_powerpc64
+	depends on BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
