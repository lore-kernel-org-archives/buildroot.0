Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B27C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 13:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 657C44152A;
	Wed, 28 Feb 2024 13:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hQoZwC-Aa5sz; Wed, 28 Feb 2024 13:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EED241725
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EED241725;
	Wed, 28 Feb 2024 13:41:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB5551BF955
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 13:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98E60821F4
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 13:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9A7M1W4uC4PS for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 13:41:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAB7082033
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAB7082033
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 13:41:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9AF187BA2; Wed, 28 Feb 2024 13:41:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 14:38:54 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 9a46e9e1718f3e8ba764a6233f39bf2338609c93
X-Git-Newrev: a07d1795ff504441b4df2b390e1b4e79051618b7
X-Patchwork-Hint: ignore
Message-Id: <20240228134102.D9AF187BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/faad2: force arm
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

commit: https://git.buildroot.net/buildroot/commit/?id=a07d1795ff504441b4df2b390e1b4e79051618b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
