Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BB9C54E49
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 13:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AD6A40815;
	Wed, 28 Feb 2024 13:39:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Il0PfAY3k6ZQ; Wed, 28 Feb 2024 13:39:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57F1941727
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57F1941727;
	Wed, 28 Feb 2024 13:39:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C6A41BF2C8
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 13:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBC6B415A7
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 13:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zF6kQkHlDGFr for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 13:39:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1727415A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1727415A3
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 13:39:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7DD487B86; Wed, 28 Feb 2024 13:39:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 14:39:05 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 3a7b549b8c2352ed68bc9887ceac4bfe30dd9931
X-Git-Newrev: e51bb2ced96c8826dcdce7ea46338d63a1ada2bf
X-Patchwork-Hint: ignore
Message-Id: <20240228133943.D7DD487B86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/faad2: force arm
 mode instead of Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=e51bb2ced96c8826dcdce7ea46338d63a1ada2bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix the following build failure in Thumb mode:

/tmp/ccfzn6FH.s:36: Error: selected processor does not support `smull r2,r3,r1,r0' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/838808b4751244ee01cde6b8261212b49e511a32

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: reword comment slightly]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a33827760823b1455326e0fc8cf6089a3081e782)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/faad2/faad2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index 686e5045c0..0b249b3450 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -12,4 +12,11 @@ FAAD2_CPE_ID_VENDOR = audiocoding
 FAAD2_CPE_ID_PRODUCT = freeware_advanced_audio_decoder_2
 FAAD2_INSTALL_STAGING = YES
 
+# faad2 contains assembly routines using ARM instructions not present in thumb1 mode:
+# Error: selected processor does not support `smull r2,r3,r1,r0' in Thumb mode
+# so force ARM mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+FAAD2_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
