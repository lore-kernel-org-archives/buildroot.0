Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D3EC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 18:07:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A64F60C41
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 18:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A64F60C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DBE140137;
	Wed,  4 Aug 2021 18:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ra3QN1V3KD_s; Wed,  4 Aug 2021 18:07:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F23B440540;
	Wed,  4 Aug 2021 18:07:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10FB31BF381
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 18:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0DA540625
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 18:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4cPZWuJWoOvy for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 18:06:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 307BE40647
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 18:06:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6B1928B5F4; Wed,  4 Aug 2021 18:06:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 19:48:33 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 80e514984b10abd2bd8ab581f6276f85f9b763c1
X-Git-Newrev: 4f08313d9fff5378691fa05022ffc3eeda0771d3
X-Patchwork-Hint: ignore
Message-Id: <20210804180629.6B1928B5F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/tor: add SELinux
 module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=4f08313d9fff5378691fa05022ffc3eeda0771d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Support for tor is added by the services/tor module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1f9090b6b4337a61eba5ebfd1ea57fcd6ff2a8e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index e7e791a10a..f6aeba2d6b 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -9,6 +9,7 @@ TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
 TOR_CPE_ID_VENDOR = torproject
+TOR_SELINUX_MODULES = tor
 TOR_DEPENDENCIES = libevent openssl zlib
 TOR_AUTORECONF = YES
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
