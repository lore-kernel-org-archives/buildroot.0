Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFCCCD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65DF361063;
	Fri, 12 Jun 2026 11:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUqXjTqMFiIM; Fri, 12 Jun 2026 11:22:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E28066104A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263377;
	bh=1SAUO+iLvgouK5+DTxqNDkdfnHjgniBi8PoE/pdUI3I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J+doy2NCkmNWXbYgXAGiDAnX+jzB+zpB9TdtM3H394zXdq9myXqFbL3QaBh6iwVdO
	 M32C6mejwnpWhF3DPgj9TXWK8IGQambA0TAS5nMn6L+Cb6R08IgPxGPaPdqcnFHkRq
	 qxG68t7VkcNmVjXpz+JBEx8gX/GwZ5QRDSjIUL4DxyXaxczCAYnoVWkVdGvNNaISjv
	 zW/lbrD0gsgNYVo8pdHe56cHU4d+0fAf2sP6ZGUrPX8JzKMK+Z3Lu/UeSEBUhVshIT
	 nKiiE07Y7diRoykqoQ2nlfcAv/fqPlUvAzfgbo3VNMq8HHYQPcDjRWLsxQ2DukQzA/
	 qZw6F5xaQjiXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E28066104A;
	Fri, 12 Jun 2026 11:22:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A8EAF4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4336A832C6
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAmwhenqsZQ7 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 691C282CC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 691C282CC7
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 413CC880DE; Fri, 12 Jun 2026 11:22:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:41:14 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c1141c393176737437d5c8a5709cfc14ae4468d4
X-Git-Newrev: f5e232127277952b482417997e83a830c0d693a8
X-Patchwork-Hint: ignore
Message-Id: <20260612112211.413CC880DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/hplip: update CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f5e232127277952b482417997e83a830c0d693a8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
