Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CE510ED641
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 09:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4C8B612A0;
	Fri, 27 Mar 2026 09:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9ex1vvD3u4R; Fri, 27 Mar 2026 09:44:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE1ED60DBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774604645;
	bh=LdyfBEi49rAf6VQNZv5Qyu7NbspCxu0/mPT11jCrsQw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ahXmcJ5xBsEv6GtfGmlPmHSZ7dyCdfxtR9BDAZZy5jnA0dFx+h08GRpu7S6VnJhyX
	 98GKX5vq8iMxgfDc9Xl+8z6GVKvd5igJrCxtgrKsaWuxiQIcYsfqFJ4koAGaGe4CKp
	 WaOZICh3P/vHQT3DsMm9n6GZhVMTeZvntX+AZVPuyCBrF/cEWZHq2wq4O3BBAHkfvQ
	 Qw4cAoWfbCGXbJSK4gMEE3q4kKWi5HojyVq7Sb6vtolgF+3z268ockDw7CcJz3Maxi
	 L+had8vqD+oXKeksd4x7rrOAAxPLroeI/NJ+N2p4TOdQy5zNJMcCDhA2L0i2R471Ti
	 LL1GzfOJi2JdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE1ED60DBB;
	Fri, 27 Mar 2026 09:44:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAD931D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A43E64169A
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LH6RtQ8w7hKW for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 09:44:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD5F441571
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD5F441571
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD5F441571
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:44:03 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-35c124d2613so1324795a91.2
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 02:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774604642; x=1775209442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qLfcyEyPquUwoio54Nee0EFbNA9pX0NJ+yIne5s5Gz0=;
 b=FmtXXmwVJsv4JPnUM5K5znc2I0WrkGC1V9AUQ7kxStyiMok/b2uu0KHyXyZCh02iym
 +jONHIXEpWhmaMfUY6m2tyrMqc+rxrUYNDDSeS9I11pMAtDJbBp5FXxrSc8EUeEocnnf
 kmluozi10PHDX/FrtqI4uwQEFOz3ZHtYIeDMtOLF0VjKnTmaEjVIhcvy1Ve2KAMfVR7i
 hEaIV1boMH0EMV80KJApt7g01rD6XBkg3x5HGXoEYv8Ha9Pkh9dVEWUOoK0pavtOurou
 n6WTslPZ8Nn/l5eQVqwZGLHQq95blxiMIO509eRIE8dE7VPLj9VOY483QgNGRMi6pJ/M
 hYAw==
X-Gm-Message-State: AOJu0YyEil8XbPY2fUUvkTMrt1GNJ7QNu3wLJ9blCgk/aF0hMjaxo5Pl
 OGppnI1RYb8A18liRG8+TQ4gKHOD+1Sjd7Dkv44dKgZbORvf3f926WacfvM1dMxX
X-Gm-Gg: ATEYQzxlzed7h1HZdhpHHVHOQRX2Vz7Ev3I+PfJixxcesmYyD24W/oLOqR2BqdgSWHf
 K6lJRupk43XLxzFpJxmvEuEnpMbiU8wHvEezzbOZVCpbVqglflui94LV5Lf9YeKvnsy+LqBmBQL
 t+KeawJxc6jEBMqng9JJQHU0uC0ACmqWff+5N9WbXdsedV7iGyqk3dseo+/2AHb2tR9ZgL7gV9J
 CFAYp9WQmpW7mCscgiDKAsq/f0Uy2EJ+ctJ4bxsVYXBP9LtnMRjM6capYuUqkMS0+oC/BPha+dN
 W75ndDwwiWbYFnRoCrcaSiaVCt4YJSuJrhSYRoVq1IKfFViRtezohgSnSoUFgKs3gcHeZe0BVUc
 Z2b91ciYHUgpZiLdVRVmVwatZd50qQXd8rW20vHTtpc7bvjr/3fgS0/ukmW7+k460I7vk1wiT1i
 FvHthtrrYxHJc+CWb4wNLcAgPqEobdbw8hbvBaYO8pf76p6CU=
X-Received: by 2002:a17:90b:1e51:b0:35b:e51a:85af with SMTP id
 98e67ed59e1d1-35c2fff2c76mr1899635a91.10.1774604642268; 
 Fri, 27 Mar 2026 02:44:02 -0700 (PDT)
Received: from fedora ([2409:4064:4d81:53cb:f362:7305:74ef:5b70])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c2d7aa949sm941554a91.0.2026.03.27.02.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 02:44:01 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com, romain.naour@gmail.com, br025@umbiko.net,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 27 Mar 2026 15:13:47 +0530
Message-ID: <20260327094348.193822-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326113620.2433228-1-chakrabortyshubham66@gmail.com>
References: <20260326113620.2433228-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774604642; x=1775209442; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qLfcyEyPquUwoio54Nee0EFbNA9pX0NJ+yIne5s5Gz0=;
 b=FSMGpkQ52qLWjyDKqjcyo3G0kSV/xqD2DP2F7jldM0fYU1Hrmq7f5rAAldSfzufsYb
 Hh5Ab/GUntC4G+FUnEc2Ca/vS2ZmPf1fAyv3XrNgyLLozVj0DlJPjko816BnjUMecstK
 sXfSLYh2KudFQQ46E1txrj0FdTkUqLi2sAG4vWnSwV3uBj1mvdur5l4KJqtiRKcaaYnb
 oWjx+So6ebVc1ugT06uRiZg7rT4BeT5YFe4JtO86p8Qm1/4dgxi6CB/Fek56UxiZO9s7
 LknoIPWQXzKBYNBbOIl2xuPDp6Z4+c7MNXApP+e8vDAiV0nrWhrntQinmsv64xw+1PSB
 /stw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=FSMGpkQ5
Subject: [Buildroot] [PATCH v4] Extend the existing patch to also add
 -lstdc++ to the Libs field, fixing static linking issues with libicuuc.a.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This combines the previous 0003 and 0004 changes into a
single patch, following review feedback from Andreas.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>---
---
Changes v3 -> v4:
  - Clean up patch to remove deleted 0004 patch file
  - Ensure only 0003 patch is modified; no extra files or deletions
  - Remove any rebase or history artifacts that caused previous patch failures
---
 .../0003-fix-static-linking-with-icu-uc.patch | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/package/icu/0003-fix-static-linking-with-icu-uc.patch b/package/icu/0003-fix-static-linking-with-icu-uc.patch
index 36a3d1f696..c58f2700ee 100644
--- a/package/icu/0003-fix-static-linking-with-icu-uc.patch
+++ b/package/icu/0003-fix-static-linking-with-icu-uc.patch
@@ -13,14 +13,26 @@ http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef52
 
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 ---
- source/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+This patch currently addresses linking against stdc++ for shared-library
+builds. Add -lstdc++ to the static build flags also, to fix 'undefined
+reference' errors when linking programs like xmlcatalog (libxml2)
+with musl static toolchains.
+
+Upstream: Inactive-Upstream [Buildroot specific]
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ source/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
 --- icu.orig/source/Makefile.in	2025-03-13 19:31:23.000000000 +0100
 +++ icu/source/Makefile.in	2025-09-22 08:56:36.791792784 +0200
-@@ -279,7 +279,7 @@
- 	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
+@@ -276,10 +276,10 @@ config/icu-uc.pc: config/icu.pc Makefile icudefs.mk
+       @echo "Description: $(PACKAGE_ICU_DESCRIPTION): Common and Data libraries" >> $@
+       @echo "Name: $(PACKAGE)-uc" >> $@
+ ifeq ($(ENABLE_SHARED),)
+-	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
++	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' -lstdc++ >> $@
  else
  	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" >> $@
 -	@echo "Libs.private:" "${ICULIBS_DT}" '$${baselibs}' >> $@
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
