Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223C4606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rFdOcx0V;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dQrcoGD+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D765F816FA;
	Wed, 21 Oct 2026 20:34:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VocNXLWb0WTD; Wed, 21 Oct 2026 20:34:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DFF3181747
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614857;
	b=VqosPRhVwBfbfhqrU8YttTevikdISiL4p2IcQqBsvmRtfgMnPwS57TTndMUeiRcTjfWy
	 BwdY7jFay8J/H5rpCyIj39fRdWIG4/9d0vAH9KFAf+48PzhF/RBEbHeF8JqVSXLb4B5P2
	 iVx/VDycvlu9LvL1GlmHZ52esqi9ZZ/7nzJUIf3LqKfJYd5psIkEgb341fcvncStRRs5e
	 JITQMONxW+tzk/NqQp4kKxYRXS9YOS4WTo/ehoTA/jgKs7ASRVKGOWhLir0DAwE8wOzTU
	 P0a4F4dpFYzGy/SeorT+r71EVuiKcPfN8mCf1VJzoZkJchCUIfIgBHpoW1Xwx3VGFEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614857;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qibc2ODm7HFjGK1Y1IYKbnGQmvEswuhOyd/W3ObRxyk=;
	b=kRn57wi2NAqpRMQ3xAzK4/6CMw6I7TKCkVcAEL33XxJ7RgTctHZEyiIQ8Hjxg/3Cwfse
	 AOVN1hSFZVLHy29qK+EOyEb81b1RnOgNkKAecRsrF0QAmzRZ/F1bmN+Iz6EMtMmfjrHi5
	 ofS22JmAMdcaWYVg9Yf4uDMwG7S3mHJAk3nK8XS9ZQfyVZrJkA57bi4vTqtHsAk+1Ry7N
	 fNajY5kDWYT5OtgGmixy9B3G4fQYrC5GHDz1oRI8UGZXE3/zbjraKkSTVdTRZmpXBdF/P
	 k4vaC1U8dVeN1Wu+Nd9WyN8MPL8NNYkom300toyhkf0XnYdBUOeBp5PSmTXB52vMZ8w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614857;
	bh=qibc2ODm7HFjGK1Y1IYKbnGQmvEswuhOyd/W3ObRxyk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=rFdOcx0V5EqaPPy6kFjqweUx8R3mf46LMwEFyzoZuq/jySLUhoHK6Zlk2CHYlS7fR
	 eN07ruKMyb/fJ47JTgKYA7HNOUkyuUZv491+aGus3hXwVW5ukHXNJ7vhvx2SAMkqOA
	 LJjvUJqc/tgLBt6zTYrxC/V1+Az/i+FRDsR9VQBtkUsD+UlAs4MZfqaWh7smMCNFvl
	 XAalyYsqN8lVv7Ag+Y3IgZjMKXUjxBROPWgbSHC93K1+48SRfkSeVFpq3rmLixZ30Z
	 iw1Y7lVya4oXQheCPP8zU/GcmrwtkAkQ4U990NW6hoKH4knmcFCjRi81hdXaDUiYvj
	 xetYbk+XyfYsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFF3181747;
	Wed, 21 Oct 2026 20:34:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B308C769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95D7840B47
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gD1orJqJecIt for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:34:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B022640ABF
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614854;
 b=SdyGmw35xyYlAyrQ4Ft8ChWjHF06vAd1J+r3s2mHllIJOOCwZEmqIR/t7ANn0QuHLdD3
 IwGujIzvcsUq+7r55rrJcycmVOJwBR168dD7yNT5ipuY/UrND6CtsfYROsN5lM/DpOrxe
 3u93m7FsaE8PZ8dT7A2JpRaFm3diSp5Wf9XJsM9NKurA/QX8i2Bo0Y4VuCzEedviV2bTN
 dolrKqdJKT+3rwK+0hPM/2stPdQ65cIjzQ2OY2HH/OMIucRshiIvevTsYMrfPXPZPuoP7
 RnHg5saQ+PRH9GU3/jkNAOOhoArCzDoUo2IuzTKaVD+qW9GSnCdPj06IatFBZzEyjkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614854;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=eEpkVVt+GCeXpjEx2DmQ6jj/maKVEvgC4m/vpB2CaMs=;
 b=l66vNyw2VSXe7XEh2c2tAnqXDzSoWpphihhx5Jo2D4XDTSnm6I5zdN9G7tngaJ1qvgVJ
 zPvIz9bgXdnHVn6JyXroQ8Mb3jTimD8/ZVglnh6MrWl5dBqhqW4BrRUI1Kj5sKaBxUaPO
 79Et1LqmrJffGsCD/Vr+AoClZQcR9YOErUdRFTWxaanl7finBXIfNRE+Dp6nHItQeeAGl
 9njQU14HLaBfOUVQ1Imb7MrVfHVHlH6Frgno05jxbUYlqen07KoI2rv/kNVanf8sb0Hc9
 QP8KFtU5fDqLsLCnhhrNBmS9h69Koybi6ne2nyrkQ07lhLJ0Bfe3EaG9FiLGyM5vMnA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dQrcoGD+; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22b; helo=mail-oi1-x22b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=dQrcoGD+
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B022640ABF
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:14 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-4ed6d69bdfaso628754b6e.3
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792614853; x=1793219653; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=eEpkVVt+GCeXpjEx2DmQ6jj/maKVEvgC4m/vpB2CaMs=;
 b=dQrcoGD+KEjbBDY968WG/MNLee/tDGs2NzzU/biqZL4rdMc7Eg4XnV0bVOKWuYM2z/
 iikBBa/yvzIaFxT8zyGZQLcB/oHeRVTCf61RvAaM2AJQwPYkiPBsCxMi0B4dF84d8dd0
 mHCqpqOdF0kmqcA9WEexdfymZ+gntbOF6Qw64312nU9KSXfm+Je+v4EirdM+3BS6r8/C
 Egce51qljqmO+LEAyDHmXUtjgKe7/aCHyvnL/oUGcnk//zjiIYVb+ffK33fV8DqNDS/p
 rcseIE5FmWAUCPK0lcr4IQ2LePWdIF2Rsr2YLiJ1DEMRv9ejXbnNBoXewF5qWQJZ0ITd
 wZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792614853; x=1793219653;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eEpkVVt+GCeXpjEx2DmQ6jj/maKVEvgC4m/vpB2CaMs=;
 b=ltvtkZqmVEsKA8Vwgywswhs8igWssVLsZDUp419TAo5/16OVlLuW0xvcwz/PNzQuAf
 xvRSGQDHLBO5Oa3F/iJDDo8CzSZuLv1xXXH7UCwj17sj6l+5B8UXuUMEr1xMTRGQCRoP
 Qz3UCqthjxf6hy6qMgTVmokVyKg7a4e2Fhg09QXBoIO1hR+4fAsNZSCQ1pQHrSvceotJ
 NAsWEIRNVB9n+IYip/ovBRH+mZEUVxNVLfvYG4qW460HN+LhBgu9fRft3zbrXPTL45Ui
 QnFb66XWdlHB2NE13eDEly/q3fQ6Kvw0XZp9vaBYpQcYZ9QHpgSHjv+GnIvNlUGHd0pI
 BwzA==
X-Gm-Message-State: AFq9FYJtO5QKjPpBo373XgbREOX/DlwkxMcwMHLZdlX3+11aF5uPlHzL
 NDFJri3Q3nlj1P0nE/zNrmSBdQT3K7BxftXiqQeHniB3eNyDdKZ4uRIRqeVABA==
X-Gm-Gg: AYBFou39RRBtKh5WDWgq31CcIEbGCb4Vbp4rk+Ss5ESWaJkFPdFHMlm4VpU2fgBKC9J
 cutwlk8dC6TZyjvIngc7eIy+O3jQIU1NHi3HI0hKmX7dMtEn4/WAoWaSeX+/6I9sKkk94m4zlkS
 h029EtSF2pHfIqeVENSMTr+JMIXf1zfsMJ8hPNRb10vuZZDi2Y8XZSDJEUNJtrKontwp+2927rM
 qLrWjyztWa+Bu6Srja+HZWA0AGdwF28yMDdduC1A9veUSKupFOuy3bLQcUzyV6/WhuRet80Vh6r
 KlGsj33Wn4DFLxLfnsRykyCnY9bzdsl9pnP4wiNGcB7rvHEKKrTpFlNs0GwKbmKSeaIfdSeKx7n
 ZKrvQFB68lWZbcLrBcMINp4P/0ZT1Ccoh5m59R44mvhm3P1ZQtt5s45FfOv2i4esk+f3V3uh+mc
 BmYY69uktzjBwFsyasCe6847yJ58HPFqLFx98j7jkHjfYzX7Ty4Fb+nxzyu1BnTae2M6bDCw4Zg
 JwLlJuNTp1y0Ns6imodq7vFtmwWUh6TEjLkD0TVvImoqak7VHeBn4Y9UcFvQOJWNq4vzarT+qq7
 DQ5uDKk86t9HPgqkJolz4nJH5HOQ+fbQ3is2Plu7eDrvXFSoph0AOLret6DmWHI7Be1zXhzeecO
 rScyLv8WRW9Glq/wUJ06hINRUcZStBZzBWDXSFeK514UkoQGGDgpDXPSXS5DxR173Fyk3oeqjTM
 yKxQa4en+WD7lUMhNaFGiJnBgP
X-Received: by 2002:a05:6808:3088:b0:54c:7dc0:649a with SMTP id
 5614622812f47-5535fda0bf3mr2514830b6e.32.1792614853374; 
 Wed, 21 Oct 2026 13:34:13 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-552ac8e9463sm2647696b6e.2.2026.10.21.13.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 13:34:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 14:33:55 -0600
Message-ID: <20261021203410.3114473-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 01/16] package/python-setuptools: bump to
 version 84.2.1
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
 Manuel Diener <manuel.diener@oss.othermo.de>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes v2 -> v3:
  - Bump to version 84.2.1.
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index d0ed270e9c..16b4cf7bb6 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  82e1d67883b713f9493659b50d13b436  setuptools-80.9.0.tar.gz
-sha256  f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c  setuptools-80.9.0.tar.gz
+md5  251cbfc8f83414155e0e595cc4cffdd2  setuptools-84.2.1.tar.gz
+sha256  3ff8b3b5492a0aa66960f4419365a86b84e013070d4313e4d4a6894f5d64d6bc  setuptools-84.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index e013000c57..a74db0e592 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 80.9.0
+PYTHON_SETUPTOOLS_VERSION = 84.2.1
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/18/5d/3bf57dcd21979b887f014ea83c24ae194cfcd12b9e0fda66b957c69d1fca
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/70/b3/c19426f783614d625699a4b247faf628ea9ab1db228674491767b417f9e1
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
