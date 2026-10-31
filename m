Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD70606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 18:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dGiD5ybH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aJVF47CG
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C47E4069F;
	Sat, 31 Oct 2026 18:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RoXH0v94fa5R; Sat, 31 Oct 2026 18:08:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4781840699
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793470128;
	b=Us6FcLSgzzB03OpQJEUsR9t4eVoaYy/RBh425xAWDTBjYTBQHeiCwuKvhjijmKOtj2qx
	 yYCc9kIXlhgsGmduJEGHuqnmQk7ZNb7giTNJmI2dGmtS66es7xqnl4+ueRfNsrcsDDt13
	 micOBUlnyVuibZXao8Meu0uk2o3DWlDzbws+9x8N1IAijlvQS9EfESU08kdVz6+anOCnr
	 BTeaISEq21MXAIf5WrvQhTh9zfoLtXEmK5QnqN+pObooUyLEmrv0rtmC9DSw8nDBEipEc
	 6GK3FPiTIU211Jbe3xNfFk6SX6lqleXEfca94/i1kg1K/wcE64jsaRs/O5MUHSDsKuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793470128;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=zxFJscgHrYvWDsFJXjlIDL5BjnguENn3+aVUoGyIJdY=;
	b=mC2ohQms1DwW3aPna89+/INElN65HcmTifb2W+Xf/+Nuv1bheyU6AdsX4V3tDlNKAYbB
	 ooOavSatHiLdK9D7eDMSPwZkIdXa+M037nmIJb6Zc9WeG2iFy/aE38X2XnBZWmMVDSO7C
	 D1flVIjdvaImJyg7XTldnIZW47eVuZH0e+B9SXp95MsDYGltce2KlMsrz8I0K0hF5Rvdl
	 bzHLquitLsn3Gphh7g1QW7MlImjQ1Kfp5NkUk1GnfrFYqloeTXQMItz0dpJenPWabYx85
	 knDOL5D2bMkfU4eZrZQTTMFVJTgPxeYBZntYwj7mPY4TeOjL7apo04gHtAge+D/vaDA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793470128;
	bh=zxFJscgHrYvWDsFJXjlIDL5BjnguENn3+aVUoGyIJdY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dGiD5ybHMllQSz7O31e/2YZV3R1I3fFhbhwWLfOzTTIbXINeyWs96DY+aoSTceb3D
	 DlWY/V8QeWIwFx0uNFY8m4D+hjZD177R51+VzflRRBgnCb6YVnvOkGxCIVKyzlEx1q
	 ovj5YiV3QcBtsd2abgf6Gl07UOCestE0a753rx8qsqIe3tQJ5jhC8SN/ArpPgwQZXp
	 gCWRCJLzevs/lTXQ8q+b3ewqrJW7VUxlLXNJbWzPOZRbTHnpEo505YvBJc50w+2sHD
	 WDdXSSDkm5KKJiADQAMoyWvoueZCg6vELLQz+dZijdxzieo2gcqJjpGB3Hfj05cpbS
	 f6iCMeqSMLKYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4781840699;
	Sat, 31 Oct 2026 18:08:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF3C7156
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF51D4022A
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZkkOjVfULE5 for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 18:08:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AA199401EC
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793470124;
 b=NRgGbYcHj/1WBwsTjSYLqePXKpfujHsg5sSt8t624zahttl38DDoMniQH1+T6aZDzfQb
 TwHPqMUXYiXwPJDaRgfiRqqbNJJqHLZskcGiOeS1d7OGpizJpy46DTJnqSEfyXZvP1WO3
 kFj3Pb8O/9hm5ifzODoPGkN/8w95yTsRXO+CXlx61UVVwSLazmXdjfw0IzNCAz9Yimkvw
 hJ5ivB/sUu84BmHiXfN7AXWUzeFGVOHd7VnDrLQgalEhTDoV6ThL7nWVgjTWGRAJUqYdn
 oELOezv0Hk8uyudOG1SJY/ryD3p9iHjOjn7atFufixR7ao7eho+NKhCnmC9ZEc+QGCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793470124;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=sECYu8kwP3xg94N8AZyiotCi7khfpDbZEFkcUMmVRog=;
 b=GkG8NDucYiezeatxUes3qL6wgZsfdhgWoT2WN7K8DtAF+GlBSugNTQGlgzqJ/LYc7TLC
 ORB0OsUTaBggbP1jy6UMsb7l4SQOg2FP5UUTXIJ/X72QzidbX569ucqj6DbkLbXVDcNGk
 oOfKTKHA0DYTjEillMo6TkI5DdXygnNVIYHq/LuBflFWGXHgZojqbh0wX7HOOLP20VAS8
 /x2YrA06bK+uzoOjXfjLOAb9/lHp5yJ6NMadCSR+CdmQGaN64fMRm6EZLIVmOzmY+0v4L
 vOuylroTisqslTajyK89u/AM7/MiX9Oesz54wybdhBHgU/f4UO0859KD1ej8929R2aA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=aJVF47CG; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=aJVF47CG
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA199401EC
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:08:44 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-4b28d7c729fso1086696b6e.0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 11:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793470123; x=1794074923; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sECYu8kwP3xg94N8AZyiotCi7khfpDbZEFkcUMmVRog=;
 b=aJVF47CGwmREq4OdIkiANuY7J9Zh02dfhGw9MontcayHM0DA0u1VJAcBBpKuYpDMUW
 5ACFXMMo5mAGKdjB/KC0PbbyP9UJ7bXxVhhcKMKVzBNJJ4aI6xRuOc/2aLN7w9dxxznD
 ++uaBoF8bAP/UQR0vFIPGkRivi2CersolAvP1P+NXRBW3CECVxsmyejU5mPXdX6eqCGK
 oW7H56mqYgHdzy8ae8+iA/HSfQfH4x276Fmr0TQ/4XklFz+qLzrZSupjvnRawdQs1wmQ
 yJL6aj6c4sbAbGbCJ6byMCyS5e+Ls5Mp+p1GboatrSLRJ4466P9NCjCCANOZyg/Zdb16
 fIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793470123; x=1794074923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sECYu8kwP3xg94N8AZyiotCi7khfpDbZEFkcUMmVRog=;
 b=TvJxXTrmS/GmRwI8MqLBKpC9W1YpkT4s/ZspSLkYisVo2ZVhYrPpQQQAC4AL62DpVm
 j+GiYV0/pBLbrg7V2n5lJ1RiglA0K/p3a9+pGyFH6xCzbup60sYhvgWHJYit8mchK1AA
 SnTCIZIZ3kI/i0w9Disjbf7bGmymdptX5v2DtO+u3NDvbWGB4q1/i5p/1fNOBvLyMMGy
 vi6bhQlhq0og8bbUdsdUAVpb6P3XK10W7IIqLs+OuvaWMWw82tVpq6CVenTVYsMOZhJE
 Zog/JsjoJBpi0pNabJm4lWRB658BlAjA2oF9bisxMXUFSw4DH6u8fJH70SFTMbtZTroi
 Qzcw==
X-Gm-Message-State: AFq9FYK071/02QEPH8b4Vui5c9nrpC/NUyXTw6ryDapDWcTvqTaxuYvU
 0A5JRX2mUnI5XLTlO5QjRlHmBpw8NBMbP7sj085+3b6LW8VOjT5jGSUM0LaGtg==
X-Gm-Gg: AYBFou3sWqCBdWaVZykd6xRCIHHIfqbpsYtrt41uif2UzIgF1Zdr1q5eZxVzHMZl1Wy
 3J1WeGQaNCMPA/eF7T7rSnECB8+vUNyEJ3TgnT9gSkN5XSn4ExBS50VxNKQ4G2IGbbd96rNCHo7
 Y9cBoP2jjBMGcFs1RSok3YKqSGl3npUiMtozmE1CSyjyIGj09H8ay1B+uV1CaRcOqMbtVM3LkoV
 9l78MQMU0+pHREy4IOhq7bfohoPKuNWWQofkx2Fzi+pO1Np2J36F8jkHdne/ZsAfXnCHQNKL4hg
 6Sa3ce4wocVmmwcg5y/e/JBMHi0vSrIRjYnUgpMx2SiiA73xnlUiIQl7OQYZFEkIdedQ87EPfGD
 wTMCAlQUtgmeszO3/ei0FtTGK9KPUVgO+lou6LismUT4Q0L/bJO7BuH1KbLD7lI64Y0XrLEvZtO
 /Lo6Fguls1YfcpIW1zj/UKgSRugv5U2XzSDtmsNaFEnOsUBMirqz5SRU3a0B2q1zv1niGjTTAaj
 uGXOyLuq4H5GHrMDb1itxQ6Qvhh2/xfhBs8TJ1EtgoPlnCh/PIkSABTPyKoQ5oxCUof+hD1RYg6
 bCkXjllUx9suW3IWnRRz4RYkW5Rr7zwH2U83K6kzyTuZc0XolA1N/Zi+y8ETU66U5hBCc1Hyjw0
 Hed0QBOFCn/M+pKTQy9fFYfSwHcK2qu1AyjsjJgh0KZ1kphMaG86PQWjrwdKKXXSuoXZgJVKPTB
 lFZf/gRaQ+skemBwazTziZi/6GAOk1PcpUzTngaVgD0GafjkPxSODtIKgbtWOKsmPB0OFr/WV7v
 iOu7wExLUEo/ZuBW67/fg==
X-Received: by 2002:a05:6808:10cc:b0:4e6:9390:e153 with SMTP id
 5614622812f47-5640dd69442mr4049786b6e.24.1793470123443; 
 Sat, 31 Oct 2026 11:08:43 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5640fc49880sm4548195b6e.2.2026.10.31.11.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 11:08:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 12:08:38 -0600
Message-ID: <20261031180838.2738700-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031180838.2738700-1-james.hilliard1@gmail.com>
References: <20261031180838.2738700-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-pydantic: security bump to
 version 2.14.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Update the pinned pydantic-core dependency to 2.50.2, which fixes
GHSA-qpmf-fgh3-ff25 and GHSA-3r8g-cqwr-jr29.

https://github.com/pydantic/pydantic/releases/tag/v2.14.2

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 68ffab3df5..57f49bbe03 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  d1d82b6afbe5cbed83544dd99a104c02  pydantic-2.14.1.tar.gz
-sha256  94f478203dd03404682a1ada216965651dd74b1d2d5ffd62e00e0837caab5c26  pydantic-2.14.1.tar.gz
+md5  f088af0a539873a8dce16be5d13c4e10  pydantic-2.14.2.tar.gz
+sha256  fb7b2db6cefe8414dd612edeede49c4c433acb0432b0f92b95024e45f66c505d  pydantic-2.14.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 0a48204cca..5a560b2afe 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.14.1
+PYTHON_PYDANTIC_VERSION = 2.14.2
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/7c/0b/8e10b2e693af8ec54346a14caf36221334775975a747c9ceaa3f8371d96d
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/9f/d5/b4867fa7c7f04c34997d7d8aad744f64d210bb99d67cf18bf3fb1eea1aed
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
