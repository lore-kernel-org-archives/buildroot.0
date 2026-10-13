Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFB1CC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 177C8607A5;
	Tue, 13 Oct 2026 16:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWYuLYaFZ1aM; Tue, 13 Oct 2026 16:43:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 323EA60791
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909805;
	b=OfYAL6iTIsfwTSHzNkIkHlWPLpy0XVvcK/9XlNHwOkazt/rkIUmXfxdNA54VmkO/riAK
	 DgiAvQ4bzI/5dt6i439A/V/DLCaxV0+BxlffyNSqBQOs/rMGTqEJt8KSsdsjCTkzeve8X
	 DEO03nTE2oRr5PlytwpSHsb6Tek8SP0dzsUj0BO83jcfEFWHv0lbqDs/kSRCyATdcqIhM
	 aka1W45FHp2Fa/uorXRoqsOnV2aHpvwe5aBE8jGPEByr/lkAffQ2777xmGCAbz/F11Xby
	 UGzPnB+sN5wxF9YZXxXtUPI1/rdqE355liF6jMeSoYxPmxYAX9CshHs3gmKXVcWrOyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909805;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pyUbxba566Ci2Hwam44+Rybxwyxtsyfk4lubJlS7pT8=;
	b=JCqy987hin+EfSOCknLeJErMtVe2m2jeacvF7QJWjibyIwmBdaG8vUCpz8J2jKGFmk79
	 uAomwIKJSQhIiQUlYvQESrB3X381bRyc5d0caUBExXphalQNjuRvzpM/g/BBykBhUpR36
	 raG9R8f5ncVSXjohdA0ennJg9ya9nl0xJ4WIh0A8rZI6iHUxVDUSGYC18SKzbmOJooNCB
	 udtnM8KYTEufVFY7yGedZSWyimW9Tm4QImUTlaLeDqGrNZY0uLHl0DOM+8YXwUJn7h5rT
	 rQ9+aHq2X/dBmQORBwlpP+m0gHxoAtIXMbhtYjmjg2cknppU4skHkSx6wh/ixd1Jo2A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909805;
	bh=pyUbxba566Ci2Hwam44+Rybxwyxtsyfk4lubJlS7pT8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=J6uVGPkwySFAEQuostqRweSs0NviXG7RB/j5z4L9cfGpYMbxh9CLQIAcVjqjgSKNd
	 Qvk6WMTE6ev2eKsR/WvDMYzux5RH89Ail+JqBusRi4Jh2YQiPSqld5vBCX+7Hlp5UJ
	 mLmc0kqYQZfNFj5fM7SWwTt+CtWMX7OqgWxsJAL37A+NdqXxjckZ2qG8apJG8GC7fD
	 YC6JkLhLibVKgkQdQxn4syBXBcushur+WrphBKcc5JcYeGdSPj24YREhp+UflonGNw
	 DjMmNgfYpwLm+ZXiJ/roM7v79P45PszHlAijCrygEF5QARIVpKWF3nfsy2zvA1aN73
	 wAkt/QgwfbI+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 323EA60791;
	Tue, 13 Oct 2026 16:43:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BFE1F129B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABD1480DC2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJ0wbMgpjK9b for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7D44B80DAE
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909799;
 b=PDWEsXi2LutdQjPe10hkiCiPDSTXSwt2HimIHOGp+SybVAn+yX78Lp7wnzR13VQ7+HKM
 KHivWFGUu4onB4imn8/vH5KWIl2HHHaPvb/ZOaO3WC5NM8wFdCXeqlniUNWdDK1u0Dmz4
 I9uC+KObOJPJ7Jem1KXXli4VDsmfVuIFf0XKJE2E8dfUCZa+Lwe6MYeVsSyP2sBldqOYo
 LLhVJzQepq705HWPADAmodrJ0x9GYRm5OKR4LibjkSocgWorjh0CMX7AhBn69mdjv9fwR
 L77IP1GKjRCjEORSmoFipUP7l7te+B42S85kSqW/ecxSOoIaM7YYUHu0Twp+KdvpHcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909799;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=zKRvy6a87V9zsEYNy2OGpBqibXcSIVDbqqlrd5Rhslo=;
 b=Skrg/h23sX5s9CR8EnkCPOmrc9epBkIVanMDOk40WeGTd0nf9ppb2ZzAkrOotzNZEGFM
 CLeYyR3pv7Kc687LiD+GK7hQgXITc6/YJGurT1ZxxsOcUiZ3OCEDECOwZPFYWjlZYfL4h
 M3asml4wJDBwqHLk1bFrWsKHjG5SnTcNk4oj6hwB/H4dM0VGoInKihm3+UmiyTjINkCpu
 ajyGb9mEWigTiNHg+vkMldRI4+wUZtPGZ2gMF3oDMasB5+S/0ShhHs+da/kiyyJkRy6JL
 O9XAWC3V7MJxfaAHct7m8MDTlPLmtcavQF2IaIy3C6+9x+fsIBW9ffhWwIN4WAxRxZQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=SurRcMRq; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SurRcMRq
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D44B80DAE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:18 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-6f8a519e215so1325597eaf.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909798; x=1792514598; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zKRvy6a87V9zsEYNy2OGpBqibXcSIVDbqqlrd5Rhslo=;
 b=SurRcMRqkhwzQOMsN4Th5P/T4c66POv1/eq+f/6JqPCN5wpRnykuIyZcCsH7NwDl3R
 CuMdDzY5t+E3MRSplXxDmqQy5dERB/CKsSm++pRssl5jndJFOp3N/yetH0Ms2gfBCPiP
 Yfmq8fcGUD3WyvWqoM/yRcYvd8wTVtQYMt55yBd+S9kqRRbUUN5n5UWqwJLlXP7Jfs1r
 A+xdgn/qrdQgVGyGHwbG3WKqHeEDUYkwDh7StC4weh8gaecbyjhsWaOnxs6OWQf+ZBEq
 uZjTiCwvCGpjntPniaWusjEykMBtPdR0Vrsm1PGSEk8Iz67l8/iLGFbJwlcExn9Th50n
 +CgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909798; x=1792514598;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zKRvy6a87V9zsEYNy2OGpBqibXcSIVDbqqlrd5Rhslo=;
 b=QPK3p+Z7DfCT56sfsqEb1YvXzm60/9MqmrsI9hjY0yu973tiS/NLayaov3hHoMPSM5
 05+qQjAtgwmWdUMiIFVnYpzokqkvZaZa4wWaRtwxFcXtmaQIVO32S2n5AS34JKumxnXZ
 Orlc7iy9ptdl9Rm/mB4I6Emq+Mc8b07c/hjySL/U5ciIa2HUeSmDhtW7sXrpaIp1zHPU
 PhzY8qRBsHzG8UCj09Pand+VeYVC/6qe8+zt+/g7uokoCRoy/vINfGmqu7lRVrcNzD31
 gT8e0gr16Jebq/jH0K8tH74xHr8XhEFfE2l+lV/h7C0TVfctzL+I8BT3D60XS/eb9g3u
 /J5w==
X-Gm-Message-State: AFq9FYJ1qmRZt8emkRVnZNzKvSnWNdXoLc5DmEbxcv6TbtQZ7olXtsxv
 OyyFdt3j0kYk0oVWYHVN1YuamHwIJZM+1J8mHB2HiJmTxiOqSXf4Sqw6rvWNqA==
X-Gm-Gg: AYBFou0aRyG2vLkGX6sYKTxaWXf8Bt0NwMe4kAm/PXs1FDWN8CktXrBUq1i9sEJuP0n
 QfPcKLQztKYtBUXgRu1/5v4ySL+/3VYYywM3NFZRk9kLar9ubQ6+ickt+QDYIl3lAU2A3Zg5FyD
 vKRifW18ScLl7lSd0IOY7hIf+AMFiECIbBUeWIptXIGCYa26oPtmMDJk9UARt6MvGOo3GjUZqui
 EbCzEyunnBVPabIbFIIMEhVNUQoL9dVeOKD/cpqN6gRv5fR7oPQrD8Z3mL3cTev5BTSDhIrkL9l
 FP5IC4cV9BwlUry2oI6I8J9CcIoU1vIumTwNkb4jiYE1KVp6VDlCF44ogFnYF4Ri3NC2nMHaR9s
 8b9BTBDrpvCfMfOvC9EP/MocYAdw4tW0YDe4uusPgco4kHXp5b1u788c+jnOLncwnK64onjo1Ns
 vLKnxdrypTzYOAJsXiEyqEPTnR0x3LkWDguBrl+HLdluwlncrxLqqq/wClnwzHNwdU7a8ho1lNG
 J9btmejoI8PMrqyUz/0tprgv8yBVMGeB9Ez9O/r1DpFeyIFpLhN0D7tKG3ruLiew4Oz36DhG0h1
 rTHapktazuCwpGrFhDkWj9XY0yINXN5iHNq3Wy02uIM7JMJhLdjMA1VKiJVDCZch659jMw3mGEl
 hA12zxylJF9Ay5XBdexxDo/BVfPTlB2nht9BiC2FJ/1w=
X-Received: by 2002:a05:6820:f022:b0:6f7:3c09:c712 with SMTP id
 006d021491bc7-6f73c09cb37mr3598706eaf.18.1791909797689; 
 Tue, 13 Oct 2026 09:43:17 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:00 -0600
Message-ID: <20261013164254.1476592-14-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-iniconfig: bump to version 2.3.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-iniconfig/python-iniconfig.hash | 4 ++--
 package/python-iniconfig/python-iniconfig.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-iniconfig/python-iniconfig.hash b/package/python-iniconfig/python-iniconfig.hash
index 576a93455b..7ae82fa863 100644
--- a/package/python-iniconfig/python-iniconfig.hash
+++ b/package/python-iniconfig/python-iniconfig.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/iniconfig/json
-md5  5c1d9c21275feb3da71400bf716edd72  iniconfig-2.3.0.tar.gz
-sha256  c76315c77db068650d49c5b56314774a7804df16fee4402c1f19d6d15d8c4730  iniconfig-2.3.0.tar.gz
+md5  dbeb0b0ccd25144e7ed5ba66aed46bf8  iniconfig-2.3.1.tar.gz
+sha256  67f4b9c50da0dedf52af349e7749a80a9057a5031199791b906c3bb3ae878960  iniconfig-2.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3409fa91f7ace557894632676656e32264fe5ef7581535725dc9a23774551bd4  LICENSE
diff --git a/package/python-iniconfig/python-iniconfig.mk b/package/python-iniconfig/python-iniconfig.mk
index 68392aaa10..4308ec7939 100644
--- a/package/python-iniconfig/python-iniconfig.mk
+++ b/package/python-iniconfig/python-iniconfig.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INICONFIG_VERSION = 2.3.0
+PYTHON_INICONFIG_VERSION = 2.3.1
 PYTHON_INICONFIG_SOURCE = iniconfig-$(PYTHON_INICONFIG_VERSION).tar.gz
-PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/72/34/14ca021ce8e5dfedc35312d08ba8bf51fdd999c576889fc2c24cb97f4f10
+PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/01/e1/2069291243c926a2ff1cd706c7f3eeb9b62144bf60f77c9fb9ff2fb26bd3
 PYTHON_INICONFIG_SETUP_TYPE = setuptools
 PYTHON_INICONFIG_LICENSE = MIT
 PYTHON_INICONFIG_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
