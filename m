Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E37FD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B98D83BC4;
	Tue, 13 Jan 2026 19:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHkz4KlWOVCO; Tue, 13 Jan 2026 19:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FC8283BB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333028;
	bh=19WuxDYswB1oH972aVpRPRgzf5fGFIQwCfaZtXiP3q0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jUKgbQSY/NMs/I6OSEP2ECgddcihY97DdSRbOpn1HEUGxxNYpGxpNFYfnzCL/cGR1
	 SA0lpMmK+1vEEacl3YfnjLYdwNYLsEDtmf7mOeUJOWvwhUUH2KAiEVGd5CqJPzEi5K
	 UVb66M///ZNk2+2Oj0zdwsoCbowN4nN4pXmQfFWwm8d6XeeXqJKjUOsirE5OV7jwzt
	 kQKauPX6FE4RdJDrYreuz/j96RpvOHqIruoThOeIfxMmHd9mPoqzXvHRkOXv970R87
	 5STX6OOUBUGgejGYCvMP4vSR3ypArGf02O8QMg2H+EYccvaW0eGb+J7w44lCv2CU3l
	 f98ObpbYNwKlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FC8283BB1;
	Tue, 13 Jan 2026 19:37:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F360231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC78582BE5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKY0SqRQ-3Nd for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93B6982C35
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93B6982C35
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90E85873D9; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:23:04 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 81b7bd41a0a51247422f9de9b96ff7c0d9c03642
X-Git-Newrev: 9621d102043be13bd0b2cacd6c6fe4b49f7c57c8
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.90E85873D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mender: ignore
 mender CVE because it doesn't affect the client package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9621d102043be13bd0b2cacd6c6fe4b49f7c57c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

CVE-2024-46948 only affects the device management and update server part
of Mender, and not the client running on the devices

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f16475f3773dbb910356c1b9dbb8a663266a55b0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mender/mender.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 146e6b2b73..1050277db1 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -8,6 +8,8 @@ MENDER_VERSION = 3.5.3
 MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
 MENDER_CPE_ID_VENDOR = northern.tech
+# CVE-2024-46948 only affects mender-server
+MENDER_IGNORE_CVES = CVE-2024-46948
 
 # Vendor license paths generated with:
 #    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
