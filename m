Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F172BC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 13:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9C02417AD;
	Wed,  5 Feb 2025 13:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Ve982cN4TPB; Wed,  5 Feb 2025 13:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8475A417B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8475A417B6;
	Wed,  5 Feb 2025 13:58:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B59EACD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A43D240BA4
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFzP9pIHUtmT for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 13:58:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A0E0411F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A0E0411F6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A0E0411F6
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:58:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.32]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MD9X9-1tWZFp0mDx-00EYZW; Wed, 05
 Feb 2025 14:58:40 +0100
To: buildroot@buildroot.org
Date: Wed,  5 Feb 2025 14:58:24 +0100
Message-ID: <20250205135825.2310972-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250205135825.2310972-1-fiona.klute@gmx.de>
References: <20250205135825.2310972-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:MSRLzv7pus4GRvu2p8WQpgm+jIC2G/7zz088aX0i7CvS6YSp3Px
 kkjoY33CwjSY0zUcbFp2KJ0Z97h1JfsnLWzqYTprrUsDV9Q7+rgaqB1rJ4Ajlw1gWqLGTup
 0iNaBhYDD+quPXazftz9+PFWN4+1OHDs9zWJ6az8k6p0Hn1o7bQ6rbc6/Lh0NRSrT+Jja9F
 Mpz+tVrd2ce9gsfXS7a4g==
UI-OutboundReport: notjunk:1;M01:P0:rb0eTtUjg9I=;WKSqyxAAJCBGanN4f6fP0NJlaVm
 QBDzu5mi2rtVZRYiLUC4hCeDuq76+MKLgpfO4Vh86wii856AxEkjMlTpOcDYWpWGnQ606aIli
 m9JCIMJaLcRj9zLXpdoLc/X5fJ7QG5jYgrqxTLRvXMi4H3xaX8A3dvbF68/Wi8kXonIkmQhTj
 iWpuyhV7TZjNU/FBY41f7HmiOuM18kxUsLUAYTyiqnyY1QmTzGy/RSdg7XBFQKCXtZGu3dnH3
 nyehppNtyoQOIELQc9Ut+yelgpkTrptuSRZzv5gHp2V++6Sil7Xozj+DqnP5xfvBzQcO+fkbJ
 kwGtoiND853wiIS+ZTT3H+WhasvMsLjTF1Gs8jRxFjkvTclEFsFo9roviSZ9jjPnymzsa+jfj
 Op5V7Le2IJaL6xSJmS2XXwdTguMC+Xc/qmUkR17MRFfKW68A1JscGOdNg6c7fh5Vv8P86QcQq
 HyJuzC8OIfYP2See8nOaQcLQMn8E6hCd0KqOoMQD1f7r4fwrET4m2I+47nfOXpF8EXcj/GCoI
 kja+e0NeUVXEsE+IXRUKIXdEsaLd4Omvpw7GIILuIL3IoiXWe+WASqUZPSiMi0J+oCQuabczB
 ZJopn0UxjQ2vmGBOtPE96Ti6JDE2GwkyKWtnFvY7cHqHDPfP7o/q8aOdjIjYzpNbXKkTEQYh1
 cO3uhfONhOLm9kFEL/VhN4bTmlBDiUPpqGg+Y6Ueb7KZr8ECzQOa8GYrTL6u5XRRmKLLISrTi
 I54aEt5NfghXPjzG8mt9wLmgfyoMYykU5fI5MlEqmnsYVjxZ596Qf4WZVjpT3uU0JMv0d/vur
 0Plrw5nbAg7j/UJBqHHq8PkCNuI7skDqeExFqFLtoYDdZ4CUdJKqJYhPZt7XCK0MNNNonkdkn
 2rLy8TIkWGUqwvi8y6d7uj196+Tju2xhNJjOIfVZgOaH6nEbRygg8E+oHa/v74dhcbhjApjwe
 RIne/af8foeZ93FNj1PsWBevkRyy5AIZFobhJhE+mKC4CNJSLV0ktZkGDwtYdCO3x0ESfTlQA
 CJPv5d3kVxIkLVJmxTAl8E6SB/6uwWqDvvot3yrUrlZlz4ruZPN2GbieytTGCTcPbIykLtzBM
 Ov7x0eR3a7fRUEQURUJekNAWNr6IsGey6dvkp3Fq3bhUFp/kAfc7B1cNMIwUXHgU9uyxYMlHt
 jiNN2Wkv8IZ97YJokwaoDsjsrRj6i6GdzV66yUtlqriE6+b+SD7GMqI7IV1vs9Bmnv92CSiDq
 wY/XBIeFtE0THstHmg907/pEE1/i9lXni469ki6ZlMISt0lgOd4QB8n3dIpiq7eI4OXj07yYE
 Bn9nxz6Ia5RUOkw9/+GK65no91qSZnkZaZuL6Sy9PPZ+BE6AToCfxpxH8X1dDknhFYndJsEw7
 kjlyLPJbQtXgTkcVfglavKbEDMxvElEEMVxk0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738763920; x=1739368720; i=fiona.klute@gmx.de;
 bh=La77xq3ZSBT/NlyjIk4bdeYUKcXx4nrAdiDOv/LR9hs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=O3JnMGw5pdqy902d7zDjdYy72r8vYRQWGbQPkr2ZssxOlp2XnPrYLozVaL25NF3R
 g43N7eGAg2VCjfsrKa+XAUaIZTY9oDmloph+bQyVXZ/kU6+XCdaMvStObP0ohkNQs
 iSDeJR/g5PiqQpywvY9cL2drVl1R7E5tGsQ12oXGh2SXx9jzzxGpEoLr1f0+yufYC
 /NWnRtXWrSkY/aNvIFT4Qz+M4V17QIq+8fuqNgQun4FSrIjV3SfXL66TV7QGBoXID
 Ns5sFMFx5l5h55+k8spGgrg/5FHsbfZbFNNvlYKthrPbpxU3OUWqqdaYVyCiHn+fa
 OkuwaXD1mU5J1BpNWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=O3JnMGw5
Subject: [Buildroot] [PATCH v3 2/3] package/pkg-golang: use ld.bfd instead
 of ld.gold on aarch64
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

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Go forces use of the Gold linker on aarch64 due to a bug in BFD that
is fixed in Binutils >= 2.41 (that includes all versions provided by
Buildroot). Forcing Gold will break with toolchains that don't provide
it (like the Buildroot toolchains), so override the flag and use BFD.

This override should be removed if Go stops forcing Gold, and may have
to be adapted if the set of available linkers changes (e.g. with a
future Binutils update).

See: https://github.com/golang/go/issues/22040

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v2 -> v3:
* Note in commit message that changes to the override may be required
  with Go or Binutils updates

 package/pkg-golang.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index a3421af288..bdf8de4d66 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -118,6 +118,16 @@ $(2)_EXTLDFLAGS += -static
 $(2)_TAGS += osusergo netgo
 endif
 
+ifeq ($(BR2_aarch64),y)
+# Go forces use of the Gold linker on aarch64 due to a bug in BFD that
+# is fixed in Binutils >= 2.41 (that includes all versions provided by
+# Buildroot). Forcing Gold will break with toolchains that don't
+# provide it (like the Buildroot toolchains), so override the flag and
+# use BFD.
+# See: https://github.com/golang/go/issues/22040
+$(2)_EXTLDFLAGS += -fuse-ld=bfd
+endif
+
 ifneq ($$($(2)_EXTLDFLAGS),)
 $(2)_LDFLAGS += -extldflags '$$($(2)_EXTLDFLAGS)'
 endif
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
