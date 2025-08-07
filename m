Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B30EC87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E262807A0;
	Thu,  7 Aug 2025 17:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IvuHJsfpkDwB; Thu,  7 Aug 2025 17:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74EB1807AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74EB1807AE;
	Thu,  7 Aug 2025 17:44:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10FB631
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02A7040022
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9sm_O-qxjtfl for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:44:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DBAB74006D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBAB74006D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBAB74006D
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:44:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D4B1442D3;
 Thu,  7 Aug 2025 17:44:08 +0000 (UTC)
Date: Thu, 07 Aug 2025 19:43:47 +0200
MIME-Version: 1.0
Message-Id: <20250807-libldns_drill-v1-1-5d8713fb0860@bootlin.com>
References: <20250807-libldns_drill-v1-0-5d8713fb0860@bootlin.com>
In-Reply-To: <20250807-libldns_drill-v1-0-5d8713fb0860@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bernd Kuhls <bernd@kuhls.net>, nicolas.carrier@nav-timing.safrangroup.com, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdduheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeikeevffduvdevgeegueduuedvtdeileffgfdvleetteeiheeivdehgedvjeegleenucffohhmrghinhepnhhlnhgvthhlrggsshdrnhhlnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsggvrhhnugeskhhuhhhlshdrnhgvthdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdgtrghrrhhivghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghng
 hhrohhuphdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754588648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hdbMdVfWPFl6ApACRNDX8vjmWu8EzIfJoYbXxFZnKGA=;
 b=cN3pp2VLWdlStLw+VW2ZnKoPaswxGoeVzm7wKMV3BjLXmQHu9otV06OpOS9ih8MhSr3/oi
 0NMdvnNa30sea//cBdtFWHYpPhkCPFNnNNFUOHxWDdN8blwBnBNirq6B9BJiXsgMxpl6NY
 KxHa5nLFR/ytqdhfrxIPpDAo/2CoHe8obDZzBVXUW5A9jt9nA6ZCqFDDJ4HNJ081AjUrry
 I5EkoHV2HPqeY/wdVKU8ned/h4q6HryONeLE9c7ZGmvW4cjDEwRxBfZvI1ayy3jkpEvgFY
 LuIzQkmDIAhQ1CeKKDMBiRxNGNe/UpxClp3PYOHWAiS8l3tSE5InZb/Ddnh7cg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cN3pp2VL
Subject: [Buildroot] [PATCH 1/2] package/libldns: add an option to build and
 install drill
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The libldns library also comes with a CLI tool named drill, allowing to
perform DNS requests. Drill build is currently disabled by default.

Add a KConfig option to allow building and installing drill tool. Set
the default value to n to preserve the current behavior. Similarly to
linktest (see the comment in the .mk), drill fails to build correctly as
a static binary, so make the new option depend on non-static build.
---
 package/libldns/Config.in  | 14 ++++++++++++++
 package/libldns/libldns.mk |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/package/libldns/Config.in b/package/libldns/Config.in
index 696fec97b59857fbd99bdcaababa09d49774f3ae..7a169c495281be01b2ee724fd2f9e27b83f5e2ec 100644
--- a/package/libldns/Config.in
+++ b/package/libldns/Config.in
@@ -8,3 +8,17 @@ config BR2_PACKAGE_LIBLDNS
 	  experimental software for current Internet Drafts.
 
 	  http://www.nlnetlabs.nl/projects/ldns
+
+if BR2_PACKAGE_LIBLDNS
+
+config BR2_PACKAGE_LIBLDNS_DRILL
+	bool "drill binary"
+	default n
+	depends on !BR2_STATIC_LIBS
+	help
+	  Install the drill binary
+
+comment "drill needs dynamic library"
+	depends on BR2_STATIC_LIBS
+
+endif # BR2_PACKAGE_LIBLDNS
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 0740d09fab2fd15592c3d55cd2c1932664ca3344..6ced75a44fcf5bf9c95e443181362f99c9375eeb 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -45,4 +45,11 @@ endif
 # interested in the lib target anyway
 LIBLDNS_MAKE_OPTS = lib
 
+ifeq ($(BR2_PACKAGE_LIBLDNS_DRILL),y)
+LIBLDNS_CONF_OPTS += --with-drill
+LIBLDNS_MAKE_OPTS += drill
+else
+LIBLDNS_CONF_OPTS += --without-drill
+endif
+
 $(eval $(autotools-package))

-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
