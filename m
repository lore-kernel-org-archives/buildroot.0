Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F69606A31B
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 18:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EFfVygne;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b4oBzQIN
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EB9840A21;
	Sat, 24 Oct 2026 18:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mSnXF31rfKG; Sat, 24 Oct 2026 18:29:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 308FA4086D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792866581;
	b=ML3i8RG9YHpnoWjjSLhqaJP2E2kBZ8C16NJxWK2T9P+QSlSFmLevwvyZO+NDRBOyG6ru
	 wfmvfB47VCYkQjamPojEr19Tke/cekhJCmVYo6PvfpwbbzA9aZwpU9HqUeOsMjGTkUNjy
	 reK+pj4Wu6vkRdAiHCbtOCYqGgPBNTPhDFCFRO6iJi0KKeVADHMAiCKtm2ZhrGg/9mFix
	 8XSQGqGcSTXJ+hvhLhFNldysPE/aIHA4f9RXRVxARIDtMLNWXKGHgHv+4LRb3XoEEQ7KL
	 4XA0UX+43gbtzupQAFCVjy4ReAxMuJMkRHOqibbe+A8mymCmW5VzD0NC9xxw/H49+nw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792866581;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Okuf1qdkvhaC3r1ADvm1oPvtvbhhNcRYuWTW/T7kdP0=;
	b=d5BlsrPly9McE5hRgCzo7H0Sx1D7fkkyjMxUOlda2e52d4MfVCwK6SA6+pa+1XYi+nhR
	 o1R8gdMRlUO4p669gM+tdqouEqJZDlY+phGyIyrKmDozTy0PROnJZzT2XK+ZrOYaK6Vcj
	 T65FDTfwiEY/wJjeHgRFyg1pr89m4+YGe2sUHe4mzVQC/2SZUtW95k/Zy5fS9OY5eY+Tt
	 eeVQZ2q7z8KoYJSNbejwhVhxRNcToaK5/SViUZSedrDYFlrM3RElprNl/TCsAtTuLsmsO
	 VpNTTMA1V2yS6cJLiIKeevRgbdjhwjoSI3px/qs/EEDDxCNkrp3edExcI08NZJkptKg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792866581;
	bh=Okuf1qdkvhaC3r1ADvm1oPvtvbhhNcRYuWTW/T7kdP0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=EFfVygneP9CJ1kAU2C2zVMNZPr8nnrZ9rJdM4S1fjue55Djx+qbSHtC6WxcpW6CdR
	 rphu4aQa3Qsran5bJdBmCeWgcvTDGO3Em2UpYpj/hp1zllWer7cps3Qn8CcWnp6TLD
	 RSaFvs0wYy/eSaTKc//QM8DYv2uhqzxn+OJkcXKH0A+sExeSnHxtsLVadkHcnZhn7x
	 w4mvtFxsLdtja7q3YLkQB0PxqEjzC2XFryJ1zyZJ1bQP1JYZbVydXmngqlFlfy1y0E
	 zVfwXUkdaW+9RROK56Ji0ubLA55hh/OhurieUXJz0u4R1W282dXXlohvDBMRuVHHeC
	 nzVuICV6XIUUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 308FA4086D;
	Sat, 24 Oct 2026 18:29:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C175380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B9D9809B3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z6rmJCqx6AxT for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 18:29:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7AEEC8098C
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c33"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792866571;
 b=R21uy4Oo7hkhlHyU76AxQTgbLRIS2s5mW5zBu9hinvFJolTZAN1zqXH7pzijlFIRNCar
 Pw2TN7xuDnKyh8ADzmWcCn9EaeO+IN6zYN8Pu1j0hzGvmnjt8ScdQsD94d1kbo7AVPZZS
 ERBPs51q9JamcHDWflCobg2eCBDVavngeQlA1ZDdVWaVvHuT2TN/NjblXVxU9PoHLwpaU
 fEJQOqeQ5Qymu2sEsP6LIrLseChIcUO/JcmSdKsdGle0S8k/3UEGYLuTbyZcinomnBwmZ
 rO/ukqdTZcohbB7jnBzkawEaB84SP6kKujT2XOI9J/0EGBVJDgXFPq51bdLOW+sXoDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792866571;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=QU9H5k2/aiSIKND7SLbrG8C1zCHEoI78ExxgLN5nGKI=;
 b=qip/ZsnLnjcaIIEBEJFG0YZNS3ex53gOkxgZReozyjraiIOTwhY5mg1FLIBP4Iw1nM8O
 E1P7jZjmxWY84kn0L7IGAybhPMFauJUQYfqOtsSmeR/DSyeNZ8gkmUamtb1k7Gbgxll0Z
 hQyi992AGu3GvunYgTAORkFIln92XwMwauB91CGcflXGMcA3DcoJ4cJ4PcDUL6mYGiWRu
 qj8ubJCsgElR6uU+NSWpEL1GHFX9b6XyL0ma4JY1lGdubeYg0kIT10dwjUYV1P7gFTTGg
 l4y9oocAe3eG3cLmk3hRJRiqMgodJkyXfrA2H3Ra03AYi/XefVVlGNkFHgMjZZwYZ1g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=b4oBzQIN; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c33"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=b4oBzQIN
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AEEC8098C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:30 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-6de1fd5f572so923461eaf.3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792866570; x=1793471370; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QU9H5k2/aiSIKND7SLbrG8C1zCHEoI78ExxgLN5nGKI=;
 b=b4oBzQINyJKtSf34bOFb1SQ5xWmGyrDW7LQucrU/1KTKEtbxpiQIw2HFvrk7tA0C0G
 3NOzsMLMtju9lqM3KCubJiFvf+ADaZqb4R1H5dDdThk+c8gIDBe9sPQOEmSCMTI9WvHU
 3lPGt0UBnq59/BmZ/ZHkCmBZ2aN2AIjcUpvU1czIt7m8IeDrvRnLGgAHycHGtNBWyZCd
 a7Xfjfn0gZjc4oreiyllpqnIDLew2yED070LbvbJIJqPGtubhCafTen1Po3ORDolJ9Q2
 wN09YyqmyzcMl8gUBArQDERbcLFClXIfYnPwW2srcWTag0M/iWDw8ltVjMZe607gsr6d
 ly6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792866570; x=1793471370;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QU9H5k2/aiSIKND7SLbrG8C1zCHEoI78ExxgLN5nGKI=;
 b=mH74vjwgIKKD1eD1FTpKFgDKUIqIVpqvFOgfQGHV30CZEqqm6/h/5Qnus4yeaq2bQu
 ePjO9leUhNnkHAKyYKM9mQInzxEU57/sV7EVmyvQpUkh1Lq3RaZF/6/O7AIYJwZilm4v
 1eOgKjLpouVYl1Rgr6T+8/k8kygFbcKCzMK5lIsOsemDSWemx0WLl/rgB6KosdqKLht1
 qAT6aRV2NylP8JSlFzuXiwZ4T91rKSnVi3gUd5pmfcWmq7VDoDR7KlAe66oKPsrAZT3E
 AzribVa9WI1UaroqZz0UIoueF1dSGoHOZhL3NoPvhIWBQOm5kqMdAFvU30SNGw84UKUn
 c8Aw==
X-Gm-Message-State: AFq9FYIWsYaVtKxwkp8hax7fhZtJQTZ9am5pENGvy443zfUaYPW4D2XV
 nIp8sEsZeDT34ccRR3mGOnESQaA9ByvknjhaueLdY3zoDoUsZLPFeHvFHsduZF4g
X-Gm-Gg: AYBFou0XiLgZtAcbgglfof+2Kmx5Md7se4IVmNe5fkvMOKmjeXayatYXckrC92s2zvh
 a/5Prwnaf7Ym4TjHltQhC+KadEEslYRg27jrx4OzDdt8EMEi289HtbBvopPS53L5/onrMv4r4r2
 18iXHD/vqa9vf0QB3/WcHZI20isTcEyatCzmMcpow/129fkg9Ni3nK0LVsCHXZ3uex7usgiS9VF
 fURFJPZCsxjWE86gqOr0cvpH9UNnVP02aluUB5QIKZO0JZYiCanpdxhJnJKfPMLrTV8Mm3vo2Ng
 vTYQzXq7Nwsy7q9T7xRvbeo0179l9UDOwbDJNKOZWPSTLWaW3tvcHsx0BM+1Hv+LMTlhU8ilFiB
 hFLM+zrHt7hxDLcIa4ywgavGhF1iusgPrpx3KBzJsr6u9htLJS+w7qB2Gkij/DDFuR5/eDc33a0
 6AeCgdj++BuciR1cIvumaPpl0wet6nzG3XLhMF3DhQiePdjFN9TyAdJkltoTecuqzBLtmFw5ws+
 gi+BfQzz6sW9GC+zgCQ55hRAm2Z1z9I92S1XRqtxgdVZp4JkGoZ6kdMgPEazHDjvn7SH+wMpyHI
 GZN2Utq43ecCE+GRuPQdqYFFj19GwakUXPv5aaiGgS71MSLUNY8haaPLnwNweNdQDUGl3VhoYNr
 DmETTY/v8XdMpxgMjpL5qiqzqdup9u+bW6uMME24QpLKFYYicC5Z3SEB9HD5FnKcRZhJ965Y1o8
 L3wB+GjEpIywWcDaUeJBuCDrco
X-Received: by 2002:a05:6820:5601:b0:70a:d839:2b35 with SMTP id
 006d021491bc7-70ba0f93c3fmr668081eaf.86.1792866570032; 
 Sat, 24 Oct 2026 11:29:30 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9dd3c9b5sm2634336eaf.2.2026.10.24.11.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 11:29:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 12:29:04 -0600
Message-ID: <20261024182913.1957467-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-grpcio-reflection: bump to
 version 1.84.1
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
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-grpcio-reflection/python-grpcio-reflection.hash    | 4 ++--
 package/python-grpcio-reflection/python-grpcio-reflection.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.hash b/package/python-grpcio-reflection/python-grpcio-reflection.hash
index 9d00dc378d..42540564d2 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.hash
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio-reflection/json
-md5  45379372e331e398a56919114493ea61  grpcio_reflection-1.84.0.tar.gz
-sha256  06bf3d7d8cef9afbcc721ee52191652b4483831774255e174404b0e0551741bc  grpcio_reflection-1.84.0.tar.gz
+md5  fcc7b785c8283697cba440e9c32e6260  grpcio_reflection-1.84.1.tar.gz
+sha256  09d72642fbabaf45f8fb9c86b0d3cf45945fb7c7c1c4a2dd3321dfdb05cbe2f8  grpcio_reflection-1.84.1.tar.gz
 # Locally computed sha256 checksums
 sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
index 9218fb0010..1b5f909727 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.mk
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_REFLECTION_VERSION = 1.84.0
+PYTHON_GRPCIO_REFLECTION_VERSION = 1.84.1
 PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio_reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
-PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/6e/8a/94af17ae0738cc4508af96d5f107f352e2b54473eecf32f0ed9bcdd895da
+PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/d8/16/dc6673110945d3d2a17d862516b67e0237dabdbaaa6ea1c8ccd76fb704b1
 PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
 PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
