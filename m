Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68630D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20A9840B4E;
	Wed,  7 Jan 2026 18:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id maDAkC6BmA0O; Wed,  7 Jan 2026 18:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3A2440A47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808885;
	bh=weWD2ZTjqtOToMiQzNC67qshC71mR5KNXJTBAVvpF7s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ePvOh5MZG+ovdS1y7lQn0ArkfYMMS0Uf6BtKsLJAuUhSYz3YyhJBqK4tL8SXITzZs
	 4koexeaWb9KW9mHH2X8Ql916ns87CWwNc8nmlp9WI0ijzuj+5QNuq/fy61kBvMSXwx
	 mKqqGWVgKXtNCaSKjvEP+IxngSa+/Af/PbMMyh1nU1XGtnmf4MtttJRPgh5+elYzhf
	 7qVDgykTbodYzJkWbk0GYQHSKYMWc41YLlDiEij56mTGvXYO0O0WNCBnTtp5skam5h
	 j0T6ozlS7QlDJHvs7yzbf0LvTNK5pGM6gg9wBPjvibLs+mJr6KxSuV2kAYpo4jqMpx
	 g/iMLvURdYbCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3A2440A47;
	Wed,  7 Jan 2026 18:01:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ED4825B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE63880ED1
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3K8FXZY8l06 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DBF080C97
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DBF080C97
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CA1B883AF; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 18:53:16 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: cd84d000ce9262f57f412c2b45a48a33029a1c64
X-Git-Newrev: 6406861a56fb5d86418d719d42abee031186ffa7
X-Patchwork-Hint: ignore
Message-Id: <20260107180111.1CA1B883AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/uboot-tools:
 include FIT print support if FIT support is enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=6406861a56fb5d86418d719d42abee031186ffa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Otherwise "dumpimage -l" produces only a newline when processing a FIT
image.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 39b925a0a6d80b2f347abad1fd75742c8d51a458)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/uboot-tools/uboot-tools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 37ccd7b953..1135fb9c03 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -32,6 +32,7 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
 	echo $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
@@ -124,6 +125,7 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
 	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
+	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
 	echo $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
