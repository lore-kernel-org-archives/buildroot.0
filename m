Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CCB606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fDvbvCrQ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72BFF608DC;
	Fri,  6 Nov 2026 21:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ellnUsqCY0JX; Fri,  6 Nov 2026 21:14:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6CF1B60A46
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999679;
	b=KY6HM81HwJvHiIihT+Jyj5pHlfqaajnNXNYGReSsugKD9+CNAYvwm35E62Spfmxd3NR0
	 7XzeSoMzXNj2MOPIOO+JOcyz9F+zUSZjXReKtLQIfc0ixstO108m1GKDy+EWhGTCaEAQf
	 m3gMps3CyDvBl1bh8cYK2ca4/6tvq3RrOHDII3nomdWeF4bH8W51MappeXEMdiEkC4FFH
	 fpr/FAIMkIBU0RP3MkNOYFv35n0rTRSNm6yAeQeEcta1geweRkwdh2lWhZreW+DNhtrNP
	 r3qJka1TTEOxiZsA5sk1YgtWv0BlgwvIjFvgd+eIm2DNZ5SeLZ7CT2gU7IXXa/mM3PQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999679;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IZosioQr+c+6MzGOoZ1jKdVDsLBleypBZNbbWTjTZPQ=;
	b=qSdep2gkB1bgirJIF/cn2wE2RKBTyXCVeJyty/eGUO2Q24AV/YaCQVT5O6RMg8PUlv7i
	 49lPAiX8onIbIoHSJE4t1IifkLW39AafhPfpLEzo1cS/QW5f2kwipOnx+pfItnP12HDDt
	 7ILNmmQz/uii8g2HiZFrqzJ5vlji22mxItRP92IyYCeePuJXfKbo3uDNhajxWrWgd4LwL
	 pYySCVG13NESSIle641U0+bcQDoT5sPCIOuaSNxZy4RCVUKZuHWjDVEzifp8MNcsDDZlf
	 B5Xqmnxu6pWGzwSXpnwYsobcwjXm4JhxZZHmgyeL+snQqw5+qq07/3+XtAEwa6Q4cjg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999679;
	bh=IZosioQr+c+6MzGOoZ1jKdVDsLBleypBZNbbWTjTZPQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fDvbvCrQfzRBjCXBUnStILqWv8ybJWcS7ZyG33SD5y80llJaruNi/41RaOD7um+Se
	 FzWJ4wTFiwM3GtADpoPpkGa6ahCanaBM1MgTMDau36FLaMAz0GDrdePWhcJ2ELV8xb
	 uqm0nWfFzKZt6T03tH9MsZPccIMVLnRAWA8OG65wdzUbYVCZVAT9buVRE9mvywYHkn
	 1Ux9ZFpTzx/z3XWac4UnWVUUDJZzLjNF16pUXqywQb4kwFNs4v2YxuZHsdLBSX/L7v
	 DiLK+o+mRx+oRLiINfZWObaoL/D/osR96JCFwqbc700PVQ3eP0TZDGQoBxzeLPOW2+
	 0Tov9Z/cipkfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CF1B60A46;
	Fri,  6 Nov 2026 21:14:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82E4532A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70DA440400
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaogJrEGs9K7 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B46AA40401
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B46AA40401
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D10C09E0FA; Fri,  6 Nov 2026 21:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e4b7fd380dacf830fa33dd36ea5793af4d6720c
X-Git-Newrev: 9db99661f47076e65044c1e19ae1e4d1e77cb1f8
X-Patchwork-Hint: ignore
Message-Id: <20261106211248.D10C09E0FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gpiod: bump to version 2.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9db99661f47076e65044c1e19ae1e4d1e77cb1f8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-gpiod/python-gpiod.hash | 4 ++--
 package/python-gpiod/python-gpiod.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gpiod/python-gpiod.hash b/package/python-gpiod/python-gpiod.hash
index a94bbaffaf..6c49833dc5 100644
--- a/package/python-gpiod/python-gpiod.hash
+++ b/package/python-gpiod/python-gpiod.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gpiod/json
-md5  b9df2fa69d4d7a77b0d5c70ff157a6c9  gpiod-2.5.0.tar.gz
-sha256  53ae5a1f14d6388c155b591ca0fc0cfa73b44d4f6d8d117e8a9e68f5902d187a  gpiod-2.5.0.tar.gz
+md5  f5fda3d5ff274a9a16bc6db89202a9a5  gpiod-2.6.0.tar.gz
+sha256  1076f0384c63fdb9e4438508c511378c57b4236c6b43b65ad609d0dafdfcfd7d  gpiod-2.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  LICENSE
diff --git a/package/python-gpiod/python-gpiod.mk b/package/python-gpiod/python-gpiod.mk
index 592107111d..b86c29cda0 100644
--- a/package/python-gpiod/python-gpiod.mk
+++ b/package/python-gpiod/python-gpiod.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GPIOD_VERSION = 2.5.0
+PYTHON_GPIOD_VERSION = 2.6.0
 PYTHON_GPIOD_SOURCE = gpiod-$(PYTHON_GPIOD_VERSION).tar.gz
-PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/fc/c2/c7bc26965855f39ae3e1b09b404a1fdc3b172dac371012c316f5b9b6a314
+PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/ae/09/caeafe129570269e85f93f429ac5eb7e15c513b2b788996ee68c640c3fd6
 PYTHON_GPIOD_SETUP_TYPE = setuptools
 PYTHON_GPIOD_LICENSE = LGPL-2.1+
 PYTHON_GPIOD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
