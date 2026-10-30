Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA44D606A320
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=O9JIPnl0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A/m+7mHw
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8620440B30;
	Fri, 30 Oct 2026 15:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZukmpzL2StQQ; Fri, 30 Oct 2026 15:24:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6598740B4F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373895;
	b=aoDR5wBvBLiOzCsJzBfQHg1SsFhzEpS2Z4+8pkYo35YrK7Ww6J+8CW4LwlewjDIqbIEq
	 gGlClSu2a5df/UZ6WhEQt2efkbboJuLPfz/98Odl5L3WhOM5PIlgVdhLTpCByX20MUe1Q
	 gJKh3IPN3j56Rv7FEybllTenLneFLzygCbntiRXMNqPjW39GyDq25KqcqZvJXDORncaBi
	 2ugzbdWIFBJr6uavtrK7FlzNyWflEswn7Q8ZOvwxg/dfwpUaPhmI4p1CxnuZAHtjHfyRl
	 g9PDUtrvIPUpcFcE6rScsZn2ixyVlCe/4+RZeT5o+qfvWyEYF5P5jJSORKZcAzHwWTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373895;
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
	b=PfVjiH0FyPndNeoEtaffvfqdQ3Fws0QYsMIGVGP5QgyTvC7wmgBDcy/sukU2nMb761ye
	 DPzmBA751MwrHfTswHGjvo/r3NO/FYnMSeWrad3Pb2X/mMVRjbfD77lP4ZBfbhodQfVjh
	 9SIGRulwfzrvK45Xy7kiTQwPbs94XViQNhr3oSYGD9cazO9rDPQVXBZLhFm7459SknVb9
	 4ddGf5hZZlHROrB3qdIvVW3CpL+mdqTRsraY7gd4LtusnGO8VEzYVhwlLWkyMGhM8pblt
	 lT572AYHr2kJdxGi+bYa5CAFoIWTu8kumjTua4TnyWu22fX1SN+oN2yd0ZC+t7bJ3uw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="A/m+7mHw";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373895;
	bh=RFt7P1dO/fkg0oozLLa3buNXQ5e58q4yUNIt3u7QHks=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O9JIPnl0Lm7j7AonHAxdUhLqRxW4txT4GxJDixRnvxQ/BviiXF9Ld3qlLkkNjT/sr
	 GKNsalHfAerj7AUgG4OOUVJIXfU+LCFr7mBWZu9+4WQGPPz6aQ4C/GaO3s4WTOEEZz
	 LoA0hU71QUaW0lKLhPxkAo6SKwyVqsUPfyFNY3C8nlgmgffGb2l1lcSWfqYHLz3FtD
	 GnUryb86HPLg39SDgNDjIR/oN2nLcIUiWHwHeQJ7tN/poLiIPTR0D5cNW5wB4fKWTE
	 E6pKYtVokap7dcjHoJud4zI724ygnQXTImkdDougkyN0xKZ63Ni1T1J99Sw7AbGxIj
	 NvrT2UrkiM3LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6598740B4F;
	Fri, 30 Oct 2026 15:24:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 863133AF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8265C40B3C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bxIxyjoGBa2X for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:24:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 62A7240B30
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373888;
 b=kd95TxIDFdaNKCD30Fn++kGYeacKaLOLhXFEozidaHa1gWPHk+9sbau5aLskzskPfbzZ
 SzAo1UI5DY3C0PuI60QXxlndmbJ0WNUsKxWiyuwK7DZ3LEV3xLmieSstJHDrJR837LwSy
 3ftwK4TX1GdILwHs/A7Q/fR8W6dA+cQjS+6hCAcTF9JH6A35f+lDbVygsz6OvrxOR+1AZ
 0rv8DG/3LoTC4ab4tXmBwkL/irfj1UyfCGQap4cj4umUCEUA8M+zjsrlaKDDEr8mkMydk
 6HSSU7upDl0SFhPpUprquzNez50ey4sEEmvv5TjUGrnWWo201el4RejRSgcrPrzNBXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373888;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=hHlX7opppHyW9eOAG/3AYFSqVMArqV/475LfPDT13eM=;
 b=hdz+CNvNKSYweu07nbSbRRJvs4kkqUyKYQJ7eJEb8hDO0A9gi1vQ54+PPmng/ibxoEtZ
 +mR6rMiERJGmLoSpcxsrij7+OLG+wF2yiIGnekU+Ipf7/iX0qWeIwueoIHrldviCeL0k8
 cgxL7aQsPl8ga7A9kf6aRStMLgxP53Li3O0/7JCphzJh8RecsWsHo59b+4Dwc1hKFlyzK
 hHhT/rzukrcCR92bDzYNdBuxzr8sfI9BxikYNJ8WZdyu4MBbbQ6Ux5KCTkrb/s9wXo3Nq
 yrXomRXaUtxsgNFsSeoTylV4/hDJ1v14kF86F9avPsWu/h4HgpbOEWvEibsVTMQTxDQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b="A/m+7mHw"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=A/m+7mHw
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62A7240B30
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:48 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48e20edd106so698642f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373886; x=1793978686; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hHlX7opppHyW9eOAG/3AYFSqVMArqV/475LfPDT13eM=;
 b=A/m+7mHwxFZRnwBfMknL+EAswSZ1asnEilnX8bhf7j6sk8uryVc6jLva+snG+UZOVj
 IkqsM8v06+e5enBiQrTkDcmCArOExrcMYdTOaYwotjH2U0v8ZbjVmgO82yxSIdgbsSGn
 qngJoSIKnNWG9yyTSNLNk6tpFwxuc78Jry2wscAV1CYTZqZ1IecvQHrNhBp9W8FupN/I
 AtZtKHNoGgZVXtCGmCDTNXaOMKduvQMR0Vj1tW+NMCMZfRnogSY5UdhPdO6Z3TTU4pZw
 weZ+ZoJkoJbblmb/JTR1Qn+bKzQlS3uUNxtRvOWPul5DCsoqO8ksQs70LmAXyeJ051v1
 wyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373886; x=1793978686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hHlX7opppHyW9eOAG/3AYFSqVMArqV/475LfPDT13eM=;
 b=G4wGwT/23oS8IDSTG+tFt8bENKPKvWJT0DX1VwZQ3AFq3M7tZHM/Q6jPYJWjCLRATX
 PNL0SyHIGp8eIFD/agaWxL292FVSWgoPKIbwcVfJtYUs+HY5aJiwievWlwcrUM2g6LdJ
 x0rdomaervmYWjKAWT0dYrytGSn7Th2dms1beUMJ9VpgZOor0wmgwteJyLbl3mAnSq2R
 y29XfSlWniugjLka5rBmvpAbjM2nu0Cjfn7gEnMiJF+Ek4hGuyZRzPgBQ7O9QP4IsG5N
 2zy080K+B8gOaSZ8riCg3fII5UWO9QElOK2gUZ2C0lDlmJ5zARbr97UjztIyIJdncfiC
 tVWg==
X-Gm-Message-State: AFq9FYKWDa70q7rCnEbB+lXToCPNAPAZTJMAULsM7KgWWKKH0kDrPpjd
 E3n/sfaePJj6Ub7teO8wR9vWx1NTpUwU+IuT29L36Dmd3yVWneoePJNr1ZfZgQ==
X-Gm-Gg: AYBFou3ipOcuqz1Szzmz9Feinv+bTu2p3gkm6om7zdicKNWPsSNw8PJ/fD3isKedOnv
 q7SYpBJAO2y1N6f7ha9YlXkiq6+KB9WfGVvPu54q7Z+okGOHKtPI9WDbuns3W6v49hjwBw5vxg0
 /aZ+TM0EH9FVIv+S2mEYDeRqx2+n+uIX++uzngxPAxRhZnhTslIZdjA37MPo6mQYojrXoch+N2D
 VSXMXZTvlB6YxYXyOupbj4pZ/AX78zkw996YAJ9DcKOSvpoVEHCUb0sVeXQb7CHpQZUdt/58v8h
 +L6sjj81bgYwKoEUFAC5IoQKg6Xvzot+LqVR7XJ3utFx1CfN8QtIYqJsUzGMMCUgvKnKfr5b8el
 idBKAfuaZGmoYpy8DBB7qgnXBHX85CCIM3g65XZbr2qLuI61kJ5hbCHNihvs+WyNjGZhtX00DqZ
 Sg/EPhsCkyEMjSEayo5Asm8Ub+IBkgf+bWBcBSJzDzENF25i7nG5lOmOLKxyrd4EJFXo5uvGi5N
 xRikkHDmrirZitb8MsSjDZTLUPbx+KhbjawHaPvyXiF80zSYhiHC9ersR8Sdh7+7/STPuWpcB+n
 3CzUOjGdDR2bBPx80M54RnCtT5I3Mii4VKqUUYnp1p2yqu6sLnLZ0Q==
X-Received: by 2002:a05:6000:29c8:b0:48d:f3a4:610b with SMTP id
 ffacd0b85a97d-48e6e2f04ecmr3722870f8f.25.1793373885905; 
 Fri, 30 Oct 2026 08:24:45 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8c0b6sm3540180f8f.41.2026.10.30.08.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:24:45 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 16:24:32 +0100
Message-Id: <20261030152434.3738285-7-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
References: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
