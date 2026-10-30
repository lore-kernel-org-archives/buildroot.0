Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795DB606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lMFesuEP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r2KqrUM0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 564BE81144;
	Fri, 30 Oct 2026 13:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXzmwxXyyH5P; Fri, 30 Oct 2026 13:59:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3F737810B0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793368780;
	b=cF+fTvWtnsJ/0NZIYD0jC4WQBCTkJCAATF+lg8rdUC1sV6UVCx5KWnJQjPQBPSO9GdFv
	 lD9msfNjH1vwd6pry7Yk77biI+CRYqOj0g3Vbr76Xz58/alQtXI2BeSpE/1YmMVGsLUI5
	 vqzpaLQIQzRHTnfComAEFE9jDBW/JnjNpfP8Bn+sDXMxFPbe5dLIff0gXHyUUngY3+REB
	 OcHcCWkilOPnYoEMHqMWIjxsPmWMXY2c0xmuII5oGCXFo8QP3qehgk0fdBpqmqBM5Ptmo
	 ckcQOe9jIhqFs+JIJXAxscPJzDgjSjbqnotKWmQHgRK4lXgSVahBScKw3ZxyDK1NHiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793368780;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=RFt7P1dO/fkg0oozLLa3buNXQ5e58q4yUNIt3u7QHks=;
	b=lmCDQwE1huaocx7BNau1XKyQCxZo3x6B7TQl8Rh5d1fbKzLcckBRKufskeUfjUwfkCuq
	 JI2PmC4hMgKwb05gcZjlvS5VPo+fIF+Y8hfI2sLofmA3CN0lePG8sxvBvrqy3K7dNyAXn
	 LGdcENGmBrn2fj/EWrt4uinxQaixMulcs8MzDS0NGgf37tDhTTVa7P3k5yvwZNYKnXKvn
	 dbi763EdLRsWLX1XjwEE8SL5Yo4KchnvxEfzFym86HghyLT2Zm6IpXpxlZ+96eouxkE0K
	 NAvaENsJP3kD3QeZEe4g4WLt9ucfQUWj2Z68be2fV7yo7rRmH7mkIbwaNt0mrQQ+Fzw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r2KqrUM0;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793368780;
	bh=RFt7P1dO/fkg0oozLLa3buNXQ5e58q4yUNIt3u7QHks=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lMFesuEPE8LfnJlZQHOuvbRYzgxu+XrIxu/80HHh1V4MGFgUnLEMGNU9u0Z3Ow2Z5
	 iZ4tcWX5hwfdZ5kctMFHjEt6KBmAXuLNHoDDuuTCaGawCv4QM7CyD0WCOB83jVLnxQ
	 P/kkRH2tkl5myqzAUYy5gX06N2bisHrPgg5E2jyekBeXSJHSQ55TShnflHBvyRHNFz
	 JxU7Wn9XT/i5dH1+VhXEdyr5smvXIZmUIkf8mNEaRVljwzHGM0B1vRxm5rMvUQQl0k
	 vdytzmR4pv9wMagpd5iYnoM0/1K6p/auu3xw25NeN9Eo/IjXE0C30OZF/QntJrYdio
	 wyZ+WRYoQYfaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F737810B0;
	Fri, 30 Oct 2026 13:59:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D22F529
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8329E80FA3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdXxGbQgPLkN for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 13:59:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6EDB98107C
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793368772;
 b=B5OGgSTO1Cpc8hbJQLLURyyO0kHYD/7NExIpbpI8MIpOmco8dmhyPPvlbhGxhMkDrTGS
 SKXgruLJFlsbIuPkoBCYw+HT8XC+OO0pE/1W46ndBgbzw7AQNrTYzh710zoYEu8yzU2zC
 0oPqmM5fws2f9YM/iiM9oRVVI6KQh3lFf8Yp6k3HBHvcyavT7+osf3/4bmc4EHTkqWBba
 /zLdzP+nXBW9UTI+uJr/60r5SdvTnbrcRG0xrd3eGpOTUXx7AcHTPOlw6msgMazD+o7kD
 2Wi8vhe3uVZ1Rgc1q69Ik2betpt94Tsy+UO6gur5hZmpetvnTpzAX64U2q/bq5TB2BQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793368772;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=hHlX7opppHyW9eOAG/3AYFSqVMArqV/475LfPDT13eM=;
 b=qEIcdLuXg/liwPO6GcuyNymF7BLrJBTw3Rpm2ymqSatGaHbKZT8AJha9TUoZVPWPOwi4
 hzcA2ipy8UFLwhSkvyxUS/kThEvY/9gxNkmF2J42Mp8lFZgKfjEyrY5+r2LiuDPU5m0KX
 trECYviNmPxmBKY9Z1al8SQlw1woATC4srS6XYEhP6e2mmE7MHcMfWER4V9pQPfM4pIHb
 qTc6nq0lftIBYKuOtQPPPF++zWUbP2Bik6RB2Lm1DXTY3jj34tnLNhFictn8gCcS4hLk+
 Oy5gXvKt6DftJLlTXWEKIZEEndcHm/tmdPhDftgttyqevij+lXoVgLYOSgvBIuQAyYA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=r2KqrUM0; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=r2KqrUM0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EDB98107C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:59:31 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48e0d1c095dso418322f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 06:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793368769; x=1793973569; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hHlX7opppHyW9eOAG/3AYFSqVMArqV/475LfPDT13eM=;
 b=r2KqrUM0sYZmn2uv1cQSe3RMI8b+EaFf9bgmvpalX/TaXzKvMFTzfdkoV1aVJyBrGS
 C8/3ifduEYk0RKXOCiCExaUqPtC9Sa1N2jYDbfJ5GQh4oCpXzKSpeVUclMD1DWhFpJxU
 kIRTiQlFoAE0y6T/IF43flXEujd4taXUf/rLwX8IsL/tbXMlt8dVrQYiYrJ/+Y5TgGlS
 r2atSQdApRMmODgVXMETLj+nsY7Cx2slBGusjSWf7kyvXDioD1bX64KrDzaVAGhlWp6W
 mFFYgCUzMcVRkCsp5D+q9SFURNANvZ0qEr3eq70+Nz/SsyDvWbneAJ1rynx4i4kHodl/
 S52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793368769; x=1793973569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hHlX7opppHyW9eOAG/3AYFSqVMArqV/475LfPDT13eM=;
 b=SHX83R9K/mFXUkW6F37972VBs9wTUJ+9axnfadmrDlYp1b1dKp+SAgB2mtHWZlNcPi
 1XWHnmwpERVhi+p86UvKMEbTghOv7YxcQU33vm5f2RTd8Ut0nVjXRDmw0zRn5NdkYLNV
 R0uw4pMGq+YBDbJdEuXfGdCCQ04pIAnLyiDHMbWn3Nz+8Q6EKpVOSTOWd2D23c51RPTI
 3uleMcIkNdIsR1UrfsGWjUbINAXLJO6F2ynkd0ed0TJyqZNwBv2UM3qWUNhTVvs38q6I
 PiaRp8jm9EahIyhzKUWiYi/BKPYDW/+ezmNFvelyTtxcA7ECaX1MB9E4WxyPFv5pmTy5
 bDCQ==
X-Gm-Message-State: AFq9FYIxXH/DnO/D4b087CBNTZQIcbqBNJyBUE7Ew7yc5FwVfTjLQYsF
 +9UPh9BsnQ2z1TMz/DX5D20dRMUkjFutTGwEUG/W4+UB4YqwdRpNuEsuPYTiDQ==
X-Gm-Gg: AYBFou0w3jcGWTQILXxl9a5A6SotX9vCkjigC271mYlaYHbQcSuR1pY6kenc1hB7U+p
 86S7z7+yaxBG2WfQkaCXnKTxR3OUiquvhtZ1UoaC06Ynxh3qJ2kyB9oL6XGS3+OdPBmByAS2b7r
 li+XBGCOhDPlX8j5Gb5VOZZURo/w9KJ/9zAuxE26wZ+BdqadBI93x5UrtH4jMlt5OsjCcGe4cy8
 egnhsxO4F4eMYL9VFjOGYlFnKVeg2XFo2jHfsJ7sKQiSsu5E5DWYZd+Pz3HT9Yh+jKE3FPmJcZj
 axS16w2DsDZstSIdRYoDSQSxgqa+EiOTikYAfCYjhF24zQuy7JCCiN4lEix5gbXRGaUzeyLnBkh
 0IayGF8ju+YdoC9EIv2Av8Wjs/id6YKWeQ7xQ65sQoyYjsjWj3uPNzeYzYWwVZbSjQJSJoEV8km
 QMJEOssw28JgFPGekL9i4cvz0z082oiDVI31c1KQsIykI8t+QPO4MjVHozVPtF8iccc3n/TwCU5
 rdT8ldLjEYuEqFuMBebwNp9lTlXj5D2BbBassyZPrsAYEx0hL6uKSSXmY2fbC8Bo2DSdpNF/cPU
 MAWNbtIURwFasGkGKYUkuzg9zCNLgPBc8cbIqZqps6w2bXG+l6avgQ==
X-Received: by 2002:a5d:59c3:0:b0:48b:1a0:5630 with SMTP id
 ffacd0b85a97d-48e6e50b3b7mr5140216f8f.41.1793368768999; 
 Fri, 30 Oct 2026 06:59:28 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b959c1sm3423347f8f.45.2026.10.30.06.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 06:59:28 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 14:59:14 +0100
Message-Id: <20261030135916.3599219-7-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030135916.3599219-1-angelo.compagnucci@gmail.com>
References: <20261030135916.3599219-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 7/9] package/sysdig: convert to a virtual package
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sysdig 0.41.4 needs falcosecurity-libs 0.21.0, which only supports
64-bit architectures. In order to provide a different version for
32-bit architectures, convert sysdig into a virtual package, as done for
falcosecurity-libs. For now, it is only provided by sysdig-latest, which
is the former sysdig package, unchanged.

The license and the CPE vendor, which will be shared by the providers,
stay in the virtual package.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/sysdig/Config.in                      | 10 +++++
 ...llow-to-disable-the-container-plugin.patch |  0
 ...-only-include-zlib-with-the-bundled-.patch |  0
 package/sysdig/sysdig-latest/Config.in        |  3 ++
 .../sysdig-latest.hash}                       |  0
 package/sysdig/sysdig-latest/sysdig-latest.mk | 40 +++++++++++++++++++
 package/sysdig/sysdig.mk                      | 29 ++------------
 7 files changed, 57 insertions(+), 25 deletions(-)
 rename package/sysdig/{ => sysdig-latest}/0001-CMakeLists.txt-allow-to-disable-the-container-plugin.patch (100%)
 rename package/sysdig/{ => sysdig-latest}/0002-userspace-sysdig-only-include-zlib-with-the-bundled-.patch (100%)
 create mode 100644 package/sysdig/sysdig-latest/Config.in
 rename package/sysdig/{sysdig.hash => sysdig-latest/sysdig-latest.hash} (100%)
 create mode 100644 package/sysdig/sysdig-latest/sysdig-latest.mk

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 5dff37251a..35f28bf6cd 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_SYSDIG
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # falcosecurity-libs
 	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # chisels
 	select BR2_PACKAGE_FALCOSECURITY_LIBS
+	select BR2_PACKAGE_SYSDIG_LATEST
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	select BR2_PACKAGE_YAML_CPP
@@ -31,3 +32,12 @@ comment "sysdig needs a glibc or musl toolchain w/ C++, threads, wchar, gcc >= 1
 		|| BR2_STATIC_LIBS \
 		|| BR2_TOOLCHAIN_USES_UCLIBC \
 		|| !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
+
+config BR2_PACKAGE_HAS_SYSDIG
+	bool
+
+config BR2_PACKAGE_PROVIDES_SYSDIG
+	string
+	default "sysdig-latest"
+
+source "package/sysdig/sysdig-latest/Config.in"
diff --git a/package/sysdig/0001-CMakeLists.txt-allow-to-disable-the-container-plugin.patch b/package/sysdig/sysdig-latest/0001-CMakeLists.txt-allow-to-disable-the-container-plugin.patch
similarity index 100%
rename from package/sysdig/0001-CMakeLists.txt-allow-to-disable-the-container-plugin.patch
rename to package/sysdig/sysdig-latest/0001-CMakeLists.txt-allow-to-disable-the-container-plugin.patch
diff --git a/package/sysdig/0002-userspace-sysdig-only-include-zlib-with-the-bundled-.patch b/package/sysdig/sysdig-latest/0002-userspace-sysdig-only-include-zlib-with-the-bundled-.patch
similarity index 100%
rename from package/sysdig/0002-userspace-sysdig-only-include-zlib-with-the-bundled-.patch
rename to package/sysdig/sysdig-latest/0002-userspace-sysdig-only-include-zlib-with-the-bundled-.patch
diff --git a/package/sysdig/sysdig-latest/Config.in b/package/sysdig/sysdig-latest/Config.in
new file mode 100644
index 0000000000..2af84e1917
--- /dev/null
+++ b/package/sysdig/sysdig-latest/Config.in
@@ -0,0 +1,3 @@
+config BR2_PACKAGE_SYSDIG_LATEST
+	bool
+	select BR2_PACKAGE_HAS_SYSDIG
diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig-latest/sysdig-latest.hash
similarity index 100%
rename from package/sysdig/sysdig.hash
rename to package/sysdig/sysdig-latest/sysdig-latest.hash
diff --git a/package/sysdig/sysdig-latest/sysdig-latest.mk b/package/sysdig/sysdig-latest/sysdig-latest.mk
new file mode 100644
index 0000000000..6e0499636c
--- /dev/null
+++ b/package/sysdig/sysdig-latest/sysdig-latest.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# sysdig-latest
+#
+################################################################################
+
+SYSDIG_LATEST_VERSION = 0.41.4
+SYSDIG_LATEST_SITE = $(call github,draios,sysdig,$(SYSDIG_LATEST_VERSION))
+SYSDIG_LATEST_SOURCE = sysdig-$(SYSDIG_LATEST_VERSION).tar.gz
+SYSDIG_LATEST_DL_SUBDIR = sysdig
+SYSDIG_LATEST_LICENSE = $(SYSDIG_LICENSE)
+SYSDIG_LATEST_LICENSE_FILES = $(SYSDIG_LICENSE_FILES)
+SYSDIG_LATEST_CPE_ID_VENDOR = $(SYSDIG_CPE_ID_VENDOR)
+SYSDIG_LATEST_CPE_ID_PRODUCT = sysdig
+SYSDIG_LATEST_PROVIDES = sysdig
+SYSDIG_LATEST_SUPPORTS_IN_SOURCE_BUILD = NO
+
+SYSDIG_LATEST_DEPENDENCIES = \
+	falcosecurity-libs \
+	host-pkgconf \
+	json-for-modern-cpp \
+	luainterpreter \
+	ncurses \
+	yaml-cpp
+
+# The driver is built by falcosecurity-libs, which only supports the
+# kernel module.
+SYSDIG_LATEST_CONF_OPTS = \
+	-DUSE_BUNDLED_DEPS=OFF \
+	-DCREATE_TEST_TARGETS=OFF \
+	-DBUILD_SYSDIG_MODERN_BPF=OFF \
+	-DSYSDIG_VERSION=$(SYSDIG_LATEST_VERSION)
+
+# 0001-CMakeLists.txt-allow-to-disable-the-container-plugin.patch
+# The container plugin is either downloaded as a prebuilt binary or
+# built with Go, so it is disabled. It can be provided by a separate
+# package in a following patch.
+SYSDIG_LATEST_CONF_OPTS += -DBUILD_SYSDIG_CONTAINER_PLUGIN=OFF
+
+$(eval $(cmake-package))
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index d04f67a97b..3ee54a556b 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,33 +4,12 @@
 #
 ################################################################################
 
-SYSDIG_VERSION = 0.41.4
-SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
+# sysdig is provided by sysdig-latest.
+
 SYSDIG_LICENSE = Apache-2.0
 SYSDIG_LICENSE_FILES = COPYING
 SYSDIG_CPE_ID_VENDOR = sysdig
-SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
-
-SYSDIG_DEPENDENCIES = \
-	falcosecurity-libs \
-	host-pkgconf \
-	json-for-modern-cpp \
-	luainterpreter \
-	ncurses \
-	yaml-cpp
-
-# The driver is built by falcosecurity-libs, which only supports the
-# kernel module.
-SYSDIG_CONF_OPTS = \
-	-DUSE_BUNDLED_DEPS=OFF \
-	-DCREATE_TEST_TARGETS=OFF \
-	-DBUILD_SYSDIG_MODERN_BPF=OFF \
-	-DSYSDIG_VERSION=$(SYSDIG_VERSION)
 
-# 0001-CMakeLists.txt-allow-to-disable-the-container-plugin.patch
-# The container plugin is either downloaded as a prebuilt binary or
-# built with Go, so it is disabled. It can be provided by a separate
-# package in a following patch.
-SYSDIG_CONF_OPTS += -DBUILD_SYSDIG_CONTAINER_PLUGIN=OFF
+$(eval $(virtual-package))
 
-$(eval $(cmake-package))
+include $(sort $(wildcard package/sysdig/*/*.mk))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
