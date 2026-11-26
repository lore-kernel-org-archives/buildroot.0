Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B222606A321
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 11:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KYTF/u2g;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtcagvGZ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 283F140545;
	Thu, 26 Nov 2026 11:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJ2nIrgz03im; Thu, 26 Nov 2026 11:55:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4053E4056C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795694145;
	b=smDXlsIOUbxmqmhALOGF04SPXhQd+ezJa4cfgB3ij7NU67fYxxLREAl7Ba/cAuxmQYwX
	 qV0Nn4a0ncrP3M0J4mkIziAlaJIohcrNcrHItJsrZiDrD1Ze4Cu11L2ntuLVndceHH8g5
	 TlkNKEejzKyH6aqS0PmgL5Jidv/woIGY4XJ0McpzDO+ep44AyNwT97dSWAmMJtRJE6ptz
	 FYiiD5zBw11m/5HALQnqZPC3gIiuVzz2/kPihaBe23GilrP6z9Baj2o2XGNZPKVWfhwnq
	 nKxNLC/BxwYDZgrW7MMoH2QmwMj7ls0u2kUOMGKts2/5Fk7/hiTgkJOQ7fKfV96C59Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795694145;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8NwABfSvw98R/p6bPV9BBjUY5Am+G/VbQehufObF99E=;
	b=gi2KhzaYQVW3YHgknqSin3bhlaXv5hpoEGC1uLGNgLCch92zTRJJVxXlOfCmeyqIXcHL
	 eWFPCiqr3gxrfZZYRVYY4/8U/2+Qiphh6JnD41r72mHbgQ/3hGNsoREDvkH8ogwclNrg4
	 2De6djAp6nZ30Bw+bZrKzqlwUVQA8l8fGE8sMUAd3xYQ+H0azkIK5slL+ZPhXT2Qnp/29
	 AO0dI2kz+Yq9SicP4aCkCgSuZs4g2U6fVEA0tWNixbI7a6SM+dFtho8uobCjU8wkdKxj1
	 6I2R3kZJ010t+FufwCMoCwb52Z33bScNdXnPasDXxi9el4XZ/WxyH/n/HvTNCcnLgSA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795694145;
	bh=8NwABfSvw98R/p6bPV9BBjUY5Am+G/VbQehufObF99E=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KYTF/u2gKiJERuzBx9AAz+Ua1Ad4+MldTyV3w8ftZVHVy5+V7o30GUmIsh2TCoUnO
	 jRcYDz8oV2j+L1OnyD0p3aBA4CZth5Hd9T0JT8c5qPwAZ224YOi5N7eWuynFdHt+bz
	 JJz5kuqKkxD0Ay8usFFUe68ysjeWB7y/qiI2Gf+mvPT9niTXJZbyvWeasbKeBLDxVr
	 pD4SMEPDrlJkD+63MRbCBgRxQmpeWB/YzZ0XLLK9AIhBpznOelrUx73HuqZOPDo3lr
	 vyofDr3RFrJ92ptsCTf8R0DQ3Y5fNZiLjULkitcAgacBKmX6SzOH2QoTkXzaylYiNF
	 zpx+iFzS4cJ0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4053E4056C;
	Thu, 26 Nov 2026 11:55:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8262843
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80239608E0
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUEekg36mw30 for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 11:55:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 836E3608E4
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1332; helo=mail-dy1-x1332.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=jtcagvGZ
Received: from mail-dy1-x1332.google.com (mail-dy1-x1332.google.com
 [IPv6:2607:f8b0:4864:20::1332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 836E3608E4
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:55:42 +0000 (UTC)
Received: by mail-dy1-x1332.google.com with SMTP id
 5a478bee46e88-38644aedba1so10367918eec.0
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 03:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795694141; x=1796298941; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BwhsZDBtGcz209MkXVs6wqXkmj7Blpt1QVhW+S/2wLo=;
 b=jtcagvGZRIa3AOZWo585iSZeQR1jqGUhKisuUdX/e5MKA6Pw2NR5efp6O+JhG9ICmU
 y1YDrUyrpE3ipKfsDL5bVrF87nrYiRk63Tr2cUVFbhZ1X8HOzlm8s7mRroVz9NatqnpO
 6+8ZvBjpbmNM0qOZmluQPmxUp4DoWR7gstBOicOfHzC1aUY1800ix3l295z0+tBDmgPF
 +zAWwupYzWvqsGhPRYRISOOv11HRGi0GpI35EtHg2PfqrrDLdJCRtAqasr0Fc7ID7sLj
 sXgUwareYupT5ihxZIZZsmR18vBFHKDRwEs0ZnEMUypcwFgirUXIdGnQ+p6/vkoG08ih
 8FEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795694141; x=1796298941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BwhsZDBtGcz209MkXVs6wqXkmj7Blpt1QVhW+S/2wLo=;
 b=v4zbpfU8iahl1Q4nHOBQHxuYwPgk4Skof0ld6hp7Pk2xumPLyMA26c6adJ06mzo+PL
 Eo9p45WpbNia6j0j8U0bCx9QQFxf/pwRk/aNJZ/WIvEboF/++q1hZ9Zn5ZxW/YPUudXR
 xjoN0w0WawyxulFlqjgP/OOpQyy8kK8OpnE8QSBnRC3l5zLVvLiZO61pWr9kwsSHQrc2
 eOSfsnfbaOrm3y3z6IFEfIarYBIgo/VteTriMouKphK/YcroZli+wzI6l4FfvilPvZuN
 1NQDzhvCxInmnPuOea0321Fssxft37IMMvPESc2FUBnQkBHfUgl++tOZMEONzAOyZQU4
 i7dQ==
X-Gm-Message-State: APuU4Z/git14fa4o7QxF+oyEiR1diqb4r4QYzc5IyVZPaVNq0bqWpoD6
 5h7qDT/T8Qt+M0phVGZXMj10XtyvQ+RAtrk9c71AYHkz7Xond2/d3bswUD9ndQ==
X-Gm-Gg: AZFdTZe7hq7YVgrO/oF2DiFsR24ClRaid/t7bTPIP4DwEyY0uLu7zg64aNSChisOkKI
 5Mx1wH9UFymeQEq0VC5Z+Ci+FU02a5eSnQyz4dd5iyzlCsreSD3xYFtwEuWHxW90YJCCflBu/6B
 vCd8fIMcmclrRzC478QGN2LECdDYJ7o+EkHXsSSNGF0kX3709EnyimsVWP1irupO3uoWgQTIpDf
 vnlPkAEWDOVkghpXajzaIIkGBFwrAgPRGrhGF4d75oMgiJ1OVC0j1qXyJLLZi1eoEx96n5c0YlS
 9pT8OJqdpYorsgahbd6zVPkiwqoneAzpJYNWNMZbLFTVqTlqBcxINByNEaFH4JU/kz0OrEWUp2q
 ufCrbkKUAul/Gtu/BLFBlj1V0MLwkGEejDNEp1snX6oZydSPks6+h/PeSBEuQG/EsRCtcDsyoWL
 fnFyIRkrKUIIJrHMgQsfwd+ZHsOuRy0JTSjfmjlOWy5E9EHhIC3RmF0SMpgPEn8t1EunFXWPZcx
 HGZEOUyfv18lb1E9H8HX6swyNE0/hGObT8i0ehTvb7txjzXsSEvJGMfd3lJ+BSwNSKgukLcjWbq
 oewRyQU5Ltz3QODdJznYqtNrvDwqqTrcfASsKfwj7ye8OubV9bWlTK7FYFx1gr/r
X-Received: by 2002:a05:7301:f02:b0:378:7434:a526 with SMTP id
 5a478bee46e88-3856f8519d9mr20804073eec.14.1795694141163; 
 Thu, 26 Nov 2026 03:55:41 -0800 (PST)
Received: from fedora.taildae27b.ts.net
 ([2409:40e4:2045:e80e:4a6e:5538:6cfb:9bf5])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-385666e99fdsm76654112eec.5.2026.11.26.03.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 03:55:40 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu, 26 Nov 2026 17:25:09 +0530
Message-ID: <20261126115510.733864-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ccache: bump to version 4.14.3
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

For release notes, see:
https://ccache.dev/releasenotes.html#_ccache_4_14_3
https://github.com/ccache/ccache/blob/v4.14.3/doc/news.adoc

The hash of LICENSE.adoc changed due to updating the bundled BLAKE3
subset version reference from 1.8.2 to 1.8.7.

Tested using:
 utils/test-pkg -c /tmp/ccache-test.config -p host-ccache
 (Result: 6 builds, 0 skipped, 0 build failed)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/ccache/ccache.hash | 6 +++---
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 3b97f1ec9a..d006973414 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ccache/ccache/releases/tag/v4.14.1
-sha256  29f10de481ac2c41c91bfabead63d803bd2fe823e09752aade5b0b8704cc4f30  ccache-4.14.1.tar.xz
+# From https://github.com/ccache/ccache/releases/tag/v4.14.3
+sha256  e1999132cf7dbce48de7d946b767f3e26ea09adcb5daa4a7103a8fa09ee0637d  ccache-4.14.3.tar.xz
 # sha256 computed locally
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
-sha256  072c40891d4ec8e1bcc93420031ebbbeb90b8f2c49fcd7c872d1bb05564c345c  LICENSE.adoc
+sha256  c482b87a2abbecdf85916b297d0b15fd0cee0598d220f484fbf50fdcac01b90e  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 6ab9a4271a..f594edacdf 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.14.1
+CCACHE_VERSION = 4.14.3
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
