Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DC8C83F22
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 14:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3A2F80FC6;
	Wed, 16 Jul 2025 14:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qmg_yV3hKdYF; Wed, 16 Jul 2025 14:53:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17E1981066
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17E1981066;
	Wed, 16 Jul 2025 14:53:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B40341514
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A298414D2
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id onpCAyWV_dA1 for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 14:53:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D1214142B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D1214142B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D1214142B
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:53:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.122.179]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49hB-1ukTeZ09Vx-017LQO; Wed, 16
 Jul 2025 16:53:10 +0200
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Wed, 16 Jul 2025 16:52:49 +0200
Message-ID: <20250716145251.1359958-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716145251.1359958-1-fiona.klute@gmx.de>
References: <20250716145251.1359958-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:s2uDscZ/uL26d2Na4BDD+UIBTF13a0ITRvD62X2oM6mLVLPGncH
 LHIQJB8bq/lLGte5DLXKQPrONkWdpnGGgigPMag/81ofefF61DwRqVCsONiEoYDaQ28PxEe
 6Q7nQZ333I/Il8ifakXEzPwcRfeSsbcP6a8y73iFvu/R+HsMhUWofZP77080WjX2P7bxA4K
 iJZ4RZKqC6/wZ/ndEXf7w==
UI-OutboundReport: notjunk:1;M01:P0:g94s5agXjFI=;Q5DKWtfV1tt3rfslO8PSxreco+S
 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
 ePQt0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1752677590; x=1753282390; i=fiona.klute@gmx.de;
 bh=ySwLMwWPLzOh+01bzVm2FJs2FbOut4a0l1FzWln/zts=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dYqd6sfJyQpq9Zjy7p1xshw0hE84oAWYzOogUJnsAYEyaG4OxCqWL9odblo1q2wV
 Cwxa78W1SEv3zi5CpI8FtGcpwYURGqSzroy7SlOaLgcebtyXIh1Wx2esZNBORWfb1
 K3gZPmW0YmWMTa0g54nH5IsbwF3PMq1UuJVu1c3x42+/+Z0pREhggl/6WRP4i6oNS
 j111yL30V47HpMhqY22vw883cxr/ScjF4NTgN5Y/Hu/KgfUZO0184J2Ukk70HX1T5
 Wqbd4xWpy22KDEVEcd92lHWfYUwwkXw/Z1Uu802LMNGG7EwuRMLyzj7ELbsoQokEM
 DrNuee/uwPespdHmRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=dYqd6sfJ
Subject: [Buildroot] [PATCH v2 2/3] package/pkg-utils.mk: include package
 directory in show-info output
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

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

The new package_dir element contains the path of the package
directory. For Buildroot packages this is a path relative to the main
Buildroot directory, for packages from external trees an absolute
path.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Tested-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/pkg-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 0266f66b42..288a202230 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -120,6 +120,7 @@ define _json-info-pkg
 		"virtual": false$(comma)
 		$(call _json-info-pkg-details,$(1)) \
 	)
+	"package_dir": $(call mk-json-str,$(patsubst $(CURDIR)/%,%,$($(1)_PKGDIR))),
 	"stamp_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
 	"source_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
 	"build_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_BUILDDIR))),
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
