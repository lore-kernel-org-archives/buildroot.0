Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B22C3ABBB
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 16:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26CEF8121C;
	Mon,  5 May 2025 16:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7nmthXshkhKI; Mon,  5 May 2025 16:04:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28A7081E72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28A7081E72;
	Mon,  5 May 2025 16:04:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B61C12E
 for <buildroot@buildroot.org>; Mon,  5 May 2025 16:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66CB34026A
 for <buildroot@buildroot.org>; Mon,  5 May 2025 16:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIGxewvhr93s for <buildroot@buildroot.org>;
 Mon,  5 May 2025 16:04:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 18939403AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18939403AD
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18939403AD
 for <buildroot@buildroot.org>; Mon,  5 May 2025 16:04:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.125.70]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfpSl-1uejPe2VoH-00eAuc; Mon, 05
 May 2025 18:04:35 +0200
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon,  5 May 2025 18:03:24 +0200
Message-ID: <20250505160327.3422096-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:s+9ScG+LmTkRiOVBurjwo22/w0b3b835o93zkFwlK3XDY2TFAqs
 yRkrAzdKMCZx/bZn2jEGljlifEPk+GQlJqzZpReOq2tmkCxarbBtJ09pN+IzKPdYAKMstIX
 xlVEk6Ny8ocQXRx6SCnZt0FrvJsxgvxR8y4k0Un86nFQH2Wz2k2bsLupa1x/p0fz6+u2eTX
 3QY+srZIho5wZ5uGjYMmA==
UI-OutboundReport: notjunk:1;M01:P0:OxAfbLWV5dk=;17aIc6tni0Ku4J2uFCj45LnNeze
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1746461075; x=1747065875; i=fiona.klute@gmx.de;
 bh=j9/GdML2xj1U1WcTHgDVbePt/nJwQAv4bD4GyX8s5To=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NOblQGvGdgS1Ejk6n+nFn3wovcm5YL7gG/B8UbOqNmRKoCZTwFcLyF+IBCrMfJPW
 8zjKpC7ak/aH19nrcXDzgQm37jDkR9lr5OeCIOpPZcRKslubV4TfQCiTn2korfXzm
 oaZqPrdHm2+2fitt/2uwt11Chet6jGhMSSIe06Z4yaL5r7t2dMbTTOcmlcWIVvYqg
 sYoZ2sNu8kYXmXTXh/WXPB/yRhYV3SxgysQEeNHPaoaYKw7Ixxy7MpRWvUrhXJbUq
 2gBYE0K82KHUWKiBYdJHqocn8j+kV44s4rdysHq7ZwCAJtaSQV157dYWW45JZLc0J
 rSsV9OSY8JMh8kuBrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=NOblQGvG
Subject: [Buildroot] [PATCH 0/3] Add external tree information to CycloneDX
 SBOM
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

* Is there a better approach to pass external tree information than
  adding a new (optional) input file? With "make show-info" being
  meant for package info I don't see a good way to push external tree
  info into it.

* Directly related to the above, I think with two sets of input data a
  make target to build a CycloneDX SBOM would make sense (not present
  in the current patch set). With "make show-info" and "make
  show-vars" writing to stdout that'd require either changing the
  output, or recursive make invocation. Is there a preference for
  Buildroot? I'm assuming avoiding recursive make would be faster.

* Is there a better approach to record which external tree a package
  came from than deriving it from FOO_PKGDIR? I'm not aware of a make
  variable that'd give me that information. With the current code
  nested external trees aren't supported, but I doubt it'd make sense
  to.

* Should utils/generate-cyclonedx raise an exception by default (as it
  does with this series) if there is a package from an external tree
  without external tree information? I believe this is important to
  ensure data is consistent, but it would force people who already use
  utils/generate-cyclonedx with external trees to adjust their scripts
  or habits. If not, I'd want to add a strict mode where it is.

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
  I can't speak for the Buildroot project in registering a namespace.

Thanks in advance for your thoughts and review!

Best regards,
Fiona

Fiona Klute (WIWA) (3):
  utils/generate-cyclonedx: support including external tree information
  package/pkg-utils.mk: include package directory in show-info output
  utils/generate-cyclonedx: include external tree in package properties

 package/pkg-utils.mk     |  1 +
 utils/generate-cyclonedx | 88 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 83 insertions(+), 6 deletions(-)

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
