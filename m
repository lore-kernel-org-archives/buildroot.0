Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364EA606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 13:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=r5B2Pl5l;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8OrRiiY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14B7040AE8;
	Fri, 30 Oct 2026 13:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXMV6KOWZOKB; Fri, 30 Oct 2026 13:59:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D5B5840AF5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793368776;
	b=ELDzFfXuYlIMkNrUknlawuxbIZj+VpWH6dUkTODnNi89ucigMTWhYIn4j4TfCvnGJnxK
	 cMjrqp2QWH/Zu/U5ZZLywKPsuxm94POMaTUxlDiEs1H6dB6x5vU6/5WTf359mbmVSOfH/
	 LnJztgtY4ckLK2jOuuaZnVkNXcyw3hirPTMqx3b+CUh/tuEHGuoNyM13vbUULkS3S4rnZ
	 EOAwPat52GyueXQaMCB5SWoSnKv/lVGHoHygg37Dw+LlkSVejrMCw6eekmafcitBv9vwW
	 aj/ZQb11fBIRG+Bz9ua+fzo/G1/DhLhgTfcplpbf6M6JL+lFX6NZEmBQa5pL04Z04YQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793368776;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=jKJOQb18X25Jz3OqXOAgA/vgSOcLujLAh1vmRQGs9xY=;
	b=WuUh64RVZ5XZjowVEisRrAhpp0Gbqt4TZJ4ozAqipWNK+ydXhSfF+efJGYb2kv8D5Tqs
	 kZGVQCoiU9L0RLpObR8E1FXAesxuSL2i2tJP+3lsJ9SZ+NnSZrcIISGOcYu7NAn+SeKxU
	 Xu1E+mNxqkM7v/SLl6z05+nSNFuqaN4Lt+GLrlp9IED4Pt96aCtbeIg1WPZm+jMaqVLff
	 DH4NnbqdiHXz8HeKvkIggVW7/uH7vjWuQh98lRoh7NA5Sacsl7Wlj8zunOf0HNjaeRwVq
	 WszjwmMy7axECUdx9Z3NsfGmZp7G9T09Ty5akUDiX0DLc7XunAngQ1r297/218tJ0og==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793368775;
	bh=jKJOQb18X25Jz3OqXOAgA/vgSOcLujLAh1vmRQGs9xY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r5B2Pl5lTbKadiGWpOLDN/9C+REBPpndflplvZ/ZZKlOLm3Wns64hvNRXqXjkIyjt
	 A9CmNO4nOG+vzGJlD3aAhih0li9u1zDvuaMvCRMeKeDfFFFMMGYf70uhBPtSXSaXvk
	 v4Hm74hQSlH5rLSuLqwHQarpbzz3hLjtWxSmhiIfExDNBD9rfh0A/7vdImsy43QBVm
	 qAYerugQlGugSH4wB3IuWNZnWC6PNso8pMqVBBxSIehTTpwLK4mKjyIzCsQeMdIyW8
	 a2hLW82BbtWKQetZj1qCv30npc+W3sDJCmayZg3XP5H4XbfevO4BsH9l5P9EBkjWxf
	 RV1I44VHMVkHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5B5840AF5;
	Fri, 30 Oct 2026 13:59:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFF91529
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E34B605E9
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mQzpc-yEbZLx for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 13:59:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2139060808
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793368770;
 b=Jxp1K2JjKf5+7uXmtTqozviX4Sp9TafTcimJYLfFcvO9Ci0AYxooS8O1oE91LVQa3G3i
 5Cl/0+7nsY09yPeUMmLb26xuLQrGkaO+tIyTpMbHRLM1wd7PoMQHBBD2YYTjzNt/sDWpw
 vnc7jsyarmC1xh76zSPiyc1JuvhXMW7Ewnppl3CH6pMGi2wk4aBLR5WMoeH+PU0TnCQL5
 7KI/tG/u7hf2q+SZXcS6u8XzYXkr943SLUhxZnaNRjDu74gMXwKQfI/hpY28rqof7moZZ
 kGw8YNf64cRs7OtmGt/ECypppt3E6S3KOL5dFboCAKoGxOgWJjHIm/FeJHd7gXKJ6lg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793368770;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=3ffIfWT40g/d4zbr4gmubF/do8sjmwFeAM+M5jT8rCk=;
 b=K5Ets1jEbukGm/nq0xVf0d7mPn+utkO+sd37stVjxOJ1blLkgLdr4M4QGn2FeCk0OQZq
 UkLW9cB92wqoDNeYHUBEKNKTFju6khieU6/DyxL9bJCr6ZGGbAcdxrKI0PeLSilanJSsV
 1VjqmBNOtHIWDlfhPHFhZ9ekX/wStgWIcUiXHQHpHql6Rp+kkVXS3oGWsEIysn1fxyjWT
 3TqnjMM9aEdTkrl+VmQgdFQ2bauPKT47rJ7GnTAp6VUyRe8mk9wc7DAZdA8/rQVv4zgdp
 LtILxcf8g9oJXkFaIYGTG9gGW7sljLRdkV3sHKZUXfXFo+4TWgO6+NwU11huyH/2wbw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=o8OrRiiY; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=o8OrRiiY
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2139060808
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:29 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so632018f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 06:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793368768; x=1793973568; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3ffIfWT40g/d4zbr4gmubF/do8sjmwFeAM+M5jT8rCk=;
 b=o8OrRiiYSWrTnFBXP70BIDVHHDpFeigDn9m4GYA3NE1Fiuqb5RhES3qPhJHMCDE+Io
 jZOIgg1woPK1XaJole54HhchPDmhl9B80vslhHjHW+PWMvXAZOk2O2RL9G4w8zSD61hi
 j5Oz1TIzbfbxGkJCFEka6hemyrt+DZgoKSZ2AmogW0s8lBixZ5gIye6lotYm82VL7poV
 EvYL5BZ8knVoc/rEiUwQWFSX9ahohpAnvdqWRVVqpHXAr3213pwxC/An/SKR6t3+S0cx
 bFR8Px9XeSinhQQcHC7ymu8hdmhv0v+uyQXE8mJNEHgveP8jGuAqwgmmotyaxssUDCAy
 zvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793368768; x=1793973568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3ffIfWT40g/d4zbr4gmubF/do8sjmwFeAM+M5jT8rCk=;
 b=CM9uczNM9d1Lqhmbh0GAxH9cCO99oj3NB35w+b+f6lB3Ci/rGb/0dHI2Vte5nCFs5b
 2fBQ+D1/XWwAhZghJ7FZto3U6hDV5fQRiBfvrdiTy3cEKMWAwUYdiCA/7Z1PIC3YA+An
 gk3xMIf4eOQy2m0xvwAuq7iaZSFj9XBwojVhuVoKCXw2jSE/YmRZm8kS8ZkEZdbrLvcx
 Rs9nDPwjGTbropXT0X7y8iZ2sLUwNAhmApgHAaRNCBwrAp+rTLCoL6ewc6jt7CruT/Sr
 BORCzcsjx/8GVie6Z9RYzbzKC5E0BL6AIvrlPi+v47N4MIE7weyGmejyDHqYQMgMkJEo
 OPjw==
X-Gm-Message-State: AFq9FYLg2a+iCkV0k2Yq+sfIJwviSE7UXSGiZo/tQxQA02yIP4wqT12G
 Sy1cbJw2LZQWnmp9nB3s7gGMlTWReF2sytzOoBf2JeTeQM7uI2baeJYxbA0JfA==
X-Gm-Gg: AYBFou29/XAGrisSj6NQ9ObmrNhXHVqEAoXDlNz3ViSo+WgNDG8/9zg8KHvY1HS1iPW
 gAFfpwbisV2lnwhuGKawySh2GAjqTJqHUU/SqFw37Kbu6K3o/OVJjUDLehihqjbd5B1Exf/0oTM
 THyKSqvzlaGLKqkkdtAXOIn/7CHAwuZVQkwZjiSORWOuceXPiKZUbmnqsQGNkWvXngTOwW5nQGp
 2KpF+Co3JkXK/adNmB8QwjE8M0SDC35fI105DEU/UXrSG5cT5FbjJLowiN3IZt1apeG8Us5uC5h
 iJZZxYOemS72cDTPe1A8StW2tGsVCpqbKQHmUxn/2gMX/eIR4qz/vxGanT2jZJdE/kBHRXg84zn
 LAyoDxOMuS2LPzGM+vXayHIXHpdTf2rcVTXqQbFJoBKFldUWsfTfonhBPNChfYWSw496Qw75zsu
 KegTKwu2LjeGIfkzslsiccbg6xhJsM/RCGpBsfP0X5G46RMWW2YcJSxy3+q13U8qKVy2GTgzG6/
 ovSDq95UQXAkmijjshA5GXi75LrVRNPuVmiZ6hPjURmjnDAqJjDXmCBy23sa6fnS4pEqYjumYST
 r0vAfW+eRUTasvlrKaU61xop8EhwE9R/YL8/I9vQsjIRvyLUTG6mkA==
X-Received: by 2002:a5d:6f0e:0:b0:48c:7ee3:e07d with SMTP id
 ffacd0b85a97d-48e6e529f9amr5324526f8f.52.1793368767522; 
 Fri, 30 Oct 2026 06:59:27 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b959c1sm3423347f8f.45.2026.10.30.06.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 06:59:26 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 14:59:13 +0100
Message-Id: <20261030135916.3599219-6-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030135916.3599219-1-angelo.compagnucci@gmail.com>
References: <20261030135916.3599219-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/9] package/falcosecurity-libs: convert to a
 virtual package
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
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since version 0.11.0, the falcosecurity-libs userspace libraries only
support 64-bit architectures, as they get the system call numbers from
tables which only exist for them.

In order to provide a different version for 32-bit architectures,
convert falcosecurity-libs into a virtual package. For now, it is only
provided by falcosecurity-libs-latest, which is the former
falcosecurity-libs package, unchanged.

The license, the driver name, the kernel module make options and the
Linux kernel configuration fixups, which will be shared by the
providers, stay in the virtual package.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/falcosecurity-libs/Config.in          | 16 +++--
 ...-pass-ARCH-and-CROSS_COMPILE-to-the-.patch |  0
 ...ver-replace-removed-task_euid-helper.patch |  0
 .../falcosecurity-libs-latest/Config.in       |  9 +++
 .../falcosecurity-libs-latest.hash}           |  0
 .../falcosecurity-libs-latest.mk              | 67 +++++++++++++++++++
 .../falcosecurity-libs/falcosecurity-libs.mk  | 59 ++--------------
 7 files changed, 91 insertions(+), 60 deletions(-)
 rename package/falcosecurity-libs/{ => falcosecurity-libs-latest}/0001-driver-configure-pass-ARCH-and-CROSS_COMPILE-to-the-.patch (100%)
 rename package/falcosecurity-libs/{ => falcosecurity-libs-latest}/0002-fix-driver-replace-removed-task_euid-helper.patch (100%)
 create mode 100644 package/falcosecurity-libs/falcosecurity-libs-latest/Config.in
 rename package/falcosecurity-libs/{falcosecurity-libs.hash => falcosecurity-libs-latest/falcosecurity-libs-latest.hash} (100%)
 create mode 100644 package/falcosecurity-libs/falcosecurity-libs-latest/falcosecurity-libs-latest.mk

diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
index c73b92d78f..495dd2b8ca 100644
--- a/package/falcosecurity-libs/Config.in
+++ b/package/falcosecurity-libs/Config.in
@@ -19,14 +19,18 @@ config BR2_PACKAGE_FALCOSECURITY_LIBS
 	depends on !BR2_STATIC_LIBS # re2, tbb
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # tbb
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # tbb
-	select BR2_PACKAGE_JSONCPP
-	select BR2_PACKAGE_RE2
-	select BR2_PACKAGE_TBB
-	select BR2_PACKAGE_UTHASH
-	select BR2_PACKAGE_VALIJSON
-	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_FALCOSECURITY_LIBS_LATEST
 	help
 	  falcosecurity/libs provides libsinsp, libscap, the kernel
 	  module driver and the eBPF driver sources.
 
 	  https://github.com/falcosecurity/libs
+
+config BR2_PACKAGE_HAS_FALCOSECURITY_LIBS
+	bool
+
+config BR2_PACKAGE_PROVIDES_FALCOSECURITY_LIBS
+	string
+	default "falcosecurity-libs-latest"
+
+source "package/falcosecurity-libs/falcosecurity-libs-latest/Config.in"
diff --git a/package/falcosecurity-libs/0001-driver-configure-pass-ARCH-and-CROSS_COMPILE-to-the-.patch b/package/falcosecurity-libs/falcosecurity-libs-latest/0001-driver-configure-pass-ARCH-and-CROSS_COMPILE-to-the-.patch
similarity index 100%
rename from package/falcosecurity-libs/0001-driver-configure-pass-ARCH-and-CROSS_COMPILE-to-the-.patch
rename to package/falcosecurity-libs/falcosecurity-libs-latest/0001-driver-configure-pass-ARCH-and-CROSS_COMPILE-to-the-.patch
diff --git a/package/falcosecurity-libs/0002-fix-driver-replace-removed-task_euid-helper.patch b/package/falcosecurity-libs/falcosecurity-libs-latest/0002-fix-driver-replace-removed-task_euid-helper.patch
similarity index 100%
rename from package/falcosecurity-libs/0002-fix-driver-replace-removed-task_euid-helper.patch
rename to package/falcosecurity-libs/falcosecurity-libs-latest/0002-fix-driver-replace-removed-task_euid-helper.patch
diff --git a/package/falcosecurity-libs/falcosecurity-libs-latest/Config.in b/package/falcosecurity-libs/falcosecurity-libs-latest/Config.in
new file mode 100644
index 0000000000..2115e9a928
--- /dev/null
+++ b/package/falcosecurity-libs/falcosecurity-libs-latest/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_FALCOSECURITY_LIBS_LATEST
+	bool
+	select BR2_PACKAGE_HAS_FALCOSECURITY_LIBS
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_RE2
+	select BR2_PACKAGE_TBB
+	select BR2_PACKAGE_UTHASH
+	select BR2_PACKAGE_VALIJSON
+	select BR2_PACKAGE_ZLIB
diff --git a/package/falcosecurity-libs/falcosecurity-libs.hash b/package/falcosecurity-libs/falcosecurity-libs-latest/falcosecurity-libs-latest.hash
similarity index 100%
rename from package/falcosecurity-libs/falcosecurity-libs.hash
rename to package/falcosecurity-libs/falcosecurity-libs-latest/falcosecurity-libs-latest.hash
diff --git a/package/falcosecurity-libs/falcosecurity-libs-latest/falcosecurity-libs-latest.mk b/package/falcosecurity-libs/falcosecurity-libs-latest/falcosecurity-libs-latest.mk
new file mode 100644
index 0000000000..6e078e080a
--- /dev/null
+++ b/package/falcosecurity-libs/falcosecurity-libs-latest/falcosecurity-libs-latest.mk
@@ -0,0 +1,67 @@
+################################################################################
+#
+# falcosecurity-libs-latest
+#
+################################################################################
+
+FALCOSECURITY_LIBS_LATEST_VERSION = 0.21.0
+FALCOSECURITY_LIBS_LATEST_SITE = $(call github,falcosecurity,libs,$(FALCOSECURITY_LIBS_LATEST_VERSION))
+FALCOSECURITY_LIBS_LATEST_SOURCE = falcosecurity-libs-$(FALCOSECURITY_LIBS_LATEST_VERSION).tar.gz
+FALCOSECURITY_LIBS_LATEST_DL_SUBDIR = falcosecurity-libs
+FALCOSECURITY_LIBS_LATEST_LICENSE = $(FALCOSECURITY_LIBS_LICENSE)
+FALCOSECURITY_LIBS_LATEST_LICENSE_FILES = $(FALCOSECURITY_LIBS_LICENSE_FILES)
+FALCOSECURITY_LIBS_LATEST_PROVIDES = falcosecurity-libs
+FALCOSECURITY_LIBS_LATEST_INSTALL_STAGING = YES
+FALCOSECURITY_LIBS_LATEST_SUPPORTS_IN_SOURCE_BUILD = NO
+
+FALCOSECURITY_LIBS_LATEST_DEPENDENCIES = \
+	jsoncpp \
+	re2 \
+	tbb \
+	uthash \
+	valijson \
+	zlib
+
+# The version can't be computed from git, as we build from a tarball.
+FALCOSECURITY_LIBS_LATEST_CONF_OPTS = \
+	-DUSE_BUNDLED_DEPS=OFF \
+	-DFALCOSECURITY_LIBS_VERSION=$(FALCOSECURITY_LIBS_LATEST_VERSION) \
+	-DCREATE_TEST_TARGETS=OFF \
+	-DBUILD_LIBSCAP_EXAMPLES=OFF \
+	-DBUILD_LIBSINSP_EXAMPLES=OFF
+
+# Only the kernel module driver is built. To keep the build small, the
+# eBPF engine, which needs elfutils, and the gVisor engine, only
+# available on x86_64, which needs protobuf, are disabled: they can be
+# enabled in a following patch. The modern eBPF probe would also need
+# clang and bpftool to be built.
+FALCOSECURITY_LIBS_LATEST_CONF_OPTS += \
+	-DENABLE_ENGINE_BPF=OFF \
+	-DBUILD_LIBSCAP_MODERN_BPF=OFF \
+	-DBUILD_LIBSCAP_GVISOR=OFF
+
+# The driver CMakeLists.txt only prepares the kernel module sources and
+# Makefile in the driver/src build directory, which are then built with
+# the kernel-module infrastructure.
+FALCOSECURITY_LIBS_LATEST_CONF_OPTS += \
+	-DUSE_BUNDLED_DRIVER=ON \
+	-DBUILD_DRIVER=OFF \
+	-DENABLE_DKMS=OFF \
+	-DDRIVER_VERSION=$(FALCOSECURITY_LIBS_LATEST_VERSION) \
+	-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME)
+
+# The pkg-config files define the prefix relative to their location and
+# contain the absolute paths of the dependencies in staging, which
+# pkg-config would all prefix with the sysroot again.
+define FALCOSECURITY_LIBS_LATEST_FIX_PKGCONFIG
+	$(SED) 's%^prefix=.*%prefix=/usr%;s%$(STAGING_DIR)%%g' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/libscap.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/libsinsp.pc
+endef
+FALCOSECURITY_LIBS_LATEST_POST_INSTALL_STAGING_HOOKS += FALCOSECURITY_LIBS_LATEST_FIX_PKGCONFIG
+
+FALCOSECURITY_LIBS_LATEST_MODULE_SUBDIRS = buildroot-build/driver/src
+FALCOSECURITY_LIBS_LATEST_MODULE_MAKE_OPTS = $(FALCOSECURITY_LIBS_MODULE_MAKE_OPTS)
+
+$(eval $(kernel-module))
+$(eval $(cmake-package))
diff --git a/package/falcosecurity-libs/falcosecurity-libs.mk b/package/falcosecurity-libs/falcosecurity-libs.mk
index 28de5c0c9d..0437648383 100644
--- a/package/falcosecurity-libs/falcosecurity-libs.mk
+++ b/package/falcosecurity-libs/falcosecurity-libs.mk
@@ -4,62 +4,12 @@
 #
 ################################################################################
 
-FALCOSECURITY_LIBS_VERSION = 0.21.0
-FALCOSECURITY_LIBS_SITE = $(call github,falcosecurity,libs,$(FALCOSECURITY_LIBS_VERSION))
+# falcosecurity-libs is provided by falcosecurity-libs-latest.
+
 FALCOSECURITY_LIBS_LICENSE = Apache-2.0 (userspace), MIT or GPL-2.0 (driver)
 FALCOSECURITY_LIBS_LICENSE_FILES = COPYING driver/MIT.txt driver/GPL2.txt
-FALCOSECURITY_LIBS_INSTALL_STAGING = YES
-FALCOSECURITY_LIBS_SUPPORTS_IN_SOURCE_BUILD = NO
-
-FALCOSECURITY_LIBS_DEPENDENCIES = \
-	jsoncpp \
-	re2 \
-	tbb \
-	uthash \
-	valijson \
-	zlib
 
 FALCOSECURITY_LIBS_DRIVER_NAME = scap
-
-# The version can't be computed from git, as we build from a tarball.
-FALCOSECURITY_LIBS_CONF_OPTS = \
-	-DUSE_BUNDLED_DEPS=OFF \
-	-DFALCOSECURITY_LIBS_VERSION=$(FALCOSECURITY_LIBS_VERSION) \
-	-DCREATE_TEST_TARGETS=OFF \
-	-DBUILD_LIBSCAP_EXAMPLES=OFF \
-	-DBUILD_LIBSINSP_EXAMPLES=OFF
-
-# Only the kernel module driver is built. To keep the build small, the
-# eBPF engine, which needs elfutils, and the gVisor engine, only
-# available on x86_64, which needs protobuf, are disabled: they can be
-# enabled in a following patch. The modern eBPF probe would also need
-# clang and bpftool to be built.
-FALCOSECURITY_LIBS_CONF_OPTS += \
-	-DENABLE_ENGINE_BPF=OFF \
-	-DBUILD_LIBSCAP_MODERN_BPF=OFF \
-	-DBUILD_LIBSCAP_GVISOR=OFF
-
-# The driver CMakeLists.txt only prepares the kernel module sources and
-# Makefile in the driver/src build directory, which are then built with
-# the kernel-module infrastructure.
-FALCOSECURITY_LIBS_CONF_OPTS += \
-	-DUSE_BUNDLED_DRIVER=ON \
-	-DBUILD_DRIVER=OFF \
-	-DENABLE_DKMS=OFF \
-	-DDRIVER_VERSION=$(FALCOSECURITY_LIBS_VERSION) \
-	-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME)
-
-# The pkg-config files define the prefix relative to their location and
-# contain the absolute paths of the dependencies in staging, which
-# pkg-config would all prefix with the sysroot again.
-define FALCOSECURITY_LIBS_FIX_PKGCONFIG
-	$(SED) 's%^prefix=.*%prefix=/usr%;s%$(STAGING_DIR)%%g' \
-		$(STAGING_DIR)/usr/lib/pkgconfig/libscap.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/libsinsp.pc
-endef
-FALCOSECURITY_LIBS_POST_INSTALL_STAGING_HOOKS += FALCOSECURITY_LIBS_FIX_PKGCONFIG
-
-FALCOSECURITY_LIBS_MODULE_SUBDIRS = buildroot-build/driver/src
 FALCOSECURITY_LIBS_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
 
 # falcosecurity-libs module needs these two kernel options to be set:
@@ -76,5 +26,6 @@ define FALCOSECURITY_LIBS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
 endef
 
-$(eval $(kernel-module))
-$(eval $(cmake-package))
+$(eval $(virtual-package))
+
+include $(sort $(wildcard package/falcosecurity-libs/*/*.mk))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
