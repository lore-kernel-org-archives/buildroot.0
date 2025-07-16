Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FDBC83F27
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 14:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D4BB80F50;
	Wed, 16 Jul 2025 14:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_lq9L2vYNIY; Wed, 16 Jul 2025 14:53:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CC0380F17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CC0380F17;
	Wed, 16 Jul 2025 14:53:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC870234
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE9CC60900
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWr3AUVysw35 for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 14:53:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9041D608AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9041D608AA
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9041D608AA
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:53:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.122.179]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McY8T-1vBvci03xt-00dfVE; Wed, 16
 Jul 2025 16:53:05 +0200
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Wed, 16 Jul 2025 16:52:47 +0200
Message-ID: <20250716145251.1359958-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:1KyQWl28IrWIOu77ZEh04NrTZ5nVFnQe47574AdTVcRWlIxZE6k
 kHbxoSCE4zpOvEqZHxNRYycc0w6u2N+eoTLsiqf34PxxJXuTGINmi3/ZbG3PcOCYfkDCurM
 8hRdTsd3XKXsj1dVl6jyCSsvhBoAxaUkBV34JaKk+y23Ts7CELx4lDqypxWjb846Qs2pa+O
 /WdJuhh5aLiSCj5DUoy0Q==
UI-OutboundReport: notjunk:1;M01:P0:HsNOLypgkd8=;6LAZXA6gGd7vhxxdgNf6h91MsLi
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1752677585; x=1753282385; i=fiona.klute@gmx.de;
 bh=leKjMf+QD+4VRCqONiicok2SYwlvY28kheBpcVeMiAw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=KagyMf+0UHhBv8Mhvq/9iGc7HK7UpQSJjBvOLxyGIA55x0d43UUUPaYqPfF1Zcb6
 ILeQTWFrkanMhTG12+SEwgrfi0ye3+W85FggRbFgTqHeo5SZQsq2nGckukdl9aPUp
 oab63OoP01ZlLCJFdoblENt89kbQ6rirAKPxhQIaiE0KI2TMLkL0pekX9xUxZlRGj
 Gil1pgsKAxwmRxlCnBwabrvEj0ssbJPZRJTqr6jgFFqROAld97QOfccVlVy33/Iud
 uUyrsuf2qo7yj9tKoT2uE9Ol5crbxBmM2mwDju7sN1pwSAn6/75hFMJ2XRfRgauHi
 BlOQh+rXtp1UK8Afzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=KagyMf+0
Subject: [Buildroot] [PATCH v2 0/3] Add external tree information to
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
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
