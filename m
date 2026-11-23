Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FE5606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y4Ikj4IX
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D26DE40685;
	Mon, 23 Nov 2026 09:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id irhVWWAeR-TP; Mon, 23 Nov 2026 09:54:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E5C0140684
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795427651;
	b=gzyjB6WHc1k/rBi0xWPX+aMHlqMV5YPB9nhX+wtsLOdixh9r9PDQaoe2V5scbkcuFeER
	 OS83YsUXudjdsVgL+NDI7dnD26eN0mTaxwbRY7Jtqg6OOPMXQYj3s0zAxaLlh9xduNpls
	 eU7fG6mQ8E/Aovj89rXHqlOvVLVlNWFlhhLpn31GkdzHGkTdcniuSUKkkyZ54neavz8PU
	 eA8LUIBbX2XW0+qSM83Mfvr7GBfEypG8qGalZdiX4f1Kh6gsGG2U1sGbQFdk5sw3Fquo2
	 USzaclbF88jPKg9T089PnYXBMUxjZ2XH+hzEEKdGuUfiqy4p0q56/q/SVeauHV3510w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795427651;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6EKGXoNQJtX779AMA0J9nq/4GVgygDuubMQaejNTLcs=;
	b=YQOofOot+TiSmKFmg3fPQY4mJH7AlfNrD/PyzuUJdO+JhoAmtIj4SJ+DAyk8fLrcv2DU
	 KPTgPpF59LrAbpcYwx0qI67i2V2hAdh74Akjsl6DQtT1It7YankKwgfZH5GSjVsMPv5Gr
	 iS0i5/JhQpfXE8tFJ3RBYNL/B7V6/gda7j0HLTWvrd8cepZIdaAn5WmJFO6s+ulKNV1YW
	 +qsmbo2jdkPKxu1RCkOzOH2pkLdxgsrio7jpHQAcR6HX6zkh+RgE3nhONHah2vg9eOL6m
	 VOCohBfTx+/FGWJFYKVoQj5wRonekenZ4iPfwtIEbnbLyUs/WQri/9i3xewllxsQDWw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=none header.from=devoogdt.com;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795427651;
	bh=6EKGXoNQJtX779AMA0J9nq/4GVgygDuubMQaejNTLcs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y4Ikj4IX9lhc+VTfo1AksTDlHxqDI12svhSTcbJljD39c/mSX9o+86BGXpQMTexFB
	 IskfPoKXHPvJJcb+gfMXaSTMYj18x3JQDZpLbPNFZH2ksj8PJqBsR2UP6BRF0happz
	 LkKgtECWAh+hS8oCfReBbCqQnao+Qv1eQNvcHTqMXK4Lcea8uvM/bW3UEaXQvStcvs
	 6xJ3p2mCtXplpV1pXmXT02EPVf6Wb/0gGntXvV9S4teqI0zhRjHPcI0S556Hh/0lHe
	 hfpKZGNjR2J3wxq6hmgaARcc7ZhGDWeH5kZ3G3APLPW1CaupKJNigiub3aTcD4IeMY
	 4pE6kW0tddsVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5C0140684;
	Mon, 23 Nov 2026 09:54:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E5F3499
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ADF240668
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gigpebrdEJgO for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:54:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6A9464066D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=209.85.128.42
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.42;
 helo=mail-wm1-f42.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A9464066D
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:02 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4bb6c7b6dbdso28015855e9.0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 01:54:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795427640; x=1796032440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wi51LakkAjpS9MsqQKfjqN2+KVUOqoJJUqP9pCo184w=;
 b=K1uRbKVgjtUWLIskkeaKqP+X3WL4ywID/wmwiDwelnqmWzli/YAKGPEpgsALJUiWFl
 3eGspuBeC/919vmNJGMcFtvAqDykg5z+Bwqe2vhLB8qiUO7byLkKTjdBWTxENruilnyV
 EF/SASU2e7K6iiNAdEam4HWFrJ5vNdCkRazzPqkpK1NwmqIcLc25qy9sgqG1rqQrJNG7
 XFoixhFZgcGsFrvPtzSLhEINKdFfuQdKnVAj34shYrNP0JvZn3/zq5vB3ytsTsRP/aoc
 ekW8J3PmzkNjJ9xtKwzj/jNxeerDwlQSnWazJHmDMao0yxYea0N0TYG67vmdg1/a04AC
 7k8Q==
X-Gm-Message-State: APuU4Z93b2676d1Xns4rTC+r1OYroi+pZ7Ye2xAFxS4LqXIPtJxibFWp
 o3QIsA3Yi/0N8KeaO5jm81Qc0jwIPDGq8tDAdHLFTIIuNe4rhKaPWAMd04fQgZ37
X-Gm-Gg: AZFdTZcFa5UBi4+TC6Yp9A85zaVeqaDQycPPpQJfRJXEF/IRf3KIjscihNNxVxdGMbk
 3x+3FEVnzNMdKOVGW88IQyiAIPLDRPJaVzTPHKw1xt5JDybnartxBHNR7oS4+63h9l8TdxC5Ems
 O5lKB0IiAj87Ko2lNcQzxClAWsXG3bGkPlG4TsCwdtj41tjiWaP19mi0LLpnT0yBbnHprBn54+z
 t6WY3Hq8u8COUncxmg/Eko6WMVhc3c+0tquyg10Dgzeks2LhchChg5F/dzWEaBTzV7xVIhpnNJ+
 9638Mkfrs7H9nJeaAl342QDKQMDETZ3oVEtA+3JWaY2bUX8BHfvD3nv0StB2DlrxDO03IdSqyEj
 m8+E4uxwt/OwpmvvbwkibxRs4k/9rTJBzItpH4qZQ4iCfWg8kV4YQmjJgmRzuUN+9M/OcCOdB8L
 GZlmVzLbShSGvV4MOUWTrPsgRslSU6Gor0gsHGaxjdestyL/BGdiMJRRXEgKBxbwq9ZZ/izjbI0
 DGYbrCKPHvtNEfeU7Cq/50JNndsAUk6hpz04/MvSyzYzm9jdf5sAs0e64e18hbo6cdydyVtol95
 pCR0bTszfyb3v9+3wU3r0b0UcxXbFJWK1zku2fBSZ6hJ4MUpqSPNwwLA6CG2HPTwWT4LJvibcFr
 SKiBlZjLkwMlUPvTlVw64WhdOHg/x20OQ6Au2FTH55ex6IPg9gbeB1BG28l5u3F0IRj2zSd1ZSD
 /zKOLjrBxUgw==
X-Received: by 2002:a05:600c:34c9:b0:4a3:5d64:df91 with SMTP id
 5b1f17b1804b1-4bb88810d28mr241672605e9.18.1795427640155; 
 Mon, 23 Nov 2026 01:54:00 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4bb9067846esm186202105e9.4.2026.11.23.01.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 01:53:59 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Nov 2026 10:53:34 +0100
Message-ID: <20261123095339.1566394-6-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123095339.1566394-1-thomas@devoogdt.com>
References: <20261123095339.1566394-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 06/11] package/libsrtp: bump to version 2.8.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release:
https://github.com/cisco/libsrtp/releases/tag/v2.8.1

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/libsrtp/libsrtp.hash | 2 +-
 package/libsrtp/libsrtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsrtp/libsrtp.hash b/package/libsrtp/libsrtp.hash
index 89a5820f496..e3b01ead59e 100644
--- a/package/libsrtp/libsrtp.hash
+++ b/package/libsrtp/libsrtp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d123dcff5c56d4f1a9006f2b311ea99a85016cbf3bb24b1007885d422237db85  libsrtp-2.8.0.tar.gz
+sha256  ef5569220749529d778013aae1178391d972570a2b4f7288dda22effa875b07c  libsrtp-2.8.1.tar.gz
 sha256  8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  LICENSE
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index 076270cbf92..7f3f91516d2 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSRTP_VERSION = 2.8.0
+LIBSRTP_VERSION = 2.8.1
 LIBSRTP_SITE = $(call github,cisco,libsrtp,v$(LIBSRTP_VERSION))
 LIBSRTP_INSTALL_STAGING = YES
 LIBSRTP_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
