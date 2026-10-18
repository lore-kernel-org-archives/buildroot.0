Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FB3CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 12:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 828526061A;
	Sun, 18 Oct 2026 12:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hulsH1JoXWvA; Sun, 18 Oct 2026 12:10:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8DB9860687
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792325408;
	b=Q25ewcOvTgEHfCzlsZ2QA4lI2++e+bFhUMVcG6unhtj/qg4mA3uqkH5zceiPXPr/oats
	 njmVf/vT9ZPPCyH4YtYZtu2GtT8nWYzhNEj1Zo2KxaoyBmCrvUSgyu5Rl4a4Hp5mQ4I7X
	 IO330+HaHsYG1+gggrcFy49MbwUkl9Nocm/1zUGeWNo4bYbZBx2mMn4lj+XrVNfkZHlUJ
	 Zlnu7Uikt0RcG9TApVApCSluipGx9nJ9AeDWS8vKbA/DDwF/qcC4Fa90lOVGyykXWrYVa
	 I9/rg6OQFuDiZMg3Q3Uxq8si9rhDVHjD09u2DDDUdHWomYIMt/uDZKGHQ8zPMVAddgg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792325408;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JWZnxa1FNInqQg5ljKYnObb5SHY9VmUJckwoAOlUC/M=;
	b=mEC8j1qvtceBJybKpVQLhDfqVxzseYQ4Lxu97m8X7LRyP1R4QeJ4VGhvgN0KkWCZgOJ0
	 LkkCEt7yU7kHP+o350mxtKhhxAIwxFqWfqAGxKa0wAoMrdQcU8jmhkZ4s/1y+yApvYCM5
	 MTny/exIrQ7Jo7H/j5xR7VB+vGCOkradCVhBTcS3wPCA6lurG2JQhLufhEoL0YB2GeTXo
	 5TE+pySuRWC/phHMzSjDJYTPkAVRTs/1XIZTgjifIitszITO5na3s+MJAkBeKTeCOrgo1
	 r9WyLB0yxxWKSxTtq4C+Elv4EjK8QVlEQsiDE6uUUh3tEUMxSoSeJk84JVGAzWZviLw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792325408;
	bh=JWZnxa1FNInqQg5ljKYnObb5SHY9VmUJckwoAOlUC/M=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=WMUJJg6VRNTh1bB/gk6sP9GH3OwoND/Z6uTOuSvUwv8YsGLQsPAXrD/kmIn7b4WMJ
	 dacA65LJd2Wu0gRFvfPKUsZtybdYtLwE/yImuW6+njedGssDAZ3Q7LixuH1aya7mhf
	 N3T9r8fpc/q/Em09Tc3wva/2b6oTVa8OGBYMmUVL5rEvo+3NrBpR7p8uMJ69Ml/Tcu
	 W0b7yzHil5ylXU7zE7p+23A/jPeGq4uRjCOaUd01zf1s2wB3uiBiCXW7pMm6gy781A
	 TZT01QxdkWt1W83H5ZrE3reQRTB3NSY6MuQjr0cbM/ATkpqqaXjF8oukpdZw4ZlCrs
	 glszZEHtbtuvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DB9860687;
	Sun, 18 Oct 2026 12:10:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80DA81E9
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 12:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67138811E7
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 12:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ib86kDMj3NMb for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 12:10:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2467780E86
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792325406;
 b=ELEOpgjCl0/Ioam69iPV/lDUkAgDb9zWItxPP3rYL2Dc7jHQ8f+6hBoEMUEIy8Vp+QEK
 5e4SOE+bGeLWIr0OKbeV9WIJNL8DieFV6uvJfytFlTirNrn0AgAdRtFMPpTUJTEIQWrfv
 pcIGFo/Z6bQz3NAWg2aqfpDZqoIVGL9dsK2NUXgkGGMYSPSdXvlrzkBRpqywUeKXt8gne
 SVgQQEfMiBnX7vtDoQ3H0K8YckLkoNvWaTUIHUFkkoKyQUEGFu4h5Kzdm7AkrzCrY7bhk
 1yVPi7V8Awdi6VNEmGLTNg5I/gdvsNTavza8iLbRhpFyidX6Uj3l2PI/8nIApz/bn2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792325406;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=YBFiHfCkFPq1DLTxT1+/1ecdtvRHIPWSAJZRLuxHAi0=;
 b=jCebonrhNq1QvlYR5hXkRh2Hi+mhCAiQbQ89D1+hKrfE0ojakLneW7TiSito1HwalKwP
 tlUDpLcbI/zVO1R8fLAWDHGaFQOWWlmZTfDBC7Ka+9nvJ9+J/RmMfGavEDoIOpOxwQI5Q
 MexxdrRmaqEmT1HbWsqQOwmDncqC5A1H7pqBL96fOEcXrYWY46/v1KQKWBim9MOFlhV9S
 e3GDDyVc7rEt9uS3RxixTXUdsUgKe2/0s5jSGj/oQJSYUc1xp+V4pBCnrVZwJsvgqpq3j
 lWDYV9OczWX/o3SdlIPahDw/acqeXAt+cH+4qT8da4VTgfiwkBQicYqQoZCtUNtv9xQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=lq40r8BK; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2467780E86
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 12:10:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhU5R-1wfU3V33VT-00oTrj; Sun, 18
 Oct 2026 14:10:02 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 18 Oct 2026 14:09:40 +0200
Message-ID: <20261018120941.1476904-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:v8Z+s4qIoL8mLKeSO3/Q70kHVlmTPotS3jE049UV5NEXK+Oqk+n
 aqLvXAqDA5ya7IF7MJrfgsFsWqqcOjNuUKCft6noumQbSNOQTqQImpCTrL5mgrAnGtGUkWo
 /FE0nK2eKbbcP/g9MUsx9fvEomWhK50myhfAqCEru+558tC3VfvSeFwYxgt/KiEmE5aj9zs
 Tvh2w+HkVpGAWDkT3VZ9g==
UI-OutboundReport: notjunk:1;M01:P0:Qr3M/WtFZhs=;a/XkyuHky3cRwankgllv4cWhsGt
 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
Subject: [Buildroot] [PATCH 1/1] support/download: enforce
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y for missing hash files
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_DOWNLOAD_FORCE_CHECK_HASHES=y is supposed to make the build fail
if any download cannot be successfully verified against a known
hash. However, support/download/check-hash would only warn if there
was no hash file at all for the package in question, and allow the
build to continue.

This is a security fix and should be backported to all stable
branches.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/pkg-download.mk     | 1 +
 support/download/check-hash | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index b38f0c7053..896fb59def 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -116,6 +116,7 @@ define DOWNLOAD
 	SFTP="$(call qstrip,$(BR2_SFTP))" \
 	SVN="$(call qstrip,$(BR2_SVN))" \
 	WGET="$(call qstrip,$(BR2_WGET))" \
+	BR2_DOWNLOAD_FORCE_CHECK_HASHES="$(BR2_DOWNLOAD_FORCE_CHECK_HASHES)" \
 	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
 		flock $($(PKG)_DL_DIR)/.lock $(DL_WRAPPER) \
 		-c '$($(PKG)_DL_VERSION)' \
diff --git a/support/download/check-hash b/support/download/check-hash
index d18ec8b134..669c3a0d78 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -98,7 +98,7 @@ for h_file in "${h_files[@]}"; do
 done
 
 # shellcheck disable=SC2086  # nb_h_files is a non-empty int
-if [ ${nb_h_files} -eq 0 ]; then
+if [ ${nb_h_files} -eq 0 ] && [ "$BR2_DOWNLOAD_FORCE_CHECK_HASHES" != y ]; then
     printf "WARNING: no hash file for %s\n" "${base}" >&2
     exit 0
 fi
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
