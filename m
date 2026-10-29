Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF25606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P3aaz8WD
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF7BB81636;
	Fri, 30 Oct 2026 14:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsPER3yB8t8p; Fri, 30 Oct 2026 14:19:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ED4B7815E7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369962;
	b=I1ek/BBFLNMVzgwQuKCVXkA4FwPJRXfhLkWm3uUi4Rwe3N0zQjFcwHm3FVIwWs9Qvvnh
	 VFVvOkzqJVKT4hYfYCB0DAZdzOf7Jhn9nH0hYS8jvKZhzW/87JQdhI1uruCcn6n/ai17d
	 biz2fBf86eR1Q2Zn5ZlSjBaE/DPyg0PJgw0+nzwYgQqQB3gEjCO1FpTIKRS4kYJ0tp/bC
	 IPifUU9N/qhZ8FvzVzoAtsBHO13bwZSqm6TH+bQOkOKb0OtFzJVZxVgO3cPjxUPr3mCsE
	 GJR+YytaRNez73zPkJsScLX+SbjnBifOOYzNBI64tw+4MePFMO0uvqHfmPqiOujVwzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369962;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=jUVOD6eqBk+2b/D8qVL2dGQBM88oirXxSabD4ImuDRE=;
	b=cPWuKQYz/OKCx9rNxVTX2htNUiTJFjhXvXgcu42QiaDPpp1Ty8xPauMXavmCJa7D7aPh
	 Exc1AaACjGfWycyb4bzeisrbXPcDVS0+i7sxJ9nbshyP2PfiWHwivp1EhP1/cGyB7lYcG
	 00CsW2KfJT3oi+GxGBatAK37Bwi5POMocp2MGXU9br4xhg+q/SShIL4r6zVmZzSnKqf5h
	 lK5hPjeNpI7djlKFHv/pcB5gHIMBsKg0fad8eqGMhv9oojvhLcPJAQbHLwIcRTylEr+kt
	 9f+AzI7nZkce5r0UM4OBP2Tp6qNSuBLu2fTAf+ALaizMxWYZR/qz1K1FcTbOoD8KKJw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369962;
	bh=jUVOD6eqBk+2b/D8qVL2dGQBM88oirXxSabD4ImuDRE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P3aaz8WDaH5iKtkX3XgZx7T6Xl4clfGJUsV6BzuaezvaqPWteYsO88yughzfpugEU
	 B5D/hgXKrskBrsRY64Bj0Na/HrPFuv5YNUVJRRcKXF264gd2uX0KOzBUNXJswPCTzN
	 MePl0yQGwARjnJPg6igxmi1Xfl3mDp/YdiNDacwFIF9Zda8+y2qMJCmgJ33tR5vB1e
	 WoY34BeFErEnLoc4pq5rxhjg2LRE4iDRNRRzbM/idl28B8RQ+TEo9LO9Wt2QU9qRkW
	 B4lUgOGvoERk1xC5aUyVCsR9Zop7gyO9suOFXySBDAYvjMVyUkVQuGfnBcy5PjQGef
	 PMEb6ize2vaOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED4B7815E7;
	Fri, 30 Oct 2026 14:19:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D062F712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAD70812E1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_jLePuNMWFa for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 011A5812D4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369891;
 b=lJUTvm1lLK5WdNsCN8WRd/4x1WihJE3n+/QTB8SoV3NPXbIJt2HVYfx8GrZDUd8kPMmL
 cY0bypIENSygvl8J9p6mCDzo4j+VshdATOS/A2vJt2TmYkKjQw2zTScteXhlEaBOI4bLn
 VmZXrmVB5VwJ9MuoW9jBTK3/durzHo4t1yUZy7H0qHjDLtvNQU8x3HkbbBlNsGGSOC+Jz
 M8/l9FwYKDYbvyTSi/nullnaXY+Ud3AbE4KnWCVNxKhciH7JcUDMptmoFlVX7uqghVsGL
 idBEDwgGlnDAEnL+d8kBZ8wP81Am09LwqLZ30H+omvZS8fzs1dXExFG9DWF22MnVj8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369891;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=L/1lGDLN/ZikpvQHIIFxzOswFxtGs46dHFibcHK2d9c=;
 b=tBepyA8eGKy9iFBcXe5psJZQyRsCd5aaOYTwiD1xEi00RuFPUdTIHe/2YcH0msrEqnPh
 s0+b5Li2WRkWDtUJJC7OrN2vTIGAx4IiG3BfWfZDugtQgD3JXf1T5QC8R18hqSNnzGlVY
 baXhdk65vJOVPke1AAX3ouaAC6QEN9WOqPq+juTQhQsbI/tNKtOWk2dV64jzrbPvpZYOL
 NI3E8ou7b3ySattMsi8OmmnooDmTsSu7izS+Spjc7Qvyibc42bzYQLWvk4SjVldiiRA/I
 DeKkvrZu/0k9htRWeZaRURdsqdSi10Ud8tpiSHr+I5/UaTAfVXYSIeUyM6rD0fOYasQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 011A5812D4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FFB69D388; Fri, 30 Oct 2026 14:16:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:07 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: a26c883b7cc05f23b8f35117d5e9c1d4d80d2f97
X-Git-Newrev: 2dfc5ab88d214a7922bd85147fb4e1528f90d747
X-Patchwork-Hint: ignore
Message-Id: <20261030141643.1FFB69D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python-certifi:
 bump version to 2026.10.19
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
Content-Type: multipart/mixed; boundary="===============7066282709840110237=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE,TVD_SPACE_RATIO autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7066282709840110237==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2dfc5ab88d214a7922bd85147fb4e1528f90d747
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/certifi/python-certifi/compare/2026.10.18...2026.10.19

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5676346fd77e3ce5e672e94732b2d098dda2da55)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index c6e0206ea8..a583c17bae 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  915d53b5fceb004991800f62b552e0c0  certifi-2026.10.18.tar.gz
-sha256  b9995d97b64d0431a5af837d8ca8cd6238104d1f319f04bd93ea43124d6c861e  certifi-2026.10.18.tar.gz
+md5  f64fcaadfe9a0ced492ccbfe88bc4a27  certifi-2026.10.19.tar.gz
+sha256  035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae  certifi-2026.10.19.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 5430596350..bdfb8ed12a 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2026.10.18
+PYTHON_CERTIFI_VERSION = 2026.10.19
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/7e/eb/a2aa1ac3ea30dd3f30ca57f40232138b6b0040719316ecb85daf61167771
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a6/bd/1436c50cc46699de0230fbaacc1d1de7bfec413176099949e9d5112e88f2
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE

--===============7066282709840110237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7066282709840110237==--
