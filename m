Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8C1606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Q1X14MPV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D844040C01;
	Fri, 30 Oct 2026 14:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8PRpGFA40MK; Fri, 30 Oct 2026 14:07:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0ACCC40BE6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369270;
	b=Z9ZklSVyXl3+2x7btnsVubCy6FFPcXvcxBMdsR3Mo0FLtAXPiXKJKloEtsEC3A6s4vXe
	 TRI8zra+bx9J/o7uuBZcvB6H4o5TaaVUKnNX6OVvkOjPZ1AZp7Oe6cModWDiCNtqCp5tj
	 pnH+SiDTjE9D5H5v3wmQrBmA9KerCRmiiz0nvMAVJDzm0/jIVifJzJ1hsI4S1ZFaEihtg
	 6euU0M+/zr/k0c3lQjZA2zdiVF0wP3MoquAu6sow15mZzX53+15yzjO/3PJGrhMC1vx0e
	 39OUdSSR49QvOCBP5GtKFdmMHVNSHnqoh/cAs7ZXiJf9n0WeEKaTw/xaBRnv91/kO1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369270;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Qqza5hxQeGPulQPypqt4aIE/KP5XgPkADAlkzMAVhsU=;
	b=aRhn+znAukV0+hlERDbUvgJVcHDiDfhG3OHMztodKZ3djvKMP5Lq/QvYnYpbvugdk+bE
	 R5VhWEJB7YZp47v/kA2ctBAHz+wpx+vv2YNHkGYmLfD4WWtjkRRo+11yqzywiu1hkTsvA
	 6MIzo+iy5F681VSds0jRGyxIPQphLvPrmnMldSbX5O6qLw4rMnCPAq3QfbayTLmKPXAxI
	 rguZ2R+5I4x4oJVlwPQKqfL+Sj2X54UN5ccSgGHPZPGyt6hpMAizdkxHlbY6AGW0miHf5
	 GBKcMQwy4sFpfpH8ch8PA7EF9cXkqUiP4A/2jAf+bReT8tG/ueZpAx+wd2S3+odsWIg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369270;
	bh=Qqza5hxQeGPulQPypqt4aIE/KP5XgPkADAlkzMAVhsU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q1X14MPVEuS4YN5EBq3FbCD8i4NyjrZvZ6cH9ZuAgulp77xy6MOkbVBisH6o30yV1
	 1cFoAIWzy8EOgghIzqTQ8My205vJNrvJOvHXutAe3atMuiWF+YnrsKlmpJQ7VMQave
	 ns8jWtSr4c/h1Ec6g+jbrArQMrd9GyMWgkDANs9jscIRBGzv55mL+ACx7Qq8jvcbxv
	 4OPKKZ7MOM2lhWKrXPpAvQYXyXm7k6itaQljXOAyjLmisfE0Ssp9rFg6a0VX+OONdY
	 mqvYv6DLh+5SyiHmfcGfXYA6s9GlIlDANjFaGyQxbcRr2LA24yQFrVWj7G+jif/buM
	 Mf0OizNRRtY4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ACCC40BE6;
	Fri, 30 Oct 2026 14:07:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE74CD4A
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86B8581195
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGfaldPjkjkf for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A6FF381172
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369166;
 b=qg43VEI4X4LSKxH/pAD8YTncxkYkamyKkvZgkeiVdR4ydIJpxCtVZfWTauJVq5gnpw64
 za5WL46rfn9hnkQMXJ41/7mCPTgcMBOsegrx3MuXq8tpQTpOgr0n52SvUEcjRqxOe9IWx
 EN+Y++M/oIwtakCNYr9ZZGUNzZe1fDmdX6C+BXqDpM8wBmGEqzUbdphmN4Dmydi42RcuR
 /N+T0wNL3foEp5KSKeMeU4YbZTJQ8BDmRvdD2F2E2LPafjzGoPHcYNbj+SOOjpCvmZkjS
 2roM/Ve/t+Dff6X3AuY+DqhvLc5dn1+l48E9gkRkZ8OPMcBFJ30/A+FTAihMhfkxtpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369166;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gLkhg8DHIUEOt4A5H9JQ+GDUsTX10yrCe8lQVbJ9VJI=;
 b=JjgpiE5M+pV02+9ObkqsmWEomjO2a0nPY5gZ346b7hIyoMNZpLjHS0FTolapYATEZROF
 DgOB6JEBWl5FQ/y1M/ZSi5IbFETgrIE3B7pQiuzxZB64dTG844hTTKM7oNc6LAGZ3zcos
 Wxjm6mZtrNwsL0EcS5kDwXRlg0K1TNPeJx//vunHPEjay9CNtRD5zc3PZRN4YKbNT8Ckg
 ExREcOAuHFz2WxeUYSgARku5B1+Oz58s32Zolwb8IGfW5Ij7nFVz4tkTnp3EdnVrGV2Eh
 +hKpPc8zYm1IXCaUWtlEDSdDW4xjMyEbIg4pkQUQTCfoZWHG9TtXjmeeMHaUycbnjtA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6FF381172
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C682C9D389; Fri, 30 Oct 2026 14:04:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4ca04e1d3456cc392e9fbb0750b68cfa3c130f2a
X-Git-Newrev: 383c321f1619b1522985f61e7e039e4715ba175b
X-Patchwork-Hint: ignore
Message-Id: <20261030140438.C682C9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.122
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
Content-Type: multipart/mixed; boundary="===============2730475969522590798=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2730475969522590798==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/383c321f1619b1522985f61e7e039e4715ba175b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_122.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 35e86cef162ff842acf060b9451929b7bf1343c7)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 1a15325f1d..d2e85cb32d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_121_RTM/src/SHA256SUMS
-sha256  cb3a8f8781bea78b7b8edd3afb7a2cb58e4881bb0160d189a39b98216ba7632e  nss-3.121.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_122_RTM/src/SHA256SUMS
+sha256  2699478b843b9f09c61f85341578df514463a0069447c816bef0d59bd800d777  nss-3.122.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index dfded6999e..bf59827bdc 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.121
+LIBNSS_VERSION = 3.122
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============2730475969522590798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2730475969522590798==--
