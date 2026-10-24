Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFD9606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qEKAvM06
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C62B8156A;
	Sat, 24 Oct 2026 13:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdCXnjnGHOKp; Sat, 24 Oct 2026 13:21:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5DA7B81754
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792848107;
	b=YLjn+hP+Ygrz0VpbUz1jtb16nWC6R2hJ2O+Jv8e5UrNHdWbERU83MQOVvKrHZqK7x1e/
	 tWtusUtEWl8oESTCpLJC6mtR4VY/rY+yXCIBiTqzCEPE9lb7rqt8FTmuOWZ7LfsBrMAEx
	 T2t0XSGKadgY3g/zuho/gMGfiIJOQhOaK9n0B1de9a8r7IOGYhOUqLKf2Bvb/6qM4C6wb
	 5iQkDrOWQpO5Dp6PV3pInGiGsbnfdFMGjBnIeVg7iMPrLMx62ssYcKL5h7aepSks+Ncrd
	 hDGbAm1SiFlrqu+Wq7lfKhw7yeG72NQ+ZgY6Zw9UVu1hAcPMxevIyKEhaRUoOkYCCTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792848107;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=c/PcwqEDXN3gHd/uJHLZR3oP9sUDjHtSUCJaSf7AUmo=;
	b=SAlgcZuwYvPbl4LhPzg1/1w1h/0WSOCvaqqfip/1mW1bk1yasd1szQ9sZ9Wgf55vWoBi
	 yV8oMj/wLmPELhhXL6LnHo1Wqy1nBQbOdDifJQSE4W1BXJFxpEh+zo14bnj+2/qWaVFOg
	 uRCWwhKxeiZd3qVGCLngao7GHUwWZSDZ7KjcaZiDtlJ6/5BgUFq4FnwzFlHdsUjCDwImL
	 UeezfpQZXsGCQYrmga+xNpJKjAoeSMzJKvIL70kDk6S8vd5UZq1WN406SoWZnpSUgh4ws
	 jU3p39lLtn55UDEcwUDNQlYa2oL73Ck0euqH764eWvZAhqRAEgXaCWfikBAlDXXIc7A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792848107;
	bh=c/PcwqEDXN3gHd/uJHLZR3oP9sUDjHtSUCJaSf7AUmo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qEKAvM06/WxrYwNwXaZmhkWB5yy3RrFv2qErgsimq4ZdM9FournKtCvoRB0X4QXrJ
	 /fPtN6SAiG1fsps9LQ3Ke36PWR3uiz02IQard2huwaSj+ZMzENFRIXS7bgH2VeiVo7
	 2EiuIEPgvY4iUAv+CwdTjJtH5VTB9hT8uCa+cxsGBdIKjfs6hUSSiiBiVEE43wgK1S
	 mJiSh3yLPTWTJx/+K23dWlAfdtDCdamYoXAjP+j79osXGM9inQrIzDLjeX7FaMpLpf
	 HW1Th/0NIn8Xh2iTSVDH1BwVVbqpIfBhT4qwz+GhrlNPhJ/+F6rIYhaZXzdy8KPdaW
	 0odW2A0fEEkoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DA7B81754;
	Sat, 24 Oct 2026 13:21:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54E49380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4693940177
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVTKv8XpUGvg for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 13:21:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7C1B2400EF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792848104;
 b=sfKQfJiGwcfo7yWwCmW/u3waqmCuaA8HEMwLziSGDnEUSVn0w98FU2KgMjNOmfH5nYkZ
 eDRlBbeq/o4rIFX1juGWZ1CZE3fM9CVGj8lnnJn3JMeyjzgsMarPsL/xAUScO9qYtuYAz
 1CmF9AenTZ+8E+tnYJ1FunlEoBOaDDa463LOycLutLAIbe37CDqJmKpdve4iZIG+UJ3il
 ZiNo5bZ2R4dcquF18gdlxRfZ3j2FYYDgystv6W0wl61Ro5RVMBad+p9HAJvhFsIPLW7UQ
 Kys5aUYH1GtCYLPZYjeSSYShmYtdxXLregTvX43mZRrrFvuL0Uc2bPvgfDvoMaJCgww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792848104;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=i56HU6d8R0AZdbpfDQkRTAYysRFEsN6wZIHX8Fom4FM=;
 b=EXYzbl8Ff36v83bPir1djOmHznSwckDr6b/Yfn9ZiHfC18uNXhF/2waZZgADZ13P8vF1
 GlzCfFqDTnDqgEGopeVYcvI0Ld0c0jB64R+2SwD8x4rQHxB8lPmoysPo8D1MQCgp2y6lb
 xbMyEHAaipDZ0nYVRvJWKzvFdQk9sDuBZno+m/NynYvjzuiavTT1zNutM28Q/+FkeE5wP
 t1eBgIo/oJJMDswugZ7DKd7dj82aonru3oT8Bc87E72XlMsZxqWMsNVPva1YQfBr+1sbk
 54Dw8sNfegJLudq03EJrfvLyEIBWrMgu171JLgfoBvgJFs1fCQC2+y/7/fAQ44K8qdA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C1B2400EF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:21:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 702049C7B9; Sat, 24 Oct 2026 13:20:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 15:15:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eaba571a623aa695ea4efdeb8bc5e205ca3f6aa8
X-Git-Newrev: b234f0a773f2c4e06f32a42d0920f83595ee9df0
X-Patchwork-Hint: ignore
Message-Id: <20261024132019.702049C7B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-api-core: bump to
 version 2.43.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b234f0a773f2c4e06f32a42d0920f83595ee9df0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index d546dbae68..2a619a6c1e 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  d24f5de1ee29fe538f3b042188f7a51c  google_api_core-2.42.0.tar.gz
-sha256  82cf5daa2ef1b456d4e29ff1de1a5c2995c7be3ccf4fc608184326e03390c1ee  google_api_core-2.42.0.tar.gz
+md5  2ac450a1a704ecc4b73951dcdb69f7d4  google_api_core-2.43.0.tar.gz
+sha256  d67355a22d995a009b6c5ca98744ea35fbf4f9c2c006aa0588c0941d1ceb5216  google_api_core-2.43.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index 55371ab811..0ee2d158c9 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.42.0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.43.0
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/ac/aa/2aa84799e6920216f8aa2866d3b43daa20f7060dcb6efc8f0449e8be0ab0
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/bf/1c/83011225511b8a0aeee9633d58d8e6b5d858ea5502e76117bcefb620245d
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
