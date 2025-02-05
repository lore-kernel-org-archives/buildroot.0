Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02311C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96B134251D;
	Wed,  5 Feb 2025 11:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_dqJqR66EXL; Wed,  5 Feb 2025 11:35:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1689A4251F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1689A4251F;
	Wed,  5 Feb 2025 11:35:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FE3812A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C78F414D6
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxm5UUUGYk9y for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:35:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C5A9D414CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5A9D414CA
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5A9D414CA
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:35:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.32]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MO9zH-1u3VAb1lF3-00I3FJ; Wed, 05
 Feb 2025 12:35:40 +0100
To: buildroot@buildroot.org
Date: Wed,  5 Feb 2025 12:35:29 +0100
Message-ID: <20250205113531.4161633-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:OsIRGeMyHpvlvuct+USbdrEkL2KMjz63duY9TmGhFtPqz36SPfS
 UMqXXJWpqYaLJcbe1PcYPF6bj1KagSJhr80NYBjVzN/TyFA4T0VNK57qOp/7RS8bpDExHwY
 3y+iVx559H0OlXAE7pGN/WSJHMfCAJ30osbkGQF48+eo2+FKvFqY1X9Qfkk0tO611JklfLl
 p1/8kHdcubF/vQMYSVP0w==
UI-OutboundReport: notjunk:1;M01:P0:xK3wGD8xAFI=;acUkxnpGgGI0hQn8VyLW706XLlk
 V8yweVDCznFkLnJK822s04rDO8Su1oObHOsPWJdHQDzGl9npJ9BfbPWijNPF39Svrfvz5rYsp
 6s+MHGXBKo3msw+qtAXKIQ/UASZK7nAfUTg+g3BUKfEfm5ZuaVWCO9WGwKmzogISa235afg+K
 Mlzxgy+u9cbTf/mXtU5XeEPRLmdh3JT5b3RtAOSsiAE0AXDznLFTxLzU2wd0LixhZire1IIqv
 UldQEdd0ICDGhYSws4FdQRhnVlzckqlvPZESL0ZazB5PM57smuiJ7QhnEXZe+qES3PP6HZgKT
 pkaVf4LUt+YZ1egB3QP+T9Nl0affPVhreIPPLYLT5lozs+eiM/0VQuzBlmJ6EwnWsEKwHop+t
 3pVronGOSQ8doIYu58c97PHu2LGgi19n3TQsF7ktsq0HZ7b6ckJvb1iF4OXrICZ7XYiGaffVv
 4FafNp97KTWBkfNFKbXbIDHBsXvuBVMjKEdq9FZkTvjW1xLHTzuQasnusknU0zpxdDouHziI2
 qVwvjSyYDfwK3QRKET26Vu9aKa47vjjmRY0B3CPf6I8erFKmWZ+2yOMcAskTlA/qHRDxf4QY9
 JMPCGP/FbjjdLje+MqLs9+Vag4PhNSVySKa/uvi0KRjK2pMKUlKNham2GwyPi+omRZFJPhBDp
 gPPNf1gYlWQF48x/KxYjVM21tm1FEV0j+5vuIIvSfL9EwHYWeF2T1dlAYH4gcK5vyqKBa4WIm
 SQS08o98AQJXq6OWbin6p/SuoYwYqqz2e7funm/aExMb37CVUTqLHfuMkCRYrSDuDhTippqDC
 uJcQhrjAQWHMvql5EC2FT+0jQ5SyTJmbK69qbnaPPI2jRIMZ6PCSRS6tcSeKZXAK+uRYKevyI
 yZbT9uM9LQDaJobCw4VLUhWceNfnPx21afDh8nDNuJkJdR0rj1qddbhv984Y0PhzBFmCBn6KM
 34u2BOXx7f/vy4be+Cz+vGhYc+Ei8NA+f/5x/pIC7gakQ9z8ISlIqCbapJlEHgDQ88IX1DAzn
 xAnbCIO8tnl5AJY0qlHOiQDWt0IEegFnGxO0Kdg/0u086hNamuHdUdGV56zeqxnrFxbDU3y/S
 OwlIVwB/Dz8eZpYzwLrQZUagpXpiDM18ctKIvtyKfUyQxADKrcohPzzqQ5KdNdM4CLZoG/UNX
 EWyQBs1vVf9fBHzgMrK9IxVdLStty5Z48txbuPDrJf+v5lpBZaGl1srat4EC8Y82m1sfLvW5O
 Z4MI97cZu/wghxjcbtwHzAm2M5WR02Jkjhv4j/MiKFwsBo91cINMyAYSwX3dRcTKkrpXNcFtY
 9q9jwrdLO7QuaRHO7kPUEP9YQNtC5murwgKu5ozfCg/YYomuMK20KQ2JjGlT4Pho48FJbJ94n
 7yASnXSRiFW0RAQQhgYu4UmJrpdgydPjt0IPOPP/9pm7G7tXabQ2KBYQhP6qsWu9B3Y+yjHQO
 7JIctCg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738755340; x=1739360140; i=fiona.klute@gmx.de;
 bh=RSHhA1L8GBp6Dfq7kRys6fkp8cvL3kN2Kb0xyLrMYKM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Cy6jB5TGkqxw34hwmM5kJ2zuz/pdAsjw4F1Aoxq34WghIfoaktAA8kWsIRmuuQRd
 mLBtFUC69343b4o9SIy0lPkE84LEg1WcCgR7IKSMKNNR72KklZ/SMCg0m0J2W3oZ9
 9sDjyWxCVAyJfiiiI9fVjGAvfNiadEgkWE1RABEX6kX2H+M/wd5QZ7lMo7TxC5MiP
 ZsrtaQueq8Cw3adhu2XaFo2ts1dvh0L//bCBXWAJUu9wtbujC8lO3ouLuXNBhzFOG
 MY9mxSP9QCoqQDKQSivXEC6ZIrKhwBwN7GWN85gq0iu23zor61j6GBW2TV+DZjCMi
 zCaCMPXjMMOZkB7mDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Cy6jB5TG
Subject: [Buildroot] [PATCH v2 1/3] package/pkg-golang: allow packages to
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

For some packages, it may be necessary to pass extra extldflags. For
example, some packages will need to be able to specify what ld to use,
and so will need to pass -fuse-ld={bfd,gold} as extldflags.

Introduce FOO_EXTLDFLAGS, that packages can set to pass such flags.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Tested-by: Nathaniel Roach <nroach44@nroach44.id.au>
Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
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
