Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B18C433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 20:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A62383FF9;
	Thu,  6 Oct 2022 20:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A62383FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QMVCDvTy9OvO; Thu,  6 Oct 2022 20:00:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB68883FF8;
	Thu,  6 Oct 2022 20:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB68883FF8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8453F1BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C13D4199A
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C13D4199A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-ylMDEV954r for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 20:00:22 +0000 (UTC)
X-Greylist: delayed 00:08:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD12A419E8
Received: from mailproxy06.manitu.net (mailproxy06.manitu.net [217.11.48.70])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD12A419E8
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 20:00:21 +0000 (UTC)
Received: from [IPV6:2001:a61:2571:e101:cb62:e29b:df1e:fe65] (unknown
 [IPv6:2001:a61:2571:e101:cb62:e29b:df1e:fe65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: wg@grandegger.com)
 by mailproxy06.manitu.net (Postfix) with ESMTPSA id 5432B5801B9;
 Thu,  6 Oct 2022 21:52:12 +0200 (CEST)
Message-ID: <41db705a-2c63-47bc-3f03-d4c52d2a4b14@grandegger.com>
Date: Thu, 6 Oct 2022 21:52:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: buildroot@buildroot.org
From: Wolfgang Grandegger <wg@grandegger.com>
Subject: [Buildroot] [PATCH] package/udisks: install to staging
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UDisks2 provides an Library API [1] for accessing the UDisks2 service via
"libudisks2.so". For development of UDisks2 clients, install to staging
as well! This issue has been reported as bug [2] as well.

[1] http://storaged.org/doc/udisks2-api/2.9.4/ref-library.html[1]
[2] https://bugs.busybox.net/show_bug.cgi?id=15026

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
  package/udisks/udisks.mk | 1 +
  1 file changed, 1 insertion(+)

diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 2bf519a2cc..959333d01f 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -10,6 +10,7 @@ UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisk
  UDISKS_LICENSE = GPL-2.0+
  UDISKS_LICENSE_FILES = COPYING
  UDISKS_CPE_ID_VENDOR = freedesktop
+UDISKS_INSTALL_STAGING = YES
  
  UDISKS_DEPENDENCIES = \
  	host-pkgconf \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
