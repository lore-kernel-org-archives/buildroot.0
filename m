Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3131CDE00B
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 15:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1AB441133;
	Thu, 25 Jun 2026 15:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDdtV1t46NK6; Thu, 25 Jun 2026 15:38:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61F2E41125
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782401888;
	bh=aNJsI4it/8Fr3t8TWekslZFVDxxEuKa0bLu2ljZxbNo=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dfgyq1e0SVq+W2SV+t2MFYVzTTVyT8CX6o5JufWbsFetAo8OykHogrxEWkC/3JOF6
	 Z8LTnerWLqeKqZWE/RCG27Q5qn58gMc+Q+AmD7rB1XjOLE1EbQ7AuPbhO9bLxly6gx
	 aXiIYE0sB9BBSZiZwnVmDXF44sFCknGuHvFt1bPCT87NK4FXXLQUXSjK2++8DrUvyV
	 kVMPIrN36J5/Rk16mTyysFmKoo52nlgXKBuswTbH7A91695l3RmzkaO9IewVfBP1Q9
	 zJwUwfSHCwHJ9C610gT+OCLRLLJ1ssIcYNm0B5etL35WZIlk+0MfiBg231Rsspmufh
	 LCXu8p/0gXvdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61F2E41125;
	Thu, 25 Jun 2026 15:38:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C98E22C7
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9FBA4025E
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JPyxWTsIXdPZ for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 15:38:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.25.8;
 helo=smtp-1908.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3EAD8408AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EAD8408AB
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch
 [185.125.25.8])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EAD8408AB
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:38:02 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10::a6b])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gmNHD4dm5z2TC;
 Thu, 25 Jun 2026 17:38:00 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4gmNHD0DGjzWPH; Thu, 25 Jun 2026 17:38:00 +0200 (CEST)
Date: Thu, 25 Jun 2026 17:37:46 +0200
MIME-Version: 1.0
Message-Id: <20260625-tf-cpe-update-v1-3-b315a596d23b@cherry.de>
References: <20260625-tf-cpe-update-v1-0-b315a596d23b@cherry.de>
In-Reply-To: <20260625-tf-cpe-update-v1-0-b315a596d23b@cherry.de>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>, 
 Etienne Carriere <etienne.carriere@foss.st.com>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1782401880;
 bh=UMq6GivMd5Ixtdd0SBsIjbd13xDI+XWKBiv7nwz5zIU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TnLjamyhbcO0/bNbZ/XRglBXWHWY6sA+YFZWXAZvEIRIPjBayQHoCr0oF/8Po36Vt
 bqBwk+J3PU1Gg26JTBo4wlEVzyrVDZtm3dyl7YBSZwJVwYB+x8Dx23Y/3atPy2sBfL
 A4RYad+wbDHZTVElls65FVcP/AuBj0jrOxP6T1iEu53PqEJLg9jU3tBbh8jDEJ5nHj
 3wOFWAahIUeGK65+oll7b+611rumpq5C808aouSvviLxQetH6tHTM4vWvCXoD3YXeE
 VYqVcvsaLc7MxYtarJ/ISOeQV0/K7w/vrDRiPJJCBx1MEgvnSAn8FgiP8YBbN8rucG
 aGWH+2iaG/BRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net
 header.a=rsa-sha256 header.s=20231125 header.b=TnLjamyh
Subject: [Buildroot] [PATCH 3/3] package/mbedtls: fix CPE
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

A new (and hopefully definitive) CPE is to be used for mbedtls:

cpe:2.3:a:trustedfirmware:mbed_tls:

CVEs for projects under the TrustedFirmware umbrella are now seemingly
handled under the CPE vendor "trustedfirmware"[1].

NVD correctly reports[2] the new CPE deprecates the "old" one Buildroot
was using.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/49486/comment/2fd93ed7_df27998e/ before last comment from Sandrine
[2] https://nvd.nist.gov/products/cpe/detail/453A781D-74D5-4FB5-9BB6-8C1F7F281A7A
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/mbedtls/mbedtls.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index e8bb0a71b9..9def876808 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -15,7 +15,7 @@ MBEDTLS_CONF_OPTS = \
 MBEDTLS_INSTALL_STAGING = YES
 MBEDTLS_LICENSE = Apache-2.0 or GPL-2.0+
 MBEDTLS_LICENSE_FILES = LICENSE
-MBEDTLS_CPE_ID_VENDOR = arm
+MBEDTLS_CPE_ID_VENDOR = trustedfirmware
 MBEDTLS_CPE_ID_PRODUCT = mbed_tls
 
 # This is mandatory for hiawatha

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
