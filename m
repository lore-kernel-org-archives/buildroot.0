Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08D8CE8D61
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F83E43301;
	Thu, 19 Sep 2024 09:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNapjKBYxKG8; Thu, 19 Sep 2024 09:18:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 809D4432D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 809D4432D5;
	Thu, 19 Sep 2024 09:18:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BC1C1BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F0EA615B9
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1NFT8BlBeCl for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E059615EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E059615EE
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B79283C6C; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:55 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 05fa1c65450fae4dd0ed04a34a7bdaae7da83be7
X-Git-Newrev: 500d75762b064a2aae37023ada053c6eb16a905b
X-Patchwork-Hint: ignore
Message-Id: <20240919091607.8B79283C6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/gcc: fix
 explicitly typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=500d75762b064a2aae37023ada053c6eb16a905b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d5bb8fff5f8636ce8b4a063668440efe9489d8d3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 94935d79a2..41a2dfb1cc 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -233,7 +233,7 @@ HOST_GCC_COMMON_CONF_OPTS += --with-fp-32="$(GCC_TARGET_FP32_MODE)"
 endif
 
 # musl/uClibc-ng does not work with biarch powerpc toolchains, we
-# need to configure gcc explicitely for 32 Bit for CPU's supporting
+# need to configure gcc explicitly for 32 Bit for CPU's supporting
 # 64 Bit and 32 Bit
 ifneq ($(GCC_TARGET_CPU),)
 ifeq ($(BR2_powerpc),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
