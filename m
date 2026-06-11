Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7F6CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72DDF610E9;
	Fri, 12 Jun 2026 11:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPrtDk6nw6rs; Fri, 12 Jun 2026 11:25:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C44C61170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263497;
	bh=2IZELBBvYoJUab8uQaYyTdZm3xVPwNJK1y3SNej9Y5Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UsopJzzgPStkZk52GmZkuiXHKF5RspvlF0Vk4OVkDBZYkNxWTZ9k+pOnooJN0C7rP
	 D5VdeAmkVDNv6u2V8oGsR7xXcKSZGgyQIQSTi3bqXACTdti9MQ0+adYxXCw9ZeAsyx
	 pEtmww3pgtBDJ4ZUs1pvziZcmse5lgoulb8ZMGRUiICNPI7U8jtVuAdi+5YiExMD34
	 BSmHF2krEmOv4Qjd+0XXSZfu0Ccgg0e9Na/kXLq+qjNpDRGscbJwHFrQVTLV9h30P/
	 LFiaG28fpWdud6kcKkrDX9w1FGzAo+wkJfBcBEgBoHVaAVqU7bmHsozc/69GT8dnmt
	 CXPKPmAw2DbqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C44C61170;
	Fri, 12 Jun 2026 11:24:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 212F0F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAF174066F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72M9_PIKOGId for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2698B40148
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2698B40148
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00215880E9; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:41:17 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 69b4c798318af51f5dc48951c6e01c4140871378
X-Git-Newrev: 267ef20bfb8094ea9646a4918a5dc3603399b471
X-Patchwork-Hint: ignore
Message-Id: <20260612112350.00215880E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/hplip: update CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/267ef20bfb8094ea9646a4918a5dc3603399b471
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The 'hp:linux_imaging_and_printing_project' hasn't received any new CVE
assignment since 2013, while 'hp:linux_imaging_and_printing' received 4
[1][2][3][4].

See the package vulnerability history at [5].

[1] https://nvd.nist.gov/vuln/detail/CVE-2015-0839
[2] https://nvd.nist.gov/vuln/detail/CVE-2020-6923
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-8631
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-8632
[5] https://security-tracker.debian.org/tracker/source-package/hplip

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 534ae54df967a94f7cfb07332ce803b5a7eb25d7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/hplip/hplip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index 59a0f8ace0..54766978de 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -11,7 +11,7 @@ HPLIP_DEPENDENCIES = cups libusb jpeg host-pkgconf
 HPLIP_LICENSE = GPL-2.0, BSD-3-Clause, MIT
 HPLIP_LICENSE_FILES = COPYING
 HPLIP_CPE_ID_VENDOR = hp
-HPLIP_CPE_ID_PRODUCT = linux_imaging_and_printing_project
+HPLIP_CPE_ID_PRODUCT = linux_imaging_and_printing
 
 HPLIP_CONF_OPTS = \
 	--disable-qt4 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
