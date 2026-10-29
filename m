Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08AE606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AZHGiv2z
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B117340BDD;
	Fri, 30 Oct 2026 14:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xr4VAlFaDOGr; Fri, 30 Oct 2026 14:07:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B4BED40BCC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369244;
	b=VxroDSPVQ993bqtF7sv9TheTM0Wo897nUUNwcIo/B+4M80FRdHgST8NIsKXInfG3j1r1
	 VMkZFfbJEcrAo66rigExW1H0gnxNoIjFVCQOPVyM9z7aJGJXcRIASl3829efNPQG0ipvR
	 BSQicT5TjIE9N4dVvmj09ISW0z1aWd6uPSEnQjGVAsB65yxCHesE7RmJIJZhCJdtnrmXq
	 fesEotdzXky6WtS/OTnnUeWzU6QmMtoAtxF+UZcjokJZYuQLli3ab8Gv2nsvpFHghq33+
	 uYEVwfX4riifL2cgH+I6MjXWdsd2y9gzwjGzW8U7fuHmLSwCwVOEPfFcAB0LqVpLFCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369244;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=bu8E1ZDBfWOy/njMG2TrBGPvWVzA6LZNwbfBqV4Td0A=;
	b=lin0Q02idKXCFQHbf0jbz72dZKHEbUaWdKWdONAq2ahuBspKowfmZk/xQNu3+IMlMAgi
	 H5podYmcAO+lBNovFq139aqSMtMkcHbadj+D6TEoEO0iypJmuPpblOpEv4PVW15r6Ad4u
	 m9SdPTEi5LQgLhVFlaGduVcRRvNsDoTqbF/fTU2O5v7bVkAlTl0gU3yZFW371SJF2TFIm
	 OTk1XWn58T8kCv8qEhwSYJSg32KNg7hbWitVzhDPYjqq89l4GG3mn1PR4Pu8xmRfj+E3o
	 RECMAhkCVaXbYd+eloXqpbXOSghyvPwZyyNjI6rc+CNmAleTMovOTKtzTNjrADaXl5w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369244;
	bh=bu8E1ZDBfWOy/njMG2TrBGPvWVzA6LZNwbfBqV4Td0A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AZHGiv2zHji9R/dlGEWq6wRcPOsVg9jRpjzee3ibcPvTkkkN+fHkWx7RAGPnDYZYM
	 ecSM1tLjUcaiZb5eBJSz/+kpC9sbLSaejJPV5krGF9CE/DAd14vKOQ+8Yn+SSx0Q7l
	 Yp3F65wCAbOYaPp14uj7KznBuPvoXtKbRejfg2BV+aJa9oy4EQTrqe7wph1/1q1Iek
	 h5LQJsQ2+u6/VGz/ezTzcvdzDiNOYfGGdypL2Zcd0Y4PL0jdUkIBhLliPEoVzV8WUR
	 w3Rd2pbomtBCJkEhzvlhSa0jXFcn6sOGOgqDB/4zBxp5Q5I2dbwVJmDbw5Mzva6aLP
	 5aF+DJ+cn2Peg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4BED40BCC;
	Fri, 30 Oct 2026 14:07:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C241D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45661811A1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAn7JwOeM0pr for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DCBBB8118D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369165;
 b=Tspq/6AA6sI5wt7W4EHwacb8j5TUOcyE52TD5a/yJlHAMtHfGPeDEPBEyuexHIoxFYbs
 tEPQqMb/rgYZBlshH1MnLWlfmkls8bRzZXRheca6sJHUDg/fDYRHynSed6BW1NR55bJP5
 E9q7dPOA73jENoT5Yx8dHGGRkaL7McBhaLujL2VRXJqPfs4uELUo2MsOxtgrLAdE3jstg
 zs7KYATHRWQso9w00AezKorYuI9CqOL4WqKHPMeaq03u/wOADjep8rbBUq8b7GUKV2+QQ
 ulDzLisruV6xxxmlC1GyHA8GNZjxlvbCDv30kBP6mdLGWm+Zes6z5rAs94LDDTbiOsg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369165;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gRw3Kq+mFAIBou94DsGtFF68+acAW1RU8ar3pjxY/cQ=;
 b=deM1QWjeazXQEpwj3FrU2jDnqLjEwgPhU+9Lfvd7+btSggwYBdwsubB7VQK68Nukx/Wq
 CLrVeMcmDi1/fg8EPcBcuLtYGRNwpjp1LW6cYNUYpWXnMeMIwddvKdR0UMP+r7INfauhn
 S909JEPd4At/KML8kG5bCnnByWBcJ28vsGbAEKpClRqhscMUuf138qsPSAySVCjp9gO+c
 73eWnzSaawbWlFUkPVTTLPI79JMQ6OGzsZiMaHU7tB+AhXojAAdhA2x9o4rsA10roTtAg
 VGliY3/q4owkZkuRLRYm+SmNwh/NiNwQ+3GaZ2dojLJ8yJPhWKgvysF3zhGlV7qvS6Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCBBB8118D
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 076C39C668; Fri, 30 Oct 2026 14:04:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6020814a14ec69d65941b768b52cf100dbe35c94
X-Git-Newrev: 1bcc4b447741571317b8f88d3174f59ce7768443
X-Patchwork-Hint: ignore
Message-Id: <20261030140438.076C39C668@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.113.1
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
Content-Type: multipart/mixed; boundary="===============8712122987500589547=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8712122987500589547==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1bcc4b447741571317b8f88d3174f59ce7768443
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_113_1_RTM/doc/rst/releases/nss_3_113_1.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d4cbf1403f191f40b82dd969d9066cefe3e1c395)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 7fcb75e6ba..e0bbc82413 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_113_RTM/src/SHA256SUMS
-sha256  acef06b512d3bd81c87a63b3c8653d258bb689d2191fc0e64decf5a1efa01c0f  nss-3.113.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_113_1_RTM/src/SHA256SUMS
+sha256  b8c586cc0ac60b76477f62483f664f119c26000a8189dd9ef417df7dbd33a2cc  nss-3.113.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 312b361cde..a5ed34e95f 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.113
+LIBNSS_VERSION = 3.113.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============8712122987500589547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8712122987500589547==--
