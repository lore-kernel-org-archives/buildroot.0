Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0E3C8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 10:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AADFC82B51;
	Thu, 28 Aug 2025 10:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1gcFCAn5Yqc; Thu, 28 Aug 2025 10:18:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB68282B9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB68282B9F;
	Thu, 28 Aug 2025 10:18:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AD5517D
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 10:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F89682B51
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 10:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xa8uGAeJiIoc for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 10:18:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 224D282B9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 224D282B9F
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 224D282B9F
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 10:18:56 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B4ED23520762; Thu, 28 Aug 2025 12:18:54 +0200 (CEST)
Date: Thu, 28 Aug 2025 12:18:54 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aLAtDsqpq1ePUy46@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.1.0-38-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1756376334; bh=8yx4EInJqFyFXRYJHcaWTl7d3Cw007scIyUq4ik9xpg=;
 h=Date:From:To:Subject:From;
 b=KfnWN631r3y8/JKrUAVc8dC4sNYQEng633hn4uLHLToUu/0z9AfsKRXGcOPxsjHCb
 oijO7H3pGpE0EM7xTiZM8o2G6yKjO/rggiBoXvu/MM3W0t3pHu8OlmDzI8fEodd8Tm
 ZzrqpnqSwrQwdd1fcqwWCWclbNGAU36RsebFJ4eXOae5NXtNo+TfTuWRKGQODDyrLS
 g7WkiyQT3+SEYVQdGOsJDrp7nafMXK2yf3ca3P55ITmPohL+ZrIqus2xB7Gwuyx0Ku
 3XVpQutbVmLY4vZr4QsgP/11HZ5bf7hUVZ3gtqS3Fvnl0KgqE7Vo2ivx1xlf+DBz1s
 ZhfZ7Ymn2wCAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=KfnWN631
Subject: [Buildroot] [PATCH] xterm: bump to 401
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the Changes here:
https://invisible-island.net/xterm/xterm.log.html

COPYING was changed, the year was bumped and some extra
license information was removed.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/xterm/xterm.hash | 4 ++--
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index e0fdcfe66e..e86db1c06e 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  1cd5763d94d9370fed10d804e831a089b2ace0e7a74b6f56ef5a16a766bde7be  xterm-389.tgz
+sha256  3da2b5e64cb49b03aa13057d85e62e1f2e64f7c744719c00d338d11cd3e6ca1a  xterm-401.tgz
 # Locally calculated
-sha256  e38de4a0780954b5a7e69b5fa6c571daa8a1bfbacb4f2c5b2f07099e1a1d7c93  COPYING
+sha256  99f70364bb769635eb9de18cc286e16cb78026f3b6478276344ee8619098dff6  COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index c2c97dd318..fb6de107e9 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 389
+XTERM_VERSION = 401
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
