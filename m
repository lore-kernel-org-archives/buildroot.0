Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAEE606A327
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KzCvdXws
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5F2481539;
	Fri, 13 Nov 2026 14:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qm6YtHMcJoBx; Fri, 13 Nov 2026 14:54:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B5F9181404
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794581675;
	b=st/Rgap+Ug4WieH/HoRXlkpaymvcOyk3XMjBBYXwapqyuA7aNvp7pRr5yijyii0LhYw+
	 54Qb9YmfSSvCFZruuaz7mIcTUKzQm4dFrmqAynW7Qed0P7OywnOjdOFDBL72v7Kc80fJj
	 96L/DuHtt22Gfe3dDSvA3cMpYvyFyeUnhqUZL8uRcW7Nc21QVf9l1Yz20wnUUS23BOGQo
	 2/PDWJWobjxC6aHtEYgMR+kvbE+x60tCa+Ss8ICuxu/xdMc1r7uV7pAf7GxcnnnPh4HBv
	 brmZ+0mB0i30lKxH2JxQDcrXzNnQLgjtiSoq6vYignX2t4lsl84zNKc/BoJfDAhisrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794581675;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:From:
	 To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=w5nwhF5TtQVZkECk2zvPUbU5vDqWaHSyiP/86V0cwp4=;
	b=DIxGmQgOagbnwm9NQmw4ifhC/qs2rjUsqKYcB4ikIM/g/ZV/HRWBuiOPW8aUGf+Ol3V1
	 KgzohqFPiR1Xw+bktsCRSRFfCdMcp+8aC0rr7fgnMIqv9y6kWDYBH/2Ip9e20DwlvnCGS
	 vYGy1jk5Ci4cTdeesOk5KMgkICtmmNrih+KZqvRXBmBVqDiK4epaESuIVOzKqSkZ4iBZ/
	 80MGI/OyhFyOVmpWSvGH8G90jVWAyBbcFKLsgUP2OoZxaE2Q8rTQlHScZCSVys9yAFFtG
	 BOhJcUK0fahD9dXthFfxhP36HR3KvFfh9T9/cDilsEoYU/lhd1kI7lkZ3YhZ/8wLlsA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=fail header.from=gmail.com;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794581675;
	bh=w5nwhF5TtQVZkECk2zvPUbU5vDqWaHSyiP/86V0cwp4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KzCvdXwsQJgPyhaGdgOtveHFlOW/Jg5RvqGpQxgWSBr4PkRvhQe8GNi1DPW7zffjX
	 +nIRvr9LJ0Qxj1qIV5AZXLxGSTKeQ8s2iXo4WKDzVyB3s33SXYrZspygUvOSM1RdrU
	 gRO5ZS8XbpWUCZwxBTBJzixGTZ7Cb5nOGCZBltXxtwSG9dKRGw/Mdpm6pJYUw6EpEd
	 hzt1bYx1a0uXgy1t804uUk2xPOcPHJrcaueJu+2o7NFT1tBVWMU2hoV3jJUK8ri0Iw
	 SSUrsKM93nFppHTGk7U9TsUPD5ySDeCrRkjd81oOdgcQ0oWxGJKAkND9jEVrbdFun3
	 /OzU+d0m/D4xA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5F9181404;
	Fri, 13 Nov 2026 14:54:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C5A5228C
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABE15814BF
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKy54lWpbveD for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 14:54:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 014A181404
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=77.87.242.242
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=77.87.242.242;
 helo=harvie.cz; envelope-from=tomas.mudrunka@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from harvie.cz (harvie.cz [77.87.242.242])
 by smtp1.osuosl.org (Postfix) with ESMTP id 014A181404
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:54:33 +0000 (UTC)
Received: from anemophobia.amit.cz (unknown [193.179.247.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by harvie.cz (Postfix) with ESMTPSA id 868ED1802AE;
 Fri, 13 Nov 2026 15:52:25 +0100 (CET)
From: Tomas Mudrunka <tomas.mudrunka@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tomas Mudrunka <tomas.mudrunka@gmail.com>
Date: Fri, 13 Nov 2026 15:51:57 +0100
Message-ID: <20261113145201.2357363-2-tomas.mudrunka@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113145201.2357363-1-tomas.mudrunka@gmail.com>
References: <20260324130037.1411867-1-tomas.mudrunka@gmail.com>
 <20261113145201.2357363-1-tomas.mudrunka@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/5] package/libmanette: select libgudev
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

libmanette selects hidapi, which selects libgudev, so libmanette has
always been built with gudev support (-Dgudev=enabled), which it uses
to discover game controllers through udev.

hidapi does not actually need libgudev, and the following patch drops
that dependency. Make libmanette select libgudev explicitly, and
enable gudev unconditionally, so that its behavior does not depend on
what hidapi selects.

All of libgudev's dependencies (BR2_PACKAGE_HAS_UDEV, BR2_USE_MMU,
BR2_USE_WCHAR, threads) are already libmanette dependencies.

Signed-off-by: Tomas Mudrunka <tomas.mudrunka@gmail.com>
---
 package/libmanette/Config.in     | 1 +
 package/libmanette/libmanette.mk | 9 ++-------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/libmanette/Config.in b/package/libmanette/Config.in
index d4f45e25ad..0f3a5a7bb0 100644
--- a/package/libmanette/Config.in
+++ b/package/libmanette/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_LIBMANETTE
 	select BR2_PACKAGE_HIDAPI
 	select BR2_PACKAGE_LIBEVDEV
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGUDEV
 	help
 	  GObject library which provides access to game controllers.
 
diff --git a/package/libmanette/libmanette.mk b/package/libmanette/libmanette.mk
index c320b84840..43b44efbe3 100644
--- a/package/libmanette/libmanette.mk
+++ b/package/libmanette/libmanette.mk
@@ -14,6 +14,7 @@ LIBMANETTE_INSTALL_STAGING = YES
 LIBMANETTE_DEPENDENCIES = \
 	libevdev \
 	libglib2 \
+	libgudev \
 	hidapi \
 	$(TARGET_NLS_DEPENDENCIES)
 
@@ -24,6 +25,7 @@ LIBMANETTE_CONF_OPTS = \
 	-Dbuild-tests=false \
 	-Dinstall-tests=false \
 	-Ddoc=false \
+	-Dgudev=enabled \
 	-Dvapi=false
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
@@ -33,11 +35,4 @@ else
 LIBMANETTE_CONF_OPTS += -Dintrospection=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
-LIBMANETTE_CONF_OPTS += -Dgudev=enabled
-LIBMANETTE_DEPENDENCIES += libgudev
-else
-LIBMANETTE_CONF_OPTS += -Dgudev=disabled
-endif
-
 $(eval $(meson-package))
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
