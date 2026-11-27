Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDF3606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fXGJ67R5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xv3zgTm2
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD5B9607BC;
	Fri, 27 Nov 2026 15:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDPQhuK3BsyJ; Fri, 27 Nov 2026 15:17:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EE2206060C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792637;
	b=MbRMvhV0OcObJNWwe/nBM8grG+Q4/yv3dJ6jphqkUwGZpi7DvQz3D9yP5PnbzDwv6ZXU
	 LC+vRBmsKfhGNcnvRl/D1NPr88HSm46ygC9v2U+LkKhXs9O/RV2w28nIOVZEYxPu96smM
	 VTmiDPohEUV1fE+FM/FmM3Brm2eloAxxRuL9o4n0w7Ns4RLiQ4dCIGo3rglEBfh+zepYJ
	 nH59H0XeD9eBFhTK4koDlYg45MQ4QZXKTpUQ7kHeO7XiFfT0y0ZoC36hPnJyYBUnHrVns
	 QCwkyfGJizz4fQB2S2zG9tIOgZiGXLnXaOsfIesY1nT4/Q6gO7TMshMbRqTqOuZkyzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792637;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zKMcoUyrVb901U3rpxoGsMIDVJw/urlMqriHTMGIpA4=;
	b=fxmj608K7oZVvp8MItOr7Z+aaOe+cG8YHaghmcjlEjfF61PNeF7Ma/dZKAIcozQGr2so
	 cKt3nchZ7HYEajNBB5r0vk1zrBJ+e071C8boUm60qKUyK0s8jcGr0z4UHrMktqVz5sCGB
	 Fo8vKGrGZVH89wKFzBnVD3/VQSlTwaZ3fV8nVmFD/3+dw7f4k8q1GjduQ/hLlrZSg8Uir
	 FrmiPX6PXqndNFoNHkZ8GuWgalZs7BkfIxnlFiqzGSI3R4jqw6HDsuhG4Zp2v57jWdV+7
	 FCMmbqmtGH0C2Ajba0I8elp7X2ROti464qatCr299VjHBky2qaRaBzi4RspSupbrWpg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xv3zgTm2;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792637;
	bh=zKMcoUyrVb901U3rpxoGsMIDVJw/urlMqriHTMGIpA4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fXGJ67R5daalO0Oa/IO0atdIEw7LeeEWFZg4sO59i/aqwmnBYYJotubAoOWXc8TUY
	 gYiNyEGr2+Z8nVDebxYDtTiwKTSCUiraoq8q4ajH4QCT4GaebG/Y+BDkBImI9IJuOt
	 6L9Gics6T4plzqPgHQ7QG8sMFo8Z0F1l1TRh3niRQSei8BnajBJLZFt/3INDxj6S/q
	 szZtoI4bZvbA82b7w2ZC5i1DImocOz/gBgYC/1CK06jLXNkbFkqR0YmmoViwPo4qiN
	 Pzh/7pXrf4Hwi124sbz98gl50jaAyT5+Hx7pOQ/90tGhWtR/iF5iOy5R1gJVTEbldr
	 rLQyenLPGcyyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE2206060C;
	Fri, 27 Nov 2026 15:17:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09BF8373
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F00CA6060C
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hc4V0wERboZx for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:17:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 17F5A605E8
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::122d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::122d; helo=mail-dl1-x122d.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Xv3zgTm2
Received: from mail-dl1-x122d.google.com (mail-dl1-x122d.google.com
 [IPv6:2607:f8b0:4864:20::122d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17F5A605E8
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:17:14 +0000 (UTC)
Received: by mail-dl1-x122d.google.com with SMTP id
 a92af1059eb24-1b3ada81853so9362645c88.0
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 07:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795792634; x=1796397434; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rsWxR0EYq2S7vetdPPtidM5TSJ+KYTa6SpR3GEvcBJ8=;
 b=Xv3zgTm2jhcKJPvtS+59LV9PeDn1vE2DOjil217N7iz8laU3RiII8HcCGFtGVtZ0uM
 v5yyu7ma6dwhV4Kyf+VSdsTSXXwU2fxReAIhx8Anr0gJiaijUkPv5yBUx6fi11JjXXRn
 8TZ9Gzzi2g7emN3wO8U6XPXt4gavOpcUK5L/cEUCwuZQVOhFcQico8OlSXyw4tYrrreL
 QkzHgKYDKFSKch0KWzR5PCtdrrv8ax8xbma0q/6Wbq3gR8lChUbVzPosX/yNRdDyXWsO
 SCbwkH0Rw2QLQBNVxj3vtzja4MqDBP1+2xFZvhDhEl69nMYBrQoyOn4jr5Vr6fdmaafY
 V/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795792634; x=1796397434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rsWxR0EYq2S7vetdPPtidM5TSJ+KYTa6SpR3GEvcBJ8=;
 b=mopdaypR5U7Iz0OjAmlQF0+U8ioGYQyGx4LsPlGp7Ha+D0UKEZM/i25QOe1FjmdsVs
 bDR5doB7SKbHH8y5fR6suUbvh4u17n75OavvKizoJf8G3ggyUTOnAz2CihEff2VWx16y
 CC2TIvf38UkjsBHFX+FmZI0KD4EOe3Oq0nVszJAHCFbAwHgM5bCIrGgXZwZGTEFzDOeK
 pBuyH05a6EoF8nhrSsBx9Vk6f/J/oe/8hMaQuVLneBEGbfochdEYMuv5CJD6pnXkZOm6
 VtnyCNC9Tk960apfPpwASiIpmf+r+BD8KHZhP98DcmJrEqidhOlztvAnSM5YQXnYLC0D
 XcSg==
X-Gm-Message-State: APuU4Z+LqZrd/+N7cc+k2lERr4UBWcGjar3sE0lnqMr2PBLYKv6wiqw2
 3sr2aC7MTrIHQhPurIHKYcOLys0RvSJrfNQn2jWbIh91c03ZIgBSnlxhENRfSA==
X-Gm-Gg: AZFdTZfoSaRjn6BkxSSDa3mmXMTtEQzevi/xI12u89VZec1apNLJCDoJbodpefOr4Nx
 JNDmnG9orrW+yg69LLYeBCW4Ogq/inLCKaVzvWXQqz8SG0/eScWkELOLHcb457uef8yb8rHjC7s
 vNeGcVVPI8pa9JXoSsZpMzvz6oFbhJ4hzvBJeD+QGoLOxZ6VUwEjhXJQFE+RUwpNGXm0VNVCKCj
 lwc2AJpQu74b8EOB4eC2e1S127sncG4DWK0as4zWaVnIkUGCdnaB3vA/C59Ft9Gf21+xcMFyDVL
 2c4CqYXckqbYz3xxorS5lAa+tEuV7POPQhgxyD3EvTdtBBXmQGrbjjtPHWqyq83jZdcyY8IR6NB
 jmz9dU39WnEwgHF8M71FC3wUHMV+s1kszSTGCY7cgy6KiSYho3KcU0IWBhE6t9G1o3B4lTmoKCm
 uBVj7WLgSFoOrK4FRPonBgsh2FuTPLGMdt7Yxwnq/qu2WcOW5XgjH0nPSGL/LW9NchpyYSt7fxD
 CqQKiPztM1JHFE+bO9MX6mShwiHUG8MGmAbzKY7368yTbjvghu5i/hZ5kThGaRNd+K2avSENNcJ
 1vNVOfzFPfKfBZkmOHb6lK9trKqgW7cCpqG+rp1eG0qBIh6a619bkeGWEqU=
X-Received: by 2002:a05:7022:290:b0:191:444:425 with SMTP id
 a92af1059eb24-1b5567c0fbdmr23037689c88.2.1795792633416; 
 Fri, 27 Nov 2026 07:17:13 -0800 (PST)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:9a:8d55:be15:fb2f:b58:26f1])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-385672ce402sm69496564eec.16.2026.11.27.07.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 07:17:13 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 27 Nov 2026 20:47:05 +0530
Message-ID: <20261127151708.2263407-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/lzma-alone: bump to version 26.06
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For change log, see:
https://github.com/ip7z/7zip/blob/26.06/DOC/src-history.txt

Switch the source tarball from SourceForge's discontinued .tar.bz2
archives to upstream's 7z2606-src.tar.xz release archive on GitHub, and
update the install path to CPP/7zip/Bundles/LzmaCon/_o/lzma since
CPP/7zip/7zip_gcc.mak now builds into O=_o.

Update LZMA_ALONE_LICENSE and LZMA_ALONE_LICENSE_FILES (replacing
lzma.txt with DOC/License.txt): in 7z2606-src.tar.xz, DOC/lzma.txt
contains technical documentation only, while DOC/License.txt specifies
Public Domain for C LZMA sources and LGPL-2.1+ for files without inline
license notices (such as LzmaAlone.cpp).

Tested using:
 utils/test-pkg -c lzma-alone.config -p host-lzma-alone
 (Result: 6 builds, 0 skipped, 0 build failed)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/lzma-alone/lzma-alone.hash |  6 ++----
 package/lzma-alone/lzma-alone.mk   | 12 ++++++------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/package/lzma-alone/lzma-alone.hash b/package/lzma-alone/lzma-alone.hash
index 33901d1620..af65992e92 100644
--- a/package/lzma-alone/lzma-alone.hash
+++ b/package/lzma-alone/lzma-alone.hash
@@ -1,5 +1,3 @@
-# From https://sourceforge.net/projects/sevenzip/files/LZMA%20SDK/
-sha1  fbe4d6c02202d65fae75c2db0e3cdc542ca41e6d  lzma922.tar.bz2
 # Locally computed
-sha256  9aade84f229fb25f7aef39d8866b375fe6d35a9e18098d7cd86a99e294902944  lzma922.tar.bz2
-sha256  65cd2f7b76266889cbdcec55ab8ce6e845beabb5f450d58287439b25666e3b6a  lzma.txt
+sha256  a4e374c8f864f51df48c2cfd0e1413ec3b2ea030deae852d6a655402ebb61ac4  7z2606-src.tar.xz
+sha256  9ac2b4a97ab5d523965534d8b2d5868e511b39096d51fff458ab72c38b80fccc  DOC/License.txt
diff --git a/package/lzma-alone/lzma-alone.mk b/package/lzma-alone/lzma-alone.mk
index 2ed6c2c772..bde58a8c88 100644
--- a/package/lzma-alone/lzma-alone.mk
+++ b/package/lzma-alone/lzma-alone.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LZMA_ALONE_VERSION = 9.22
-LZMA_ALONE_SITE = https://sourceforge.net/projects/sevenzip/files/LZMA%20SDK
-LZMA_ALONE_SOURCE = lzma922.tar.bz2
+LZMA_ALONE_VERSION = 26.06
+LZMA_ALONE_SITE = https://github.com/ip7z/7zip/releases/download/$(LZMA_ALONE_VERSION)
+LZMA_ALONE_SOURCE = 7z$(subst .,,$(LZMA_ALONE_VERSION))-src.tar.xz
 LZMA_ALONE_STRIP_COMPONENTS = 0
-LZMA_ALONE_LICENSE = Public Domain
-LZMA_ALONE_LICENSE_FILES = lzma.txt
+LZMA_ALONE_LICENSE = LGPL-2.1+, Public Domain
+LZMA_ALONE_LICENSE_FILES = DOC/License.txt
 
 define HOST_LZMA_ALONE_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
@@ -20,7 +20,7 @@ endef
 
 define HOST_LZMA_ALONE_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 \
-		$(@D)/CPP/7zip/Bundles/LzmaCon/lzma \
+		$(@D)/CPP/7zip/Bundles/LzmaCon/_o/lzma \
 		$(HOST_DIR)/bin/lzma_alone
 endef
 
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
