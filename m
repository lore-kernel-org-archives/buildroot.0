Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222AFCE7AA5
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 02:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 278B740939;
	Fri,  6 Sep 2024 02:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVBZ1Apwl4Tm; Fri,  6 Sep 2024 02:55:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B89440929
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B89440929;
	Fri,  6 Sep 2024 02:55:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 768541BF398
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 02:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 711B760B46
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 02:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDpQNfWrYiH5 for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 02:55:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.3;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 59D0560B42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59D0560B42
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59D0560B42
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 02:55:25 +0000 (UTC)
Received: from tianyuanhao3$163.com ( [59.46.133.34] ) by
 ajax-webmail-wmsvr-40-119 (Coremail) ; Fri, 6 Sep 2024 10:55:12 +0800 (CST)
X-Originating-IP: [59.46.133.34]
Date: Fri, 6 Sep 2024 10:55:12 +0800 (CST)
From: "TIAN Yuanhao" <tianyuanhao3@163.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240609075444.747339-1-yann.morin.1998@free.fr>
References: <20240609075444.747339-1-yann.morin.1998@free.fr>
X-NTES-SC: AL_Qu2ZB/mSvksq5CaeZekfmksSgOg6X8CxuP8g3IRWO5x+jD7p3RIYXHhFMH/z9syGAgaVqh6RVz1Bw8RncqNxUY0sUoea0XtlE4gkfDRqOG49WA==
MIME-Version: 1.0
Message-ID: <607c9f1e.350b.191c541d918.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD3P7sQb9pm8QFPAA--.61952W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBhBlRjWV4IP7VogAEsx
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=Wsux3jGmo0iVYCgLxIHA5GF1KrKTyNkKKz6ioYGMaug=; b=N
 V9so3dLc2cMFlQx4xSWfbJO+fgSyxpfdOCZX1ha3R7bmEVnvtGKD6whIS9tjagry
 XX7YD7b1Z6mNaY1alJz3SSSOX46P8K6vNiA69mKMD18W5QIhlo0O7TErxtddX9xy
 a9GnIjv1nefjTAHJ87nk7gMoowAVgPhfyhamQJvhLg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=NV9so3dL
Subject: Re: [Buildroot] [PATCH] Makefile: run PPD and RPATH fixup in
 host-fialize
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brandon Maier <Brandon.Maier@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At 2024-06-09 15:54:44, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>Currently, the gdbinit is generated and installed during post install
>hooks, either from the gdb package, or from the external-toolchain
>package. When using per-package directories (PPD), the staging directory
>of the either package is stored in the generated gdbinit, which is not
>going to be valid when all the PPD staging dirs get merged into the
>final staging: it would lack any library installed afterwards, i.e.
>mostly everything would be missing (but the libraries from the C
>toolchain in the case of an external toolchain).
>
>Similarly, all the RPATH will point to various PPD drectories. This
>does not cause any issue when the final host is aggregated, because the
>PPD directories still exist when we call programs from there (e.g. from
>the fs infra, or from post-image scripts).
>
>However, we knew that would not always be possible to keep the PPD
>directories: we have the prepare-sdk rule that runs a cleanup pass on
>the RPATH, and also applies the generic PPD fixups.
>
>When we introduced prepare-sdk in c32ad51cbf2a (core/sdk: generate the
>SDK tarball ourselves), we did not yet have support for PPD for the host
>directory, and especially, we did not have the host-finalize rule, which
>was only introduced in d0f4f95e390b (Makefile: rework main directory
>creation logic) which kick-started the introduction of PPD.
>
>At that point, we did not realise that the rpath fixups from
>prepare-sdk, would be better moved to the new host-finalize rule,
>because that had no impact unless one would need an SDK.
>
>Later, in 25e60fbe1cab (Makefile: fix SDK relocation for
>per-package-dirs), we eventually introduced the PPD generic fixups in
>the prepare-sdk rule. Again, we did not realise that those fixups would
>be better placed in the host-finalize rule rather than the prepare-sdk.
>
>While fixing the RPATH in host-finalize is not critical, fixing up the
>PPD paths actually is, as the gdbinit case demonstrate.
>
>As such, move the PPD fixups to the host-finalize step, and while at it,
>also move the RPATH fixups.
>
>This now does not leave much to do in the prepare-sdk step, and that
>could very well be moved to the host-finalize rule as well. However,
>some people may have started to rely on prepare-sdk in its 6 years of
>existence, and the little script it installs is not needed unless one
>really needs an SDK. So leave it as it is for now.
>
>Reported-by: Casey Reeves <casey@xogium.me>
>Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>Tested-by: Casey Reeves <casey@xogium.me>
>Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>Cc: Brandon Maier <Brandon.Maier@collins.com>
>---
> Makefile | 16 ++++++++--------
> 1 file changed, 8 insertions(+), 8 deletions(-)
>
>diff --git a/Makefile b/Makefile
>index 3bef434466..6c2a2ccddb 100644
>--- a/Makefile
>+++ b/Makefile
>@@ -594,14 +594,7 @@ world: target-post-image
> 
> .PHONY: prepare-sdk
> prepare-sdk: world
>-	@$(call MESSAGE,"Rendering the SDK relocatable")
>-	PARALLEL_JOBS=$(PARALLEL_JOBS) \
>-		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
>-		$(TOPDIR)/support/scripts/fix-rpath host
>-	PARALLEL_JOBS=$(PARALLEL_JOBS) \
>-		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
>-		$(TOPDIR)/support/scripts/fix-rpath staging
>-	$(call ppd-fixup-paths,$(BASE_DIR))
>+	@$(call MESSAGE,"Preparing the SDK")
> 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
> 	mkdir -p $(HOST_DIR)/share/buildroot
> 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
>@@ -719,6 +712,13 @@ STAGING_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.t
> host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
> 	@$(call MESSAGE,"Finalizing host directory")
> 	$(call per-package-rsync,$(sort $(PACKAGES)),host,$(HOST_DIR),copy)
>+	$(Q)PARALLEL_JOBS=$(PARALLEL_JOBS) \
>+		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
>+		$(TOPDIR)/support/scripts/fix-rpath host
>+	$(Q)PARALLEL_JOBS=$(PARALLEL_JOBS) \
>+		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
>+		$(TOPDIR)/support/scripts/fix-rpath staging
>+	$(call ppd-fixup-paths,$(BASE_DIR))
> 
> .PHONY: staging-finalize
> staging-finalize: $(STAGING_DIR_SYMLINK)
>-- 
>2.45.1
>

I found that my patch [1] was duplicated to this patch, and our situation is similar.

[1]: http://patchwork.ozlabs.org/project/buildroot/patch/20240828124440.3882-1-tianyuanhao3@163.com/

Acked-by: TIAN Yuanhao <tianyuanhao3@163.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
