Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A5F606A31D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nePp6EYt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vhf3/pkD
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C533815CC;
	Fri, 23 Oct 2026 18:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jBUG-mAhBSD; Fri, 23 Oct 2026 18:19:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 596EC816FC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779557;
	b=WBPblh6T6GXlv6PjgoUh1bR62UbrCEpx/3MucVwq7pGGDunoFGXcTyMUz834nSaJBr6d
	 n57CHKHgJQJYXrFLpk1wfRi5R9OtkdDKzQUZobOK93yMK0X3/50aZh5lan/uh8mZgh2ug
	 LVN+RRMKxeyEOz8HhIJ0eJcdYRDz0ad7bhMVWSEPwL5/gLTM/TZyc7hDjLvEpyUZZwYLc
	 Rc6yBM2FX1xXN3LAdwNgtq/j4x3dkzYJ2Pokjc+Y60tr5bSIbd3aihXzHnvvhI+tzIWF6
	 2LAoeoe7KDeZVU71ogmr1YWSU2lkbBTi46344nppjEqczea4AlUVn41z4sybIowMCSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779557;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=UJXT0stFhMn9m94wAvTuyqOidIb2Gmpoir57M454bDA=;
	b=XmeZmIXwkduEM7w9Tz5s78R3WonxlSVjD0S+K1PbOs/NemWSViBip2GwJ75igOYLiNN9
	 R66jKwN0Nzs2GW8Y9KbniqAZzQzVYTSWnrQ4t31OqkeEXXu8WxAgIkD02em+8Nz9gGOGw
	 CncL3yS5pJHCYlsv9Mp5mUU4veCisRSNc4x4nEZpt12bvZbGxlAy43rAQIzfYNwrbr/HX
	 q7yf63oVXa9+iJh3jxiH4xuqAIFe06GcQTUzOfczeRCErzsTIvEg5iXgF49itybrWB2gQ
	 LfWUVekPEckb/WLoaBei4Y6iSmHdSzc0BQ0UBSZifkS8W3b+g2fBcSF7tEKDgHF5eNw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779557;
	bh=UJXT0stFhMn9m94wAvTuyqOidIb2Gmpoir57M454bDA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=nePp6EYtYt5ohLdWTJSdaDPZdJJMX+1U6MbJQixytw8/u1xNgdHL9DA9aFjrN2mjn
	 7Tx/2f7LNt1m9eVRq/H/zzjB873H6sPnbjTsFFI3VC/SZehtaaNz0oTtmfa5z238CW
	 4V5jdfC4emv/LWDaNhqz2VWFgbN2UDXJII6EnUD+mtaGuKxp3GG/T3JLhvESFaoORt
	 UX2GJmwNll74kJ/lFfJo5zB4MY64JIp+tV7vvf/OQuts74DUanW4TLRjJZSoOUp0H7
	 Gv7gj40UGniFlMWYmwaPkFeNSZ0bt7S9HhML04PTFRMaee0fDi51E4TSG/LQjudaW4
	 sM0yZkpA5aAZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 596EC816FC;
	Fri, 23 Oct 2026 18:19:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A422112C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A4F4404E8
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtnAdE2xJh-u for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:19:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A238740483
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779545;
 b=j91vwR1HWPgwbOLDxozw8j0NBWtd1j1kRwC9ZvcZibk0SBs5TW93pyHI24Wpw51jCA5O
 MvtoA3AcMkyGhFLESCjPC3/A9WjxcNPLqdzF2KO7UaoTk+OhWXlUwfrlj/3YakKRJ0kFI
 Lwf9slo+9BABEmzp7aEmPwu0BAHMYURpiZ6Ee5/b0ysKz/c9DJ1ciHwH+sQQ5SLqV0b89
 N1UnCgAXAFMSdpwe2nzER4qPHTRep2bhxnT54YXqo5m4kWHtXgUk6RyxcRXiYZSfFkhQ8
 OcXACk5z/G1UTSOqQKVAv1J6b2TNVjlX/k2NBIzofMr9D5yMgjScifC7tMdkFX+BE0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779545;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=wqMm+w6wL+i5w6t51CCm89Ct8AAkvjVTwI8HnUk9DF0=;
 b=E8GqpU8ZXdQQ2uxoKT/cQEUO4MEeVhS3Q0c1C6rnYeBLNKzM2wh1Xld+MAmKJDTDLMvD
 CXhQai5heCOnQkl/uJIpzHM3SW+ubOIaTzLxgXinKgFFMzsV74TyZthGe+SAfkBFgMoaN
 vKBzE7COKv4ZWawhrqHRjDs1JuqoHDW18i1c2NYm/Km4ehochhKLObvloVoog/Kb9rXeP
 0cuRXMeYY15kJNccn5bOsmPN5Xij2x+KaXN26c6jSrg+3mutsLi+Mjb5nKvDTV2MwFvt/
 udKJfwOc71gbwND+pG3ecni6vAp1MEQlrjpPKwBrY2s9Qo+AAhGRzWqgIIBs8wP3RUQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="Vhf3/pkD"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Vhf3/pkD
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A238740483
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:05 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-833e671ee9fso943068a34.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779544; x=1793384344; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wqMm+w6wL+i5w6t51CCm89Ct8AAkvjVTwI8HnUk9DF0=;
 b=Vhf3/pkDeDgG/PNx0MoTsx+epwMXNFJvblHf+LIxEBH79Z0QI5pGOxHrKX9Kf8pAmn
 ssizTcXympTtT9CcC9gmSUbNKqoe99VXVokkcGWeF5M7HSBvasd+hG9/h3FAqCB7ttcp
 n4m5Icd8xrVEzIhJ7fJxVUC265fdmTXHj9iYrU7JeoprbhJvSiYar+yuvfphcXG6t3CI
 Voaq2z0soYbSZqC0cthP7Eznz80SnAzbjC58PoIYPK/E0G+npUj02Opqzp/2OlfqqFy4
 MKy6A1w+UPpaOdwvFEQgLbxJ1zMVd16zzOEtoDO+AAymzjU8vDM5xLc3tsnGgYw71dC9
 1LEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779544; x=1793384344;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wqMm+w6wL+i5w6t51CCm89Ct8AAkvjVTwI8HnUk9DF0=;
 b=wn/Wjlnj8NrzLhzVLXUWILiHz838r0uAwnbX0AI9GCbc943WFZ14watKJkYctDLoqm
 zir6nToV6CarKE7F7HyLCg3rh3r1pFTQ04jtEauelPwlqIvGMC7RiwnvncV7TX4/61Gu
 i9x2qI4yz3pl9QFkK48Y5nwGJwp4/GIVhtHyARvrxHn+mD21YHj0GLxIsfeu+1S1+XDv
 782EZBQ7njNDr7/incocomZk8H24o1sLxTqsTaOTVSBGHOOURYuP+/kLMrGKYcrjW3vD
 cJGq+LUlV7uyOspc46LcvyzywZvcxVbA7nA1xACDh2PSVrHBSbkQlvetTHBLtobVpzn5
 izJQ==
X-Gm-Message-State: AFq9FYJYK2IgfY+fXGIykbBczZdS+LYL4mUScyjiaU89qIOtGSd/B7Lr
 IQ/demMvqMBVPQCPmEE78bJ+TcJzomSt/wuUgUlkDKQm/l5Nm3punxMlSudkUhXo
X-Gm-Gg: AYBFou2RaGp85bbwT2l1rKliv4T9d9lPt56erBI74Zd9tz2bSQ6o0Hd7ew2+WSRxwfw
 OHhX0B8I8J8Jy4OMSU3se2rFlkm2enKEIGaF2KIQszBL8t+JTBqRqabucFr+tFkyHRzTvi7EWK3
 EuZuP5cDox3VE9e1NbOjrYvFuX1fbxV3P43b0n9lBqrEKhJtZnrOywc//RxKo1D2xF3kBOq/Ha2
 t+3dXh9KZaGVwXPnePGc2jn3bpM55WYPvpNlJnBS8ihH9+6S2D10lRRsIAUYmCRWuY11dyL/I4+
 7q4DRBQxFaMBJ7j0nqYV8bHKNorsK0ilkznuHUNnrX4HupdlRuz41AqzJIpvyC3RcgKXNWSZiUv
 0oJEHdY+0pRuLOu/DcpmdN9IYS9IAM/j4F2avmle0gwkGBVIuDKZulFWHh8kKChrRyDE09229zn
 S3gONVm78WDryGXcYHH+bJbJSYHBGU/VVSa2HceqksPK70bXhVpPwyeYpallwxN8G/r2Qo0ZHM9
 zKKqnNshgebmZdenjO2+2yPPuAeC1Z3DqJoUNg//+kedyWHUA+tCdkcGPJixSLPNwGhMv8BFjXb
 vj3NHDSPoM9DhKULtw5ZhfB+xxOm9uxPrCdaPlWhS31bLXenesu5sYJEnJbBelp2ONrYHXTgTpf
 ilUHjGwHWJN0zLyf/Wuu2OHXRULv/ghuVQZpLTXVATWhWPHRYP3iBXShv9X0zKryoKvKgIMxal8
 DGoHoAlL2Vd2W/OsE4NtJgripfqy9t+IhxvS1Wy8rfN0KU
X-Received: by 2002:a05:6820:f003:b0:6f9:59ee:cf99 with SMTP id
 006d021491bc7-70b8899fd21mr2259690eaf.15.1792779544010; 
 Fri, 23 Oct 2026 11:19:04 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:19:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:45 -0600
Message-ID: <20261023181818.920329-28-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-tzlocal: bump to version 5.4.5
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tzlocal/python-tzlocal.hash | 4 ++--
 package/python-tzlocal/python-tzlocal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tzlocal/python-tzlocal.hash b/package/python-tzlocal/python-tzlocal.hash
index d870d54d1f..68368b3039 100644
--- a/package/python-tzlocal/python-tzlocal.hash
+++ b/package/python-tzlocal/python-tzlocal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tzlocal/json
-md5  24e01420acf49871034e25bcb64139ba  tzlocal-5.4.4.tar.gz
-sha256  8dbb8660838688a7b6ba4fed31d18dedf842afb4d47ca050d6d891c2c15f3be4  tzlocal-5.4.4.tar.gz
+md5  dd6d0ace736a684b9a3c57a30a509cc9  tzlocal-5.4.5.tar.gz
+sha256  ba976898bad27945178c9ca25c222c19e322b30c10342b9f40b46714f70d2d5f  tzlocal-5.4.5.tar.gz
 # Locally computed sha256 checksums
 sha256  d99ab209aeb16aad2c25c90ffd83c1a981e290ffff76a420a2ab03e03f041b8c  LICENSE.txt
diff --git a/package/python-tzlocal/python-tzlocal.mk b/package/python-tzlocal/python-tzlocal.mk
index fa60a1b7bd..0ad873ce79 100644
--- a/package/python-tzlocal/python-tzlocal.mk
+++ b/package/python-tzlocal/python-tzlocal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TZLOCAL_VERSION = 5.4.4
+PYTHON_TZLOCAL_VERSION = 5.4.5
 PYTHON_TZLOCAL_SOURCE = tzlocal-$(PYTHON_TZLOCAL_VERSION).tar.gz
-PYTHON_TZLOCAL_SITE = https://files.pythonhosted.org/packages/81/5b/879b2f932adfa7a053c360d50bc896c977fa6426109185f7c12ebdd0cb9d
+PYTHON_TZLOCAL_SITE = https://files.pythonhosted.org/packages/d8/89/2bd035df331499589fc92e59375c17c6cea6a500453b2c5f6a6ec9572825
 PYTHON_TZLOCAL_SETUP_TYPE = setuptools
 PYTHON_TZLOCAL_LICENSE = MIT
 PYTHON_TZLOCAL_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
