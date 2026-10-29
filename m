Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAA0606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Z0dtllHZ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3040C40DA9;
	Fri, 30 Oct 2026 14:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfuPtVP876NB; Fri, 30 Oct 2026 14:20:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4595940DAF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370003;
	b=RpZd9XiIG24gaTQK9dTxW1p0oGyJ75DXQbntjLOwrUWIr+RXMUotIEXA+cqbUf/P75Fz
	 pJ2Q7+pZ/2EyxPqAm1e7rqfXczy2UbkZJcu/GUYgtXTE5CWHjohuMzt1hesNT+VS/93GU
	 mpa3q5ksNJ7v7ZGbyTz7O+ruBWzF4FqdyELgZfJ8Vs40sd00jnHymbxjB0uS8gW4FETTm
	 FZ2pW144LGvPcUhYp3IbDHssGA1DwxtV5yH7JR+h90I7HhT1pWgObmwjMuNrDC38x0fr4
	 xyG3lnjBA3ykR93YfHBMdtrEmazdmEjne4TMPgNpi+KbqLFKJcyJDo11jfL1SctynTg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370003;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=WfNU+Tvj4dNp2bCZTCCHnrg5G93iugbZQ3Nk06/JExs=;
	b=Y5HqL5JIGWm7v8S9/AKF4Nfp0NPqQKSzdtHkV3GW9c3ea1zzlPlHrLf5uDhyyBVwa/9c
	 rG/Ch5ZHL5Bz1/Ln3YLIzpFX27MgrfSZFhLUtLIN99w59IxP1nuBV+r5rNZs+6ixeVF2q
	 V7Y9E1a1MVtdVjkOmgRKr3UTUSB6GeG7AfwGeAeQko/FN2wsYQIn9dcGlqc0ip4jcPkcn
	 VX9MbbhTYywYN2xUdnhU2YY/aehIdkvybXwUksBOy8mnohVHRga8BObA0lseGLftfgFOw
	 5lLgcy6LTeoZoK07IVljVgPtOYxa01NU5VM+wQi2ZZDT8+XQ9iCf6iPqheRj3w19h9Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370003;
	bh=WfNU+Tvj4dNp2bCZTCCHnrg5G93iugbZQ3Nk06/JExs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z0dtllHZx6qZQL0XT8H0WT1wk1JharG4FlDOarsYSMl1efnhFdVFX7MADtHVAxPe5
	 6lZNqnxeAhRvStQn9qsAr3H1p6WuvTm3kInEEbm2cT1fiqplKX9LV46hA4N0hYl3Th
	 TGc4Yt+QGw2CdHYciDIilWfkjeyo07P7IxO7FFvKdRgqpYsU1G2G/WIIjfUSW3hl8I
	 4q0v580SbI/COrBiMpK8BIymFX3sSZ5S2dd+ljf8OfPSVdrAO0weAoqVGSt+9eJUIc
	 sjnHjMUjd5YxAMCChS8FNeULd906fmWriKUEI/E+KyjQ/EaNWAw720wCh4d5KhfC6d
	 VYY7YIIAYuPCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4595940DAF;
	Fri, 30 Oct 2026 14:20:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 95452D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8756960AEC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gFIb2saDcQf for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A7D0560AFF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369894;
 b=Z1hlvcfUG8s6O+pme2Npsocu9RwihUXYbwxpQXqXNla+w0uifEnmALgPl1+PLp4RuqG3
 O6vXPvLayLbwdnCM8u18lpNq9t+xY7mq4+JAFTzDSwMa1jv0nEeJISjuYtw8gy+W3nQjY
 UCPCxnmJT3L8Wop/rsBUgxhh/Ah8osno0bEM9vNx6nNfiRQw/ttdq1SOQKCDoEqoFMXH0
 2ubDuaHqTmel/lVsolqyIaEq1hy6WoqG8hlNmEcj8OtqifKgHGp2LYT/Ld+fprkn0LfZh
 YmIYiQUPOgfcZl6JoOCz7w926g1r6zH6WNBTwgKxV81+10c9zvcbFN+VFRiz6Y17Q5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369894;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wbza1T1bGQvaZNDVS9Obz1zGoEAn968Lt1vsNmds6K4=;
 b=NlMQJXFCWuYEZpvGQPmx3vX2V1mSmbhdD0u48hzxLmddH09+Ok/r4YXNULl0mOn8Xomu
 nNUvwOQfovEOWbMh/W7Bp9px3INXVr8W2Xd6KFP3e3rPN6LljkMZaVMG24FO3h4/d+wY+
 Yja2JeQuEbuN60re2caYX3IqdMK2rSeJPjUl13jM4T18zjnhqzU7rY5U+Jtg+vbCKYsqY
 g/eSiujSnw1z+dr5ZXyGxlX0UqNTNJYojt8LrbN/qPb8SqmBIyvu5r4AEqq13BZDaEC+h
 5V50WbZFNbFRLW4lpfuwoQ2xStQIHqVSDM8M8OC9Ep9PCHEEHRojUaZw0vEMHotoasA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7D0560AFF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4EB19D38A; Fri, 30 Oct 2026 14:16:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:10 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b21dd5c5eda4574b6219174c937da941a2ade12f
X-Git-Newrev: 88ecd46083048dc0473238371044f7cf073bc202
X-Patchwork-Hint: ignore
Message-Id: <20261030141646.C4EB19D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python-certifi:
 security bump to version 2026.10.23
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
Content-Type: multipart/mixed; boundary="===============8505831168029649368=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8505831168029649368==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/88ecd46083048dc0473238371044f7cf073bc202
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

This version removes two more eMudhra CAs relative to version
2026.10.19, "emSign Root CA - C1" and "emSign ECC Root CA - C3". Both
had been removed before in 2026.10.18 [1], and then restored in
2026.10.19 as "unaffected" [2]. Version 2026.10.23 is in line with NSS
1.131.1 [3] in this regard.

[1] https://github.com/certifi/python-certifi/commit/5cb238caeeb6c30ec1a7309ad3e16a5aa7b10ce8
[2] https://github.com/certifi/python-certifi/commit/662df63d7906df66f1f07c0751a3dfe9da14d914
[3] https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_131_1.html

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Fiona: rewrite commit message to describe security context & release history]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit cb7884163e44a33a049acf2129f9b0b34aa04e81)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index a583c17bae..96b977a4e4 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  f64fcaadfe9a0ced492ccbfe88bc4a27  certifi-2026.10.19.tar.gz
-sha256  035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae  certifi-2026.10.19.tar.gz
+md5  9380cf82be7f2a74885ca68665b4b12b  certifi-2026.10.23.tar.gz
+sha256  a9895e6e2758b371e0545e321a3a8fd1fcfd9829ada8824a936dfb16aaaf36cd  certifi-2026.10.23.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index bdfb8ed12a..38fa5c8f22 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2026.10.19
+PYTHON_CERTIFI_VERSION = 2026.10.23
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a6/bd/1436c50cc46699de0230fbaacc1d1de7bfec413176099949e9d5112e88f2
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/fd/11/b524cbd9bbdaca58608e4cf4053fd463417549e1959fa8d3aa18319f9555
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE

--===============8505831168029649368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8505831168029649368==--
