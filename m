Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B43ECAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 11:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EA1440900;
	Wed,  8 Oct 2025 11:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65JzoKBATkD1; Wed,  8 Oct 2025 11:53:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0217740482
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0217740482;
	Wed,  8 Oct 2025 11:53:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83ED3119
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 11:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A6EC6071A
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 11:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NyZhyKmcQkuE for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 11:53:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6380E605F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6380E605F1
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6380E605F1
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 11:53:32 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 610BF44093E;
 Wed,  8 Oct 2025 14:52:31 +0300 (IDT)
To: buildroot@buildroot.org
Date: Wed,  8 Oct 2025 14:53:23 +0300
Message-ID: <5ff528f1f4822ab5d2d0ea102bc7c44281026e14.1759924403.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1759924351;
 bh=zgkgV0XmAAKS7qMk7GFX8FE8mbig76Zj/ceUMg3vJl4=;
 h=From:To:Cc:Subject:Date:From;
 b=r0z4hdcMz9uDyHBvX+NTnF519veTUQEEl1g49YOvj6JYdXsASBa1rYYfuAPqb9uKp
 Zz+bbCUNAe0YsOR6qRfLOn+xy6fmHdnICYZ0f7GXn3CAT7b2sKA10cRm6B/B8Jl/Ab
 xLBwOq27RjOni7LuuzrNMVcez1rVquKA0xnxMI6r1O07CigMkm7Qvk6i6WhU2dNNuQ
 s3PwPGGykmjY8KyCoMWljpK1ao3IiNlnEBV9VSa+zhobsYjdGGV0Ce3CugrBFc0zeJ
 EgkYoax9UmUPVJCHxmcBUJZPdW0rbgXV0AiurUsRZ8vs41h8jGIfcl48Y6VWDoRenN
 uY1k06YuBTd8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=r0z4hdcM
Subject: [Buildroot] [PATCH] package/ebtables: disable sparc64 target
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit c5d6cde7b627 ("package/ebtables: remove KERNEL_64_USERSPACE_32
workaround") fixed build with GCC 14 for when Buildroot
BR2_KERNEL_64_USERLAND_32 is enabled. However, ebtables configure script
enables its own KERNEL_64_USERSPACE_32 macro unconditionally for sparc64
target, which triggers a similar build failure.

Disable sparc64 target for ebtables and its reverse dependency to avoid
build failure.

Fixes:
https://autobuild.buildroot.net/results/9a2510e0038cd13db8c3aac0122ea7a0f834fcd2/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ebtables/Config.in | 1 +
 package/libvirt/Config.in  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
index ce5f67bc61f9..83337feec6c6 100644
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_EBTABLES
 	depends on BR2_USE_MMU # fork()
 	# https://lore.kernel.org/all/20210518181730.13436-1-patrickdepinguin@gmail.com/
 	depends on !BR2_KERNEL_64_USERLAND_32
+	depends on !BR2_sparc64 # int-conversion error
 	help
 	  Ethernet bridge frame table administration
 
diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index c55ab429ebc3..5664f69dd8d6 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -46,6 +46,7 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
 	default y
 	depends on BR2_INSTALL_LIBSTDCPP # nmap
 	depends on !BR2_KERNEL_64_USERLAND_32 # ebtables
+	depends on !BR2_sparc64 # ebtables
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # radvd -> libbsd
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_DNSMASQ
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
