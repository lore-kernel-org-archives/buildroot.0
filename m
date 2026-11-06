Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D06606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oL621OtD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Auuzbh5y
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67CEE60A70;
	Fri,  6 Nov 2026 19:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVijWrjXw3Dh; Fri,  6 Nov 2026 19:16:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 19442608D4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992599;
	b=AeWauVldeBogxuI/u1pkrntgWWs9k+jRfSNsu/YJ5IQlcjVMv7ekNZVx9Gw4EDJfPz9p
	 npG9G1zzmxXIOYwpgRjWWGobwi4PWLB8KY1CwCHkekgcG8Nz97CfKToCE8MnXqmfGFDVA
	 U9MMqNltdKM3F4WlmRAVCk9s4RxI3gPsF2xE1jDnKGNqGTqasWRwOZ7E3SNbAE0UYmDH3
	 jMACmagU/SiiV8A+SxWJJkaQA/E5Ht93PepvHYYyepQ4vxfSq5X9vOPZ5dpIQ/SMQtYG+
	 rg7v5X9owZ6w7q22VbWBKiIAv47fXIIwoXLNWOoKnf9z8ByvrMcu7Ig4R/L9gFLttpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992599;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jno4Vi09g3IROTnro1zqLVTQkmYJDNF+AQ2Wkc7J9so=;
	b=VZ/VGXoSbJU7Rjcyb1efViYjjvkv7ebP4IzxYoZ78e6bI1u+eYjjSplxuFTHY0nyiWDy
	 7xXC/eyjQ0dpc01KGL+GHVtoT+RqvHCoDpomguOZcCPSaFNQkIgBNOlgBVejxXplNze3t
	 8HKCEPc40Ika/ML8YGyDy2HRgvDfRem7trtgiHeyk+J/1EnusdPKLbajBYW0VOnLiJrZc
	 hCYXIce69Vt5bxahFoX2qy0uVkk72D9y0whymyt8N0/5IeJTXZ1yOvq2+pbaMyXltDwH5
	 RzU85ejnvjUMhyAZUBficrx9LwKMfMkr+oAvwbmJe49Mq/lZgZhCos7+AwlPh9gNGNg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992599;
	bh=jno4Vi09g3IROTnro1zqLVTQkmYJDNF+AQ2Wkc7J9so=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oL621OtDsQNQEYhUabGbwji0yjVoBhNlEMe7UOLTcv8bZ+z8W9/akuaEdN5zwOiyR
	 lyy/ZgzdeAOriBy5KgKYcCMAdAZ04u4Kw+AyI2/RfCivFW6Nx6fnfb5+s09+QOJ9r2
	 UVU6eS67MnIIM9gf3P05ZzSKjRGsXJSpJv/dxCd05cwdmILhXjs8TJpuwCN4J/omiI
	 agkWWt4ie+aYNsdT5vaaQW1+51t663QZqaLd8v3RQnoS58mPzEYFTW9D3vh88PMvWo
	 Sb/RcCLWF+gLvUFok6+H1N4VDtVEA6IaxDBlDZAQyW9R60K7Fgq78HzrdeXXl5/Djs
	 NZ+hOu0UCa8wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19442608D4;
	Fri,  6 Nov 2026 19:16:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B76704B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D5A281401
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRw-pWsaV3jN for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9EBA281467
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Auuzbh5y
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EBA281467
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:32 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-825b40f8a26so428912a34.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992591; x=1794597391; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5a0jV2ZdhRmIHynO4Mxah98cpXGRwSIA1RnrYixVcNo=;
 b=Auuzbh5yEcyQ1yvxEu8qdi6xyxxOi9e227AAAMOaFHgJKmewvDHKT4GfGWLaBeoeJq
 Bqxq1k+1kDfgzr8B3mS/7RwOFzAcuCUAJDX5zizghfca8J5fegnJ28N17gyhBrOXIXfH
 niYaLIKGF9f5ucmko9XanXtTS82C4r89Rohz5pVLMUgrCELFEgZNX2a8kxKA+5qFmbDj
 BGZ2WAMSKeQ46YURZoybZHplKcpLU6Tt8RKWwMwsP+h2UN7cldW+LzyjCbq3cGf5idRM
 UCRsbbDDBGlE6pflfzO6BIJcYUmNGdPsamsN1eUJM15V0cruiJwu9ocj5VF8mQPtOxam
 veXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992591; x=1794597391;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5a0jV2ZdhRmIHynO4Mxah98cpXGRwSIA1RnrYixVcNo=;
 b=idPbVO4cSzJNGneyBgFgA7mSF0BCXTkc3d5I/u1kfzjwLwdg1XCVjCHKft/1BcLxwa
 +bG7r4H3fCbYr4x4YyvqjAEPUZGYNuhfrKydOxuXQl5cG8lAQPXzDQokgVB7onlxGvZe
 US3WJo8vyMUBvuOl1Scp9bMwrtAjg/CAQjpG99KJver+PFevll2HHWmtKfHfstO3GsxJ
 Cv/jQZj+dYXoxwNX4SgTfbZ507rEP9Jw0WsHBedaioXGTbZ1f0buX7QiDmLB/TdXDA1P
 Adhr58MwQ0P7X5kwx16aLqGKlh3ayIjD3RxQ50QKP3AP9+gsqLoQQUTPaTvddk06o538
 RRXQ==
X-Gm-Message-State: APuU4Z93AjE1yG9uX7IvplKyewiIdlZWvJB4RgGKYvSswAmEidZcXRYi
 0Ee+7YrSK+ho1dpJixBdmnS1Kposs/mIF81B7uAbRsBR8gHcGy3ioVVSsE0kew==
X-Gm-Gg: AYBFou3hFTKAw36vMONIgYfQgiB3hq/YigV3fSinyFItmJ+LG+TAu3+7Hrm2yEt6KT1
 6HZIyquIL6vZ43ofmS8vErgVHU/dzLG5gv3Yqe0hpS6kCqxB1E04Z9tkIXpA73NtWd6RWbPqNT6
 DBNrAu5XJfZU7D8AD2XrIVijiLGS5Xqxrg6mGeaR+dblAuX5WcB2V1TuQH0dCu4chsWI+ShPpJT
 lWQwQMrf/zxAsVDDKfU7g6k9TdPqMwoIEu9dGUtjHkVbhBC+PxpXlm+V2nnuTX+hh3M0gisdEyj
 HZ/a9lQBmGDYfTUyo+1xNSX1f2gqrLAZLhb+ER255aZ/dxd1A3M/vM5+BkyVSeknE/AXu43R12T
 vbnCkPrPTEiPRJpTD/5040XjiWyWTEuFAtl35BZNDKBHzMvv5cWJ7+/LBvP/EQJwcFLnmljQ5HX
 mR8x+PI/XiA/GhKXNKVI/5OoeKaq6FCDI4HshauSY9hBFf0StfWeWeM9CQxh9pJ0itYZ7OndK3F
 aduvhEmr28a+VJFezDexwY8N+i8XhHw7/X+DzaYt7ZnIV8bpROEW3aOAPPYv42Tp0Gp9SM46RZg
 ganQygAzN5s3RH1uun0FucKq5n3E4ZNVKN93zWf8Z2zQN2CCdCBd3pxQkTBPKgXxsSw4v+izsUF
 X7DE77VyjxTrdQ9Mk1JA9buJl8DLCpEKt2GJ2ozX28br2S3XKrjUS/Mj1IKVdR0DMWc9xS7Oz86
 s9uT3DGDk6eyVDviGcWR+KeXPIwXr+aYI/WPjQTjxaCJ5dvyZYYqohV9Py+PXPYYjkKxgV71Psj
 g==
X-Received: by 2002:a05:6830:270a:b0:81b:9d18:75c with SMTP id
 46e09a7af769-85f1cf95bdcmr3402673a34.20.1793992591400; 
 Fri, 06 Nov 2026 11:16:31 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:54 -0700
Message-ID: <20261106191536.2120153-28-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-sqlalchemy: bump to version 2.1.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 3960b36888..f130886a24 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  e48a02203a8c156dda64d0f8f703e5e7  sqlalchemy-2.1.6.tar.gz
-sha256  499eae5c9051efe96cb9a73ec2fbde8ffa4186f102b9094ebab8fcc9d3b99f52  sqlalchemy-2.1.6.tar.gz
+md5  72556b6c195d1b5f796874a132f4f708  sqlalchemy-2.1.8.tar.gz
+sha256  8bc4081dd7c17c073f2384ad0f5ee968e63b43507b2e024a3523c000a06d70da  sqlalchemy-2.1.8.tar.gz
 # Locally computed sha256 checksums
 sha256  e862bb5b904fb5513c3e14288d7a25a12eb0ecc7847a0a965d310e9a955e7cb9  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 57a82f1ca5..01037b2921 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.1.6
+PYTHON_SQLALCHEMY_VERSION = 2.1.8
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/36/dc/9addbf490110b5727380059ee542ad8353bdcee45a37ba6a5e0976966ae0
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/9c/e7/2855174facf54a83b4fa3eddcece3631c6bdae43605dacd69cc3b6794319
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
