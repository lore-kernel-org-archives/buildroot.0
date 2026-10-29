Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743B6606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IzBrHTo/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 556E1812FA;
	Fri, 30 Oct 2026 14:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXeZTmFCnguU; Fri, 30 Oct 2026 14:07:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7FAE8811E9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369271;
	b=W9QSTmwFvDUIRZvEirzxsoEO5hhdJU7upY2oN6xsXoErjGFEUonSNTFb/3s9tc1Tj8yL
	 NK4Kxcj0vUSOJIk8OdZFRHRQyYmlDgMw7jvwQVJA77FB7BC1G+KlukG6PzKPtfFnBsShJ
	 sHNfz7BdVS1YUxlzl6IPCW5fufVAwwQLn1K+dST/8g6dbdD1OwBPSwi2mCxpF2ZofHk28
	 c4MOiA6jICjsoMxkKSVeFcJNl49oG+FjCUUnqoqaMfXCgvbVQsoOkRi+7R/gb12sGaHO6
	 sNQK0aEPAOOLMjpP8roMVBT3b3vI0mZ/GHRh5WgAjTnr8T/QqLj7noHvnsIFL6zbIdw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369271;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=6dVa3SMrxONuT/gkPQy/HTEVjcMvwbHXrK3BAwSoJR0=;
	b=VQRLkibjGArEf7DpuU3XQLcr9QY03YXU59wpCKJSQrl7fQNb/7H6nkSMCf4PHW2BD1ai
	 cWZPO7ro36robjmtu6crv8hPsMlV+VJcyDDgqDDYcmuACQw1ULSbSdJkGvH72qRc1bWpt
	 I/oUooR9PsQNVE11gmJxIoH6fCJB1ydqYq1uSiFN1/9iWSAMmiPjrO4+TLMEGqpCkiCDw
	 P4mv5o/hso6HH8Uu3VlS1V2+m/th9DCiAzWMd626mumRpdlvhQBOwhX8WJ0qWXawr7oKx
	 kNAqOVGceeEvnb+ALlvpZBJwKEZl5MKYK0YJyQgAC4HJ9nxzgIy7AFSxPdLXec7inHQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369271;
	bh=6dVa3SMrxONuT/gkPQy/HTEVjcMvwbHXrK3BAwSoJR0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IzBrHTo/gOiU0yEPRwzk0i616QbGW/ApGieIIE5fE1ftRu3RG9F5c4Hsh7wEA18zK
	 GMJ4JFclvQNtV3vVT7puuGo5LWAD4wKRqDVnwuOVOmKiniwOmgY4PEvKQJEFi5QpZs
	 cOBjmcffhsjpNcziUuO1/SyLd1fTh6bOcUpSrfr8pWftld5RxZ01DSTW5BTnnaz0oI
	 SHmTRm1Db2wr8Xjw3c1Fdb0+4W49Fgk1JW9sLGtvflqJbT7ebe5mX6BUlSbWgbx/lH
	 g1gOBKcGCywdT/iFSq18iNqANBAmR0jW8kX3qhwGVye9sXGtbnzsrhLXhfcg1A5L7J
	 EilgJlG8LApOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FAE8811E9;
	Fri, 30 Oct 2026 14:07:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0B6CD43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B20FA40B31
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUJASBoFJJio for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F31A640B32
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369167;
 b=hXeQXQx+K+eofvxJTvsAKKJB1ADlDaprjRtII/0DTFlDZWWnlun3WibBo7d28QWT6Ztb
 yydasVysK8b8HELs4ceDCYsIBzu99zVLubSEOH+UJ+ZRSUOGnLe5EbtRHgyLG34S1ryXO
 ZTDIWxPrNE7kpZCW125SATTc6/fS9YE53XixGhg3FVW5NQySMerVG48Ie3F/zbVEF1j/D
 X2r9kqiLaXwupc5llJKSNVVXBwPQAkU8dyo6CqjkG78ipxWzMAokJQf1uWs/QzKqfyouK
 rziwv3jgh+u1src4OqScg83gUS12rl77HNu/n/2gKJMNilsURn35MGWLNQnJ2GI9GpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369167;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LQ/Cv3kpt9inV+sozZ48SKoqnOHAFAmn/SPj23PzBoo=;
 b=fYWbvJJOB+3KnJupzV2iLwVltvyB+k9Z0H16nd1/D3iHMfbFxLycqBSRRI7F60JEBa29
 nNkS1WrFbNq9S7nT3BFKqofHj7VIwFIwrDh9mk6ny7IOFkxK7TgxYESpEmEjevtgZwyzB
 yX8RG+/j2H0dzAQX4wD9O0J/ATXetztBOQaGwEUfKX6Ykted5GMBUb9fYzMGeO5KLLjZ3
 3IRrymHopjhxXSece5NYWfRHepUzp1qC1V66kQNDzp0Z4g7vtVtqLr8adjhSSLwNAWwvx
 nXYuSgDCTxsX15FMIORe1af3LD4FwjpGr8TYHlSd5EhOwTOIs3uklw93hbTHskM4r2w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F31A640B32
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EC4A9D388; Fri, 30 Oct 2026 14:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2b27a0c217aa15a112ddccd2c9329ee8550fd199
X-Git-Newrev: deeeccd806be1d51c91577586a7f5d9ee3fdf4da
X-Patchwork-Hint: ignore
Message-Id: <20261030140439.1EC4A9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.124
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
Content-Type: multipart/mixed; boundary="===============7304537197011040085=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7304537197011040085==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/deeeccd806be1d51c91577586a7f5d9ee3fdf4da
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/4b5e60e1b567c823a2a9c3a218d7122868d3c4fb/doc/rst/releases/nss_3_124.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 87b2b49d0016815d825115b12a9bac70e77dcd8a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 0f5ec9c8ee..4d08187fcb 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_123_1_RTM/src/SHA256SUMS
-sha256  42065a3ff780a9710a3dddcd1cee9b9be2aa40628883cea851d562eb58b178b0  nss-3.123.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_124_RTM/src/SHA256SUMS
+sha256  80da9f1cbcb267293b2248818d288bc02f874d6a34f1989a2828401d74a0bc9b  nss-3.124.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 3426995368..86d2fcd41c 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.123.1
+LIBNSS_VERSION = 3.124
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============7304537197011040085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7304537197011040085==--
