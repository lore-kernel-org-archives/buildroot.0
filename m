Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E33CAC5B5
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 09:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78EC48072A;
	Mon, 29 Sep 2025 09:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aq5oK7jJuyPJ; Mon, 29 Sep 2025 09:24:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A74C8072D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A74C8072D;
	Mon, 29 Sep 2025 09:24:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47D8B12D
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 09:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3119540911
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 09:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FsbaHGw1S2kQ for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 09:24:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9B0C408FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9B0C408FC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9B0C408FC
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 09:24:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.105.240]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQ5vc-1uh4s70U7c-00Me8f; Mon, 29
 Sep 2025 11:24:51 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Mon, 29 Sep 2025 11:24:31 +0200
Message-ID: <20250929092431.8974-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:VIGDNT37LMBxJB6o8MLzs5EHh7BlgXxTijShgfIOGuwqhlUVN+G
 YHEe5FWFtxYuvAWlgxQrxRsRFtzcHmAtSOPXPaGeSyf6MT+IFs/V0FmQ+O4CH0uUbexYqIN
 Qs6gx8t+FJBAbrVUlA1dRralNYHDYri7SEULrzUS8oLR5IwurBy79dAWjDD7ARNamkEKjjk
 PKsPFjQdxm0vVna4MDFmA==
UI-OutboundReport: notjunk:1;M01:P0:5AKkkOatE6I=;bg22Ts9x9gw+olFX6ZrWYF78IL7
 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
 arCmkPE5ZgrrQ43Mxk1zlGy466XBJhGp1ZE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1759137891; x=1759742691; i=fiona.klute@gmx.de;
 bh=wppOgGo3JyRhwiJii7Od1MgKYEhZLTCZwriYFyJ7dXI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dqXias096D2ffwbPbQM0MiscxDTbaCFoo6gbv+xOMgstg1t45sOnpmILjdFgbTp1
 zpqAybOX5Us0iWo84KkhaaPOQCOs4d020xb72azfGTF7TVa95Iqzo9Mi3mTF21O3D
 RzYC4NF6LCf3TwrgzGTm9yUEXOKz5dj2ygk+o9MAVbzeLxJKcWYKWBJpXsB1JpXTr
 c/640ZeaAqbo79OWwh1pTT8Si72cjYNFr4ag/cbxyPcNzHlFPELHY4VCu3+mKu7yJ
 eeFkKvbEwjFj0KQmCCE0h4YJabl06CTz6X9PLYy1xpIS6+Ef32x4MZs2wd4dcj4w+
 rIdG3GKBraMg+uaNuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=dqXias09
Subject: [Buildroot] [PATCH 1/1] Makefile: add check-package-external target
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The new target provides a convenient way to run utils/check-package on
any external trees, using .checkpackageignore files from the
respective trees if present.

While .checkpackageignore should be used as little as possible, in a
few cases adding overrides for false-positives to the affected files
is not feasible, a practical example of this is a Markdown file
misidentified as Python by libmagic (likely due to code blocks).

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
I've considered wrapping this into the existing check-package target,
but there are a few reasons not to:

1. Some people might not want to subject their external trees to
check-package at all, and would be annoyed by the warnings.

2. BR2_EXTERNAL support for utils/docker-run is still pending (see [1]).

3. The older shellcheck and flake8 versions in the Buildroot base
container image used by utils/docker-run produce some false positives
for my external trees, so I want to keep using the (newer) local
versions for checking those, but use the container for upstream
patches. That is more convenient with separate targets.

If anyone's wondering about the "Markdown misidentified as Python"
example: It looks like "__init__(self):" appearing in a code block
makes libmagic consider the file Python.

 Makefile | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b8678ea15b..cdc7ac0e4e 100644
--- a/Makefile
+++ b/Makefile
@@ -125,7 +125,8 @@ endif
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig alldefconfig syncconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	print-version olddefconfig distclean manual manual-% check-package
+	print-version olddefconfig distclean manual manual-% check-package \
+	check-package-external
 
 # Some global targets do not trigger a build, but are used to collect
 # metadata, or do various checks. When such targets are triggered,
@@ -1262,10 +1263,27 @@ release:
 print-version:
 	@echo $(BR2_VERSION_FULL)
 
+# $(1): br2-external path
+# $(2): br2-external description
+define check-package-external
+	@$(call MESSAGE,"Checking packages in $(2)")
+	$(Q)if [ -r "$(1)/.checkpackageignore" ]; then \
+		ignore="--ignore-list=$(1)/.checkpackageignore" ; \
+	fi ; \
+	$(TOPDIR)/utils/check-package \
+		--br2-external $${ignore} \
+		`git -C $(1) ls-tree -r --format='$(1)/%(path)' HEAD`
+endef
+
 check-package:
 	$(Q)./utils/check-package `git ls-tree -r --name-only HEAD` \
 		--ignore-list=$(TOPDIR)/.checkpackageignore
 
+check-package-external:
+	$(foreach name,$(BR2_EXTERNAL_NAMES),\
+		$(call check-package-external,$(BR2_EXTERNAL_$(name)_PATH),\
+			$(BR2_EXTERNAL_$(name)_DESC))$(sep))
+
 .PHONY: .checkpackageignore
 .checkpackageignore:
 	$(Q)./utils/check-package --failed-only `git ls-tree -r --name-only HEAD` \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
