Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5F1606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sjxcAcy8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lsKx9qpN
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35FD960A9D;
	Fri, 30 Oct 2026 15:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kk6m4vHfc4Kx; Fri, 30 Oct 2026 15:24:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3277260A48
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373884;
	b=ig6bP1qi62rZMx1RmSGt3F5OJH18+ZPhsUILAD4luH2KbFN2HIVzONLkInn7/Jd4AaOg
	 tB32MmijQmCnif8vR6JCZIfNQeQ1L0wMLAtQa37ZLLu7PjPgajF64LNnHXIrO33kCEN5Q
	 3KM3ds29OeKrKuQANXnR2vcbUf7OJR1Z3ipXcKzRqRPdR87uFMDsMGqnbu6qdR+SLm2dP
	 m99Sa2EOQH19kkXw88tWYA5kDNfOHFBeyQjtmITo6MYPq/Yo5ErS2cWP/EDXq9tnHqzn1
	 0qc4Op3ZEh1OuPdAFxXF4Rz2cOYtm/aNilAVSq/h/x+ZiH/Kb+ZpJYdOkuqddfiQqrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373884;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Odq2K8000QpLw7dqvUlEHLgkiyWhDiLp4MJRaqjnLDM=;
	b=DjsH5pySwwfFEk5TWxl0BQXRLTmxOMBdE0euPpDNKggSvHwOrV5dXnBxixdErnD5S358
	 Y9nIyjsVgsf2OBqxuFMjq986ORxHABAr5q3LKVKa1D0CT82wUOXyfAgzb/NcxUJXgn0CW
	 vX0owo1NmxEaJFcXyrGHbyWER5M+DUFK18a9tfRnCPUdPapwNlD3opVP1/rI3p/SuPGYr
	 /B3CAK6Sh0Sj24kCva2CI3QjeCyDVs+BllyESSOnpuLd+GbyvgH+5RDEcWFnkLdwkVdCT
	 Wnk6PSpRtH8IkEIr/GwOZfTCppls08DikMYZLGR75AClYXtB7afqdtLPYaIs3ObXzQg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373884;
	bh=Odq2K8000QpLw7dqvUlEHLgkiyWhDiLp4MJRaqjnLDM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sjxcAcy8sS5jtmiG8sKVo1dM2Zrq1+eI46Z3nP9PnWrM+k1V1qoMwh+PlzZxyq51Y
	 +Q/QdaG6nhTgel4zSNfWs9j0fGtbdGnF0+mHyd2x0QKyyq4NnIZNS/Wc2yQPP9ZB0m
	 HSeqrZC9KJVls8dQTqhasZ8gzucRznnnYWE6Gawrm4XEGlQURvxm4ie0ND1oPf8xkI
	 FBpjxAEnSIjJ9zAfg6VqI990Pm+EIaFSpo2iPy7ESq1B9HhfeEs9wjder5dqAQRJTr
	 iE339Jppjy2M0DW8nR+0pt2KKSln6m8/tTFf95jHW4dsizvlSKA3PE5ZSlHywo9F7F
	 YKuFj1v93Eq4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3277260A48;
	Fri, 30 Oct 2026 15:24:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC84E3AF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9228B81250
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XX8mGXHNRyR4 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:24:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6B6D38125B
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373881;
 b=MZo9et0VIr9Stz8slT1D4cSGVzFPz4Om6qxBTjFFG1qbUoNxiQ1LVqC4qq2Idu/Mxvfh
 9PIfD8Sn2IIknPWieEqu1WQWPlXxkEEKEDb6wuA57bDOC2Wdvvi7bBDKoW8n+BoS5UK+U
 hCWbSjgPDg9nYW7Xf5n9wLJL1vMsObRTikF6FarMrGmjYNq/dn4aF4Kc7lx0vrfeOS0fK
 gfDQPHyhPWRVqb+o13HQzZ2wATY9E2/uk06cldevjQIr7tNPJH31lYBaBmxlyucUII4rJ
 zC4E7JB2cG46pFFUABg8za8wpv3OyieI6tPbyS2fQPbIHxP28TpujVJ5tIiylgNOqGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373881;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=SgCl1DYt4pkrPMbz1dQIRwWLub3a7uhMZv087iljd3o=;
 b=P7t3XCX0Qn4K3VAvQWZfgdYImWAzB/iI9d50tKquesGCmVrBgFU5aRuiLPW6JfWgQwxt
 +YI44dL3mvR2tuIg36JDOA8gRrksBaUJTtmT8pvikkK+s6VrMdvS9LmzMQCPS6naaG3Ll
 WaBpKfieeeRPtm+uLraDMD0qEcBjUtWYSYmp7qAt/uti+4q73vd3wyghOS6i/qq0KoS/G
 yjvWOnO2ap2cv3Ccj+ScWkt1gpF9ElYh61QdnbW++uPb1LAbC9rM1IF2ZVrOCoAQBRgV9
 iABOEbZvXFg3kzoSx3s+vhDfRxA90+xK695HE3EhvBEgfKcN3aJ9b59xz1i/UEPT8ow==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=lsKx9qpN; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=lsKx9qpN
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B6D38125B
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:40 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48c4649b35bso803455f8f.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373879; x=1793978679; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SgCl1DYt4pkrPMbz1dQIRwWLub3a7uhMZv087iljd3o=;
 b=lsKx9qpNXF58KQJ5Tqq2IYFpo/xShRXIzh1R5R4Z5ysxLyk1FYQD5WjAECLq40CpI6
 bdIiWIbJ+lDTjl5EBbFaaDSGzhzxrsNCPNDRVAlR+GZlQMCc8f57zi55mLRw+yIAQldn
 XtMQSHi+YnQsrIzycSVEvJLQln/etjYyQsycb6BX5I4cQdfz44fm9/q8oVPNwAeD4GhN
 KUBZpeobCFS3T1uAIJOEt1t+5qP9ZFUbKzZVxogi75kXKjccaGDvdaaHOSrpkmf1HCWX
 J2PC+cNnEW/UIt8TRYkDyPMUEo1D4gGXnXpOA07aagjq32CTwy5Qzb8OCyUXo53u4j3V
 s7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373879; x=1793978679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SgCl1DYt4pkrPMbz1dQIRwWLub3a7uhMZv087iljd3o=;
 b=nZtgy84cOaNdTjwaS6PHlLLLogL/46CjNWxY43rmSAhkg86EKJEOpCs6mUl9JRKjHs
 nSuVZ8snay96Mu/GhdJDSNFpIlUQ7M+HXev356b7kmXAlQuyDPZCS+HUi7dov4eFUBgq
 scW+nZm2sEUyr5sqOPwah3SUx/DKi35JPT6+3cE96yXtBBDEe4FGCVXgB5BHYYCMBVSR
 XNW1ItZss8cQ/rxFnnt6lXflKOHH3KU+tsOL1ohmpINCJrt4aL31vVSwPbIIimxaX0Ss
 jSxjXic7wPjrEKTltdtjYkUq70hEAEFqAn+rEgdXXTJ1r6R5R/K8zqLXAydczu0Ah08H
 FAmQ==
X-Gm-Message-State: AFq9FYLPD9AvMguSPq6ArBju181eqvj7Jj9k0zy/pngjNtHRo8Y61R8n
 pwV5XgTS+gZUXbOlAtvg5K/ek5PW53PPvbmuJz0Oac/uyHYCedRgv/AAJ7x6sQ==
X-Gm-Gg: AYBFou2l9Wo0JFYB5b6b/qUHUAeYjiiP+rRCpymLQG9slW0sNnepdPD2UmV1rVxj+QG
 4fdXj+HmvGnD5/7E75INvgFVLuYC0Lz9Dv+e8CQD3vw1r/mktfX17f2dBT5P6Fn28WwHQajVr0v
 Nf7h/vDUjtP3En+iOfzX7atwLZoiNEE+YthhuZ9QsuUJjsWAVIc/rwGgLYjq8GbcfBJpkzm78T0
 uPuV5gsxDx+0qTANaN7Dh/i4eeFP9Z8rXnjWxFLF+Pf8A+wojJWTAkvwAja26axIJ0SGL0ZzB6S
 byzkk9jUeoNS5nhDJc7NnSDMlzKcPfOjnXvyKouJAG46SYGWvansOOmx2J/T1zXc8uV1CR8MCRh
 hCn5BW8KVmcWZBTbjRAIQ1aWYjOQ4h2HxNCo0ehvukBCy9fADvGtFgcgcSxFXMb9OUb3GZ45KrS
 GlRXXpZNZ4WwfiHkTVxfcPL+BSCLc5cE+qXZo2kEFRYczf2FR9+BtHzUGiU5+CgWFhVckPZfNcn
 kwew0uu3UjgVVKHRrBD+HbQuArj8uQH4jamoMc21i0MFhd/J73aasJvrPrbLbD0QQxv2LzNJxEB
 WeB56WbK0IWk+JmI/cohgq6+96Wf22DPmtf3/2P/OGOlxlpzPy8nZ025Z62eypIH7HRLnbW2CCC
 V
X-Received: by 2002:a05:6000:1841:b0:48d:dfff:fe6b with SMTP id
 ffacd0b85a97d-48e6e4ff6c9mr6423760f8f.34.1793373878509; 
 Fri, 30 Oct 2026 08:24:38 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8c0b6sm3540180f8f.41.2026.10.30.08.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:24:37 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 16:24:26 +0100
Message-Id: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/9] package/uthash: new package
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

uthash is a set of C macros implementing hash tables, linked lists,
dynamic arrays and other data structures, provided as headers only.

It is needed by falcosecurity-libs, which otherwise downloads uthash.h
at build time.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/sysdig/Config.in   |  2 +-
 package/uthash/Config.in   |  8 ++++++++
 package/uthash/uthash.hash |  3 +++
 package/uthash/uthash.mk   | 19 +++++++++++++++++++
 6 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 package/uthash/Config.in
 create mode 100644 package/uthash/uthash.hash
 create mode 100644 package/uthash/uthash.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b4ada4e1f9..8ca72bec84 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -261,6 +261,7 @@ F:	package/sam-ba/
 F:	package/sshguard/
 F:	package/sunwait/
 F:	package/sysdig/
+F:	package/uthash/
 
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
diff --git a/package/Config.in b/package/Config.in
index 796c4f1ad6..02932e5ac1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2323,6 +2323,7 @@ endif
 	source "package/tllist/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
+	source "package/uthash/Config.in"
 	source "package/uvw/Config.in"
 	source "package/volk/Config.in"
 	source "package/xapian/Config.in"
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 73ac03e240..038a9734aa 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_SYSDIG
 
 	  https://github.com/draios/sysdig/wiki
 
-comment "sysdig needs a glibc toolchain w/ C++, threads, wchar, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
+comment "sysdig needs a glibc or musl toolchain w/ C++, threads, wchar, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
diff --git a/package/uthash/Config.in b/package/uthash/Config.in
new file mode 100644
index 0000000000..e19c277abd
--- /dev/null
+++ b/package/uthash/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_UTHASH
+	bool "uthash"
+	help
+	  uthash is a set of C macros implementing hash tables, linked
+	  lists, dynamic arrays and other data structures, provided as
+	  headers only.
+
+	  https://troydhanson.github.io/uthash/
diff --git a/package/uthash/uthash.hash b/package/uthash/uthash.hash
new file mode 100644
index 0000000000..37a5a66aba
--- /dev/null
+++ b/package/uthash/uthash.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  387ba027946d7c64e9aa19cc53b2edcd714f8f9dca9fa8e3aaef17e0e8e3d736  uthash-2.4.0.tar.gz
+sha256  40f48f89e1d0095bf1c5fb4d00affd74959c3ff77463b672cf7fac547d1d6465  LICENSE
diff --git a/package/uthash/uthash.mk b/package/uthash/uthash.mk
new file mode 100644
index 0000000000..2107a90d56
--- /dev/null
+++ b/package/uthash/uthash.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# uthash
+#
+################################################################################
+
+UTHASH_VERSION = 2.4.0
+UTHASH_SITE = $(call github,troydhanson,uthash,v$(UTHASH_VERSION))
+UTHASH_LICENSE = BSD-1-Clause
+UTHASH_LICENSE_FILES = LICENSE
+UTHASH_INSTALL_STAGING = YES
+UTHASH_INSTALL_TARGET = NO
+
+define UTHASH_INSTALL_STAGING_CMDS
+	$(INSTALL) -d $(STAGING_DIR)/usr/include
+	$(INSTALL) -m 0644 $(@D)/src/*.h $(STAGING_DIR)/usr/include
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
