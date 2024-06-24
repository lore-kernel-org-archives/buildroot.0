Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2688C2BD05
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 06:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2442812D3;
	Mon, 24 Jun 2024 06:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4rbRYXQG_HEV; Mon, 24 Jun 2024 06:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C558D81308
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C558D81308;
	Mon, 24 Jun 2024 06:56:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AF551BF4DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 06:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33B15812EE
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 06:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jr1dBErL8B6s for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 06:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C19F1812D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C19F1812D3
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C19F1812D3
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 06:56:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.90]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8XPn-1sPzGo1Dur-00u3Zc; Mon, 24
 Jun 2024 08:56:15 +0200
To: buildroot@busybox.net
Date: Mon, 24 Jun 2024 08:56:14 +0200
Message-ID: <20240624065614.9276-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:hr1R2gnT1uCsgzjc/epgTDA+6E2FlABVdBRHZ7Sb3K9MxJmrfx+
 X3hrbRXCvEYHPYvS9rtJjoRvykpmc7VC1mOnixZgpxsM1mvhvazCjeWyGLiAFjXfmqACeQn
 KdmnxIaQuJspPnuqSboa4wqGgW0NsHmiLUrT8Pdd826P/rze+CNelgo+G6CJUW8zj6TibcJ
 v7Ymu9tp652vRt1WK0+Eg==
UI-OutboundReport: notjunk:1;M01:P0:t0AGgEK7Kv4=;zV4/6VeA3enyRpY2GTq8rx+VGls
 3Igeu9TS3qSqIomY3wNMHznow3Qg7sR4d64g7Jg9lhhO++ejyyItghEHI5234a6J8n7HeuDJD
 LLXAs3c76e9sByDHMPAElIil3V2fJobNYC8Uz2Ge2Zy4OogisRtdsb1HPaxKCkqfq/TnzUhef
 MiRs1zb7zjaWEoQ8VGgyXmsDTq30+ElKKDYMrDpO5L5r055rboGHQCT6UQK+Pk/j0CgGORPIH
 wf2yrjOxGtdqGGrt7lZzJ7NYorb/V5Hj7GZ9NjZj7aMcvt6rib5gEfvd3/jXO+7UOmk9eRaqn
 xNpHUgIFTm3dhDGr6H37YWixKEkjBYfSj/ZKtlG18az0mO8BSiAUs6Yo8JOHoXLxNMKpXHWU8
 Ah5S9g/2gZF6m3AKfn0THhv4RFyogTKSncT208ZWv4Uteq7DiLQDSrLkgHGmBiZMQDXSly1I0
 iMMdhc3gPyVEPVmr7b94CHt7dIwvhR0FiNL20jM9uhGoSqht+wgVc7ri1jTe7nVN7UCnukff+
 s51OlwJPsK3hfaEZ/ZOF5Lq+wx1QjE1VBxVoahWzkdcbDCN8Qiz9VC7OIwBQBf/dgNAAD7Uwj
 V/xQRnK1EZKusNXVToTM4B16U6EvbkTQbRUKzOZFBIjQ/SpAx2BZDt+6yz5QSV+Qxc40ARlg2
 kBgefWKSf/nKDcDajmxdzKAD8gqijjSeLW7Oj/3K5dHCufPMZJcKFMMX/DwMh4oC75B5/2DeV
 WLsKnV+2CJbJkEsgn88BZELI2DxqB0sHDFlsk+WplUuOCsX2Nm2vC7nXx1jTwzZQ7Llrya+94
 3jVe2rie9JWcDICiAlM3KDmJsljlybuYwDbuDe7lPRo9g=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719212175; x=1719816975; i=ps.report@gmx.net;
 bh=Q80ao5PbMJBWx8A/vu12cwLwoSDS89/Q0UYZ98tGunQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=MNoJk/3JMNJraGuFpqPzkrEwOKEYgLe1BZVgnmsMLHMMm22mhl+00PsSz1faWKvL
 e6YkqjUPSuAA5qhMTlDpqGHyM38Jk87uqZsSwLVj4J3HyRirpg/5SjS1nR5eckiTo
 5R0RKGcNn6yG6Imk9HGsSZx99Jl3kEyBiOcs9OdqwWJf1MtUD7AplzDU+QonOxG7s
 I41CzxArEFUSiHMCDnS2vmOCzsZMj9P3wstIlLUnCkP7YoYaNGh7/Wt0k6RGrUl9p
 X3Mncf/uZqym+K9G+EKcrHrfnzATIPJkI0Uy/CdCX8moerjFtCwNHZ98df/okuwyk
 UbqERqGVs7VUyq0Elw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=MNoJk/3J
Subject: [Buildroot] [PATCH v1] package/libxml2: security bump to 2.12.8
 (fixes CVE-2024-34459)
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- fixes CVE-2024-34459 (Fix buffer overread with `xmllint --htmlout`)

For details see [1] and [2].

[1] https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.7.news
[2] https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.8.news

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 086bb41098..6da8e57dcd 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.6.sha256sum
-sha256  889c593a881a3db5fdd96cc9318c87df34eb648edfc458272ad46fd607353fbb  libxml2-2.12.6.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.8.sha256sum
+sha256  43ad877b018bc63deb2468d71f95219c2fac196876ef36d1bee51d226173ec93  libxml2-2.12.8.tar.xz
 # License files, locally calculated
 sha256  7fb0a66f3989f9bd5c7e5438a3de02cd4a7a47dde0aea2f7ea2ba2ff454ee6a4  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index e7ed6fb752..001d7bcc07 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.12
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).6
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).8
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
