Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D33E606A327
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Bl+LKB3n
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4A7B80C93;
	Mon, 23 Nov 2026 09:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2TaPVaDmr7c; Mon, 23 Nov 2026 09:54:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A565C80DE8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795427648;
	b=PPveSi1nhMR/To+IEJvVK97FzOie5PBiwPoktsYa7iIKXNBB+PhB8dtVQnVw+YHVMePT
	 NZgFXErS+mqOquPP5WTmQko4Txm68ZUcqvNHjgdpc826ApzbDbDK18bdscYWr/5naBlxO
	 SAFMakPzqWnw/wAC0yofOw3Iu36jcE/f03dbGDcoXBDPdGPalC2RiVC3uCzkBlCBCYnvB
	 eSnt5kmqOBHnSiDGLxYx5fA80yIUjrpY7k1CAkBmTA6Mspjd2AzVRi1AAnXBjub40Ty2u
	 IAAnfpMDYFp5zmeWx7BgpYoNojqyH1082AZ5f8/++xSopw/mSj70K5oCb/uMOec3J5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795427648;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HG3mUlY3vdk5tDwftaRqgHfokwAQ1nd9TVfb2EWoQLw=;
	b=XIEQDer2BJshvBgxeXLkg2rzf7YmHBitr1FxZTbkFQ4aaN3Hv4JHoefd686k3e6vBeWv
	 hyM2tBHqg+DfNdZA9MyTgDGGiUH1LNVi6JKUeACFYSLymeRbkIC49eDJ7TGFfKePYpBYE
	 0Eof8lGnyZdFzG4rB5lh57gsOvT2S7L7kHd4NaklW8RRoIy6XmVmfRalc0m2PdMOKe2Be
	 JNKjzXkZxHSlQxpYtkWDC2JbVnE2lfk6QClXXwkwa1Ye93i1zuwPWxW+BVi21qRnjGoPN
	 Tv5wOqFXSGYhZexn46rACDQZUZwVxYKBSO/MhPiE+FskNteJcGCKVcdHkIJnsZ8Ac7A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=none header.from=devoogdt.com;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795427648;
	bh=HG3mUlY3vdk5tDwftaRqgHfokwAQ1nd9TVfb2EWoQLw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bl+LKB3nWLZ8swEjsUgSoYxf+wIaDP3soPD5MbazuRTW+xZLRVMpMF73TZLXPbp7s
	 7jmW7lvRVZZvSzMOU0qUyWKnPR7xUyAI1frICq2f7EnhIsJUDz9QL7KBKPhiU6VDAg
	 WJhpoU9RfUS2A8Y5lDPd5KLiuCo3fJ38itclgy2+OuZgsi6jTVNg2Wuf6ZlwLeU2AJ
	 WwtgZWNUV0GczddImB4jDQ3aWghVkNwryKskNCKUmtsGsmrgn0g2BIBUZX/E31KjQJ
	 vgeGGSfx7VFjwJWeMYQPgpPuV22idUDNbus9gQdiJ2XW/E8yG59DH99Wez78gObkn+
	 H8JyHddFSWvdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A565C80DE8;
	Mon, 23 Nov 2026 09:54:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0A2F1AB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A255880C7E
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocDh6YGDjnKa for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:54:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 99AF780DC5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=209.85.221.44
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.44;
 helo=mail-wr1-f44.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99AF780DC5
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:01 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so2937416f8f.3
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 01:54:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795427639; x=1796032439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zl12rbmL/vytoGohEzHBQFNz2OyQotgTIVgQ8+bgbl4=;
 b=lsvqXqN3gi+2pbySV0Bccjr5Jivw4y1eV0i74WT9i2VRxDIPWssmSPbe8aDKZvJCzG
 169FVMw6OiDhXAgjAwx7QR+3r9Igabykfh/vwqoMXIgniL6xMJvwl0riEIZZJzokC6Rh
 IymT3HjyOL4WbrfJuTd/dm42plBPg8S6UcL91qRSYqrcYA8HpHiYgRZ/iI60HWT6+IhI
 u7QhuaVVtlMA9JGcvo/KLbbRFD127IfR/1CS81fntaKBK1kCuTFvY5sy3bXYOYGf/v0o
 sXT8jkcUCu5dnlY8Pz7w8sd0isscEdNWDdBSte058677Wb5osPA+GlMvlUd3j8uGqxv6
 T6fQ==
X-Gm-Message-State: APuU4Z8dyB4hr+ROdvk/Hm0Rbk2zsRIDBrfdVMrSlYxjuHqN5YnVgDt8
 L7Zhto1nIxBoeJjF0+ibnsVLePWzUETf9np6ECfdNqgYkYyeGlp8o3YierLSwC/k
X-Gm-Gg: AZFdTZd3wB7AfnvqlO7bZyKiM2Lvgz1ovzVbZ7QdZiYTERRmCY8xbrlnOOnHzSfegxE
 vj4xs73/civZdBeUB0bAdUUl7Gf3b/5GclTTSaqzorZhJSTG8mWiBkFKLBaQDGjPPJvV9Jae/0o
 kYq0Lok1n5Vurm4Gst/hLDCjVJsseDJBIoEwc3g5y+1tSdc06olvhBuzsWFaydIfCRO03PQoxjC
 5jbpFJBZPu8RTbBtn/483k0JE/3nAjR1E8bXty+6U0MIR2Mbav3a+R9mmRsti010eTqNsxY+Q9O
 obtfmC3FUzPTZRC3uJ/I+uBjBzmL3AgFiF7x/KFltehnnD+BaqlPaD49SxtyDnkdB8SjcKkwBeG
 7rbvbRCre8lzPm/MlcnTcysrt/Ehu3fC8kOJKaz022tUnL0yvWVRlK+VihaHOAoWXUqbiWQXo2Q
 k5xhqmaV7Joo+BRNT6YbF+tCjMHLagGp/MlV2Np2bU9V6Lg1joih6h38sjtfL7yVZKDd4T7zcvn
 LysqukXxQFFBWzEtFFnkGP62oeMMccvG29jQBDvs2d/5+bYSC2EOzKe/TsEqk9tlBX7J8ygatYA
 WKRahvZvGFX7ld7EuiDnJdR09mxBwzBZAJxrhwbFc4BeaKRIN2D6JQTvvHqJpolMzFuz0iT1mcz
 UniTahjlU/E1P0FngROFhBwXMi+BcPP7oqTmTK3he+l0GLOj+It9g99GcFKpTFWrtITDDU7yVlv
 OZtKPFdUdOGA==
X-Received: by 2002:a05:600c:3509:b0:4bb:76f6:d23a with SMTP id
 5b1f17b1804b1-4bb88814d16mr239341795e9.21.1795427639410; 
 Mon, 23 Nov 2026 01:53:59 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4bb9067846esm186202105e9.4.2026.11.23.01.53.58
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
Date: Mon, 23 Nov 2026 10:53:33 +0100
Message-ID: <20261123095339.1566394-5-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123095339.1566394-1-thomas@devoogdt.com>
References: <20261123095339.1566394-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 05/11] package/libsoup3: bump to version 3.8.1
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move from the 3.7 development series to the newest stable 3.8 release.
Drop the dlopen patch, which is included upstream.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/libsoup3/libsoup3.hash | 4 ++--
 package/libsoup3/libsoup3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
index 588390b9575..4cc6e590566 100644
--- a/package/libsoup3/libsoup3.hash
+++ b/package/libsoup3/libsoup3.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libsoup/3.7/libsoup-3.7.3.sha256sum
-sha256  4e6a67fb8ff1376577afc24a26c842a347b0034eabf71ef13d0382b1c5bc05e7  libsoup-3.7.3.tar.xz
+# From https://download.gnome.org/sources/libsoup/3.8/libsoup-3.8.1.sha256sum
+sha256  5013dcef9136f6f861e6529fca578af50c1f52a39219027fb5aff652d1371a04  libsoup-3.8.1.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
index a850fbaa21e..8197f33191f 100644
--- a/package/libsoup3/libsoup3.mk
+++ b/package/libsoup3/libsoup3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSOUP3_VERSION_MAJOR = 3.7
-LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).3
+LIBSOUP3_VERSION_MAJOR = 3.8
+LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).1
 LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
 LIBSOUP3_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
 LIBSOUP3_LICENSE = LGPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
