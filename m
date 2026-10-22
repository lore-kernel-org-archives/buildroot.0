Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD2C606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 08:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DWjQOmoD
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E28BA408E8;
	Thu, 22 Oct 2026 08:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_-V-zOzZc0T; Thu, 22 Oct 2026 08:12:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E97AD408EB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792656763;
	b=ab11bQm/KmW/Jd8rnO5BBDAbE3LLfdYpoSUowM0ZLxfZdWfls6f/03Dp+zyQ4Bd7Z29N
	 A3m+YKF3LxmT1cTAMl/8Q5GNkRGpQfbNqER5BVB1i+Ps7C6UF/kDY9PIgKid+ZBfb1icT
	 Euk2PJoTy0lWZ56qk76t8cc/GrplIXTZ9bFMsR/hE0EBXN+evHQYb8K+qflksCAiz6Lej
	 7es1Fkv7hU83sHGWHYt/dLN5mdnagbInPE8+uuYnCWbG0ZkZa7xuGvh4wE+ZfPtTiEg5b
	 MECeVHwM0jzTrMeKQrO6j32bmgamOWIW9OxonlsXIRU2JdkCo1Vufb8PGz49AbXpnYQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792656763;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0QC/Cf9zRs6SP98A7f/0K9rbgIWF1VeJrN32sxTyZrQ=;
	b=YpAyhsQxMosljYJdA1zg6Inmj0A/QYlsKOy/2W1qnvWw8lMiadj3DKZa8nYFEENrbmh+
	 L7k8dz/edJVnEmHlPjX9KZMqk+5ZMUXDbCW7omiG/Ovvkkj096kDr7iOZm1+fRgB5KndH
	 EbHibV1qio8C7E5QiA/1FTJDo2Y3ddhBVcy3hmwUYhJjhUl4TA3zPj4wCVdft6eyT79YQ
	 9Hq8JAemf2FRHFf3JLrpd2vKtcZy2dWhlSNrsXvcAVRuZl2nNND2CeQOt+Y8rFgRHCxb5
	 rJSlmWe2SdNboGCqa6B55O2iJEASUHmb3aBmLNd6UkYejYGJR0TYplpNwHt3F0Qah7g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792656763;
	bh=0QC/Cf9zRs6SP98A7f/0K9rbgIWF1VeJrN32sxTyZrQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DWjQOmoDwu8/j9lCvDfdBw/tIZTea+B023iduWV1XQxl/2u+7D9D2ivkUBCVgz9VZ
	 SRerpggagmxOi96+TJBkgxfHR+OlY9NXjs6hbZOG5fwmrDcgGiF7ERlerP76qsXfo5
	 zEraxZ8Xe0JiVK82l2Qnht4aOVzVOmlVl3oqDhlvrE1/EbCrNqOlsvFTKRAMpzg13f
	 JEDkIADslIeSk6xePMhh06LO7pculJl2gxaaKuLUKEzaqwd2wmHNftpEIqWy6d2vjY
	 uJMYSCBRTrFsbkwjuNeMn+gmckyOu0z0d0OO9CZ5TAFxdGU/ELMCB/jWilbs3Tl2AN
	 6Mc45owHIf69A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E97AD408EB;
	Thu, 22 Oct 2026 08:12:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C8FA1184
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A51E60787
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCHsRDro4pfX for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 08:12:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8FCC860818
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792656759;
 b=XmR/TI4hDHbPAYe9TyOyUYYjWi6RcBFpC1n2/pWeQo+BTDASEtfBqhSt2X4zVL0G2Y14
 3HjnK4cWIXHjYBfdAc2W3eRpLxrvUsEqbEDb2QSeeTW+NHPnxefpDlh+XpoRRIPS3zEgU
 NU5Uc0QxevKpZiXK1cVJAe0AaHOlETHfR17AD4OD9TNCYYq3mz9Xn+S4YlhPUS5KNMgMp
 jTAEJanWxf5RZLs8sMdm3Z7nglGEassoctFHnhe0L1V+X0kGkjZ/G0R2lmVuVru/VwkVU
 DeLUnRE7uoJGWZZCC8RflyrhFuukH7hchgg3dFajmee53M3w0c6km+0vv3HfN4b6KGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792656759;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lHbHyRN9P7FR4wkxgB9MOv0gXn/79F7Fc+Q3S40ZdZA=;
 b=OcPy7xcOtJHK4TIo82I7X4igKjHMXxDD7XFaro1p+udUmp5OWTKRcj272TPBd+HfcAw+
 9AtYtQ1e/kvEkCcJ24GyfNmL11BKEu7Wr4PnyE8Vlg4t/ypRnDL4sGXPhbMBmbVQRHWb6
 4kg3IBUoatSTGpqyYL5ph8/dtemddhsUI/JkRO5cTlyvw9wb/zZi2iTl3wq/n29dVM0ke
 oAznNYdYWXESHiZ0enMAtSpSNBEgfKn617F1lHRVE8x2WHeqXG7G6QVz2BW+eS0Pfa9q7
 EO+bBCUwXTKd1nN/fXZoZF0QxOBVUBFbwzxcMdMvXNFfCgEPE6RaK/xtWEg+g8gDpxA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FCC860818
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:12:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E2D99B97B; Thu, 22 Oct 2026 08:11:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 10:10:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbb4bb8113ed6a801d34dca0b7e5c7872aeda46f
X-Git-Newrev: 0aef99c165ba6fb4db33efaec77c113ff03eb80d
X-Patchwork-Hint: ignore
Message-Id: <20261022081115.9E2D99B97B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx: security bump to version
 1.30.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0aef99c165ba6fb4db33efaec77c113ff03eb80d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following vulnerabilities:

Changes with nginx 1.30.6                                        14 Oct 2026

    *) Security: a buffer overflow might occur in a worker process when
       using the "alias" directive if the request URI was changed by the
       "rewrite" directive and was then mapped to a file path
       (CVE-2026-15176).

    *) Security: a buffer overflow might occur in a worker process while
       evaluating string expressions with variables, which affected the
       document root calculation and request logging in the http and stream
       modules (CVE-2026-93479).
       Thanks to Matt Suiche of Tolmo Inc.

    *) Security: when using HTTP/3 a part of an unknown frame might be
       treated as the request body, which might result in bypassing the
       "client_max_body_size" limit or injecting data in the proxied request
       (CVE-2026-95101).
       Thanks to Hansol Lee of GOTROOT.

    *) Security: when using TLS session ticket key rotation, one of the keys
       was left uninitialized, which might allow to forge a session
       (CVE-2026-97629).
       Thanks to PhiNode Labs.

    *) Security: when using asynchronous file I/O (AIO), use-after-free
       might occur in certain configurations if the SSI page has "include
       virtual" commands (CVE-2026-97205).
       Thanks to cyberlancer.

Changes with nginx 1.30.5                                        15 Sep 2026

    *) Security: a heap memory buffer overflow might occur in a worker
       process under certain configurations when using HTTP/3 with OpenSSL
       3.5.0 and earlier (CVE-2026-90439).
       Thanks to Banny Liao.

Changes with nginx 1.30.4                                        15 Jul 2026

    *) Security: heap buffer overflow might occur in a worker process when
       using the map directive with regex matching if the map variable was
       included in a string expression after a capture affected by this map;
       a similar issue might happen when using a non-cacheable variable in a
       string expression (CVE-2026-42533).
       Thanks to Mufeed VH of Winfunc Research and Maxim Dounin.

    *) Security: uninitialized memory access might occur when using unnamed
       regex captures with the "slice" directive or background cache update,
       which could result in worker process memory disclosure or worker
       process termination (CVE-2026-60005).

    *) Security: use-after-free might occur when processing a specially
       crafted proxied backend response with the ngx_http_ssi_filter_module
       (CVE-2026-56434).
       Thanks to P4P3R-HAK.

https://nginx.org/en/CHANGES-1.30

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 6c3afa889d..646b51997e 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  e5823dc6f45610993def93ebf6cfce68264af4958c77e874b7d20f3709001b8f  nginx-1.30.3.tar.gz
+sha256  3cf46f5ed7504d460125866b7bea99fb357f31d887e2e63b35503310e9b8b6c8  nginx-1.30.6.tar.gz
 # License files, locally calculated
 sha256  08845fe39e06b51dad7685c28140ab49577a86e947523e16b536a46caf89ad5c  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index ad61ef6140..c330e81ebf 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.30.3
+NGINX_VERSION = 1.30.6
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
