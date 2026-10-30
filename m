Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DC1606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 13:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ekgc1LCj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x42eh5c1
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43AC240B0B;
	Fri, 30 Oct 2026 13:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hM59UiNTPmpL; Fri, 30 Oct 2026 13:59:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1084540B10
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793368783;
	b=aKbPmZrQJNsmoHgqDYO/U5PZ7UEF9zCDLVzQJtn4owrEze99nAcHPoeLouMSuu73Bydq
	 0w44e9dGtykxb49W8+HrWMe5IEubhAghQENaWoFrx0SfhfyheIODPDJhcVbL7YidegXGR
	 /6a4nocU9DAxzK2GVuU0bIzhAK8vgnIN5ZlbbwPeO+gdkfx3fJmdgm55EaqLP42811i4S
	 IXw4woDGhv/caKkWSwinZV2FFMp8mEjDqVuH8WrDWnnJqJU+R360X5liA+3WRgXmlAkWz
	 wlJ0R/yTZcmITv7o8uadQFRZIlwblm3eBlsU91IddLH3vG7QLh5mT2/amGWQ7pd8gXw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793368783;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=k0iofwqPJ9EMOJ80aY/AvbWCag1vowb5OZC0imry3lg=;
	b=FF5DdsYsSh+eVqeKpKpZ6tjakXOVDvTr9816KHq30Pea1AbjXNaPkM8dy+8AYKeLyDaq
	 HrGGn2vLGVx86jt9ZcP2a0HZn0v27ABHh0wFm8GyXNs1P+3/LvzGdk6k7QHsNHTqILrED
	 ldJYGT5dIpEvNOGGDbCaaVNuGoD1cSBIyVFnWhxBnJs3dgoI3EZTuSb7RT0sjhRkkysrU
	 j5Nv6la9dhiYARBrbN+EF6B0XCoY5t6c6XiBmQfO36N38op/cF4o1E1orsVv/gmUUNhFw
	 E/ta1ePvMp+FH42Rd3B9+8SsWmoh1PPk8Ephaney3WoKD4LZJzPN1ZY14An8lehS2yw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793368783;
	bh=k0iofwqPJ9EMOJ80aY/AvbWCag1vowb5OZC0imry3lg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ekgc1LCj/me1U07yair1vsZWDjx58aSdPxURRzYPNVuopX2G6GudMLcDKDzz2EANR
	 uNvCbHGDGIaE/8LTt/KeR/r8HRwSzSRj/hqf2yWkXCkarT9uS/VJChJMY31xdxHxMy
	 XEad8xoh1qn6STsXUszSWD36kBlovTiNFyCHOFZzi5y1AVDLSWbH0jotXYAQARcBNK
	 MQsz/I9tQfTTA4L1sZk3AxgDAc8XIZieQgdmvCimD6xuKb3O8ahWLALbmxgkuhwXH/
	 LLD0ehu44mCLa08A9nh7a7WwT1DVUGbID3n0NEc3HV617cjqr6mHNu7rq0b5mkwVME
	 FbluvUn8kc7eQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1084540B10;
	Fri, 30 Oct 2026 13:59:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA6DA529
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D053D80F24
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ex8tmRZALceg for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 13:59:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9AFD7810B0
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793368775;
 b=Wj6pd2dbEc228/yU0TtQLxK/Nt98aVz3jFVdtk1gh3GBBEJWKKZkFCADTKS9hP65XeA/
 RTbB4GOshF28bg62xGuSeZ1GQHWkh6m2CRNh1VJwmMJ3c0soa2MxHFnE3iJvzrcMuwnma
 WHu3OWGcyItw6w1Q81tn/rRVWZ5l1bKwX/i/HvnbR7zHCoLvbqVWR+ZDAI2K8okNx2vzz
 sCR1b9EgEmyWgkd4abeQM8rkqTEUF1tuNgrzFScPsogy05UmK/tT2DMeQNK66k58DT3bf
 Rgt3GPqP9hEUN3GtrYojR1DUq5Jc26eitun+vjiSqSiPpvpxWE/zOHubQysdwZo9Y6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793368775;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=K0qO4Xugb33XJDX1WQ/0N84/N9n06Pxh1ywr2KJJwQU=;
 b=huHJUoTPiMVcFtlvBSsPQ37CgRBQyUSBwl8u0y4giqn/muepcIkwP9laMmziaftEeqKS
 2sIwOYnZrZQEpJ2HnoKp/EuDzpnilhNevj6n0miX/4jGmb0iqpArp6mVJYTmYybOg4wat
 8LJDKNzwZpi3/FDR7EsnrJLJ7fU5ApljLxf2q/RLo9qISC3NrGzjY95qDLfEL087riRqZ
 Rj0EQ+0wY7DsgdbiuoCXtwDoTguDasiJ0NDcfT4R7X/OjCS354160V9pVFxjcF9AheahI
 P191Nbcr+OvUCXQmz9tN18n5iL02FAuC5YQ2bkotK84XVVSxnL12JsRCOhDx6VS82tg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=x42eh5c1; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=x42eh5c1
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AFD7810B0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso435308f8f.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 06:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793368772; x=1793973572; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=K0qO4Xugb33XJDX1WQ/0N84/N9n06Pxh1ywr2KJJwQU=;
 b=x42eh5c1PeoteteJnS3yQvCOI6bE5uEIIBZdXUOBTnW5Eg36NGvHji+DEsR41OGGAq
 PKwRHa523GO6F04ePZ+14sRlttX5XbVWLKf9d/kSsl0Nq6oBVRCbDvCf0aWR5HhfjkVG
 k7Zckp9kx+JD/D4Zqa67tpajFgiAnH7MqkEcI6FX4nAXve9S6RwrGCGrnAVu+CASW/hI
 7Ffl1pa9qBk4121HxffQ/7u50dBBsgWS4SemCDlKxPrehl+GvCyalAo+Bg4FSjx9YLqH
 DDWz609dI3aIkzMDE4xN1JRIuTk34NEXu6TwQV2+1hIdg1Hi4mIs8l7x4x2nvsqva0+9
 vZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793368772; x=1793973572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=K0qO4Xugb33XJDX1WQ/0N84/N9n06Pxh1ywr2KJJwQU=;
 b=Xhh1fmDrlnCKY6aOtEfkqC3QsPyE6q0DXMz5ZAWqC28fpQVtpVwz8eUhVxgFHvU7+Y
 vsDYTrJyHSsEHtysY559L64sX36n02CCiE1aoh+mvplhJbH4aAOgHjv5ssC5i7mkwbWC
 iPsdr4AdUBkzqKk3fnFg2nWPrnzDM1qHndTHzcuwtg7FByfRimOPWKuRb1bUzJAafmdf
 3QmXapMtC38NjMd98Qi8BUJ3fbxNNuWnxdJeJeT9xW4Bn9pLcZjOvpvqR3iZfsHjLuDN
 T2NJWclzrj37iSbfLRUCRMg8I0NM7r01O4zPQJhzgBU86fhTJ9+sgrcbNkkzgvCS8yEX
 Ascg==
X-Gm-Message-State: AFq9FYINC3vsjZrJHbLdVDJ9es0k15+2lgQ42Cc8+S/Eiy2a1GRySzf4
 WjtEn14uXlx3eMDFzvO2mRjkxugC2jq7EA4iEDBbJD+x1niZQ8DljFNvWR1Xqg==
X-Gm-Gg: AYBFou2cLoqajz94evAlYweBM4wfkpZ7taqAiAhV5ZmoRB1iGGWtJw2VG0i5tf3mKbB
 zHzuqslVd8xsUNON7W8fot611oD2PdVJXf2ObwRQWnbfeSiqlxtS2ls+Oa5X88Puzbzs3onvWqr
 rma/tFQ5uxjadkfRdxYJYff7jn3D4PV1Tq/ZTYkbiIyBVZH4uCP4Ej3+TwS4ceJPu1Z1ameY3Lh
 P/YaNRFcBjkfoYStQgJUCQn7z69wVNbK3vs/CRh8r05HFBctIOwfXAWz95jA6AQFJQcI1XOM735
 juSpdaVaP/cSKRV0IvnweP4Vishdsc+TTBI+mVFtnoM46K4SjRND/uHAZ5KHpOry6Abg1W/Ca4V
 AC/zKGf2XWCxU4n00wxbgNKaF/EMHmGRkp/VVOkso8ZX9yTFgV/2aDjh9ZnBvEdV0mgmHDr2eWU
 doJ4gzi7fPyxNPwZXB4nG8Oo1aUhoTiYuQgvf/ZO/3TirTUpTg7wEfVKkR3+YEREbjHsESD6i30
 g43JXMFd0YDg9RjSsrRqT/QH7yoDjaxrjkvAjF/Sy4WlFQtlNW+dA95Sbv7MmLSjROMdAkFMnoV
 GC3hN0GvaoS33apNupGcF2iuPAYI3uQHIyP/KQAMjCLfa4kVnbJbjqyuQMnWRQTJZe3ejLQiX7Q
 =
X-Received: by 2002:a05:6000:4284:b0:48e:3678:5112 with SMTP id
 ffacd0b85a97d-48e6e2ef7b0mr5412583f8f.21.1793368771342; 
 Fri, 30 Oct 2026 06:59:31 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b959c1sm3423347f8f.45.2026.10.30.06.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 06:59:30 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 14:59:16 +0100
Message-Id: <20261030135916.3599219-9-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030135916.3599219-1-angelo.compagnucci@gmail.com>
References: <20261030135916.3599219-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 9/9] package/sysdig: add sysdig-legacy
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add sysdig-legacy, providing sysdig 0.31.5 on 32-bit architectures. It
is the last version using falcosecurity-libs 0.10.5, provided by
falcosecurity-libs-legacy, and the 32-bit architectures are now enabled
in falcosecurity-libs.

sysdig-legacy builds the userspace libraries from the
falcosecurity-libs-legacy sources and links them statically, as it
doesn't install them.

To keep the build small, it uses the minimal build, which doesn't
support Kubernetes, Mesos, the container metadata and the eBPF probe, so
it doesn't need grpc, protobuf, c-ares, libcurl, openssl and elfutils.
The full build can be enabled in a following patch.

The libsinsp examples are not built, as they are not needed and fail
to build with musl.

Patches: backport the upstream switch to C++17, as needed by the
libabseil-cpp headers included by re2.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/falcosecurity-libs/Config.in          |  3 +
 package/sysdig/Config.in                      |  7 ++-
 package/sysdig/sysdig-latest/Config.in        |  1 +
 .../0001-CMakeLists.txt-build-with-C-17.patch | 33 +++++++++++
 package/sysdig/sysdig-legacy/Config.in        |  4 ++
 .../sysdig/sysdig-legacy/sysdig-legacy.hash   |  3 +
 package/sysdig/sysdig-legacy/sysdig-legacy.mk | 56 +++++++++++++++++++
 package/sysdig/sysdig.mk                      |  4 +-
 8 files changed, 108 insertions(+), 3 deletions(-)
 create mode 100644 package/sysdig/sysdig-legacy/0001-CMakeLists.txt-build-with-C-17.patch
 create mode 100644 package/sysdig/sysdig-legacy/Config.in
 create mode 100644 package/sysdig/sysdig-legacy/sysdig-legacy.hash
 create mode 100644 package/sysdig/sysdig-legacy/sysdig-legacy.mk

diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
index 079dc1f376..a897cadd90 100644
--- a/package/falcosecurity-libs/Config.in
+++ b/package/falcosecurity-libs/Config.in
@@ -1,11 +1,14 @@
 config BR2_PACKAGE_FALCOSECURITY_LIBS_ARCH_SUPPORTS
 	bool
+	# falcosecurity-libs-latest
 	default y if BR2_aarch64
 	default y if BR2_loongarch64
 	default y if BR2_powerpc64le
 	default y if BR2_riscv && BR2_ARCH_IS_64
 	default y if BR2_s390x
 	default y if BR2_x86_64
+	# falcosecurity-libs-legacy
+	default y if !BR2_ARCH_IS_64
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # re2
 
 config BR2_PACKAGE_FALCOSECURITY_LIBS
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 35f28bf6cd..f00f6c4762 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -11,7 +11,8 @@ config BR2_PACKAGE_SYSDIG
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # falcosecurity-libs
 	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # chisels
 	select BR2_PACKAGE_FALCOSECURITY_LIBS
-	select BR2_PACKAGE_SYSDIG_LATEST
+	select BR2_PACKAGE_SYSDIG_LATEST if BR2_ARCH_IS_64
+	select BR2_PACKAGE_SYSDIG_LEGACY if !BR2_ARCH_IS_64
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	select BR2_PACKAGE_YAML_CPP
@@ -38,6 +39,8 @@ config BR2_PACKAGE_HAS_SYSDIG
 
 config BR2_PACKAGE_PROVIDES_SYSDIG
 	string
-	default "sysdig-latest"
+	default "sysdig-latest" if BR2_PACKAGE_SYSDIG_LATEST
+	default "sysdig-legacy" if BR2_PACKAGE_SYSDIG_LEGACY
 
 source "package/sysdig/sysdig-latest/Config.in"
+source "package/sysdig/sysdig-legacy/Config.in"
diff --git a/package/sysdig/sysdig-latest/Config.in b/package/sysdig/sysdig-latest/Config.in
index 2af84e1917..5cbb10f5fb 100644
--- a/package/sysdig/sysdig-latest/Config.in
+++ b/package/sysdig/sysdig-latest/Config.in
@@ -1,3 +1,4 @@
+# sysdig for 64-bit architectures, selected by BR2_PACKAGE_SYSDIG
 config BR2_PACKAGE_SYSDIG_LATEST
 	bool
 	select BR2_PACKAGE_HAS_SYSDIG
diff --git a/package/sysdig/sysdig-legacy/0001-CMakeLists.txt-build-with-C-17.patch b/package/sysdig/sysdig-legacy/0001-CMakeLists.txt-build-with-C-17.patch
new file mode 100644
index 0000000000..d033e0eddb
--- /dev/null
+++ b/package/sysdig/sysdig-legacy/0001-CMakeLists.txt-build-with-C-17.patch
@@ -0,0 +1,33 @@
+From 1b544d328d0afbde2f1443a3f4cb1ef332d65592 Mon Sep 17 00:00:00 2001
+From: Roberto Scolaro <roberto.scolaro21@gmail.com>
+Date: Mon, 5 Jun 2023 12:41:02 +0200
+Subject: [PATCH] CMakeLists.txt: build with C++17
+
+Abseil, used by re2, needs C++17.
+
+This is the C++ standard part of the upstream commit bumping the
+falcosecurity libs to version 0.11.0.
+
+Upstream: https://github.com/draios/sysdig/commit/954e6fc6238f21d4870a491395d68a7dd3062aa9
+[Angelo: only keep the C++ standard change]
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0309d66..cadca83 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -90,7 +90,7 @@ if(NOT WIN32)
+ 	endif()
+ 
+ 	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_COMMON_FLAGS}")
+-	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_COMMON_FLAGS} -std=c++0x")
++	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_COMMON_FLAGS} -std=c++17")
+ 
+ 	set(CMAKE_C_FLAGS_DEBUG "${SYSDIG_DEBUG_FLAGS}")
+ 	set(CMAKE_CXX_FLAGS_DEBUG "${SYSDIG_DEBUG_FLAGS}")
+-- 
+2.34.1
+
diff --git a/package/sysdig/sysdig-legacy/Config.in b/package/sysdig/sysdig-legacy/Config.in
new file mode 100644
index 0000000000..dc485a0fba
--- /dev/null
+++ b/package/sysdig/sysdig-legacy/Config.in
@@ -0,0 +1,4 @@
+# sysdig for 32-bit architectures, selected by BR2_PACKAGE_SYSDIG
+config BR2_PACKAGE_SYSDIG_LEGACY
+	bool
+	select BR2_PACKAGE_HAS_SYSDIG
diff --git a/package/sysdig/sysdig-legacy/sysdig-legacy.hash b/package/sysdig/sysdig-legacy/sysdig-legacy.hash
new file mode 100644
index 0000000000..efdd73b201
--- /dev/null
+++ b/package/sysdig/sysdig-legacy/sysdig-legacy.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  9af98cae7c38273f7429ba0df628c9745bd92c949f444e180b9dd800af14c6dd  sysdig-0.31.5.tar.gz
+sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b2702  COPYING
diff --git a/package/sysdig/sysdig-legacy/sysdig-legacy.mk b/package/sysdig/sysdig-legacy/sysdig-legacy.mk
new file mode 100644
index 0000000000..c1252dfd89
--- /dev/null
+++ b/package/sysdig/sysdig-legacy/sysdig-legacy.mk
@@ -0,0 +1,56 @@
+################################################################################
+#
+# sysdig-legacy
+#
+################################################################################
+
+SYSDIG_LEGACY_VERSION = 0.31.5
+SYSDIG_LEGACY_SITE = $(call github,draios,sysdig,$(SYSDIG_LEGACY_VERSION))
+SYSDIG_LEGACY_SOURCE = sysdig-$(SYSDIG_LEGACY_VERSION).tar.gz
+SYSDIG_LEGACY_DL_SUBDIR = sysdig
+SYSDIG_LEGACY_LICENSE = $(SYSDIG_LICENSE)
+SYSDIG_LEGACY_LICENSE_FILES = $(SYSDIG_LICENSE_FILES)
+SYSDIG_LEGACY_CPE_ID_VENDOR = $(SYSDIG_CPE_ID_VENDOR)
+SYSDIG_LEGACY_CPE_ID_PRODUCT = sysdig
+SYSDIG_LEGACY_PROVIDES = sysdig
+SYSDIG_LEGACY_SUPPORTS_IN_SOURCE_BUILD = NO
+
+SYSDIG_LEGACY_DEPENDENCIES = \
+	falcosecurity-libs \
+	json-for-modern-cpp \
+	luainterpreter \
+	ncurses \
+	yaml-cpp
+
+# sysdig forces the bundled version of some falcosecurity-libs
+# dependencies, unless they are explicitly disabled.
+SYSDIG_LEGACY_CONF_OPTS = \
+	-DUSE_BUNDLED_DEPS=OFF \
+	-DUSE_BUNDLED_B64=OFF \
+	-DUSE_BUNDLED_JSONCPP=OFF \
+	-DUSE_BUNDLED_RE2=OFF \
+	-DUSE_BUNDLED_TBB=OFF \
+	-DUSE_BUNDLED_VALIJSON=OFF \
+	-DCREATE_TEST_TARGETS=OFF \
+	-DBUILD_LIBSINSP_EXAMPLES=OFF \
+	-DSYSDIG_VERSION=$(SYSDIG_LEGACY_VERSION)
+
+# To keep the build small, use the minimal build, which doesn't support
+# Kubernetes, Mesos, the container metadata and the eBPF probe, and so
+# doesn't need grpc, protobuf, c-ares, libcurl, openssl and elfutils.
+# The full build can be enabled in a following patch.
+SYSDIG_LEGACY_CONF_OPTS += -DMINIMAL_BUILD=ON
+
+# falcosecurity-libs-legacy only provides the sources of the userspace
+# libraries, which are built here and linked statically, as sysdig
+# doesn't install them. Don't build the driver as part of the 'standard'
+# procedure, it has been built by falcosecurity-libs-legacy.
+SYSDIG_LEGACY_CONF_OPTS += \
+	-DBUILD_SHARED_LIBS=OFF \
+	-DFALCOSECURITY_LIBS_SOURCE_DIR=$(FALCOSECURITY_LIBS_LEGACY_SRCDIR) \
+	-DDRIVER_SOURCE_DIR=$(FALCOSECURITY_LIBS_LEGACY_SRCDIR)/driver \
+	-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME) \
+	-DBUILD_DRIVER=OFF \
+	-DENABLE_DKMS=OFF
+
+$(eval $(cmake-package))
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index 3ee54a556b..4bd40f51a2 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-# sysdig is provided by sysdig-latest.
+# sysdig-latest provides sysdig on 64-bit architectures, and
+# sysdig-legacy, the last version supporting 32-bit architectures, on
+# the others, see falcosecurity-libs.
 
 SYSDIG_LICENSE = Apache-2.0
 SYSDIG_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
