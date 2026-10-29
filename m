Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1888B606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WalpTPj8
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5A1060B9C;
	Fri, 30 Oct 2026 14:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c8j_UjeEkCMr; Fri, 30 Oct 2026 14:08:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CECA160BB0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369287;
	b=pdfbhvyJgbD3sDoba1pVUV272uL6+SWOjVk/Aa6aLZTsgHymoYEvPSYsTLaq9qk3BTkB
	 9zVZ9HyU6+kUeHSlbU3DrxpeqLI6ZeLhQLTaIQDPA7B5q4junSG7Uyl+AfCiIeZ+6D7xd
	 AMFUXmYm1aA919adCk1QMRseuqch2L7UxGfDnDuXNhHtLQCR/LHD55/+nb3YDKKt3w1p0
	 aPWG+BiBbHF7ZlPBd2Y2QgqjEUFIBkYG9cEkxuWB5fCCmn3desdJr2jSyixPIfx6h7Jgn
	 kY1klfm+5/kHiAjyLpvzpL6TI+LaMwCElmVdpWVCT7WcP5dIqyp6HyH9IbnSeyrOLPw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369287;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=S5PcP1FDAar7NLfK9rrYtGV2jOsf1MIh5lU2aIwsPaE=;
	b=a5peQINEkvS6XlfXKuaZv+U1/a9Zk629z4Zg0Gieezd2JHnu6DabrD14s07uS4WIDAqW
	 6+u46a0UwlPqdvXzXWqpX8MBAt/mMCguqHIQ0s/KHwIgIgHa/cLhm30KT+XY68V2sQf0H
	 nF9yY7IvwwV+YOeYWkWWucLMc0ItkeMyOFrpucGR3ncyvXfqTPCpkNCMi7U2gk3BFhYxy
	 M8UMTxDdu/ZPF1Ld8AtX9+k93eIuWaxVp9s9Fs1GixKAJjga0mDrnTLOjAHtMsefF+rlw
	 O8pPd0OUnsCgIahg1oXoqAHKXFoBqH5FcnV49pWbNjM9ucyzZ83KpdcT8fPOnbgzBvA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369286;
	bh=S5PcP1FDAar7NLfK9rrYtGV2jOsf1MIh5lU2aIwsPaE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WalpTPj8iRWfg3wKzKN1kDSk3nBJGE4OXwS442KbXjwo/FHbm3VyKNPDeAicLXsKk
	 wUkBc9BvSp6Yb+qnj98fWKyTsRnamMkoObW0EXWnhjh621DNfHq9BEc2WZa9jOIyGs
	 faKkSpnhxoUAeqRuTc3MNhY/QNlFTz+rMlKJnRgdKVsWusuehGCKVtQHevYI692NGz
	 uC2VHv45HaOPnE/aCHffpJmyqraKG1Qt8cQpqACU/16ELUYLz1QVMW5+9w82UW8oZf
	 qCAVm4Zy4FW+T8pFEx8vXijuhbpmmR/kT5JQBxPf03dO7uOS7m/MYIuAVD7HnJ1lIv
	 BBPgYSt6d+gWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CECA160BB0;
	Fri, 30 Oct 2026 14:08:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E631D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BAEA40B36
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x822f4sOjkkg for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 947B440B1A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369167;
 b=KS+zJYrZrnH0LD8B4R9bhUIkWiUcTK0QKwJMycqsjos1NLK3nU03VxrKr8UW8ECdSSwY
 A2oNPJZCzQse+CeYTjALzqXeaLd6Tep3WjfOOkuhMi/PJdqucAmVUGYGWvBFqoWIAghNS
 GNeFJvpd0PFgmiIIdbYSqVrZYHBdMid/Plr7k9a2q12Sle4BvXIP8YZjtrKdR65JSHPE6
 T8NsYRnYANhq3l8EGbratcSTI8HV3bK/FHRDY5Bup+PDgNt0t3E6fZgFhukcgFQexxWbe
 8/kSUK5DUGsI0cTE96D0t2Se9PvcyPA/jyMjZ+sRUCUx3HDXLlInFjs0RASJexOfSfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369167;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RpU++yIOwEKiQRnc17GfygwPDvp75gGVikYwoSoKnVc=;
 b=bZrqX5EE3a+ClAtPV56XbdjM4Z/NH1qWr+BSmOC9ChQLTvHkgD1io5/hu1F4epQI4BLW
 xyCfLBsykFXzf7PDua8p4s8P9g3tup7zEfbKQwTdyptiHn1YAwq9LQfc6W9YVA+7VmSFN
 T1OSn7G88iwYVtcYwMq7C96Nza2nOD0VwBCXATL/ew09HkULkvGXv/HnoQhZl6T7mWpss
 qeoSEbFwDAm64JHKPGHoGXfA+pWSBnCDzNu6cP4qHrkvoY+BKmHNuW+ROyrJbU+JsDvl4
 LUVffVdw4U6j4tEC8st+0O19z9m09RJa4ruoWaoP9gfl+GSiHBALz6aj2/rCNLp8rYA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 947B440B1A
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B412E9D388; Fri, 30 Oct 2026 14:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:00 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7e8a291ec9c0fca3bdfee9e91875292c3ea310d7
X-Git-Newrev: 5e7ed9819755d07ea00989e8dbdcd23f96fe4cf8
X-Patchwork-Hint: ignore
Message-Id: <20261030140439.B412E9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-certifi:
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
Content-Type: multipart/mixed; boundary="===============8973084257940964557=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8973084257940964557==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5e7ed9819755d07ea00989e8dbdcd23f96fe4cf8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============8973084257940964557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8973084257940964557==--
