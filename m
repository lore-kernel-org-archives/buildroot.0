Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C71CD342F
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 07:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C28B81247;
	Fri,  8 May 2026 07:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f3nTLwA6llpx; Fri,  8 May 2026 07:53:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB51C83CC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778226804;
	bh=d6v2BhQ3AXVh+I6dAXd41G8ceFyx8GZ9+oKLB7Ssjh4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FKRXIrnITUL3mXtw0yteqLVBZIDmpQog3vMDVOiHg1j194Oc8uFO5r21ByoNM+3Nh
	 Y0hugqT7JETP628A13MsEMURt5u+vUN2svvZs9ee+3D/3+0tJB2+jqW6aMJ4ULT9jX
	 QM0Q1kOk2bkABF1g2jdUA26GVbE1gfEdlxqlCM9SYsT4wp4emtI6kskdMA5EXx1mtw
	 9coMAkFeyuQSzpADyKsAI3hYM7AHfdXJvsVJqBeamIHwTd0QeGEeb65TPVR06sYCKm
	 CetP7ccQRKu6IspS1CcU6+ZS/Wy9kzVDQV/42xXduRf75xksnujP1WIVZeB3fE+4QL
	 WZxFQiyWePxhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB51C83CC8;
	Fri,  8 May 2026 07:53:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FC28358
 for <buildroot@buildroot.org>; Fri,  8 May 2026 07:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45B7D83CE5
 for <buildroot@buildroot.org>; Fri,  8 May 2026 07:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HkMg8i90QIQt for <buildroot@buildroot.org>;
 Fri,  8 May 2026 07:53:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 62F6383C4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62F6383C4F
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62F6383C4F
 for <buildroot@buildroot.org>; Fri,  8 May 2026 07:53:22 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-837dfccd950so785606b3a.0
 for <buildroot@buildroot.org>; Fri, 08 May 2026 00:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778226801; x=1778831601;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TnMji8V9B2oB+4aIG91wvEc3R+d7SKH9Xg07hHMFXlg=;
 b=dhlmZQcD/AZj1RbOsmoyA/G3jTSiCujlQpJvZR+2uqmY9pawVBiVO7NnQE0MBQCxBH
 xv1AITQpuJESMItVdvPLukfjoUjFAtDNiK3rTyNXB2kgUfDVJpJVNiLf516RwaF2vp0L
 bYn4zV2ItIwIJ0rFCwnOd1QSoSxVhKjNyrkSoByT5kvw6LyTiMLJy17FhfZ1Fm40vhQw
 H2gdP1w3DOyO5FeY1KUo+rAWqBK2UmmK26YHc0GqTUUxFlInlRwlN7Ocica4142oPR43
 XlENd6OZlA9Z/ylak5kNND3b7vj5F2AO4kqT+yWoo3SpYeZTEaVQgkfJtKek5IpBDTik
 WN2A==
X-Gm-Message-State: AOJu0YwmV23sTdT52mwCWv+VSP4pvaT1UnvcodrhU+rviGpgO5CnIQE6
 rKqkovnKPV/bbwD6xDA7lvrDL88jR4XMefIf8s4xUVDCMt4MQ+XZ4Z61OvD0HiPi
X-Gm-Gg: AeBDiesuWCeOJt6Gg7d8BAA2SZutoUOXXOJ6nfd49nM2hAv+e7X5ye8ccHSw4xu+mgr
 fUrseH64R1fC1LgcmDgRql3GsXAGgCuC7V2E/TlvU6+ZG28dZlJy2ZbzptPsQ2R8aYPrx7OrsNz
 Hb1+14a+NpkoQz1yorEzy2JwqSou1ZpMea/HpoylIL59eDVIbXufGMfCMaX0SFoCnJmeChYxCwg
 Ws7ImLm1yunJuSW7ks9TOZvEKV5KywWTrMOSX2YTBjmjpkK31/nem+KToWzmrGGjo4ORpefyt7/
 kF+7vyJ1TVhlfzJkX/JUiIkiHmGVZi10Aa6Ml3YpFLTCeAe8/PyzFw8bjNC5z6JRDA91dKm5W0b
 Z2pp1vAoA8Qy81XwvkPPjTaGEjCxQWy4z+IrWbnN6OHpmg6D0VtAPN/p9L8kNE5hUq7F3ClPVCv
 Ec8m4wxKfxvkBbqFyQ1Q6Kf4zDKxqQg7NbN4YTmM1K9ZN8wkob56WUfPLGJhOfJayY1qr/
X-Received: by 2002:a05:6a00:4391:b0:835:351c:f22b with SMTP id
 d2e1a72fcca58-83a5dc5de7cmr10733135b3a.35.1778226801076; 
 Fri, 08 May 2026 00:53:21 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:116d:5714:b897:b3fc:b3f:3166])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8396563f11csm14084272b3a.3.2026.05.08.00.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 00:53:20 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri,  8 May 2026 13:23:01 +0530
Message-ID: <20260508075302.159793-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778226801; x=1778831601; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TnMji8V9B2oB+4aIG91wvEc3R+d7SKH9Xg07hHMFXlg=;
 b=TOX/tlNFPfXINuXvtXP/U4dUO1nM4kRYLHXH8/ZABwjUnG2AQLT6Hq98JkZ9lySLpB
 lvT3adq9ChIdvViP5tb0rWA4HOjIvhLN4OWNfcy8ZqpeZ1dJUKhwNllTAzgYNBzQ2jYr
 SIQaA5x6fS/igtj0/yVWEtUCisHgTP2hcxhLi3Ytxctsz0MMFUxe5dfVKbmVi7xq4kc3
 WjqsAya3M7kHp7uvwuqBe663yN8oKcve5PTyFiL3cLwtkyWgjrM78QVnTZLt4CD1fOVv
 o5oaZWtDdv6NQHAz7ONdqMTywctM8/EsSelUGgmvkU/nQEqluh+mK5sT4baOCMmiALKj
 OPGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TOX/tlNF
Subject: [Buildroot] [PATCH] package/ace: bump to version 8.0.5
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

This patch updates the ACE (ADAPTIVE Communication Environment) package
from version 7.1.1 to 8.0.5, representing a major version upgrade.

Key changes in this update:

- Bumped version from 7.1.1 to 8.0.5
- Updated minimum GCC requirement from 4.9 to 7 (for C++17 support)
- Changed C++ standard from C++14 to C++17
- Updated hash from upstream source

ACE 8.0.5 changelog highlights:
- Fixed building ACE for Android with uses_wchar=1
- Added support for parallel make using Embarcadero bcc64x compiler
- Fixed compile errors when C++23 is enabled
- Updated thread name support to work with older Windows versions
- Threads created by TAO_Thread_Per_Connection_Handler now have
  shorter names (Linux limits thread names to 15 characters)

The C++17 requirement aligns with upstream changes across the ACE 7.x
and 8.x series, where ACE moved away from deprecated C++ features like
std::auto_ptr and adopted modern C++ standards.

Changelog:
https://github.com/DOCGroup/ACE_TAO/releases/tag/ACE%2BTAO-8_0_5

Builds Tested Using:
- utils/test-pkg -a -p ace

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/ace/Config.in | 6 +++---
 package/ace/ace.hash  | 5 +----
 package/ace/ace.mk    | 4 ++--
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/ace/Config.in b/package/ace/Config.in
index cf3819284b..5475577d49 100644
--- a/package/ace/Config.in
+++ b/package/ace/Config.in
@@ -3,14 +3,14 @@ config BR2_PACKAGE_ACE
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	help
 	  The ADAPTIVE Communication Environment (ACE(TM))
 	  An OO Network Programming Toolkit in C++.
 
 	  http://www.dre.vanderbilt.edu/~schmidt/ACE.html
 
-comment "ACE needs a glibc toolchain, dynamic library, C++, gcc >= 4.9"
+comment "ACE needs a glibc toolchain, dynamic library, C++, gcc >= 7"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
 		!BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/ace/ace.hash b/package/ace/ace.hash
index 0c5ed12c97..dae6a00df0 100644
--- a/package/ace/ace.hash
+++ b/package/ace/ace.hash
@@ -1,6 +1,3 @@
-# From https://download.dre.vanderbilt.edu/previous_versions/ACE-7.1.1.tar.bz2.md5:
-md5  6c86ec6c7879703783b9749d5409a67f  ACE-7.1.1.tar.bz2
-
 # Locally Computed:
-sha256  fe5fdeab1dddf4fdd99f73c59420886cf61ca2ce92adf2cc6b612b752986df62  ACE-7.1.1.tar.bz2
+sha256  2c40ecdbbd04c79fd5a815666e14654e71ab82d4335cdb3aa8669def250c3444  ACE-8.0.5.tar.bz2
 sha256  687bf9d16119e0caf6fb5c18214928fd6ea0da10df91e906255b7613af8061d8  COPYING
diff --git a/package/ace/ace.mk b/package/ace/ace.mk
index 1f79508629..8112629fa0 100644
--- a/package/ace/ace.mk
+++ b/package/ace/ace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACE_VERSION = 7.1.1
+ACE_VERSION = 8.0.5
 ACE_SOURCE = ACE-$(ACE_VERSION).tar.bz2
 ACE_SITE = http://download.dre.vanderbilt.edu/previous_versions
 ACE_LICENSE = DOC
@@ -17,7 +17,7 @@ ACE_CPE_ID_PRODUCT = adaptive_communication_environment
 # Only compiling ACE libraries (no TAO)
 ACE_LIBRARIES = ace ACEXML Kokyu netsvcs protocols/ace
 
-ACE_CPPFLAGS = $(TARGET_CPPFLAGS) -std=c++14
+ACE_CPPFLAGS = $(TARGET_CPPFLAGS) -std=c++17
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101915),y)
 ACE_CPPFLAGS += -O0
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
