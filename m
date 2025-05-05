Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C580C3ABB0
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 16:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F420081E60;
	Mon,  5 May 2025 16:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQQaaQ2eAm6D; Mon,  5 May 2025 16:04:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF75381E57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF75381E57;
	Mon,  5 May 2025 16:04:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45E8B183
 for <buildroot@buildroot.org>; Mon,  5 May 2025 16:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27D1C4026A
 for <buildroot@buildroot.org>; Mon,  5 May 2025 16:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNNzpdnocthp for <buildroot@buildroot.org>;
 Mon,  5 May 2025 16:04:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 13B6E400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13B6E400D1
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13B6E400D1
 for <buildroot@buildroot.org>; Mon,  5 May 2025 16:04:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.125.70]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmfo-1uad0Y0R8E-00QvHx; Mon, 05
 May 2025 18:04:36 +0200
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon,  5 May 2025 18:03:26 +0200
Message-ID: <20250505160327.3422096-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505160327.3422096-1-fiona.klute@gmx.de>
References: <20250505160327.3422096-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:EwCEHZqsNaEFs8BHUPhUedrI852dY9KLCltZGJ158saOF9XTMay
 6pDU8FapxbY2FHw1CuzJBpwuc6LzznlhQ+rQcO3SsgANPWTcJsi3L8IBmB4vVWyAnD+xIu+
 Qqx9ICABkuIL5uWAt0NLL1jta3tXkGZwI2H30wwh6lmFW59y5hwY3yEtvhpHftK30eTobrQ
 cz0hHN0fx0K4lRAny/Sqg==
UI-OutboundReport: notjunk:1;M01:P0:2K6JjJ2hnMw=;Al1LOrHRpOS7JVYi8hPWr4Tp2RH
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1746461076; x=1747065876; i=fiona.klute@gmx.de;
 bh=g9cqcoWJqSnRsKbAIZrM6ia0CsWvm2dwB94/XfqkLs4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Ssj0kkX2svUSA1pOukQDtgUGuH2mSuztirleCZnzAOPVhn0U/xhXHlZjn/TfiZwk
 g+kovPrl5oZwpg2Mq7uzZBXHOcIsuD+MGinfIQyrly35vmuu4pUSt3n+f4FVRYI1T
 lxAuxrdJbvcS5RgQuVxf0jXxwEcwOly27GddtcSsrdCR6smClCUubK//ZiWGdEqjE
 oR5do4NHu4eCJI/UIAfsirtfsIgY4KrmhdrZmHAUIcBoTG2m/tBGbFWI9BsepSDvt
 WerNc9nHvW161xRHLWRzHGuA21PamBq93GFPROYeDvRfoGnPkZV1zyNGwFPbNG9xM
 dD8+b4btWQ333vlRBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Ssj0kkX2
Subject: [Buildroot] [PATCH 2/3] package/pkg-utils.mk: include package
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
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
