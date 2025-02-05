Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C59C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 13:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91DB780AD8;
	Wed,  5 Feb 2025 13:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9T3siXDApVga; Wed,  5 Feb 2025 13:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96E1E80DFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96E1E80DFD;
	Wed,  5 Feb 2025 13:58:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71AD712F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 557AF80DFD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lGnh-YUAzhzD for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 13:58:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F061080AD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F061080AD8
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F061080AD8
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:58:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.32]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeI2-1tpT353CLs-00VGdz; Wed, 05
 Feb 2025 14:58:39 +0100
To: buildroot@buildroot.org
Date: Wed,  5 Feb 2025 14:58:23 +0100
Message-ID: <20250205135825.2310972-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:oRafos+PsSZ2bz+FlY2Ws5y3geMmnZSLFIeH+2b5vrcJE62oNdf
 CIRaCeEfTMeAaP0oFeuqmG0BeMJrLrwaFzO7pbkH3oXi6dNj7qnBA5Cs1sWCrI9S6BS8wqr
 foKtVlCOpcAnGOjZtaqQdGRx4L64enBn9Fj/Mg1AqtAlHFGateG9VAV63hIRBsQykZesor/
 FJl/c6/llCpY7MwOvrwMw==
UI-OutboundReport: notjunk:1;M01:P0:nM0XGxHXVts=;zdqySvgDwoyoPLLDvEIaakHCua4
 CSMBhggk8y0zoYDasPD6sop3lJT/gBwFRku9dgWzXP/r9JQhWYj1Soe0Aarg+rttPItYATEkJ
 947IkdPyGVCgzYKh9ZU3/sr5HNIUcuyVruHDvpuF6Q8SAb8oKkFyvfVH0ES/MipPhTJDyujh2
 QFF9gQ68c6gMw+ePg3m2HXpQTzf3PI3fyNMeLhBcuRzc+s3OwMV7OA31B9uQg5xcCsGESayqe
 YAgXUlkHUzVcgIQpc180/KQ01k0aGOiMJ8NbUWJKejyS6Oh75lDS8hgHu5BsHyKQAGErqXBFy
 AdyEwqOY1Sf5AAPWVojTO2FxZXbONJf1epAeF52A0ONnc/mq1BUMHeDWF/pCOOQLkyROhPK4E
 mZ1n/95uqhONTJCdxleehHdwsx8m6/S747LmORwfdhFn9Yx7tgcDUsokos9IVaNTJDZYHF9M8
 LCz9i177XLb96DQ3+hDK1RIEww4eCLJgr99e9Bt1bE7j0Sv0cAFEzuINJ9k7O/1k3IOo8JzSo
 hyL/boJl/IHBmD9GCAZNkcZQH0+QiAjJY4uE++s1ph8elJvcB5ph2BhC2RLQ68EZ2za6ZSXDW
 e8aSi7+xUnahFC57ilVo0F8gBdRIt0f2Sxh8eirMcxaUnCNL6ogwqhnwt1RppPsZD3cn0MQ5L
 oeSv9c1ioSEIv3kdZHVcy31gtc9YuIEInsQVRz//WLaYX/E/OvXaKNdNblBw/qj0BSTE2UhV0
 i+C9Hp9ROw5cxM0RBPVjucSvV0w3AN3ULk6C24foIMPhf7X//kVg3hDLFQqsdZx9S9tse3Nrn
 3rj5Rz7/OSOhqlsQgaQE06VnxWZ12EZ9IGyPxJCcoSqCzsRa+YCJlb76R0p+HoAGwCeshUz1l
 QQv6ZvHBLCgHL5t6m0G6XqwNGeK3GEFqeAeWWwahXRFvB5ppiNGcVGV+bJVrjCVkc/zcGJ2pA
 i11R3CRFcEp1Rd85HmsHCkU8ZdBAN7hy49E5dyrm/9MbzkXk+9+JG9Pif91FLi3/dCuWejjZD
 86rTXa32ejy10deyEfABwPkw+oe0MQTfdmdlr40iHr6g/yexcK9UoTujy4Coutw6dYLRZjN6a
 TX5u1ihEixLLwaIs07POuikQiHXlUY4FB2htGPam4PxYHf0cLem4U+aPRkNSNgs6g/tNcCfM3
 PiNae1OZz+pGJA5qhUZXmjbiQ8MmD06lIDPBCtyKULz6jyC40vToPpTvUDXTDzcqdfKUfEaRy
 1PNd/5rG5LPwSWxE7NjmYgJBbCBdZ5v/b5zebV0GWbBPn6cFg/9KI09AfDxGnYgtwKoutXYjl
 KmyvIKdjweyiy2qFN27Ji+oWoNz1x0rYDQV3YLqBTgbFBY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738763920; x=1739368720; i=fiona.klute@gmx.de;
 bh=Jh6WW3LiA3zJ8Eeq/Vsqi5kGBUMD1KXz22045oEESbQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=FFrqGayTxkE46Js6EEKEO/ID/GaeX/yTEZ+xLr2UJEgqV325shLo71O8QzvJ/ZVI
 hG8GpMTBl4RVnukGF4A4FHTqjYaBK/jlza1zrcjGK+4zMqseN47wk4/cETJEt/UM6
 JTlgIwOPORpdf6FMAPNvj9qRknjxWXpPtK/2y5NHXM47oLO15dUy+j0sQAQFaVxGn
 Uk23hnvSfVkeX9hlkM62MTMF23QjzcXH1fpxERr7QucuWdna0y4FVGFlOyDvbz0YN
 IUd8quirwoqeZw72LNcpO+/Gl2xU4mR+hq7FFX/2Pexlp2Q4XQLs7UMWynVvqUHUr
 zrfXLXEiP30y/maMYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=FFrqGayT
Subject: [Buildroot] [PATCH v3 1/3] package/pkg-golang: allow packages to
 provide extldflags
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
Cc: Nathaniel Roach <nroach44@nroach44.id.au>, yann.morin@orange.com,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Currently, only the -static extldflags may be set in the
golang-package infra. However, in some cases, it might be necessary to
pass other flags, either because they are needed on a specific
architecture, or a specific C library; packages may also have a need
to pass arbitrary linker flags when they use CGO linking.

For example, on AArch64, go forcibly uses ld.gold, but it is not
available in all toolchains, and ld.bfd works nowadays (following
patch); another case is musl, where PIE is not supported with go.

Introduce FOO_EXTLDFLAGS, which we use to set those flags, and that
packages can set to pass such flags.

Migrate the current setting of -static to use that new variable.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Tested-by: Nathaniel Roach <nroach44@nroach44.id.au>
Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v2 -> v3 (Fiona):
* Update commit message as provided by Yann via Buildroot ML

 docs/manual/adding-packages-golang.adoc | 6 ++++--
 package/pkg-golang.mk                   | 6 +++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-golang.adoc b/docs/manual/adding-packages-golang.adoc
index aa25426591..6de0916a83 100644
--- a/docs/manual/adding-packages-golang.adoc
+++ b/docs/manual/adding-packages-golang.adoc
@@ -84,8 +84,10 @@ therefore only use a few of them, or none.
   infrastructure will automatically generate a minimal +go.mod+ file
   in the package source tree if it doesn't exist.
 
-* +FOO_LDFLAGS+ and +FOO_TAGS+ can be used to pass respectively the
-  +LDFLAGS+ or the +TAGS+ to the +go+ build command.
+* +FOO_LDFLAGS+, +FOO_EXTLDFLAGS+, and +FOO_TAGS+ can be used to pass
+  respectively the go +LDFLAGS+ (via the `-ldflags` command line flag),
+  the external linker flags +EXTLDFLAGS+ (via the `-extldflags`
+  command line flag), or the +TAGS+ to the +go+ build command.
 
 * +FOO_BUILD_TARGETS+ can be used to pass the list of targets that
   should be built. If +FOO_BUILD_TARGETS+ is not specified, it
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 33cf9bfb1a..a3421af288 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -114,10 +114,14 @@ ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 
 ifeq ($(BR2_STATIC_LIBS),y)
-$(2)_LDFLAGS += -extldflags '-static'
+$(2)_EXTLDFLAGS += -static
 $(2)_TAGS += osusergo netgo
 endif
 
+ifneq ($$($(2)_EXTLDFLAGS),)
+$(2)_LDFLAGS += -extldflags '$$($(2)_EXTLDFLAGS)'
+endif
+
 # Build package for target
 define $(2)_BUILD_CMDS
 	$$(foreach d,$$($(2)_BUILD_TARGETS),\
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
