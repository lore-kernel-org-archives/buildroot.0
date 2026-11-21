Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07273606A32A
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 20:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PHtq4evU
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26CAE80F67;
	Sat, 21 Nov 2026 20:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYbPQvoCA28I; Sat, 21 Nov 2026 20:07:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DE06980F32
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795291632;
	b=SEZtJWjNRBdxEnH8qjRYFuWGV5dt3U13ZBKOHBs3lve3ZQ1Qc8EJqQdKCWmNJvlP8zAp
	 EVVAbqdMCWkscUFa+EVwBGn+wAPQRMJNHAwluMWlzn8daCGBmCoRtnkUz4PvzsAQC10l1
	 1eL0ufLgzGAUi7Ct/3c5NRVgr/qwCGY4WYkv10XEJQUqcwmZpkzoVLT20c+R3aTSb48bM
	 WXYm6mkQYc2X54ghlctVDcJe0thHtARWPFDk0OsxiKhKcxfTj4OY/Pyc6a5WKqUTNZJDB
	 VPhjLb6PrlKzGRHHAnkSNA8VuS1QCKb1LOtnaNEORDOC64jCnOX53u01GaXBXLwBjZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795291632;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FfaRVg7qM2PBi2zqS/nbBBDZPwcixUzj0UdflwCn8lI=;
	b=HVkVcL6E4ipiigW2GMDkpDVI1AsqqeUqmUry/EUkSwQtW1UqGLansRtC49R40kwTXzkv
	 akOfTXu+VuSlo21JzR2pIoVb3MTEatoq73Njjv8bgCAd4sWPk7vbCKsOOSEJNGLXJlxbe
	 vyqM6NCsE8TqQdBdvbqN+rv1TQryCv0PMOypWAajKx7theccAkTNHSEyG5mYMkzXheSxU
	 I0s23/Q6FL0WnxXsxDtawNU4H4OSaVG2UgnOWY3YCvG5UvygEyu6Cf43UlMg06XWKCcZw
	 FcQx74RUyI+OIWw0WunFZa3dn+XAJpSyHinEM7eRH3Vdg5W/8EGzzwlVFiXR6LgoVCQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795291632;
	bh=FfaRVg7qM2PBi2zqS/nbBBDZPwcixUzj0UdflwCn8lI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PHtq4evUGRJHBmif6QkyoHTY9L5ytZ+ev1RACyUlYVdz1lkLElD/DZr98EbnXdPGu
	 PTR8dX/waOGrvh6wygsrJifMVZ4ocb3AEoXTBZ7PxchZEDdoAbMNLm3DKQXy3vsP+p
	 gGNX5Jct1wmbvkpUEwqAT2MeRM64raAs8S2yjF+j6dZXXZkg0apgNLEjpgEw857CHp
	 iZ3DPJ4z3BSO58MvntbbqO7JJnXpfj0JrjH+QOPheu4Jhr6dZbhvpEQY41B3urpNGZ
	 KS0cdV/VVo5+gxgkG1MTkZ04mNdfhrxJyDjHl40PK7PFZjszRKuiKgbzNtEy/W9l/F
	 lsgB+eS14+Trg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE06980F32;
	Sat, 21 Nov 2026 20:07:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FF8F79D
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71C046061F
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8pIymJGGOgW for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 20:07:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 170E960619
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=209.85.128.54
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.54;
 helo=mail-wm1-f54.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 170E960619
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:07:06 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4bb85e07aadso23262875e9.1
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 12:07:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795291625; x=1795896425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=w19mD3GDsDQbNtb91z5+wrGcLBmIzOGVpisMK4taO/g=;
 b=MMRf0NGK18vV7iW4FE2mBhKoir1dMUoPeRr1VLNmmSNp5+2bod5/Y71P/V1f88rRbN
 pC3+LykTPS9nukT9AgoT3b2c57W3Pat4dXe4trLcWXDjSAYzrsWoHxoBY4bx1iNmLNN+
 F7lu0USXT5/fvwH/1ixVxVHYq2dVDUPdcqZ5yRCjCtBex0Tgx8ViJxoH7MT7UCOZTFWF
 Iwy1GPGqYX7abuLFSlkKzkFTAmyR3o59hgZ9QLDnnFUKusiAQBpcrCP6pYcUm7sH5mWf
 7FqFumCYHbUBUJ+kGcv/TFg+iyPfdQYqKXM9rezN8onlGSdkpteTwBnS/+USYo7PuPxL
 lRVA==
X-Gm-Message-State: APuU4Z9byWePn6rBU8Xgep8A7v9YrerdZrXAb8TJ6lTK4YWXoJ+gtUFc
 X5oshSy9PzQ3Hf5hQf2v/KdBOANGx4ktNMcuT2QaPVu1QST/DQN4rOp+
X-Gm-Gg: AZFdTZfQCy2k4iFPpcNQRVahsnd7+Yh/2bwgrqjKZysF44iFoTDdP0Hy56Rc2mEqLfe
 4ljFM+VXYYCqDTnjOMwmsz8wx7rUOKhtkb8e4L7RAiWm1WfjJakPGbaCLK0n5ai/Vww70ibw61n
 /VRUSBaKAKqwNuiaRAc2Gcs2Z/K9hPWBa9zaYFTDAQH8ZDng9tmirdXU/RV6Nqhh+TKWWh2zHDC
 4xBA2giU5JS9BDUZ18Z5MHzy9kznQ/C94lYl9WMFqwAaXu4YcjVBTWIEdv0gy7c8o57sQ8+qyJQ
 u7hTLJ1STnEUR8Dc2qrEh1RtMSwtIX/38T7IIJLZer/ypdx4ZboHbXIVwq5F4EdcYmRzyE7wPH8
 djmF15NS9V6XHPFsF+YNijUfycsyhrRDUamMLuYWE7ecpRFbYRv8Fc3mjTfPbHsDqMruY7KlzXs
 6SYTNtfqMn4QRTFFmcRjx440uJhwQYvmgJJeJx0OUbCZ0LQasD6gt59O3tJeR0Jm9nfZO4AiOdD
 +JbnltmBMP2lQt7jAq3zcCl7h9AEC7E0jwoaa89mKrFxNyv/jOkO8qntsF0MezUM7MICNrx2DD6
 Z75eGlcqtey1YetwqWPfq9UAmoF6XDGqGG6YiJLbqEswp3c7MVaN2jTfPin7sN3NzI6135w5iBr
 zHhqFLTw5J6X0GO+uho2DfElwg4YV9f0zGSINp1qy8Ozwyj9h0OO+CQHvG+2hdqFXMEwvR+1Y+2
 eBKKFNOmv9mw==
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6118:4c9a with SMTP id
 5b1f17b1804b1-4bb88819940mr167550375e9.30.1795291624998; 
 Sat, 21 Nov 2026 12:07:04 -0800 (PST)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb5f:fa00:bd15:7649:1768:4d97])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4bb8d4f9aa8sm151944255e9.4.2026.11.21.12.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 12:07:04 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, buildroot@tudorholton.com, thomas.perale@mind.be
Date: Sat, 21 Nov 2026 21:06:52 +0100
Message-ID: <20261121200654.28019-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121200654.28019-1-thomas@devoogdt.com>
References: <20261119140223.1968045-3-thomas@devoogdt.com>
 <20261121200654.28019-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/3] package/openjdk{-bin}: security bump
 21.x to version 21.0.13.1+2
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix CVE-2026-114938, a heap-based buffer overflow in the HotSpot
compiler which may result in takeover of affected Java runtimes.

This also includes security fixes from the OpenJDK advisories published
on 2026-04-21, 2026-07-21, 2026-08-18, 2026-10-20, 2026-10-21,
2026-10-24, and 2026-11-17.

Other relevant changes include certificate and cryptographic hardening,
updates to libpng 1.6.59, FreeType 2.15.0 and tzdata2026f, and fixes
for TLS, HTTP, Kerberos, JMX, JFR, and HotSpot.

For details, see:
https://openjdk.org/groups/vulnerability/advisories/2026-11-17

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2:
- Restore AArch64 host support with the matching Corretto archive because
  Temurin does not provide a glibc AArch64 JDK for this release:
  https://corretto.aws/downloads/resources/21.0.13.1.2/amazon-corretto-21.0.13.1.2-linux-aarch64.tar.gz
- Cite the Corretto GitHub release page in the hash file:
  https://github.com/corretto/corretto-21/releases/tag/21.0.13.1.2
- Cite the exact Temurin JDK checksum sidecar:
  https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.13.1%2B2/OpenJDK21U-jdk_x64_linux_hotspot_21.0.13.1_2.tar.gz.sha256.txt

v3:
- Use the now-available Temurin AArch64 JDK; the asset was published in
  the meantime, so the Corretto fallback is no longer needed:
  https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.13.1%2B2/OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.13.1_2.tar.gz

 .checkpackageignore                                      | 2 +-
 package/openjdk-bin/21.0.10_7/openjdk-bin.hash           | 7 -------
 package/openjdk-bin/21.0.13.1_2/openjdk-bin.hash         | 9 +++++++++
 package/openjdk-bin/openjdk-bin.mk                       | 4 ++--
 .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch  | 0
 .../0002-awt-fix-HEADLESS-compilation-without-X11.patch  | 0
 ...onf-libraries-drop-the-need-for-X11-in-headless.patch | 0
 package/openjdk/openjdk.hash                             | 2 +-
 package/openjdk/openjdk.mk                               | 4 ++--
 9 files changed, 15 insertions(+), 13 deletions(-)
 delete mode 100644 package/openjdk-bin/21.0.10_7/openjdk-bin.hash
 create mode 100644 package/openjdk-bin/21.0.13.1_2/openjdk-bin.hash
 rename package/openjdk/{21.0.10+7 => 21.0.13.1+2}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)
 rename package/openjdk/{21.0.10+7 => 21.0.13.1+2}/0002-awt-fix-HEADLESS-compilation-without-X11.patch (100%)
 rename package/openjdk/{21.0.10+7 => 21.0.13.1+2}/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index b5ad45705a0..c875aa796be 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -658,7 +658,7 @@ package/olsr/S50olsr Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch lib_patch.Upstream
 package/open2300/0001-fix-makefile.patch lib_patch.Upstream
 package/openjdk/17.0.21.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
-package/openjdk/21.0.10+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
+package/openjdk/21.0.13.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openjdk/25.0.2+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openldap/0001-fix-bignum.patch lib_patch.Upstream
 package/openldap/0002-disable-docs.patch lib_patch.Upstream
diff --git a/package/openjdk-bin/21.0.10_7/openjdk-bin.hash b/package/openjdk-bin/21.0.10_7/openjdk-bin.hash
deleted file mode 100644
index 8d9efacba1f..00000000000
--- a/package/openjdk-bin/21.0.10_7/openjdk-bin.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# From https://github.com/adoptium/temurin21-binaries/releases
-sha256  ea3b9bd464d6dd253e9a7accf59f7ccd2a36e4aa69640b7251e3370caef896a4  OpenJDK21U-jdk_x64_linux_hotspot_21.0.10_7.tar.gz
-sha256  357fee29fb0d5c079f6730db98b28942df13a6eed426f6c61cd4ad703ab27b9a  OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.10_7.tar.gz
-
-# Locally calculated
-sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
-sha256  75292f03bf23d3db7c985aecc191029b93883200721ed23ed34a2e601463df33  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/21.0.13.1_2/openjdk-bin.hash b/package/openjdk-bin/21.0.13.1_2/openjdk-bin.hash
new file mode 100644
index 00000000000..30dadde1d6c
--- /dev/null
+++ b/package/openjdk-bin/21.0.13.1_2/openjdk-bin.hash
@@ -0,0 +1,9 @@
+# From https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.13.1%2B2/OpenJDK21U-jdk_x64_linux_hotspot_21.0.13.1_2.tar.gz.sha256.txt
+sha256  bb8a93f9ae6e7a693b2b721e85dbeff26ae1a77447985a8d7afcdd9c7cf6222e  OpenJDK21U-jdk_x64_linux_hotspot_21.0.13.1_2.tar.gz
+
+# From https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.13.1%2B2/OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.13.1_2.tar.gz.sha256.txt
+sha256  8c72816a6b308842d5ed1f13e5826b69c567da4784f7238d7e800efa71fe54b1  OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.13.1_2.tar.gz
+
+# Locally calculated
+sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
+sha256  75292f03bf23d3db7c985aecc191029b93883200721ed23ed34a2e601463df33  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index e2f771bdb22..f56d96504d8 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -10,8 +10,8 @@ HOST_OPENJDK_BIN_VERSION_MINOR = 0.2
 HOST_OPENJDK_BIN_VERSION_BUILD = 10
 else ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 21
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.10
-HOST_OPENJDK_BIN_VERSION_BUILD = 7
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.13.1
+HOST_OPENJDK_BIN_VERSION_BUILD = 2
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
 HOST_OPENJDK_BIN_VERSION_MINOR = 0.21.1
diff --git a/package/openjdk/21.0.10+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/21.0.13.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 100%
rename from package/openjdk/21.0.10+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/21.0.13.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
diff --git a/package/openjdk/21.0.10+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch b/package/openjdk/21.0.13.1+2/0002-awt-fix-HEADLESS-compilation-without-X11.patch
similarity index 100%
rename from package/openjdk/21.0.10+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
rename to package/openjdk/21.0.13.1+2/0002-awt-fix-HEADLESS-compilation-without-X11.patch
diff --git a/package/openjdk/21.0.10+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch b/package/openjdk/21.0.13.1+2/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
similarity index 100%
rename from package/openjdk/21.0.10+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
rename to package/openjdk/21.0.13.1+2/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 40879824ad7..33124c17a8c 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,5 +1,5 @@
 # Locally computed
 sha256  9b3164cedf78d7a76a59499d7a6833145c7e0269ec7b664bfe5ee03ced2f449e  openjdk-25.0.2+10.tar.gz
-sha256  6500906cb7cc49268ce4ca368db3ddf3541b40afd25eecb378e13d5a72f43214  openjdk-21.0.10+7.tar.gz
+sha256  2f00670ffe781881c6fdb60f49ecdfd12a6c0f5e2943b94d17b1f4bc714397f9  openjdk-21.0.13.1+2.tar.gz
 sha256  1358a7fbe258370744a11a4be8017bd9d30a00a5fc5b784f9221815bb7444a4d  openjdk-17.0.21.1+2.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 25fa001d840..94e96e4924a 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -10,8 +10,8 @@ OPENJDK_VERSION_MINOR = 0.2
 OPENJDK_VERSION_BUILD = 10
 else ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 OPENJDK_VERSION_MAJOR = 21
-OPENJDK_VERSION_MINOR = 0.10
-OPENJDK_VERSION_BUILD = 7
+OPENJDK_VERSION_MINOR = 0.13.1
+OPENJDK_VERSION_BUILD = 2
 else
 OPENJDK_VERSION_MAJOR = 17
 OPENJDK_VERSION_MINOR = 0.21.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
