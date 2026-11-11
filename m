Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594A4606A324
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 15:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hpTy9mvA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w7Qw2PFP
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1692E8122D;
	Wed, 11 Nov 2026 15:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9iE2Kx2Xh1T2; Wed, 11 Nov 2026 15:46:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 09B5C811E0
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794411961;
	b=S0+rhkI3m/lpownrJEqAoFyj7oCH+BtKoRph0X18WyjS7OknPBxdnUjRJgEEGG2JyRMF
	 IBSbw3lattj9u4HvxNR3O/ND9E3og8MzqDjsP+UzHLvoBqelsT/SDCQR9Sla3/vB7HvJF
	 w3oorbdz/f18eLyeTL2/DHYurVwrckeRCHz05Ud9+N2Os/13IhV97KacEiPRSbxnKvIkb
	 /O1/GgqDrKuuUUdHQTOPvlt2WZVTUU34r/ZsGqE2ci86yKQ0rvNiQjgFXQILCS/T9dIBp
	 wIwAD5LVIcGOQVom9ZSEmvCkli7YzbgAZ4Y2Nxr0Nmd7Jed2167gW1Z2ax7BJG5NHRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794411961;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ZKnJZen5dzqg2DkNswFo4bAmynQdKowdUXgZ0Rh/gNY=;
	b=o+M8MHj3NykrVB4P0XzXumyPUmrE6jKBWsRHo0ATbI4Jd491oAEdYdBPH/0XqtqcEvcS
	 TeSHjHmd3aXuR6haxcqR1UUkPQaR4e6AFbaYC8hINwY4SZDAP+v5ddGor9kXxF/rQZU03
	 UhhQX19edA+Mzj0Ay9YoimXA2ARMH15YAzXBXD6zeokCrO0A/l4QJ9FBKSlKnfhHc2aJR
	 mjqRNXNu8K0RdU0cN822EJWBAFj8ZmEBzRjaJfVrTpkngxrylpU+JlZojta/g6N18PMKZ
	 Wd4DoKlO9WI2+gTkwBK/rLn6FWU+Paux7WtSJ1v87ApMt/Lx1Lv+1wLynSaFThaJfVA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794411961;
	bh=ZKnJZen5dzqg2DkNswFo4bAmynQdKowdUXgZ0Rh/gNY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hpTy9mvALjZEdS+aW73wDQkzp+/TICiD835Heqm6IWwu7EFuCiZ5wVKZZtoR2TNoE
	 5451miLAN6cwDn84KztSBN+b+hYT+QsV3YWoYA/PSW3YZ1InD9CSxjvZlaVOtM5vll
	 vhxX+Vzbx9AG+BheFUXJgUFLOcCB8mj3oQN3nVSvRIVhTAZiNpQNSr8aYl8IYiSXJH
	 rHxqz8y5wzfq8aH6jBhCWD56P7I+QkMH/NVsJsWk03keJf7Gp7xxIOxIRLwRufJmh3
	 MkXIVCbNd8O+jW2ycOkxDo/8R64U0sHkFcbhCm9tXxXtqQTcuVvlukj+cnBRsQfVOt
	 ND/bOq/K8F6xQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09B5C811E0;
	Wed, 11 Nov 2026 15:46:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B77702FE
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CFE1403A8
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVszh5n5w5gm for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 15:45:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 73F694006F
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=w7Qw2PFP
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73F694006F
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:45:57 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso22772885e9.2
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 07:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794411956; x=1795016756; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=XB8koH4pKPyMRBM8183115rhYS3bkfeiZFoVvK53zC0=;
 b=w7Qw2PFPQvpKliEy6MU85est0IVFO8cL1amu9FtMrAzksVStv2n2Oq7eCBS4cjrzU3
 /gpIqNVGnVo4J1TjAbvx8lquYR70wFzBsyyuhRIzsZlo6F4XbhVUdCeULZ3Vp9DSiHrY
 A07LyAtQRM7Inq7Q8hSJB9nlnBw5PUYlmPwikt1D11BAFe2fJsIm/NUsaI2JPU5A33iZ
 tbKCFOPAOpCva3sMeyR65sTq6WjxwHvwKOy68786zDpFFlw6gzxngw7t3nJEtdQICtpE
 kzbnobHnWuy7OKNynXZPFx159M1RAEoAYW0uroM1jcNzudpyiL45MUufkd3UCb4ibLlC
 fzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794411956; x=1795016756;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XB8koH4pKPyMRBM8183115rhYS3bkfeiZFoVvK53zC0=;
 b=xflTrnT5gCdtP3LxWKS6Xjk8LsoqFtYDWP72GjRtgcZQwcoYjg30FTdWMtJEqFCBPd
 gcE7ZaTC99segK+5LO6tEI0Lqg3wFksGOEWCUR3dwrb6CPVVGJ+xf1b9F8g3mAjQyhvt
 Qgl4y3V1dtQMwMRUF3Qkv99sXsDBbNXkA1s4P+pljDKjLXK0wmbDZd8M8V4r9vxyiyDt
 c9KGqF+WZ1PycO6N6GXCAg0sWEzUhrq23L9Z6wxgeyqMLI64e1FrO2bjksgBml2MrzLK
 kT+87uZtCSj6YQtkJAa7B+2wpgQivopvbPZ0+1GrrbWW5bqan9k15VHZQn/XSd6y7dfM
 /a2Q==
X-Gm-Message-State: APuU4Z8xXw2UxPHFDKkcaGH/72oizuOO8DUba8Hb+cHRKvsX159/MEs1
 JlkLwlNMyrxWTjjOt1hQcVsRi7LQKsb9Yuit/6Jz5P+QoBwxOumi874tReXPOSuq
X-Gm-Gg: AYBFou2kDdNBaAdL/baiGnIcBukS5sbh2iRUWyOpOse486jDdkrv6DTSWA1hsOnfjUl
 6Yyf7LsqSz5rLS/fZeZIx0jly3mBwfcRhXwvrgiBUuMA/X9XA84ve4C9iHE8jj85gGNLE4KdziD
 YR+XCDnGyqeQmlLHmbsok+xopm9t61QhdyQUkUAyxejxKV/SP7tW3NL3FLhdCSfUJAXltopBv5E
 yOiXctld3lEO33VF0ce/vgkfj7Q4uxoDerVp099HvLmIqa8ou5wJ73GyrNQ2RtJihseI7daGYV8
 mzmMCGVV2L6IhMiKwxOtbC1nzmAigciQDFDTzl8m63QX9By2xhByYPSOV/mfOVZEKCAeKwjFksG
 YrDkDPsB6KtnFADgBFkBVIMLPYNq9KfcWHEaNDrKkzkA+x4xjg5XDk6X48vP35HGZRVmRtl2X+q
 KtnDjfoac9pMeolwvOTHdcwPoR+APm2f0czKp7FDIQ2O5jaail+Rp1tsdTUq7fOmuc46c4jHTlB
 2QOxO1r5DyHM7INaGgEy8MRedK3OxwQiKlXie/nAibzW8eh84tMcazbjGFsvk7pAVE4fn/1ilA4
 O0fylF44bvFQjkemRgN4PjPikvhIxiQMP+ZBUtb4NmNAPRlceDso
X-Received: by 2002:a05:600c:4f84:b0:4a1:e6a9:4086 with SMTP id
 5b1f17b1804b1-4ba091aa369mr51475385e9.0.1794411955492; 
 Wed, 11 Nov 2026 07:45:55 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c53bb94sm4574095e9.8.2026.11.11.07.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 07:45:55 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 11 Nov 2026 16:45:47 +0100
Message-ID: <20261111154553.673632-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
References: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/6] boot/at91bootstrap3: bump 3.x series to
 3.10.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIHBhdGNoIGZpeGluZyB0aGUgYnVpbGQgd2l0aCBHQ0MgMTUgaXMgbm90IHVwc3RyZWFtIGlu
IDMuMTAuNCB5ZXQKYW5kIGFwcGxpZXMgYXMgaXM6IGNvcHkgaXQgdG8gdGhlIHYzLjEwLjQgZGly
ZWN0b3J5LiBUaGUgdjMuMTAuMyBjb3B5CnN0YXlzLCB1c2VkIGJ5IHRoZSBkZWZjb25maWdzIHRo
YXQgZmV0Y2ggdjMuMTAuMyBmcm9tIGdpdAooYWNtZXN5c3RlbXNfYWNxdWFfYTVfKiBhbmQgYXQ5
MXNhbTl4NWVrXyopLgoKUmVsZWFzZSBub3RlczoKaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4NHNh
bS9hdDkxYm9vdHN0cmFwL3JlbGVhc2VzL3RhZy92My4xMC40CgpTaWduZWQtb2ZmLWJ5OiBBbmdl
bG8gQ29tcGFnbnVjY2kgPGFuZ2Vsby5jb21wYWdudWNjaUBnbWFpbC5jb20+ClRlc3RlZC1ieTog
RWRnYXIgQm9uZXQgPGJvbmV0QGdyZW5vYmxlLmNucnMuZnI+CkFja2VkLWJ5OiBFZGdhciBCb25l
dCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KLS0tCkNoYW5nZXMgdjEgLT4gdjI6CiAgLSBjb2xs
ZWN0IFRlc3RlZC1ieSBhbmQgQWNrZWQtYnkgW0VkZ2FyXQotLS0KIGJvb3QvYXQ5MWJvb3RzdHJh
cDMvQ29uZmlnLmluICAgICAgICAgICAgICAgICB8ICA0ICstCiBib290L2F0OTFib290c3RyYXAz
L2F0OTFib290c3RyYXAzLmhhc2ggICAgICAgfCAgMiArLQogLi4uY29uZGl0aW9uYWxseS1kZWZp
bmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoIHwgNDcgKysrKysrKysrKysrKysrKysrKwogMyBmaWxl
cyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGJvb3QvYXQ5MWJvb3RzdHJhcDMvdjMuMTAuNC8wMDAxLWluY2x1ZGUtdHlwZXMuaC1j
b25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0Y2gKCmRpZmYgLS1naXQgYS9i
b290L2F0OTFib290c3RyYXAzL0NvbmZpZy5pbiBiL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvQ29uZmln
LmluCmluZGV4IDgzZDNhMDIxMjEuLjYxODFmMzliYjEgMTAwNjQ0Ci0tLSBhL2Jvb3QvYXQ5MWJv
b3RzdHJhcDMvQ29uZmlnLmluCisrKyBiL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvQ29uZmlnLmluCkBA
IC0yMiw3ICsyMiw3IEBAIGNvbmZpZyBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0xBVEVTVF9W
RVJTSU9OCiAJYm9vbCAiNC4wLjAiCiAKIGNvbmZpZyBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAz
X0xBVEVTVF9WRVJTSU9OXzNYCi0JYm9vbCAiMy4xMC4zIgorCWJvb2wgIjMuMTAuNCIKIAogY29u
ZmlnIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9NX0dJVAogCWJvb2wgIkN1c3RvbSBH
aXQgcmVwb3NpdG9yeSIKQEAgLTYxLDcgKzYxLDcgQEAgZW5kaWYKIGNvbmZpZyBCUjJfVEFSR0VU
X0FUOTFCT09UU1RSQVAzX1ZFUlNJT04KIAlzdHJpbmcKIAlkZWZhdWx0ICJ2NC4wLjAiIGlmIEJS
Ml9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfTEFURVNUX1ZFUlNJT04KLQlkZWZhdWx0ICJ2My4xMC4z
IiBpZiBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0xBVEVTVF9WRVJTSU9OXzNYCisJZGVmYXVs
dCAidjMuMTAuNCIgaWYgQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19MQVRFU1RfVkVSU0lPTl8z
WAogCWRlZmF1bHQgQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19DVVNUT01fUkVQT19WRVJTSU9O
IFwKIAkJaWYgQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19DVVNUT01fR0lUIHx8IEJSMl9UQVJH
RVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9NX1NWTgogCWRlZmF1bHQgImN1c3RvbSIJaWYgQlIyX1RB
UkdFVF9BVDkxQk9PVFNUUkFQM19DVVNUT01fVEFSQkFMTApkaWZmIC0tZ2l0IGEvYm9vdC9hdDkx
Ym9vdHN0cmFwMy9hdDkxYm9vdHN0cmFwMy5oYXNoIGIvYm9vdC9hdDkxYm9vdHN0cmFwMy9hdDkx
Ym9vdHN0cmFwMy5oYXNoCmluZGV4IGU2MTFmMTYzYzkuLjk3MjdhODg4NTAgMTAwNjQ0Ci0tLSBh
L2Jvb3QvYXQ5MWJvb3RzdHJhcDMvYXQ5MWJvb3RzdHJhcDMuaGFzaAorKysgYi9ib290L2F0OTFi
b290c3RyYXAzL2F0OTFib290c3RyYXAzLmhhc2gKQEAgLTEsNCArMSw0IEBACiAjIExvY2FsbHkg
Y2FsY3VsYXRlZAotc2hhMjU2ICBiNmFlNWJjYWFjYzVhOTQ5ZjQwMDE4MmUwMzZhZTA1MzA0OTYz
ODQ0NGEzYmE4YjFkZDE1NGVjNWY3ODk4ZDhlICBhdDkxYm9vdHN0cmFwMy12My4xMC4zLnRhci5n
egorc2hhMjU2ICBiNmI0Y2Q0YjEyN2VmYmUxMDM3NTQ2NzNkMjhlYjJhYmI5NzcyYjUzNzhkOWM4
Y2JmYzAxYzYzYjU4ZDI3NDUxICBhdDkxYm9vdHN0cmFwMy12My4xMC40LnRhci5negogc2hhMjU2
ICAwOGM1Yjk1ZGYyOGJlN2YyZTA0MzlmYjJiNzdmZTI3NTI0Zjk3YzQ5OTg1MDY0MWU0NTQwYzA3
ZWEwYjJjMjVkICBhdDkxYm9vdHN0cmFwMy12NC4wLjAudGFyLmd6CiBzaGEyNTYgIDVhMzgwOWIx
YzJiYTEzYjcyNDI1NzIzMjI5NTEzMTFjNTg0NDE5ZjFmODUxNmY2NjVkNmMwNmYwNjY4ZDc4ZGUg
IExJQ0VOU0VTL01JVC50eHQKZGlmZiAtLWdpdCBhL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvdjMuMTAu
NC8wMDAxLWluY2x1ZGUtdHlwZXMuaC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFu
ZC0ucGF0Y2ggYi9ib290L2F0OTFib290c3RyYXAzL3YzLjEwLjQvMDAwMS1pbmNsdWRlLXR5cGVz
LmgtY29uZGl0aW9uYWxseS1kZWZpbmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjM1MmMxYzBhNDMKLS0tIC9kZXYvbnVsbAorKysg
Yi9ib290L2F0OTFib290c3RyYXAzL3YzLjEwLjQvMDAwMS1pbmNsdWRlLXR5cGVzLmgtY29uZGl0
aW9uYWxseS1kZWZpbmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoCkBAIC0wLDAgKzEsNDcgQEAKK0Zy
b20gOTA4YzY1Njc4ODY3NTY1YTkzNGVhNWE5NjdiZmU3ZTIwNGQxY2NhZiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb206IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgor
RGF0ZTogV2VkLCAyNSBKdW4gMjAyNSAxMToxMzo0MyArMDIwMAorU3ViamVjdDogW1BBVENIXSBp
bmNsdWRlL3R5cGVzLmg6IGNvbmRpdGlvbmFsbHkgZGVmaW5lIGJvb2wsIGZhbHNlIGFuZCB0cnVl
CitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVU
Ri04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK2luY2x1ZGUvdHlwZXMuaCB0
eXBlZGVmcyDigJhib29s4oCZIGFuZCBtYWNyby1kZWZpbmVzIOKAmGZhbHNl4oCZIGFuZCDigJh0
cnVl4oCZLgorSG93ZXZlciwgc2luY2UgQzIzLCB0aGVzZSBhcmUgcHJlZGVmaW5lIGtleXdvcmRz
LiBBcyBDMjMgaXMgdGhlIGRlZmF1bHQKK0MgZGlhbGVjdCBmb3IgR0NDIDE1LCBidWlsZGluZyB3
aXRoIHRoaXMgY29tcGlsZXIgZmFpbHMgd2l0aDoKKworICAgIGluY2x1ZGUvdHlwZXMuaDoyMzoy
MzogZXJyb3I6IOKAmGJvb2zigJkgY2Fubm90IGJlIGRlZmluZWQgdmlhIOKAmHR5cGVkZWbigJkK
KyAgICAgICAyMyB8IHR5cGVkZWYgdW5zaWduZWQgY2hhciBib29sOworICAgICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn4KKyAgICBpbmNsdWRlL3R5cGVzLmg6MjM6MjM6IG5vdGU6
IOKAmGJvb2zigJkgaXMgYSBrZXl3b3JkIHdpdGgg4oCYLXN0ZD1jMjPigJkgb253YXJkcworCitG
aXggdGhpcyBidWlsZCBmYWlsdXJlIGJ5IG9ubHkgZGVmaW5pbmcg4oCYYm9vbOKAmSwg4oCYZmFs
c2XigJkgYW5kIOKAmHRydWXigJkgb24gQworZGlhbGVjdHMgb2xkZXIgdGhhbiBDMjMuCisKK1Vw
c3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vbGludXg0c2FtL2F0OTFib290c3RyYXAvcHVsbC8x
ODgKK1tFZGdhcjogYmFja3BvcnQgdG8gdjMuMTAuM10KKworU2lnbmVkLW9mZi1ieTogRWRnYXIg
Qm9uZXQgPGJvbmV0QGdyZW5vYmxlLmNucnMuZnI+CistLS0KKyBpbmNsdWRlL3R5cGVzLmggfCAz
ICsrKworIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKKworZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvdHlwZXMuaCBiL2luY2x1ZGUvdHlwZXMuaAoraW5kZXggMTI0NmE0ZGYuLjJjMWE0MWNm
IDEwMDY0NAorLS0tIGEvaW5jbHVkZS90eXBlcy5oCisrKysgYi9pbmNsdWRlL3R5cGVzLmgKK0BA
IC00Miw4ICs0MiwxMSBAQCB0eXBlZGVmIHNpZ25lZCBsb25nIGxvbmcgczY0OworIHR5cGVkZWYg
dW5zaWduZWQgbG9uZyBzaXplX3Q7CisgdHlwZWRlZiBzaWduZWQgbG9uZyBzc2l6ZV90OworIAor
Ky8qIGJvb2wsIGZhbHNlIGFuZCB0cnVlIGFyZSBwcmVkZWZpbmVkIHNpbmNlIEMyMy4gKi8KKysj
aWYgX19TVERDX1ZFUlNJT05fXyA8IDIwMjMxMUwKKyB0eXBlZGVmIHVuc2lnbmVkIGNoYXIgYm9v
bDsKKyAjZGVmaW5lIGZhbHNlCTBVCisgI2RlZmluZSB0cnVlCTFVCisrI2VuZGlmCisgCisgI2Vu
ZGlmIC8qIFRZUEVTX0hfICovCistLSAKKzIuNDMuMAorCi0tIAoyLjUzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
