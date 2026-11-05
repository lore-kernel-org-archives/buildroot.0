Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8781A606A326
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 21:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=shbAZoHN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=V6BEixzJ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49538408D7;
	Thu,  5 Nov 2026 21:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqaGXJaKqr7H; Thu,  5 Nov 2026 21:17:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 42D5C40824
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793913435;
	b=Uph4dBZsnJAaMJkHSuURW69MODEWXYaB1GEc/AhS4Qk0C7JLEC4lA56QZrsJZ7ktu80f
	 gwE6J2TB4B8AEZOES2EOx+lGyf/TObhL8uH/5lxX66Ily+IYN0wYDE6vAhpYW9dneR3+A
	 7/Y+nFTj3cqq3qAxyLpB6Oa54lz2rR53aX4idGydVQyaoC/snrOe8S94M+LU4VE9O2n5K
	 sziZDjzxKdPXlW+xM4JbCOiT7OrC85cIrdvOnj6NsuBvEbj1qTLrld+NEQVEsPZchXPCZ
	 QzOMuQlyZzeo7OOu4j/qSICUvEU5wrHNlI98kABnOIn0xKRU1FTNOo4O4iFMSKHrPCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793913435;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/LmazEqfOKD43hIzGp5CBVtbdPP/QzZfVPuLOVZDC0g=;
	b=l4uawNRuINN5BQ0Sk7vOx3SmSgI3g6FNjF59o8ejxl+mhQkNEdtNJSnT5fViD7qaOO3n
	 9hkBWXsq10C8PIju5FLOMkwnp3cWwW557zaHQUAt0WgKVfBRQktdAcmLOTxX8BmIMoFeT
	 LN23v1F8hjZpvGNRwvKIAy2d+I5XOomvXnne5ulDJvZE45tnGttzXTlx2+aW65aePXOp+
	 v9Ec1slvuINAV4TpPUTOFYZPuohWHPcPVSOaHk9/e2Nan8gd8MrNzhzyWze1+KndgXiC+
	 bb4wpuVVfDStFM4x5bN3+aMZWzBGg0yXxA0uV7GzKEtWnr+C+WLPIt/sVrCqBJ2qV+g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793913435;
	bh=/LmazEqfOKD43hIzGp5CBVtbdPP/QzZfVPuLOVZDC0g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=shbAZoHNvc9p3tnRLlIK/UnG2rI+1VH27thaeMCGuwfKQHmucuUuiH6ouStw1rN05
	 QEbfigJLKZ9kX1QnI7jlnLSiJYpCUt7DU36dmDA4ligkrQoHP/jiHVu2DDlbs4Ge6j
	 o5NTl6Ap0MXxSwyoyR/sBuJGG1m+fLgIrcx8Eq966tvGrzr1ItwIu3gYs/gdu8YI/D
	 0QP1mremymNNKb9SeiZzMwH4hyjSiqeb4kr9AsZXG+0ybooKQ0BY6uQmI8HcWqZC9q
	 9FPrelEW7JOY4JBFwKNIXTd1sSLhi+etJkO5/Lky2ADJNaIHCT4GixQgdkScPrm8Ps
	 gjgNlJiUJ7Q6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42D5C40824;
	Thu,  5 Nov 2026 21:17:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21C7CFC6
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07CC480874
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zimn0cR2M20h for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 21:17:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 080B88119D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=V6BEixzJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 080B88119D
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793913430;
 bh=Qf9/fxRYLpqnQ+05mzamMhxvWTIHnYwMz03pnqNGn9A=;
 h=From:To:Subject:Date:From;
 b=V6BEixzJ35YpL0moF5onLSAXHGgvyrXmelN41yQ7CTBMD14rcsgQBS+yosmhQKbHV
 3C3UDcHGWGuo7iOTVm8UjrsqAg2BC4yw2AydjUExCq0Xyn8VlNqMw0nh/kl+BXy0/w
 7fo0bsQEhe5dIhD39gQ3XaKCbT0pZA8C1zMt2YBYDrpbFdNgpcSvmK5eWQiBHLLgZu
 dGtSjMRYtN1ffkOoVIRJarW0bGi+mEFSOq/3lXgwD4d3zDQJVAx9GMcV66kTNHjfxw
 cFu42mRn9q0INUmjoaFyYStWJkk5OMUhS2sCEAHwvuUSLR/jja5+OJkeGuX6x1zuhj
 KpXClyGAeH2Sw==
X-KAS-Sym: v3:f51bdf72230551df:i3EExBWPJQuNN7p3a+qxzvgCJ4kojBJK4GOGXf5iT7GmE
 ZPWNshjCtBc+gBpSsJlNANxbZLuWvq3ysMfDl1CYJaMnfkMGEC3sfr/PfBCacUt6GZ19p3pa+bf
 d+0dUQbh2/y1aeQ6n8zi0PIosP9YtnV5nI9i8LNJgsfNKnzds92phOIy6vqLc0LMql0aICRVF5u
 F1e5K8VtoS8mW3S7IW5CHG2+PWjOqslK/mONeTeeQ02DDtd3PlXYzivU4y/7TDouoHGi2Vl5LX8
 gpLqFrjDAgyojC3xglb5v80Uy7Nf1JpkIIyQzIRnFX4NTR+eXRThoZ4esZyN1bOZkKof4q6Q==:
 ESJD0X/xNcz6pHW3sLam9Rvy1uuEFHAd+uKF1mjbuuv10FJ72IwlQap/DbCPxVmKNIZBM1UPS3h
 KRppuKafOcWNYtoSMOp2cSwptZBc18inPP9k+rNUtGYfD2DVZQuC0LHdL01REP4E954qpdrRlhe
 z1C6RlutACVk4x3NbxYav/EPcKLvFS0KqCjlfw9ktuYJycHK3NNnyQMmyJ8wQB2YQjriXVpsQWJ
 y2dPgMHUVSd9MQghfnSf76ehilRuqGI2fSwooY/umXmm5nhukOXJ9VQAwvbsNFl9hZEBJvVaRz6
 /4Q4DKZczPlUVJ48yvfmRDjR6p/HoanDSQU4GJomFubo5sbv9ufgnR6ma2VCSuf3x1t9WRJY4aq
 uorLDs9XcNWShycAG2syS8tfnwDsFdfT2pawkLzfH/mv0Z/xLyGweiDO/+hlZ1mYIm+LQ2kxZtr
 CSulNlDjKjW+Zoew4vP8OsR9ghkQM37Ph5wDYTlZpWdxCWsWGAI+rYanAq4alE57cIqKQZM4+EE
 PbKkl+0Boi6aVox1O9k9KUVOKeHOlPfzoFZ7mmaBwMKYEK+hYhlAoBx8C4GS1xBONGOQsISOVGi
 rUmutg==
Received: from fli4l.lan.fli4l (p54a1b33d.dip0.t-ipconnect.de [84.161.179.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2A60BA4C3BB8
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 22:17:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57480)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xP4pZ-000000005sa-43rs
 for buildroot@buildroot.org; Thu, 05 Nov 2026 21:17:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 22:17:09 +0100
Message-ID: <20261105211709.2111233-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/linux-headers: drop 7.2.x option
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The 7.2.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 7 +++++++
 linux/7.2.15                         | 1 -
 linux/from-6.17/linux.hash           | 1 -
 package/linux-headers/7.2.15         | 1 -
 package/linux-headers/Config.in.host | 5 -----
 5 files changed, 7 insertions(+), 8 deletions(-)
 delete mode 120000 linux/7.2.15
 delete mode 120000 package/linux-headers/7.2.15

diff --git a/Config.in.legacy b/Config.in.legacy
index a28c8eeef8..0ee4d04751 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_KERNEL_HEADERS_7_2
+	bool "kernel headers version 7.2.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 7.2.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_RTAI
 	bool "RTAI userspace has been removed"
 	select BR2_LEGACY
diff --git a/linux/7.2.15 b/linux/7.2.15
deleted file mode 120000
index 74e2b2d5b6..0000000000
--- a/linux/7.2.15
+++ /dev/null
@@ -1 +0,0 @@
-from-6.17
\ No newline at end of file
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 3eabe22c9c..4350130ceb 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
 sha256  fa595aad93734f829c963c2a90ef7c3673224fd7fdae7b49406e397cde2de231  linux-7.3.1.tar.xz
-sha256  d0f6b1d7324c937ccaeb5c4ca7084bfcf71db2edb3e2d3a31f0ad83a681809ab  linux-7.2.15.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  3c2f44ef6acc021a7ad444d9a2e6ec1ef488ff09368793d0004a6080f69d621e  linux-6.18.60.tar.xz
diff --git a/package/linux-headers/7.2.15 b/package/linux-headers/7.2.15
deleted file mode 120000
index a4e1d3ec9c..0000000000
--- a/package/linux-headers/7.2.15
+++ /dev/null
@@ -1 +0,0 @@
-../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2080c909cf..71e2265f4e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -52,10 +52,6 @@ config BR2_KERNEL_HEADERS_6_18
 	bool "Linux 6.18.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 
-config BR2_KERNEL_HEADERS_7_2
-	bool "Linux 7.2.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
-
 config BR2_KERNEL_HEADERS_7_3
 	bool "Linux 7.3.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_3
@@ -488,7 +484,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.161"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.115"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.60"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.15"	if BR2_KERNEL_HEADERS_7_2
 	default "7.3.1"		if BR2_KERNEL_HEADERS_7_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
