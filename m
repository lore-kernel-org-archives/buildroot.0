Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D2FCA5FCB
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0BC740A34;
	Thu,  1 Oct 2026 14:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFDfR-62dgUZ; Thu,  1 Oct 2026 14:23:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B96A140D8F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864605;
	b=EO+GP2V7k3yGmLdiBJ4Bss3DJ/eeLjvREOkbdpQx0M9j5BCuALxqUCiir74mTbltd8zg
	 u4QfEGNbNRynKjt4PYuHZt4xgCvhJaSiyF7G39L1ofU0jQmPwGMuy7SkVkQai+He9QQlv
	 d+8Kcddo4kVnHlqY7934aFgulbJH7my1+UQ1B7Lg/IQwc7Nh9uGrE29H9vdqbbsEohsTY
	 biVHgGyF7tAjqSizBfRHiYwIruHrR9LMYjZ/eviWB8UQxfxaFu2Aoj5fmAu8GXA4Le1sz
	 HVw3TdOSUftOcuBgSiSFAMn7hftP3xYQp1aEFMgxE1vulvkJQDJlPV4nyvvkLM1JIhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864605;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=qVvBU5va9HFN+GwiYVvuZOasq+X31wK8nzdyC0qQpco=;
	b=H2D+LYFnQPR5HTxlu/5JTpJ/rHp14+dXQJoj54RUOPK74DumLf0kyANT4V/LRW83LiY+
	 fxpqsGWKlYiJjzUW6vWr/9zyZ1T/hvY7wmzgI0c1wEM3GqHW3wM78i3F4L7OSMo/f/giy
	 xa8rSXrdjhlkUE4CISWboqgWroMJeGgO++HsIa5/5E8L0UTClIk0v2I7VWrQT6PPwPZPH
	 LK0tg96rptZgD0VyYMg2HbxnMAIv/jgqmLIenZxdg+mPq4INxsEcYyAwM7Y+SJrHUs2WA
	 aH5VXftLnxSDieq4ytNUYmbK/IDrCnEEYdf4BnBijCCV1KGmy2vKGYJmjkTaiOb+Axw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864605;
	bh=qVvBU5va9HFN+GwiYVvuZOasq+X31wK8nzdyC0qQpco=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N9ZKbOgni1tDZ3bcU6Q/SPJChiZBqVAhha2Db4VEZBM26Wu0FpFoG996IFZJ4tBP2
	 ITwhJecCKzF/Skv9hBPD7rhi/4uLYcbPikNauBZRO+TKNKwJsZ3EtgODCGiahJi8Lw
	 HT+w2jXe4XRmQJoCH3EeS85ORHMW/NEIRQpgwGUiGtmC+uI2dayl5pA70UcLVFx4zM
	 wVGVHQHKxe4pQ/WE173mTVyh4JgnrAnKksabDXE7/uRY5SXmeESBypkW9u9nWCvqsI
	 enjMG732S4FwR40yC4izEQkR+71d8D5sRSoX76SHGIkbqQL8WB4G98KN4KfWJiaIFq
	 PpSAU43YsyjYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B96A140D8F;
	Thu,  1 Oct 2026 14:23:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE0EA1FE5
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7708980DD8
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYXXdWMXCpPM for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BAE9A80DF4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864562;
 b=WfIvl8zdmejvUXHAsfrWuYzBl808dQacUiuvKUQxkm8hZvbUu4B1BpiD3l8BbZ2vnDBq
 gomwXhYjq/v94kQDFPfB5oVxCU805x6Sl6OAsys7TLhN0lp9EzXJrlDxho4avpiv9Ja/N
 anjX7Vzc5LHT7LckWdbiVSoAWBrCQva6oE1Jfj6WASIqtrGMVzC+D/D0Q5PIJ6ZCjjPGI
 7Kgl+YlZkCPrj8Bbne28OS8VrpMPkNUW24Cnq0OOvE9V4WQGTWHyPLgVxKfyYuQcy6wAc
 YWS6csa84Bl19j61CAWUHdngmdcU3hsNhKtR301ZZXRgRletaRTw2LbHfF0MwT/jSKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864562;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8sudu/En9bSqjtXH4jrdOSZ1RDeUGtu1PgQY74UHHJA=;
 b=USJSpge3VIknlj0U16CFzbXzLB7m1qCV0vjfsjfWIWBRMHUnbPU40Q3uMpJaKPDX1yQe
 1MrZjVLRoBM5uQBQNwv6Q0nNDRPNoz2EScHCZsZAOXIgQ53R8RaxrUNIYPKgCXSFgbvEt
 6EciKaaQQMYCZJ8ga6h4VHrfaDNNt9JvJQXH4P2Xj4vq+xaidobN2Z7Y+p30xOxo7H2qE
 3rzQb4lIsK80pRa65cxMJF4YeO/H4BA9CF3cO1H+CYMDFs2fXOoK3TZw31Pu9CMqg86+9
 KObosMNaWbGXOCbRntQfX59ycRR5blokFdnraQhOAGBDpF+FFzEWabrQ7S5DhVuKh+Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAE9A80DF4
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02B229843B; Thu,  1 Oct 2026 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 14:44:44 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b7a2b163f64e8f0747abf47e39898f1dbb0dc3ff
X-Git-Newrev: 2e52ae72a2d7ca0e40c3b85570de0a51bfb4c37c
X-Patchwork-Hint: ignore
Message-Id: <20261001142129.02B229843B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/distribution-registry: security bump to version 3.1.1
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2340898166257239939=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2340898166257239939==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2e52ae72a2d7ca0e40c3b85570de0a51bfb4c37c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Changelog since v3.0.0:
https://github.com/distribution/distribution/releases/tag/v3.1.0
https://github.com/distribution/distribution/releases/tag/v3.1.1

This feature-release also contains security fixes:
* CVE-2026-35172
* CVE-2026-33540
* CVE-2026-41888

Drop our backported patch, included since 3.1.0

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
[Julien: add info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 02cc32ee5c66708b1f57c3aba1fc357c3429c2eb)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .../0001-s3-aws-fix-build-for-386.patch            | 45 ----------------------
 .../distribution-registry.hash                     |  2 +-
 .../distribution-registry/distribution-registry.mk |  2 +-
 3 files changed, 2 insertions(+), 47 deletions(-)

diff --git a/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch b/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch
deleted file mode 100644
index a725ab8e92..0000000000
--- a/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 6970080b10a53d858dd444a643a2bd911de12940 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 29 May 2025 11:28:38 +0800
-Subject: [PATCH] s3-aws: fix build for 386
-
-When building for 386, we got the following build error:
-
-  registry/storage/driver/s3-aws/s3.go:312:99: cannot use
-  maxChunkSize (untyped int constant 5368709120) as int value
-  in argument to getParameterAsInteger (overflows)
-
-This is because the s3_64bit.go is used. Adjust the build tag matching
-in s3_32bit.go and s3_64bit.go to fix this issue.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-Upstream: https://github.com/distribution/distribution/commit/6970080b10a53d858dd444a643a2bd911de12940
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- registry/storage/driver/s3-aws/s3_32bit.go | 2 +-
- registry/storage/driver/s3-aws/s3_64bit.go | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/registry/storage/driver/s3-aws/s3_32bit.go b/registry/storage/driver/s3-aws/s3_32bit.go
-index 218e3eab..84161fcb 100644
---- a/registry/storage/driver/s3-aws/s3_32bit.go
-+++ b/registry/storage/driver/s3-aws/s3_32bit.go
-@@ -1,4 +1,4 @@
--//go:build arm
-+//go:build arm || 386
- 
- package s3
- 
-diff --git a/registry/storage/driver/s3-aws/s3_64bit.go b/registry/storage/driver/s3-aws/s3_64bit.go
-index 55254e49..2ed1f92f 100644
---- a/registry/storage/driver/s3-aws/s3_64bit.go
-+++ b/registry/storage/driver/s3-aws/s3_64bit.go
-@@ -1,4 +1,4 @@
--//go:build !arm
-+//go:build !arm && !386
- 
- package s3
- 
--- 
-2.51.1
-
diff --git a/package/distribution-registry/distribution-registry.hash b/package/distribution-registry/distribution-registry.hash
index 38d7b5a487..9c2fa922ee 100644
--- a/package/distribution-registry/distribution-registry.hash
+++ b/package/distribution-registry/distribution-registry.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6330e6b625c0232b43cee8ea32800a660a7d7a0c79f4f53e4d9a8a6707138d46  distribution-registry-v3.0.0-git4-go2.tar.gz
+sha256  5ed3891ed90c7d097304f49aec2e1f16299770309e2f424b5ee9531b1da2429a  distribution-registry-v3.1.1-git4-go2.tar.gz
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/distribution-registry/distribution-registry.mk b/package/distribution-registry/distribution-registry.mk
index a01a3c1710..1119132b48 100644
--- a/package/distribution-registry/distribution-registry.mk
+++ b/package/distribution-registry/distribution-registry.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DISTRIBUTION_REGISTRY_VERSION = v3.0.0
+DISTRIBUTION_REGISTRY_VERSION = v3.1.1
 DISTRIBUTION_REGISTRY_SITE = https://github.com/distribution/distribution
 DISTRIBUTION_REGISTRY_SITE_METHOD = git
 

--===============2340898166257239939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2340898166257239939==--
