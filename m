Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBFC606A31E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JEcl+DCd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ClI0rAN7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAEFD81116;
	Fri, 30 Oct 2026 12:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxCewTaGjHjZ; Fri, 30 Oct 2026 12:04:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9231A81114
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793361854;
	b=p5Uy9m4j1Xs2FothklU91k5Xmgw/yKwpmDtyrb7VY0cR339Rq1MzAFyD3yjmzfvaltGE
	 Wn9fS/YMZYwBRa7ENLJc0vhjHUFPkH9dt2mmH0kwzlntCk+rHfffpYFxpjZJTB1P9ArWa
	 8LE0eCKDdmD5XDcVUr9iBkB/6wFawhu1Sr5v1FAhpz+3Kl7OBy3eaIkAD29ACKGJ8EhZL
	 iO840dYNp/hz+kVQSRmuFcrD6IIu90e9iHzvtSDEeHPxcIfGkDRnRH9o/vaxHnzCFeKCM
	 UIo5Khly5E1/+nqqeKqIS80NedJs1F1IglluxUySgi7VObbq3G8zk4TdqLN3v8STozg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793361854;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Y0u0WsXF0SplC+E8xDNxEssLGagnai1VdNKQDIYuSWE=;
	b=eaSWHCTooB6BGmwpxCNr7iLUJl40WLz4gUH361OiH3q6v3SgfpBMhXEf8P7GZJM7rkbZ
	 8UhvT8Q0OSLzlVq1RGF3qt6ZEHu7f4YfNcT2VlOPTSnLINemxQTHAofSYnBvblPDoxpTI
	 +GV53Z86S9kpKtzfPJabPh92U0FJ23c3e3hGxsSO5EOT3TI4wcxU8zym6WKHSDbO9edmz
	 Y0pwALc+7+so5frhCD70dbxokN9FZGHNuvR6Oj6Gm5CQNNl33NzTUnLv07ieFFzhA8i5M
	 XcdQgOfbVsJnQ4pfbdMktjgIfDherD7uKcsok/I/u8sqsk1hZaclQMXI82j/XFXDm6g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793361854;
	bh=Y0u0WsXF0SplC+E8xDNxEssLGagnai1VdNKQDIYuSWE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JEcl+DCdsQkZisq6lVtcUKLmgrhgpVUuAesHerAbW7qEQRvryrmhuZMASLjZ6q8jp
	 fH+tfujVGOPCWqiQNEEYFAY/0gBucUA0evjM3wv5OAxCR7W1zKdK1d4uythm0InWJp
	 jc74E7Iw44GOBJdf9/7w7YG5JqCSjU+dJ3zhzsogxbzi26onGhCsL6DkOuIKr8Gv5S
	 6EBV8h188I6Ufc6TND+9ZLT3OWxwPl8sLExtlWlU+78dFVqeS1hPy01Z9CsDCSaRjC
	 KJSprq8/ankfU+0EiDa/QZhMOXKwEzYmetVDXvoqdCR0Tl0n1rtuHULb/+Hqtbfg+s
	 zpeXFeXmPR5gQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9231A81114;
	Fri, 30 Oct 2026 12:04:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AC29362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CBE240A95
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZJaWtW_XoRv for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 12:04:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3D5EA406EE
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793361849;
 b=Ffg9+5xXhSplVBp+iiOvUGOED42nCrEhfUoE5oG/riOz1OhPHKEVJNH9cYtmREHxsTcp
 MkZsgV76ntmJwisGlfKK7ULHZNeZ6gNrEDAv97TTu3Gh/bB8YaGrqOXD3g3NGAPD/2/jH
 BvJa5Wl2NPcPC4aJQzOuD7hZwVZk1tJx8YBSBDqbN+Xu5MkxrEXd7HsrZgzBexnoeKqqt
 WAmzOqNvaMTNdSux/usA4gXtfvqeoLcla80BxfI+An6rRj2/2DjtC9Ym2Axq39jjUxyNF
 pstdha2S9pYa+eRjFaYyW8gwNFM42+nSfPQ3SRq2FPYZkBrftJqqDUerbH+FH6dehkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793361849;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Yy6PYSWIAEjQgEYUjW2+qApmieA1NLh7fhQrXtN4k+k=;
 b=Umy1kw8lSfRNSpQPG1WDl2GJL8hcze7PVSbJZQY4/VTb+AS48whl0QJZsOrbsrcFAd7/
 aVY6IDD56Zd/yWBJYWkHeiqAP/Fn5rJoBmX72A0ywiDhso/6THj8sb5cxC8w1e3nghvrt
 R3pmOdD+udDgYjrTBILtqypciDixpjeoy6SGnoX3BhuBO8kA5+shR3VWDTSSQLbxwl0Mr
 s6cWeOOTjUbD767VzOe4vEffJkWoKsNTpy0GQhZr4jZobXFg724lY0fRYjJpQBqcmEe8h
 ahjL/qN2poil5PUGxXq5BVAVkzlWs/ES8dLkwHzUZfCqOsm9/PtZwly/dbqfL0OdAJQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=ClI0rAN7; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=ClI0rAN7
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D5EA406EE
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:04:08 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48afcd7ba9bso436078f8f.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 05:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793361847; x=1793966647; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Yy6PYSWIAEjQgEYUjW2+qApmieA1NLh7fhQrXtN4k+k=;
 b=ClI0rAN7lHzqKUykk+c94AnVwhgpoiAfRElPuYlkubA1pZB5VffpAPdaYi5nMmpEbM
 n5qJdDRW4m5WOv01HPwwtS2CPrn8jv4VtTVsyuxFi0YOKaCwifl64+pZ03lkkFbG/ckc
 Bn1/yMyhO+JeaifaqgIkFE3GbBGTKRD7inAATRfXTH7ybGolC8ZjqpHbZ/ikfQngbdz1
 eESF0jxyYa+vAgbvzcJmECvLXtiYpEla/H4M4hwgsy9F69cAdFuDfVEsRP+9vGLlm7HZ
 v5Y7yNx0hfexZpMjkdoPSFII1iZxHpoLJXDjB1a8whll4FEeAc+aGUNGkbIs1gAb1rXr
 KeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793361847; x=1793966647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Yy6PYSWIAEjQgEYUjW2+qApmieA1NLh7fhQrXtN4k+k=;
 b=rP50+RHx49+rMl17JNmcUVO4nqzKGVbofdEynq9WO9w7PHyFct8X+VNJ6xus+TBOcd
 Cke45DuyTrji1Dju/Pwuk2N83n7ugjQQHNFqQ0FL3V9UZB42xlLovCJHwJgp4a8Dney/
 vZyyVEy+UHszhhyV1xSwIXJXEL4I/oWzsBnkG4XxdAJJBF/iwfD+pg4nNpLFT0At0BgD
 f4jKXS8HnkypmJyDsq7tl92N21+llCQWfBOnvHjlhd87DFprrhWjaSga6imBohkoFHal
 klHcUfMTUOzXz0RxUQpMLLpMMSjQsD411Edn+gH9RAw77hvDeTSJaCJFTP7HyhR4wBFj
 05ow==
X-Gm-Message-State: AFq9FYIRoOEEoXOVJK4f611pt3TWhmPdSRrdxQUcGRbpeTkDLyPLidVh
 Hey6auKHM7ENwzbwfg9Nj8eGqphsz7vJvB4MCUjCh8PQbx/K41x+sZZIDa8ndw==
X-Gm-Gg: AYBFou1sfBSZpbRxuap6rEoLeVZa/bRqwnKvnhTYOp0GNB08GP+ZZf3ynNEgRCCTYN8
 MOL0MSn2Ib2jvNbB6Z3sZ6GWfcU21e9rujTw7j0b+rgw+dxCu0DHXH1mgOILG/EA27FjqcsPCbb
 wZqnxIOrvm3LW0g7eJIXCr4lzzV8ZpTG/h3GDcF2EGKIoDNQvaCcs/drP6pIA10a1UsMDAYnoGA
 sM5eyEGIQIKvWPZ7eExGynRWNI9rjedsVsGHrFEcsrS0IzgsUHbbhp/kGxbTtGQRrCIxSeJ15qf
 wB+HkwbX+enHGRleuWU/DpdKhCYzqSSPBfHCXppOr2/pHHAzd/ZpaOrOzvqpzq5ekPo/21QpRX+
 3dpjAxPjVER5RCLwJALGiE7HlpoS9jSsD9gvnO7EAPfFEspI5umzxkDilQEBfTNaFiRM0CEYOGP
 43IUJYAi3V4RBD+ABaVxY2dvKZ/xHk6pndT0e9bSb5BCmvMvYB+xt4ZQ6R5bAlJHVT8VwPtieRW
 VqNeH3qz1KygQOyv7tBDfJ/1qmI0+VsdR/gYiM2qBq6mxPNvMVKZD5k7lWjOyRX06+uzmngndgs
 xdB1LK6caK0Hkwhoezs6Qw6h2yWpjDWyJ/qOZ/WkHRxwT4izc6XI4Q==
X-Received: by 2002:a05:6000:40ca:b0:48c:5304:5e50 with SMTP id
 ffacd0b85a97d-48e6e2620d8mr5514660f8f.0.1793361846609; 
 Fri, 30 Oct 2026 05:04:06 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b81c74sm2848917f8f.36.2026.10.30.05.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 05:04:06 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 13:04:02 +0100
Message-Id: <20261030120402.3171912-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030120402.3171912-1-angelo.compagnucci@gmail.com>
References: <20261030120402.3171912-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mono-btls: new package
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Linux, the BoringSSL based BTLS provider is the only TLS
implementation of Mono: when it is disabled, as done so far, any TLS
connection (HttpWebRequest, HttpClient, SslStream...) fails with "TLS
Support not available".

The BTLS provider is a native library built with cmake from the mono
sources, which bundle BoringSSL.

The BTLS provider looks for the trusted root certificates in the Mono
machine certificate store, /usr/share/.mono/new-certs/Trust, as
<subject-hash>.0 files: make it point to /etc/ssl/certs, which has this
layout, and select ca-certificates.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/Config.in                     |  1 +
 package/mono/mono-btls/Config.in      | 16 +++++++++
 package/mono/mono-btls/mono-btls.hash |  1 +
 package/mono/mono-btls/mono-btls.mk   | 51 +++++++++++++++++++++++++++
 package/mono/mono.hash                |  1 +
 package/mono/mono.mk                  | 24 +++++++++++--
 6 files changed, 91 insertions(+), 3 deletions(-)
 create mode 100644 package/mono/mono-btls/Config.in
 create mode 120000 package/mono/mono-btls/mono-btls.hash
 create mode 100644 package/mono/mono-btls/mono-btls.mk

diff --git a/package/Config.in b/package/Config.in
index 796c4f1ad6..ab8996f7d3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -815,6 +815,7 @@ endif
 	source "package/mono/Config.in"
 if BR2_PACKAGE_MONO
 menu "Mono libraries/modules"
+	source "package/mono/mono-btls/Config.in"
 	source "package/mono-gtksharp3/Config.in"
 endmenu
 endif
diff --git a/package/mono/mono-btls/Config.in b/package/mono/mono-btls/Config.in
new file mode 100644
index 0000000000..7f69e4d9b1
--- /dev/null
+++ b/package/mono/mono-btls/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_MONO_BTLS
+	bool "mono-btls"
+	default y
+	select BR2_PACKAGE_CA_CERTIFICATES # runtime
+	help
+	  BoringSSL based TLS provider for Mono (libmono-btls-shared).
+
+	  On Linux, this is the only TLS implementation available in
+	  Mono: without it, any TLS connection (HttpWebRequest,
+	  HttpClient, SslStream...) fails with "TLS Support not
+	  available".
+
+	  The trusted root certificates are taken from the
+	  ca-certificates package.
+
+	  https://gitlab.winehq.org/mono/mono/-/tree/main/mono/btls
diff --git a/package/mono/mono-btls/mono-btls.hash b/package/mono/mono-btls/mono-btls.hash
new file mode 120000
index 0000000000..70c863deb9
--- /dev/null
+++ b/package/mono/mono-btls/mono-btls.hash
@@ -0,0 +1 @@
+../mono.hash
\ No newline at end of file
diff --git a/package/mono/mono-btls/mono-btls.mk b/package/mono/mono-btls/mono-btls.mk
new file mode 100644
index 0000000000..4f807c09b9
--- /dev/null
+++ b/package/mono/mono-btls/mono-btls.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# mono-btls
+#
+################################################################################
+
+# Built from the mono sources, which bundle BoringSSL
+MONO_BTLS_VERSION = $(MONO_VERSION)
+MONO_BTLS_SITE = $(MONO_SITE)
+MONO_BTLS_SOURCE = $(MONO_SOURCE)
+MONO_BTLS_DL_SUBDIR = mono
+MONO_BTLS_SUBDIR = mono/btls
+MONO_BTLS_LICENSE = MIT (mono-btls), OpenSSL and SSLeay, ISC, BSD-3-Clause (boringssl)
+MONO_BTLS_LICENSE_FILES = LICENSE external/boringssl/LICENSE
+
+# Only build the TLS provider library, not the boringssl tools and tests
+MONO_BTLS_BUILD_OPTS = --target mono-btls-shared
+
+MONO_BTLS_CONF_OPTS = \
+	-DBTLS_ROOT=$(@D)/external/boringssl \
+	-DSRC_DIR=$(@D)/mono/btls
+
+# Pass the processor name expected by BoringSSL, as the mono configure
+# script does: it does not know all the Buildroot ones (armv7l, i586...).
+# Like configure, disable the assembly code on ARM. The other flags
+# passed by configure are not needed: -m32 is implied by the toolchain,
+# and the aarch64 assembly code enables the crypto extensions itself.
+ifeq ($(BR2_i386),y)
+MONO_BTLS_CONF_OPTS += -DBTLS_ARCH=i386
+else ifeq ($(BR2_x86_64),y)
+MONO_BTLS_CONF_OPTS += -DBTLS_ARCH=x86_64
+else ifeq ($(BR2_arm)$(BR2_armeb),y)
+MONO_BTLS_CONF_OPTS += -DBTLS_ARCH=arm -DOPENSSL_NO_ASM=ON
+else ifeq ($(BR2_aarch64),y)
+MONO_BTLS_CONF_OPTS += -DBTLS_ARCH=aarch64
+else ifeq ($(BR2_powerpc),y)
+MONO_BTLS_CONF_OPTS += -DBTLS_ARCH=powerpc
+endif
+
+# The BTLS provider looks for the trusted root certificates as
+# <subject-hash>.0 files in the Mono machine certificate store, which
+# is the layout of /etc/ssl/certs created by the ca-certificates
+# package.
+define MONO_BTLS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(MONO_BTLS_BUILDDIR)/libmono-btls-shared.so \
+		$(TARGET_DIR)/usr/lib/libmono-btls-shared.so
+	mkdir -p $(TARGET_DIR)/usr/share/.mono/new-certs
+	ln -sfn /etc/ssl/certs $(TARGET_DIR)/usr/share/.mono/new-certs/Trust
+endef
+
+$(eval $(cmake-package))
diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 06a45e0fd1..d01dc3f998 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -3,3 +3,4 @@ sha256  3024c97c0bc8cbcd611c401d5f994528704108ceb31f31b28dea4783004d0820  mono-6
 sha256  844242559dbdb96cb9cbe103b06c2bc8a349f19ad0b89d5c3cf830a8914333f6  LICENSE
 sha256  fc488f3ec9f36856bea8cce5cdde1449176341ef93a3962b691970f8981799f4  mcs/COPYING
 sha256  2c3c3ef532828bcd42bb3127349625a25291ff5ae7e6f8d42e0fe9b5be836a99  external/Newtonsoft.Json/Tools/7-zip/copying.txt
+sha256  2404801e55fe82c3b5b258c5328facbc25c823f07e7ef3fbd69160c888b02288  external/boringssl/LICENSE
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 0c833fe9ba..c71b346f08 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -23,12 +23,22 @@ MONO_COMMON_CONF_OPTS = --with-mcs-docs=no \
 	--with-ikvm-native=no \
 	--enable-minimal=profiler,debug \
 	--enable-static \
-	--disable-btls \
 	--disable-system-aot
 
 # Disable managed code (mcs folder) from building
 MONO_CONF_OPTS = $(MONO_COMMON_CONF_OPTS) --disable-mcs-build
 
+# The BTLS native library (the BoringSSL based TLS provider) is built
+# by the mono-btls package, the runtime only needs to know that it is
+# available. configure needs cmake as soon as BTLS is enabled.
+ifeq ($(BR2_PACKAGE_MONO_BTLS),y)
+MONO_CONF_OPTS += --enable-btls --disable-btls-lib
+MONO_CONF_ENV += CMAKE=$(BR2_CMAKE)
+MONO_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
+else
+MONO_CONF_OPTS += --disable-btls
+endif
+
 # The libraries have been built by the host-mono build. Since they are
 # architecture-independent, we simply copy them to the target.
 define MONO_INSTALL_LIBS
@@ -49,12 +59,18 @@ MONO_DEPENDENCIES += \
 
 ## Mono managed
 
-HOST_MONO_CONF_OPTS = $(MONO_COMMON_CONF_OPTS) --disable-libraries
+# Always build the managed libraries with the BTLS provider, it is only
+# used when the runtime is built with BTLS support. The host does not
+# need the BTLS native library itself.
+HOST_MONO_CONF_OPTS = $(MONO_COMMON_CONF_OPTS) --disable-libraries \
+	--enable-btls --disable-btls-lib
+HOST_MONO_CONF_ENV = CMAKE=$(BR2_CMAKE)
 
 # ensure monolite is used
 HOST_MONO_MAKE_OPTS += EXTERNAL_MCS=false
 
-HOST_MONO_DEPENDENCIES = host-monolite host-gettext host-python3
+HOST_MONO_DEPENDENCIES = host-monolite host-gettext host-python3 \
+	$(BR2_CMAKE_HOST_DEPENDENCY)
 
 define HOST_MONO_SETUP_MONOLITE
 	rm -rf $(@D)/mcs/class/lib/monolite
@@ -65,3 +81,5 @@ HOST_MONO_POST_CONFIGURE_HOOKS += HOST_MONO_SETUP_MONOLITE
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
+
+include $(sort $(wildcard package/mono/*/*.mk))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
