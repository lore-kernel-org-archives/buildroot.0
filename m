Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E44606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Bm9T+pDy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jIx/ZJ9V
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C0DA8144C;
	Fri, 23 Oct 2026 18:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pbTlJ91j6HOl; Fri, 23 Oct 2026 18:18:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 707A68142A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779527;
	b=d80L0hzxtNtzmbueDrRviHXVasHr+vlpZeHOaOHh4zwvkuXmxez+/U22gdYUsJlG0Wu0
	 wuQVQiKx9ZidJpXrpGIeiVG+oBR9rXworSCIBnL7etQy/5827dFSMJam6DRAT8TMsrpHO
	 CmydYE3ogC3AdV2Zjsp1BgOAn3MEPZeqURoRABIZMcTQ3D8nX1mxfBiGLrXz1cS98/4O1
	 sK8CWPgYn33hFS8L4M+Id3m/9W4vVGiWnHZkVIyL5z9mD8zmX5fVabamBGTpFjVcngQTX
	 0YYLl9N56fyM14r63czxkkbmZYeWtEm3tDoccuUsLipF84CPeviJdeXLpNZmbjSEAkg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779527;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=w2H1aorvHDKVkNeswx5LOPukxloO5z6cluKJzLLqTFs=;
	b=qwMockNe6cKMVisXAPT7SX0Hgb6QZi63uE4IKndyUjniErlhVzQ82OzmbfyZVvGvMOzx
	 dCQ4/X6IXXB20V/vFtiBkaoEl+gOKsLb2ypTx+SAw/xxsp0QDQvGtz1r7zbVuG2ju/6z4
	 KIlaRNA59KoCb2ltRaJYJI5ysuNldFP+DfbqvdAMBp6iAzrUgxJsfQnGCVZMqANh4Iz6v
	 1af0Hj3x/Rbo3n2IRcpMk6OWFydQ1WA2cyXdZPE0WsT1HQPFPRZ1IS2k0emZ/9K+lfBSf
	 SGcHiVrk/QOMvpjnWo3oPZBgehkj/6OjlNvY75iKImXns00slYNwH5b+ydj5sFDoyUw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779527;
	bh=w2H1aorvHDKVkNeswx5LOPukxloO5z6cluKJzLLqTFs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Bm9T+pDyapNhr+6UolbfDcaa+UdFrRYGvCtlNyimF531ZwU1/SpemJ8+gYCmKYFBf
	 VZ4i3b/OCZPb7xLvGaOvFKt1zB8MgmZ9e2YFLZsWctJhiu6k91e3oIwWs65XeLE586
	 CNppfG1VuuqmMgKj31O/EbN53H1wvEaSF14JSi5aoA6JeNWSThGeDywCr0F7IiE4db
	 gGPsMztjPrQ0OGYF/QMjYbUuKVpIo7Jd/IaEe0NRIk6ZIO0Z+puLpnqgh0Ds0RpdFW
	 mwLWDOXAepoLPjJWkNniVddQ8P4oiYTU9GSolcs/nANDqvPxr+B0CPvGUgvpK23yxU
	 ezWkFxgiF1sYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 707A68142A;
	Fri, 23 Oct 2026 18:18:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3508235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D97674098E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6jn9LlcPv-A for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E3CFF4082E
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c29"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779520;
 b=ktj/TMZJKkdJpXK4O/Z1dW8x8N3WMp9RSUlG0IF2wLn9W8qug++cIEd3BL5FeWBd8zod
 kFUAQCW8U5/5JLlKoRHEyuy6iX6XLRnHUAkRh1YC+MUOgd6ZLTBsAYgevyQjK2onld0VG
 7x7tcF/j1K+FcEonwFLsFRy6I3tCjdlsEOxVanqLx4y+xawQoCkxAOHjH30mhXG5WwzNj
 1NlEZiDrHDsbxfRVMFveKXN/R0vNvF2hwBkWgk9EFv81HbuecxMfUs7kJwGzB3xzVX5sf
 3LnGBkGinWI9bTJD/CnchFD1+9xYqs3ZcznaUXjYE6iGBIRhlUSsuv4CRaTovJrolHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779520;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=/itF7YRnGAMr3Idj0aYzLGBx7KqBMsVLuiagkY3OXtc=;
 b=sefwqNHxwwaTtk0Q36MZFT1OcyHBouCai2U1OKm9iCDuV1pPAKJeQOCmrwjVoJ3laqET
 Zvm9Y5KWrnbBZofS2Y0ic4D6uve7zIqYrxXLiHvgK3e5qvIO6uNCSIf7O4BPlsEJzD7fi
 VS92AVxq+jcft1yfFbDOwndD8TVFgyQWGbfrXlTrnKtXchkzaVcYGXM4Dx3aNfI/O7mSK
 kS+ycF1MEsW9LveWJMxc188AArLfjWS137udS3/cOppa3cTe82SKybujUcqB4o+xbXqUO
 Npm2pCv3I22NsaVejx7fToi0EH8vbq6/Zs0uXlwWq8WscWRdoimGWUEh29QuU2lKl4A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="jIx/ZJ9V"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c29"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jIx/ZJ9V
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3CFF4082E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:39 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-6de2f213b7aso523660eaf.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779518; x=1793384318; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/itF7YRnGAMr3Idj0aYzLGBx7KqBMsVLuiagkY3OXtc=;
 b=jIx/ZJ9VbyuAKbOHfR8ea1xkQqHfSc29PByYXP2IxcA01MEroVVJY53njgY7XP9oyJ
 54KhT6lvi9/bESrD3eUxDNdU2kl7sIVcL/QSQxhkiL7tPMtu8emhihqeAd01K7DNhZje
 X8J0mHj0Ar81Y6G826pchxAy1hEVguwSUxVzPDeAtC4s+Bi67ZDecDMIcobd4MsOqlOP
 bYexbiOMhMo76XK9hdukgp7MAyrrdnMnvk+2xzpoeGl9T3UIlOnzcAUTE64G2LPAYNVB
 nuv3JDW4srW6EY7B/oYoxMBUz1FbkrsxlB7HD+d5qyMyqejTdPKXA7wjLgsCkLVCxQFE
 2u1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779518; x=1793384318;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/itF7YRnGAMr3Idj0aYzLGBx7KqBMsVLuiagkY3OXtc=;
 b=u2QriXLA73k4NxmffHCnVcgGYkc27FYiGahBIthQ0VBgokZVITuLYQT1FJGWBz8r/Y
 601lr0XgcvrOQJYtBQ6a90vOWgvbQuqsR+d50Ei63K8bmBaWbHyL+bLrCOEBpzcOymu6
 4x3yOkDxH2YYdF7uVAI77Ku5pQPbEkNAjDrUQ6110d70A41uZEeFX0pYqJAQ0GH1+DLo
 vJplx8EX7gwnQcgLFlAVjKkQ0NZ+8yWC8ox2qOAdu0oUJUuxvmFhWw1pUBTryy1yWgZi
 xlgZlPBDDqgB6lh/W+gLAENlj7GyBqLWGn46ExsBxwjJ8Sh51D3knYXhAckvpJlROF8v
 BuUA==
X-Gm-Message-State: AFq9FYI3S/lgJK/t6HgtH5iayZrh9dhU4TOz6gbWbxiSgQiY8KEGH2Sg
 5lpBI6r9JV/OkWHgZnbZDhP0ZIk3kHRc4OCEQspjBWLJADQumex8fxDTVHcPjw==
X-Gm-Gg: AYBFou1X9efa18JbpefiiFCQcVXLBGYq8umyB+c75DsTBQiYZNTp3GmMSPyhrtst9iY
 5n4CHwy4U/nCTLCWGk2Dt7IOX5a6I5zDzYcj0hIkPN1nU8LOJool/BRYAyRTi9ueahG25DEDPwj
 VKVfoK2D31OLje7JseAHxiWiqgW+DfWNGfVqxFwxClv7eqZkkTjI2PQcRfJBiuwuVQbxo8Qny/V
 kOVRJKiN0LXhs1M6sumJEfHoOQBBrSl1XQXH1EJboaYXKwmx1Xheua25IwWmIgj7WWeliLEn3bO
 fpmOM4fvfE42Z7Iz38IFEG0p4yAtB7KduXuaKuCIbQMlDUBc/mKp/+YKrepLmt+Ct9tAzfr6Cxy
 5btRx4mPLaNgtwkyky7xx6MNCeOOT/5wtB8YkcavYxYclplRXIeM2rncUvYBfJ0Ix3+bMG2+p/y
 B9rRRpAjMmP3/VI3aR75tOBs4ZoiwXr2nAcBRoKRqCH05nKTRmitjMBWIwX6gD46tPSXfojMdSH
 d91ozb1Se6fl1DZnEH2XhQT4zu/M3FV/BZuwciQalGXKryTQNs5vDUHmzF3VfEf94MtWKlDRjWX
 9u7vr0CLOhBmo+j7XL/JMjtw1JDULcfAYInoQzINE2k8Zr8Rf8z40TIdYMaDMz/Md2GS1s8kIe+
 ouxtNklIkoRnFy6O4l0vnUIePPEPaqBKRZk0eXh7dDU7Vwzg+4Axc+RF6eoGd2WLTK06+GKWSBM
 sWBgnxccRrnr1TefjWjDGuNec=
X-Received: by 2002:a05:6820:1396:b0:6f9:91c9:4e5e with SMTP id
 006d021491bc7-70b88a1df57mr1978716eaf.47.1792779518198; 
 Fri, 23 Oct 2026 11:18:38 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:29 -0600
Message-ID: <20261023181818.920329-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-grpcio: bump to version 1.84.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-grpcio/python-grpcio.hash | 4 ++--
 package/python-grpcio/python-grpcio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
index e533bc1bfb..c230f68918 100644
--- a/package/python-grpcio/python-grpcio.hash
+++ b/package/python-grpcio/python-grpcio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio/json
-md5  f217241814a3d2f9bfd0fdc00a5d419c  grpcio-1.84.0.tar.gz
-sha256  19aaf172fc2edbefccce3f6e92c5150975dbe56c45744e9e87cf72ebdf85bfbe  grpcio-1.84.0.tar.gz
+md5  1c5d46ea8d18b15a69b59a4f9dcd70e9  grpcio-1.84.1.tar.gz
+sha256  446e7876b9b991fa124c1d414899fa7cf95f89a3e71237ea0161863dc0b2c09f  grpcio-1.84.1.tar.gz
 # Locally computed sha256 checksums
 sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
index bf32da46a2..fcd6503199 100644
--- a/package/python-grpcio/python-grpcio.mk
+++ b/package/python-grpcio/python-grpcio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_VERSION = 1.84.0
+PYTHON_GRPCIO_VERSION = 1.84.1
 PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
-PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/3f/4f/4435c0aae54657258d9cfcba78598f3d9e5fe4c82ff18d78558567b90faf
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/c0/3a/5c8e0eea2af3d30cb20d33ac325a98d9b799c069d63101ca4da20bcc776a
 PYTHON_GRPCIO_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_LICENSE = Apache-2.0
 PYTHON_GRPCIO_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
