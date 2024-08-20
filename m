Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DB4C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 07:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C984580C6A;
	Tue, 20 Aug 2024 07:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id txB54xYnxi_3; Tue, 20 Aug 2024 07:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D182480CC5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D182480CC5;
	Tue, 20 Aug 2024 07:45:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C80E91BF41C
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 07:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4FF24091F
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 07:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0jVPN4wEXhJt for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 07:45:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 18529408BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18529408BD
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18529408BD
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 07:45:24 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id F00053536436; Tue, 20 Aug 2024 09:45:20 +0200 (CEST)
Date: Tue, 20 Aug 2024 09:45:20 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsRJkHnGdaJ0DBy8@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724139921; bh=B1A+mtmgqPD1FE1ao8eURXrbL4OI4vA0GB+h+rhX/OU=;
 h=Date:From:To:Subject:From;
 b=Xy0T+yzK1TM+cp+bn5l2JpN2Tvbm1abpFRC3ZO+jA/ZLRKAsHPgRbkwoRywC39yNX
 W7xlbldG3TnfKD9tLLy8q+GLGoQp043KIrmegkq/7grvCw4p0xBf8VXNK3kq9zgSYP
 OG+9KQ0K5I1VA2mpQuTPUktcTwdlkT4qW3OPpd/A8+tWFNrBq1AboChqF/OSwB/3qY
 mMdQeYJG8SMxtwdNBJj/uXCRU2gcDW7OSpBfTOsrQgBXxewUMICyBAxWBU5hoNIN2y
 KoVnvYbubL5m4bolcCnZ9pFTH/5WZzdBD6MVFu7V/5ENA0Dc1w2vC9Dn43YD78UMhs
 Vquh8nZ76b00g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Xy0T+yzK
Subject: [Buildroot] [PATCH] package/aumix: update AUMIX_SITE
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

The old URL gives 403 forbidden.
Use a working sourceforge URL.

Fixes:
 - http://autobuild.buildroot.org/results/c0c/c0c3945cade7a6d7a615ac23523c93b02dbb056f

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/aumix/aumix.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/aumix/aumix.mk b/package/aumix/aumix.mk
index 03072d5d35..d5c2831dcd 100644
--- a/package/aumix/aumix.mk
+++ b/package/aumix/aumix.mk
@@ -6,7 +6,7 @@
 
 AUMIX_VERSION = 2.9.1
 AUMIX_SOURCE = aumix-$(AUMIX_VERSION).tar.bz2
-AUMIX_SITE = http://jpj.net/~trevor/aumix/releases
+AUMIX_SITE = https://sourceforge.net/projects/aumix/files/aumix/$(AUMIX_VERSION)
 AUMIX_AUTORECONF = YES
 AUMIX_AUTOPOINT = YES
 AUMIX_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
