Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DF1C52D6F
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 18:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15357400AB;
	Wed, 21 Aug 2024 18:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58u97oXgzR6e; Wed, 21 Aug 2024 18:12:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5C5340488
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5C5340488;
	Wed, 21 Aug 2024 18:12:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A6351BF395
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 18:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 483EE80DC8
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 18:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlYTrbIpfO7I for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 18:12:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6156480DC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6156480DC4
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6156480DC4
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 18:12:13 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 32C5A3535C1E; Wed, 21 Aug 2024 20:12:11 +0200 (CEST)
Date: Wed, 21 Aug 2024 20:12:10 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsYt+jha8qZGaSEB@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724263931; bh=LKOLoyyN9SVCHDAHfG3qS/eYeO67ggxzAPwm78QQklU=;
 h=Date:From:To:Subject:From;
 b=FGfDtzQ2LClJH8JKcKySHaNSoK5u4Urks1sgIdRjZ+td2E52YvWZ9klb2BLAKOW9x
 ZWF9i81mOLegr63txcnI8h3XcJ0Av8cvNx14/Mx+hcS94/2S67oDWTSK4OaFxilOKk
 u4YJr10/wYy+M8uC+Tkcj5NjEuANlWajxiSEkpjb2b8VYsu0jCbLadWIxHrMVOWwVy
 WI4AXhL2MslaCQHx1/jOj5h3DCHHWST5vYT+DACrtm28Rhop2UDjP43LZDuP3O4QGb
 GGDbHoPhJbTi7I/Idq3964A3SHX2g/MIFDLqpGDdfFfobsr8IAgpbPBO6LZnYeDbA6
 XrCm777Js7Y7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=FGfDtzQ2
Subject: [Buildroot] [PATCH] package/zabbix: fixup download URL
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

 http://autobuild.buildroot.org/results/9ff/9ffb4a9e3b2291498d0ccf3c9124bebc466860bc

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/zabbix/zabbix.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index 76568f5a18..18fb01deca 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -6,7 +6,7 @@
 
 ZABBIX_VERSION_MAJOR = 6.2
 ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).7
-ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
+ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/oldstable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_SELINUX_MODULES = zabbix
 ZABBIX_LICENSE = GPL-2.0+
 ZABBIX_LICENSE_FILES = README COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
