Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366A0CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05FEF61B38;
	Wed,  3 Jun 2026 18:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKFYJxAmQVzF; Wed,  3 Jun 2026 18:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 617D161B11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512597;
	bh=DxeXiw6zrRBmSLotfCM7gG7oVlJRdG1rENdENalpCZI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JmD3nIZ2gjAykMtM86ww19fsTpNla4uce1ncHJTw0z4EI8Ji2PArEBHW5WNYk1cAU
	 ADnpYdZ/n+sbRuhPZAvvNrpfoEcXDnF4oB3of3XAkMoE6Wnqa0+lKY8THSwMeYeqF2
	 IKJmyKSOCdBbroFbFBiwfk0Ex2omT6SApL8t7HC7/ObXBTf1LfA+IIyMF32C/pZIzU
	 jC/0ZYQGInP9o9r9/ot2gpvmacqwhl1JOo9vjKbgkfD8jebuy/+CQMas+NZ+RaSDQT
	 XfUPLlyMCliH2uwCQpIocei6h/ShRgCNrKrQ47SE2DfDGXbY2GKne2QKl/Yi1+N9va
	 eBlHh/TOHbM8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 617D161B11;
	Wed,  3 Jun 2026 18:49:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF9A4388
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B52BD4229C
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwZr4Yq2X4z4 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:49:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E702B4011C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E702B4011C
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCCD187993; Wed,  3 Jun 2026 18:49:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 20:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41e76b356ceb3dbf8aeec5597e70d7a64605af47
X-Git-Newrev: 534ae54df967a94f7cfb07332ce803b5a7eb25d7
X-Patchwork-Hint: ignore
Message-Id: <20260603184935.DCCD187993@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hplip: update CPE
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/534ae54df967a94f7cfb07332ce803b5a7eb25d7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
