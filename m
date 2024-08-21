Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16991C52D6F
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 08:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBF804019E;
	Wed, 21 Aug 2024 08:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-zHyFZEpQc2; Wed, 21 Aug 2024 08:16:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90817401E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90817401E4;
	Wed, 21 Aug 2024 08:16:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E71651BF4E7
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 08:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E137C40297
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 08:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vd0q0YTtvvVs for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 08:16:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 720E34026B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 720E34026B
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 720E34026B
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 08:16:55 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1A4EB3535C1C; Wed, 21 Aug 2024 10:16:53 +0200 (CEST)
Date: Wed, 21 Aug 2024 10:16:53 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsWidTexm+tBiTlo@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724228213; bh=SLWriq8tM50EGQhsbSJiB4yYdHWPHT0ipQJ592XLFIM=;
 h=Date:From:To:Subject:From;
 b=U8FUU3UddrqLlM5CgzSffvDvjVM2bKSZdrqZWNwMSrmNLYWgwTA1m8lUdKabQUmkk
 taFOQ0FcQIm2jETucFNV2gNOkUcP1J9DTqhB4Nnpzc37uEe/TJ4laF4MDxbUWnFfl6
 0VCzkKdLwX7G1GmknVKS57f+u5lgspNTkNfoEWMvIEn+hcpt7LgMsuTOg58I30lPRi
 AapAxNcnc6+2YIVl1Irbd8uO6L1ZochvlUsWinuQdUaIg8OYEGoFtaB0nDfp1UkW33
 9PIR3ZjJD2P+96wZnFjRoidUcTpBpVn/gkqX8M8zu/Jn02SlLawFqnzlDFG8XX+qaF
 kuanmkCo51XPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=U8FUU3Ud
Subject: [Buildroot] [PATCH] package/libglob: update download URL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:

 http://autobuild.buildroot.org/results/92c/92c697697c07f63f0e03ceb655b5d558e85c392e

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libglob/libglob.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libglob/libglob.mk b/package/libglob/libglob.mk
index 90356b3973..52da399658 100644
--- a/package/libglob/libglob.mk
+++ b/package/libglob/libglob.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLOB_VERSION = 1.0
-LIBGLOB_SITE = $(call github,voidlinux,libglob,$(LIBGLOB_VERSION))
+LIBGLOB_SITE = $(call github,void-linux,libglob,$(LIBGLOB_VERSION))
 LIBGLOB_LICENSE = BSD-3-Clause
 LIBGLOB_LICENSE_FILES = LICENSE
 LIBGLOB_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
