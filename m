Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2A1606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PxjCm9/Q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AZAVXng2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C34581314;
	Fri,  6 Nov 2026 19:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2CnpYz4M8c8x; Fri,  6 Nov 2026 19:16:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 636ED812F1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992575;
	b=Vs/j48TFbVLh1+FMsXKYg1oapXG/xFrqdZXBuZbbdS70ksSbmIK9u1R26KUo37j732HD
	 j6kMyd20CQ6tPPMW53GWfC3Kpn7YOG80P0o8V+a2oJhQAmXRukJ8KCPswj7ze1b5E3byJ
	 K1BVeTKLP+O2I7hVvamyoBj5o3omRss0op/ydpPKb04GSZsL1h7j83PCCx8+2/eLXxcCZ
	 jKSgGbBIKJljdHTgnj6KLdYT/Pqcxtk++1vT5su/xmzQOaU13a0kZKM8gvFUxrqE5fsd9
	 zwG86EVyB526seApI3toTOgeX0qMruGZPXz5+1NGFkc/BIj0jKWVmy0khW+WvNth7TQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992575;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Hy1VVGst9IMR6GtEewGgUa+0zG7U499YShzsQm/2SiM=;
	b=H7rNpRVY5jq4N9XrcOwduoKU8KWhpU1BoWnuPdwp2nLDrN+ScwVQqEnI/QLllFv//3M8
	 hQwDdlabwOrSgN4AXfDxsTcSMdEkwjuR10NYRPLjs8S5VgNKBZAX6cjjAweCkz5ZV0nEv
	 wBLx3f4mqYsQN6oZbkaHXfHKjq6MdwSgZXHBuFcCjRaXWj/OpxSGIeYilP4SzI1YjVtVy
	 4DMsq5c3BT7CdiXEQn/E64yOMpB4Qm1Qtm6R2hqxnWY7O6jG8Ud0rEvaQ7EbzrwPqB8cJ
	 j6+9xgW2DYOgsy2GPPGZZYNTWpRt+mzZOI3CCdKx7+eZP09ReBsw7ROhb+GF54gN5ZA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AZAVXng2;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992575;
	bh=Hy1VVGst9IMR6GtEewGgUa+0zG7U499YShzsQm/2SiM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=PxjCm9/QwwPgZSRmP7YKxGZqa96E9g8B6hLqgA4JO+28F+vpBPvSgRxSJ0L/VaPlX
	 HTwT8mVH+BlTLGfKezBCXkZUxUOQsnJCXrgbwQHUd+edUomgyMJ4A7XwOz38wk+nhK
	 wEkbPkaeCAr2c8Mp9+HLDodBB6N55Wd/YmNIDqBE2BCTjFBztS91ubDkuiVopgfQ8l
	 qiBEdJlimlDr+44vOqYC4hUCcdtZufTnQZC12XypOmRz0IuAAxzw1qbjbTQ/IoUpsS
	 iqUqIcpV7femVYEfN9+Bf5+mGqiZGitdapfeqDQD2w2xH7VStaP5x7CLjjeAoJ+Ate
	 G2/AbtKOcRk/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 636ED812F1;
	Fri,  6 Nov 2026 19:16:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CB46362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CA9D812F9
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4YeCoiI-jR9 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 63FC381350
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=AZAVXng2
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63FC381350
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:10 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7f84a55cc06so695071a34.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992569; x=1794597369; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=I9LBjUXmyNOBfL0Z1DuwynCi1CIjhZ+kvptfruezO54=;
 b=AZAVXng2dMmrHb34Z2EIVMfAmde0Taayg6/6lf/tOdUFbU9U8wFQQ3n1E5UOa+hsev
 xeKmlU4ApNHeiloO8+VpPAcLI+zDu/LHaXDkQo4zJ5W6izdpHRx6wvrRaNZNlNetsChR
 mt3AohzBnyNz/gHrX1eIst+U6kHWQkNQscuAsSqTPzKbmNv+ti4wDfFhnx3VB/Cohwiq
 K3RA409EH5BOF2Ec8uO2OSyO1zy3UyR3Rqo8Mkz7c3OA6IAM/0OyMEkbsE5V9LO30N+A
 +5FU9JXJyzTZaQwCnydwAieA2ZFhmqU+oIOOpDgpzKb1fduVGK+ojhDJnXMb1W+viWCy
 H4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992569; x=1794597369;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=I9LBjUXmyNOBfL0Z1DuwynCi1CIjhZ+kvptfruezO54=;
 b=sZp+OeR0Gm7/iGeNSxZFiobUaxJFVPHMJjGpZR8pZWZ5vF+/i7wWpqTgz2ho9vB9KZ
 CzT43/kv3T0xN5UpmiuVKfFpYxzR+DZSURk0sDavlKCRVwPpwfdGeBShorKIlNwa+6u/
 2QtCfqXxeQQoYl7RNF8JNj0I70aA9UsD8P0WPt6R7oyEHaW3g3j5iCtfUVLHSIiwDLB2
 kgdGGuoeyS30Ydcn9D6tEgtDb7bl6hiyvzRbfziuSF0MTe9EnV5zG4Bo1gHK6PHfKJWi
 Ql4hIjbqyP98PpZl5cj9KH3Py4gwfCjflaPH2SXsKW/HB87DthqQIg6yVVpyJtKa8cGy
 TzwA==
X-Gm-Message-State: APuU4Z/kdeKGqOYrnCxJzuEVSnMvIS0J+O3G3XHjYBPiuQKQJOGKbMUK
 lDiAoWVKabhcXpgUrY9vV09EAf4HLvGe9ciDj7ZzjpQWcu4pCUtHxX+d/CsgCg==
X-Gm-Gg: AYBFou0/Bf/4UliE9lRngOncxnJzNTOTqV+nC5//QqfcdQqExVP2WyD9nhkeR/yWXBE
 VHnhu8w/2qnhaOEgAzWnYlyoCUzze+clEjzbPiCB7jwMdLb5RdSenXeXyvVEtNohZ98NO3V3bT3
 8KjLrSOk9Kj+fdBaB58yM1M9PBkPCP1QOQTS/hj8tRjYGMVK37sZEVf8pplOy+ECOEuaVYYUbcz
 tdu67svkScaFAf5RcNVFBrHRiygg1qBh/zqJWpBbzRP0rUF8+FbKmeIxuQ9Y4pjGvNR9re3eEY4
 GO1LZLgQAmfmTKEejUStwBEPhNnbKCsiOmFNqLkDde3vYcZRA4tm1eqd1SQvy2+sZ+fRFLUu+JK
 2F+h9GB47xZbb2dTRpqQE2/UFP06g2vctfNOXwDV6Q1dUo46iKd9PAeW0r1vC1ndzbW1PFBkc7M
 PMV+jn6KKuz8QcwCue3lJGVbB2daSnahHmYSKc1znM4yv+0CYjUxnwTJR9+yaPRXnwv9lN1hRRl
 WbPGIRF6K6Gxz7mJ8zCppreeH/zmUHw5w2RAlVvXJLQCgDeTGVVcXFjn1ad9IlcQjuLb/45DhiB
 xWc7ecBNX3vCHswEF0E1/gXoSOhN0xNSN9ftB4GshODHWjdTE+bs6uGRHc/HMuEXPIGIWuUump8
 sHscs+W3ekMk0RO6euQmDpOXkNxw84ScuKo+o18PwNKdU4CZI2/oky8cpPg7vO+m4IweRMniJI7
 Nl2BjQoedoD5nlINmWoKnUcmYneGCByx1NxBQGkwho/qXFRYiA7zsFp6jm7sLhOljMUwzWt836t
 Q==
X-Received: by 2002:a05:6830:3488:b0:81b:9d18:761 with SMTP id
 46e09a7af769-85f1cfe1fc0mr3114632a34.12.1793992569104; 
 Fri, 06 Nov 2026 11:16:09 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:40 -0700
Message-ID: <20261106191536.2120153-14-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-iniparse: bump to version 0.5.3
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
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
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
 package/python-iniparse/python-iniparse.hash | 4 ++--
 package/python-iniparse/python-iniparse.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-iniparse/python-iniparse.hash b/package/python-iniparse/python-iniparse.hash
index a64cc17495..cfce25f258 100644
--- a/package/python-iniparse/python-iniparse.hash
+++ b/package/python-iniparse/python-iniparse.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/iniparse/json
-md5  229454c1e6c5a36a3e8f1c9330f97a4e  iniparse-0.5.2.tar.gz
-sha256  4f4fd009d49e4290a721e9bc5716719e9a767c9c7fdc3d7ebc403ef3379d6129  iniparse-0.5.2.tar.gz
+md5  c06438d5c3900d910da312ff8db6ba2b  iniparse-0.5.3.tar.gz
+sha256  9cadfd7dfa551aed58f91f333321753a4d7df6ff765651fda5affefface33fe8  iniparse-0.5.3.tar.gz
 # Locally computed sha256 checksums
 sha256  ff45637d8a96adc414179e502fbed40160e57205bf2e302140e79a0c71eceaa7  LICENSE
 sha256  9b02e3dfe433ccd2bd94636ef6eb08638b5a54deafe5f87a3d9d9104356c48e0  LICENSE-PSF
diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
index 4b62405bd2..5b1efc10bb 100644
--- a/package/python-iniparse/python-iniparse.mk
+++ b/package/python-iniparse/python-iniparse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INIPARSE_VERSION = 0.5.2
+PYTHON_INIPARSE_VERSION = 0.5.3
 PYTHON_INIPARSE_SOURCE = iniparse-$(PYTHON_INIPARSE_VERSION).tar.gz
-PYTHON_INIPARSE_SITE = https://files.pythonhosted.org/packages/9a/5b/f8b3a923142f9e4cfeafce9b8f7343ead2feb71929365486ce96b5372335
+PYTHON_INIPARSE_SITE = https://files.pythonhosted.org/packages/95/2f/d7637e3cbbeb7ca2fddaf0c5986284d5a086c437139523f4bcea95a9f1d0
 PYTHON_INIPARSE_LICENSE = Python-2.0, MIT
 PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
 PYTHON_INIPARSE_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
