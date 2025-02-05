Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C01C02196
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92662424B6;
	Wed,  5 Feb 2025 11:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESSXVC7x7ZyH; Wed,  5 Feb 2025 11:35:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61C4B424D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61C4B424D6;
	Wed,  5 Feb 2025 11:35:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9DCBCD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE82A81196
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8g4ezpDjHUe for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:35:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 86C8681180
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86C8681180
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86C8681180
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:35:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.32]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Hdw-1thHac1tDG-005DDm; Wed, 05
 Feb 2025 12:35:44 +0100
To: buildroot@buildroot.org
Date: Wed,  5 Feb 2025 12:35:31 +0100
Message-ID: <20250205113531.4161633-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250205113531.4161633-1-fiona.klute@gmx.de>
References: <20250205113531.4161633-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:j1gsto9bEcJVzOp+Z2djGnP3a2+lzCm+ibmE9ANpXANEIQe9S+y
 lwz1GbeNTdGUUVP5jJGTZM2Hje302+766qzM7KdVIOlJEP3KAKR2xsbNf1xBm2SMmAvTuwA
 LwUDv8moMoJUoxj4qolO0si2q3eRCJ5WOm3Fce5Jgi+ZRcxd1/xjR0fQFoMGF5wP9k1Wbki
 m+r5Tqjx/msYlz6qkwdtA==
UI-OutboundReport: notjunk:1;M01:P0:IqYrx/HhlOM=;lcKd9MXn06plXldpUqplUM46lFD
 DbjeOO4kUnDxpJJX0K0GnYegJP6/fIDZCMm7PrLVV4zLvdz1SBFs09yZT0Gd3yVvu3IgyUBhl
 6o0+tYH76BxmULP8LpBymiPYPsAsQOgLtig18JLA7WR7+HiGosnuXmijf2SXhm8LnJaYjeWNO
 HQlD6KYz8uenGNwcYdcdO37ZDltXNXLFCyyrPJ0UanRU3ns24TWCVuOI+s2fiHUqNWBrlxlao
 yQ1tIbwuPJpoDmYYA3X9RWdXDXivJ1yo06yDYcawux1UHafmOH5BMgRZS/SgPFb0xLGqB0Swp
 rH4c1V/LfJPPLfmETOAgP6V6QpPxYIsFN3wgWAVBoRMAA5amCUZxtBka2A2Ph8HPt6figAhOq
 gc3vzACJCjNwTZynKdVCG36odR+7wcNnGtVGItDu8Sbt9XikoHvkqbwEHzHIfbD3rgQvMpBVr
 SvJYlC5QZ36/7xCF2HG9ZO5ZUrhnwAoYYiA9UnUF5DkhitGHprYRy5ssqFIWRBTkFHu4U87Sm
 5KJ2M+EFlQJRa9bbunl61OLbvipuAGJdeGHfA8rd2BmcikImHR0AfKuiFf2XX3R1nMaLJfLSA
 h4biK4ssxHgLk4Ws4/s9uitezzFRop3+ALiaNoPD9kjQ9TnQHNr/3iIbrPEMkV/qUDLwmex5d
 dhqiahQED/TmGTdNW1VFMupCl9rQvM2In1tqNDWE6tVZUYJM9KkbekVYo7n/E7ochOIGrLIqA
 ajKAwfjlot4+0zhtlse3wmomn3A01K8YoyLiyrdi9HRuiDUAY0r0Jx0zbaVeRjzr79UfpBFbl
 retuNtkN/6ZNLQUDcAuhv5IoNUvFymz6GnY1BekNysJRwgthwwDN4kgbWacesSpVDuHRvlXxI
 DJj969LCe5aJsylL0yLh5ttsP57mySXmJne+eaAFJt6sjY+dcijF8JEHRpA/N5zpaNp4eBlTp
 H76z6KkrWXfWJ6qopdUcJ0PBNJYPTH8z5sdJa2SOvhUqPLjviPdsc42c1TNVM4damKws6DoGl
 UT5rQkbr+u/y/Yyq6NX0pjyP8gwmhyAcJEbuYks2fmWUKSVMVxUt1fnC2FqTNoAdY9l2vm1eO
 pkQ08YPeYq25fw6bdal/LpqZbb4xgDI5/Xyv7BP8cJ7Y0oRDHQvduZClE3ZUoNDY9h8wmvbHO
 e4UZjaG1RCKskRc/zRJEwdFh1zV9RydA9Po9G+x4CY4t1D8KuXd2xtXcsJ/NRUgHZAriB+/to
 ehfHC67yrCz//et0xBUYL5Ca0zpbUpBy4k/Ltz83YIy+TIbFVDBQdiVQ7YNWLDgpso8/CkXbT
 mdqNcztK0vqQiGZTo0z5lNoKaxeRHKd1Fc44ESt/9TMyWj77sISmTrGIuSK1adCsbdagPEosx
 tiHkYq5wucQHsZ4BkQVHGObZNIeogy7yYVQh1MCA7et2a4SEBOLsLsw34UkZUVoqKIcx5x+uZ
 BafyBvvL19F8byHYvjl/InZA4AB1iEvP9ifnvTjem3RzRAUM9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738755344; x=1739360144; i=fiona.klute@gmx.de;
 bh=olvOpJM8S0cS2vv5cHBD7WoN4ABVKpjZzHYiixzNyoo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=UP8OOM0UH1WBwjpBcHX5d6+g57n9ycNwzGcqVQTsd2Yz9d30+rkX7XNp3l1qXItw
 E3ZrBP5/fPV36GNnkCdRa3cdePVFlYBysqa/OPv13r/2kKPt8cqzfOim1AoRYQSJH
 RCXai9HkR5no6H98jyYYbS1SeWDBN+zVEJ5P6b7DcxIL+gfaUWQTPJGCSGDHB2v8J
 fpkEV69KvlM5wCBYJSIMvInBYsTX9avTjB8FO7YRRC4V6YHHMbNubCNzb/evjdvHG
 SEHCIe2485W5wL3b30Y54St/iRehsqQcaA+1MdmGVk/NeRJ+Kama9N69x/GyzqcvX
 zyXVCx0FamEr7tPjmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=UP8OOM0U
Subject: [Buildroot] [PATCH v2 3/3] package/containerd: use --no-pie on musl
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
Cc: yann.morin@orange.com, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Disable PIE on musl to fix "read-only segment has dynamic relocations"
errors during linking [1] that appeared after major version bump to v2.

[1] https://github.com/golang/go/issues/17847

Fixes: 9c2e146ca9a21f0de3c97981113a57c58c3a5bd5
Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/containerd/containerd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index ee07c22495..1f70a26ebf 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -49,6 +49,12 @@ ifneq ($(BR2_PACKAGE_CONTAINERD_CRI),y)
 CONTAINERD_TAGS += no_cri
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+# Go exe build with PIE doesn't work with musl.
+# See: https://github.com/golang/go/issues/17847
+CONTAINERD_EXTLDFLAGS += -Wl,--no-pie
+endif
+
 define CONTAINERD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/containerd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/containerd.service
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
