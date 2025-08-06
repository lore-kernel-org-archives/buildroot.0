Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980C8C87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 16:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 491F440C82;
	Wed,  6 Aug 2025 16:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fk_nZAjVEKoO; Wed,  6 Aug 2025 16:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7163440C10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7163440C10;
	Wed,  6 Aug 2025 16:16:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4459331
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3627840BE6
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lsag-wJZXk-o for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 16:16:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8057A40C0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8057A40C0F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8057A40C0F
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:16:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.163.130]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9Wys-1ugMtN0IWC-001MSD; Wed, 06
 Aug 2025 18:16:05 +0200
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Wed,  6 Aug 2025 18:15:52 +0200
Message-ID: <20250806161555.3805467-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:el45avmfgmSk6l8ZNnSRMc33UT1Hp8FLaY+wQwlkyQBF6kWKrx2
 YbSgeh07O4ai4253g7pU8L8Kcx/9u4vly9RcF6tkKsa2WI481+Kd6mZJ8BVfbESij+K06KI
 fXOnOBBG1UHPEcBjRncLewC9yMPeHGmG4LAAkbLAXeV8qYwXSzk7fdL7VeCAv4r5jyrWrrn
 s1O37+onPdq3nXCXhpgnw==
UI-OutboundReport: notjunk:1;M01:P0:fx8tMtybJC0=;zF8vCfA4jfKFxUvsx317yE46AJC
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754496965; x=1755101765; i=fiona.klute@gmx.de;
 bh=Nr5RJ8iOnuom5vsUtoj75ppx5LYwt937/m3lB+qcXKA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=POjPJi2qj/atqR02oqnopeixqeI7vh6UzkB+N29YACbsaqLMNRuw9HBDwZYDmEAo
 l7ZFui85nuWERrZW3oiInmjsSP2XLIWI9O178PmMrnh2S73+cD6WmsNVp/fiTvdCy
 DKi5Th+jAf9Yswi7pMmUTfGsHuutM+Hmb+dBtxFbyP3J3UEoH08O6xhj9miamuqLR
 DiRne6uEWcnJQsEZPUaCXiY54o156IjN4fIbpmIMKAHDaV9sugsiWaZU7c7xIridt
 kqRgSUHXn8w5ixeUI2u6Jgcsa4NviTkrN/ssjE3t+uyxlEZtxEMQulgUp6+ONEvDT
 /whwKN99UorB1xprKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=POjPJi2q
Subject: [Buildroot] [PATCH v3 0/3] Add external tree information to
 CycloneDX SBOM
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

Hi everyone,

this series adds information about external trees that were used in
the build to utils/generate-cyclonedx output. I think having this
information is important to accurately interpret SBOM data: External
trees may add or modify packages, and in that case the Buildroot
version alone will not be enough to precisely identify the packaging
that was used. To be able to identify which packages come from
external trees, it also adds a new package_dir field to per-package
data in make show-info output, which will be an absolute path for
packages from external trees.

Particular questions for review:

* I've added a BR_EXTERNAL_TREE property to packages from external
  trees with the bom-ref of the external tree, following the pattern
  of the existing BR_TYPE. However, the CycloneDX specification
  recommends (but does not require) registering properties with the
  CycloneDX property taxonomy (see
  https://github.com/CycloneDX/cyclonedx-property-taxonomy). That
  would mean registering a "buildroot" namespace and maintaining
  documentation on supported properties within that namespace. As far
  as I can see, adding a section to the manual or an independent file
  to the repository should work. I'd be happy to add a document
  specifying the current properties (modified for the namespace), but
  I can't speak for the Buildroot project in registering a namespace,
  so I'd want maintainer agreement before working on that.

* Is there a better approach to record which external tree a package
  came from than deriving it from FOO_PKGDIR? I'm not aware of a make
  variable that'd give me that information. With the current code
  nested external trees aren't supported, but I doubt it'd make sense
  to.

Best regards,
Fiona


Changes v2 -> v3 (in patch 1):
* Fix merge conflict after reordering of metadata structure in commits
  6098cc45d64e9e7928f888b7cdf79533813d19c4 and
  9cbbc477626c433fe78614de9474f8446b7e2389

Changes v1 -> v2 (all in patch 1):
* drop unnecessary default=None for "--external-trees" option
* fix help string for "--external-trees" option ("%" needs to be "%%"
  so it's not treated as a formatting specifier)

Fiona Klute (WIWA) (3):
  utils/generate-cyclonedx: support including external tree information
  package/pkg-utils.mk: include package directory in show-info output
  utils/generate-cyclonedx: include external tree in package properties

 package/pkg-utils.mk     |  1 +
 utils/generate-cyclonedx | 87 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 82 insertions(+), 6 deletions(-)

-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
