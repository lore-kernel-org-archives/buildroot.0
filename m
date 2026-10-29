Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96E9606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W7MiD6i8
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83CCC40DD6;
	Fri, 30 Oct 2026 14:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EvJqpBRiQFPW; Fri, 30 Oct 2026 14:20:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9CCC940DBC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370007;
	b=MgsTIJy8bW6cWcREDwPj70OUUeoD0G6QDeW1FdzY22bNuCwmyPs9M1UnWq+CNEfwnpkK
	 C/7RiyNMM2GmLSOggpicLTaaxoD3jmjgpsblpkL55S5f5L6EQPCqvsiAVeMb23We09Lg1
	 LfajbIrK2dhFYIM1L6bOP+pEvrgJcHImFcZiJgm5wkDaUGILz4GawidDnhaPpsPRNNoBH
	 GZJbFew7TvE92Er4kLwX1+qVmfuSlbBDZYgADF85elJEzdXwcHuAdIJbBvAAFf6sZ/vRi
	 swSGyhD5Z9pAq2fpJlWvN/1/W6xedrHUvB8ypLCYS/YhvpKZRz5aVDVDww+gxFvtQsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370007;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=h5oE3bcD/YL+ifL9IcMY6HkkdkhHPyFdgZEmDyBevM0=;
	b=KTJAHg0gRYNPH8SuHjB6vB99aDboqv9fPdWPqzH4HX+aT0rOhpNVXuGdUeBL6A1w3m2A
	 GYeUVvs4HV006auUEHy2FNHrH2mC5Ch34iV3CUTSYoOd2pvN76kRj1m8VMAcnXLoBmSWM
	 Pays9f6trn9uUQEo2u/H/rgIRKKkcPI9tn1UTAjsLJOE0y1yIMHvevTh0bSxPyx0P5vZ2
	 5aXS1Wyg56cdIiUJvU731gijC4MulMdhGVfBdegCY4TR/wlrUbpEzHxqMTfbl71cINBLd
	 9TegdWlX3jMD7GV7tnTgi39HryQQPUySOnqATxM97+Uq9zeG2ho70geSySz3fJg8PKA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370007;
	bh=h5oE3bcD/YL+ifL9IcMY6HkkdkhHPyFdgZEmDyBevM0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W7MiD6i8mO/Fn8sB0LIhUL75z20SFifC5fMTbpdMjEvX7ECHfDVesb9eMlKIaJa0Y
	 BFd2BD/yZcv37M96gJfppqvFS2XrUffmcTm95LuVQZNQUfcdMb1rCZc780Rhkef3Ly
	 dGIrNXTGCVr3VjHqhYR9WIxQMSoufmnp4zrMUuen3bDmaVXfHef10oN1NhJwqAy8gx
	 Mdom2ryud14IpeZn8b/OXpelrnXf5xy2X2ut7TLpHhNufXbcEAyvmZZeaJ+vKlTdS2
	 ZApZV9QbzDqLVuNPDpk/1cNSn86+g1QUMhHEmpTO4ZlRyE1GqK5Z9DmK+GbAhc1CFG
	 w1GboiZ2Uerew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CCC940DBC;
	Fri, 30 Oct 2026 14:20:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EED38362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEDDF81332
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7rEm-R1UUMC for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 34E3C812EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369894;
 b=RhQAaHAQJ0QIXBpKH+qNO8I07P/MUBoFvQrQx4Dw7BddT0zmwtckXX5KN7bhiLkypjTB
 As2ne/BJVDuYYGqFvoA17VgNnYUYTw8K+hWu9nJ3o6gdL5SPaPHFI1VjRr+8yVADUdRhE
 Gj6ZpvUmaJvFIRHqRIDN/mITAL8B65OcDfKOvOPrEPzdj8yhhT3ynx+P4g9MyfPyRSuNa
 R5k5onZeDsM0c8mNDaLRD9h1QTbiQ2ua/NdSqwVokcQoxmq7OQssXhnJ+MsQV1vzjU29r
 FdR2op7FXdZ4SfIC6xxCJ2DFtoducg15aTKZ9uPnUT2Kj3l13zCRXipj2y5n2+A2oTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369894;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Lghs0vjTGkzzvfmLezFpbJwih8smFMbOyBdaupnLVwc=;
 b=Ob8SXRhzZm+mDkXjMFbl/2MTyaGR8BwzzhtTREyeUVLCcOfNMw73BpjIhn7pS+AFkzWe
 ymIUnT7sVVDPbLN6KRgoD4+1HwIiNd8Ry3Z6bBImMnp6tfCUN1vEK3HK+VDikRwuBVKeM
 D/hsQ6ttJKoBXjmIPRmnZDCQw3sRzelnGOLKu62Ri4Gk8qp7t2eXVaBo7msvTpu11vbZK
 B+RT4yGvPAxwjG0LaVKgr3OYB3j3g/o2t7eG8O/72esuglvlUdIoZ5Iti6M8p6gl9W8nY
 tdfK/Qtt0TXgL8eYAqHWL5785q9PheyBr0pmLYPn8wCIJL75UPLYuXXrxafjH/YERKQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34E3C812EE
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5379E9D388; Fri, 30 Oct 2026 14:16:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:10 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 193d45d26627be3597e25096a4525aefb010dbea
X-Git-Newrev: 7d3e5f3cec1b582ae53eb4b2dedaf570553e4260
X-Patchwork-Hint: ignore
Message-Id: <20261030141646.5379E9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libnss: bump
 version to 3.131
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5781259294321343808=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5781259294321343808==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7d3e5f3cec1b582ae53eb4b2dedaf570553e4260
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

For release notes since 3.129, see:
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_130_RTM/doc/src/releases/nss_3_130.md
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_131_RTM/doc/src/releases/nss_3_131.md

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a152da33b17badcaa1aeba1742c24da3f7391475)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 1851b1e5fd..02bbcaf00d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_129_RTM/src/SHA256SUMS
-sha256  38baa3b0a18a3f674843473b549753c96419a0151abd1e7a9b214ce0493d0785  nss-3.129.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_131_RTM/src/SHA256SUMS
+sha256  ca0005bc77e9255d9942103e6f9756cfe311a3df72afa99860709e386eb3c167  nss-3.131.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 42021503f7..6b4e68a624 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.129
+LIBNSS_VERSION = 3.131
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============5781259294321343808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5781259294321343808==--
