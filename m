Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC66C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 15:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2C8240A9B;
	Tue, 20 Aug 2024 15:03:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zOxeR3TlG83; Tue, 20 Aug 2024 15:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB5AF4026E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB5AF4026E;
	Tue, 20 Aug 2024 15:03:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD7461BF46A
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 15:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9BD0811D5
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 15:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9er2qXL-Td3q for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 15:03:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAF0E811D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAF0E811D3
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAF0E811D3
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 15:03:20 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id CC50E3536A71; Tue, 20 Aug 2024 17:03:10 +0200 (CEST)
Date: Tue, 20 Aug 2024 17:03:10 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsSwLoXXYTo8VPiX@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724166191; bh=Unr5m6RWaHyGzF34rIPnjnnweoRqiU5mqV5ZiQrlrow=;
 h=Date:From:To:Cc:Subject:From;
 b=p38T6ReQ1prL5q/JQvRMAWoGmmf0F6XVStKK892LIUlWw40WoAi5up9LcsTlSvcDa
 9gCQt78pQFIzQGvyCToawNUv5PGlqJxmIXEYGtLHGjR7DOYRvP+hptK7WsqJQCtKNp
 l3Vgy2igWAOcVWuUwtxOf4/RvJMWjdG58vVEOeMnWQXrB6DkFrNQKecnfPjd01mxPd
 Nhvk/pJb7MwH5Bxy2rtDegFDnsRwYKS/cYNec9rP30cy766d/r4JmYb6+oepupMqCu
 7bad0cpOgwrOVcuR6YkZLNP9VNesEBka5PEX+HjJwD2DrFiE4ifXsxtX/GrYvmPbOT
 JfWfZjWf2O23Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=p38T6ReQ
Subject: [Buildroot] [PATCH next] package/batctl: update to 2024.2
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
Cc: Jens Zettelmeyer <zettelmeyerj@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/batctl/batctl.hash | 6 +++---
 package/batctl/batctl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/batctl/batctl.hash b/package/batctl/batctl.hash
index 7bc6fee67f..b5d71fe894 100644
--- a/package/batctl/batctl.hash
+++ b/package/batctl/batctl.hash
@@ -1,6 +1,6 @@
-# From https://downloads.open-mesh.org/batman/releases/batman-adv-2023.1/batctl-2023.1.tar.gz.sha1
-sha1  8d899c6323e228b9b370caf28e6d67621cb7d35d  batctl-2023.1.tar.gz
+# From https://downloads.open-mesh.org/batman/releases/batman-adv-2024.2/batctl-2024.2.tar.gz.sha1
+sha1  a0eb5c0d55ee04518db7b2ee5da14bc4c912e30f  batctl-2024.2.tar.gz
 # Locally calculated
-sha256  e5bf47305d955abb199244bd0e5fffab96108b1affabd0d9705533f8059395f1  batctl-2023.1.tar.gz
+sha256  cb02953093ffc2c700d122c03a3d9e4d867f646d3038f31d0a901e58ff995d07  batctl-2024.2.tar.gz
 sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
index 197e4beb72..182f32c71c 100644
--- a/package/batctl/batctl.mk
+++ b/package/batctl/batctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATCTL_VERSION = 2023.1
+BATCTL_VERSION = 2024.2
 BATCTL_SITE = http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
 BATCTL_LICENSE = GPL-2.0, MIT (batman_adv.h, list.h)
 BATCTL_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
