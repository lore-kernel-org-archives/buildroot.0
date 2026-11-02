Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157B0606A336
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 18:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Mgvn1K68;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aBlilmDw
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67CA54029D;
	Mon,  2 Nov 2026 18:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRPJgwtXfp8r; Mon,  2 Nov 2026 18:14:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2E27D405AD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793643240;
	b=Kp8EksBQvgFPwf52WYKYrJ+rebJwX4HWznLHq/1s6+r1TwSwSTAxNwNcf7m549SeJPQP
	 Io2oWeOp34eUeHJpTrinJTbW51s9N1A1njlQY6yXbh+qSqJJVDtnbLqPCUcyTpsW+RsP9
	 R33q86XFWIv8jYlStk1p0asmOoFQyzLVU6tujPDNlwseo9HN4d7UyQFfugA6/1oZF5UHI
	 nPp6omPC5/hKa6WPhhBwS75TD50h5Brt2F0DiTzChX7GwU6mJVsDgwkyNyBHtgqqqtYmB
	 yfc0soala81zSWnIClheffAVk5Yh7kV4fb5Cr5Xj1BGgeZZjSH4HCGcVwi4nMOMeKgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793643240;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=46eSVhqj2hvNph3AH2AhFYPK+dkIpd1l3sIufBzZHys=;
	b=Yc5Va9QwQZr9y8ZGB2g3U3e2lFl1HrFqXQG81/gYRTOMVLXr4VYQZG7YdWJGRIIY8G1l
	 uPREyUnLv11J6jOEFdD4bxsVVB0a+Sj1Wqo1x14+e0UN8o7ySOEnZ3oYE0eDDJiJcakuO
	 IAegdzAYEa0Gtp4/hFMoOPeuDY6BDBiXvHxom9JaKRWX3MmYNuRdYxBC+jBX2fNq7Ve2I
	 lQ9NiH8BIfX347yXWlcELcnnALzFiduKtVDGYGvdB0GEOMrl7mmt3uf1xrQLpK9URi950
	 3cgGnMDkvyhSAB2wffa5JwUaXd/sPxcFWeglYulE7F/sZ32BV4JUtUPD14DF3oeT3Gw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793643240;
	bh=46eSVhqj2hvNph3AH2AhFYPK+dkIpd1l3sIufBzZHys=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Mgvn1K68APoBRcsUSefwYF206umv88m+zGj6tTD7nZwd5pSt+uhAIizjWLH0ntwtk
	 qK8dlfUIeyWF98oizQOs2z4AOkzv7EOK00MSd2nTk20E9GZK0A992sOl4oOeOCbNQ5
	 6XswjSIbXXKGpfI7vanTPnEu2pzi50cJSoPAon47Jv5qUt+U6EKrtxnNsgdcezBXtP
	 W/vqF4bH8XdpumJC9QCTQIYSFA9MCecof/5cWMS0s/Z6DAO1yRkB3c2r170Fkog+au
	 Ymwpg5JzJLw8L3gEo5SzF94VWTMhGHDykEw1kK0gkERq/rsoW8t13gFvslcD8MyJ74
	 Q6z5a7seGcJ6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E27D405AD;
	Mon,  2 Nov 2026 18:14:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DBF4C4BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD6AD400C8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MP6pELxDmch2 for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 18:13:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DF4F74007E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793643235;
 b=d55372jtZzvamDT0nWZlzzO4/AxG9Fs0Ghd79iH6YE91cSQf7NH+Rp0WAEohf47LSwQI
 3Bue/hX6kJMu3sHgWRj3U40HE+7GvZC0SODxsMh1h7y1wnQhDku4qzVlpgPmx7B2P+ZA3
 aiWsh81guoktvSCunzqO1/Jo/nqPtH3qXwvx5EbuIy2KJb8O1KcVmml/h/jxBUEgAipFp
 OWcgF/BwZ7LHh4vMHGy3SFnyltQGShhwLTOrwao6vsl+ilcGZT45zPEH51t0A2w4Ss77r
 zdqfM+8Rios/vwl/sb95XuDfVUIifYjKHqG/vkeDjqPJzVsTud1SELd1BQrnn5AwaJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793643235;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=y55aeHTWs44bF4Uv+aUagIe81jQZpeOn/SvhmGOZWWk=;
 b=NitskbvI5KmlY4XuMPt4i6z3lEieD3jpArAoIe97rpswR1VzAzwlgwjMa9OBLb/vSfac
 Rc6F22JX2bcbIK/iYVd7tJbuALyjqeg02HCSsCnVPJneG719Qtn+IKbJDqcRf+OJ9iT4/
 c9Wo3FL+wLwbKoXkZE8SYemSXV5itAsm0vHU9zEyA0loUpDxuvfICFHztRwzMjfWuEKfu
 g2Y8m8GYqKQJtCoZkCRc5cTG+YBPc26a3NntNzg7QZ/Nnai432IsSypS8n+qYjHWKlY4G
 frLntjvs7SxQk735AMCykvFjthuO44YrzFMu2H8R3nHn3CzX3xOqFHMlcyfDVdde4kg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=aBlilmDw; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=aBlilmDw
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF4F74007E
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:54 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-4d198f1a591so1883473b6e.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 10:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793643233; x=1794248033; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=y55aeHTWs44bF4Uv+aUagIe81jQZpeOn/SvhmGOZWWk=;
 b=aBlilmDwXzjyAZNjt+YfUS6S1I6ytjwKnlnWkuquudLBzVPcC70By+1TAW1H6qnxC+
 fmMVo1So8caqw47I9fyPjVpTVyRO8x8NXNsEzLYNNBMOhI+vCtrFEGhw7dy4YtcQYrTR
 qTRVzlo7CsRhZ4PwVhVWmsVQnGXgcwCwO3ye1JnsXxYHsces46q8SCr9NOw54sHmRC0k
 UVAclXFsPJju309/VLCFrKHVm0xSvPShiFjLSARZkHOv5AvftyXhercnyZed5DB6QL7Q
 TbmPCEUYJQViu+YeOc1eqMmQ6Bc2TU5qqh1imjT9oUj+T6Q9OOJgim+OnM9t2edPdNUy
 UZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793643233; x=1794248033;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=y55aeHTWs44bF4Uv+aUagIe81jQZpeOn/SvhmGOZWWk=;
 b=CQQXwcFrZqstA7HlBRu1R9yKgXQUfMoNI9PLBQJXKIqB2808taAoN0lqleRwU+tZXX
 GESZCSYao7PEkEUSsCdXr8rBP+6ezP4b/+nn/0grw2pSjbzU+SrqlCaIpRlCgxwqjqJx
 Cqz9ouqj5m5rkmsMCuiOsC/RGJzvfS8XlsKsHzssQiOwZ6FFfq4PzsshcqSsBxnszQWp
 CeKA2HrN2x9jw6Ut/WeEu0ot/sxHxNLxzPJxBOuKUR1ARSc4wT+8upg9u8cjalVIJfR7
 efQpVx01RjFjRaPzioz8bTwOC+tq2lkCyQgI1cXVwgm2GP5CaOpRl2wvdDtJ/GEDfbFZ
 FofQ==
X-Gm-Message-State: AFq9FYI/6N/iQwlfcHc13RkB+pFW84o61DSPtw6vEF7Rh4ao46PJurNR
 AJY0EfXEY87DWAGl1CkLmBbn7L/uQH4WQ6WTPSq1FwSsJuBSR2RbH0MBkfErEw==
X-Gm-Gg: AYBFou1+pfdlKPbvqT+fnUIGSe9rT4afBkrNaxBLqPsxRZVUNUm9dJMo/HnkMYbuWx3
 SeJmuoZPtoqVM063OocMAaTSusn3Bu0+QrR7DrWy9+elb++KvhCFFJsX0+t8et8d1IH9sDajgTR
 xuvPuF4xp3UH/vrIUmqSna2q940P3E49gP8+zzmuOOkXv1UJO2CWuq95iXPELyMpAqdzi7nVA/7
 hGzrFz5A4NRw4tcwVQlSZOnya9TklGLCLkggPvaVj9i0VW3VES7rtONfK6w9EIPS4stB5Tl/cIq
 zPi5SV09/Rnu5a0ZsKQZfc840oUejx+1jDFq0QC/wj6gQYz12EF7oWkKpmE5dFGXqqZBoz0+dSU
 4waBs7CpnUFYWXjvlegsDibSSZ+3LqbycBPeY0rvxO215U/F3Bk1lBwWYGCGzVh/QQuBHnChao+
 PuWxN0MYEc8ttxQDfnuUu2GghpydnKGW654jybKAGx6MiS2AKBO7r/jkNYFYqvGr1O4np3zs63w
 eY3SDXlxzeTvfNaTe8WWd5GoXRLh9lGY17QBOUpv/IflHknHkoFTLqmWEljkH6wQqo7ezXoqVfM
 CZ+D3ulzz3wRMCXt2EbiMFZQDHT4uEYmqrRTqy2JKKoOkRJm/C6XheYvDQhOkpmus6dgfNxXwBu
 Ks017ULKJGzg4YypJokOY5I/ImexQLTgNBl8J+br44SWnODd/aAkNxv+WPZ4m8grdUDoIEMUe7D
 GBne11rl/wo/v96lqI8/qy5pytS/RV6x7nnMzITw4wE13QHIJafRB4qxgLRzCrNoPoWGG2aCNYV
 g==
X-Received: by 2002:a05:6808:1907:b0:4cb:f21b:6f8e with SMTP id
 5614622812f47-5640dda81f5mr8145666b6e.33.1793643233463; 
 Mon, 02 Nov 2026 10:13:53 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5640fd95562sm8445016b6e.4.2026.11.02.10.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 10:13:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Nov 2026 11:13:36 -0700
Message-ID: <20261102181345.3238554-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-sqlparse: security bump to
 version 0.6.1
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix CVE-2026-112307: unescaped dollar signs in generated PHP snippets
allow code injection through interpolation:
https://github.com/andialbrecht/sqlparse/security/advisories/GHSA-xmww-55xg-h3vc

Also fix quadratic CPU consumption when formatting statements with
unterminated quotes:
https://github.com/andialbrecht/sqlparse/security/advisories/GHSA-3r5h-5jcg-gmgg

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sqlparse/python-sqlparse.hash | 4 ++--
 package/python-sqlparse/python-sqlparse.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlparse/python-sqlparse.hash b/package/python-sqlparse/python-sqlparse.hash
index b0bb518e72..1b8d4f4f81 100644
--- a/package/python-sqlparse/python-sqlparse.hash
+++ b/package/python-sqlparse/python-sqlparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlparse/json
-md5  900c83341958cb0a16380b204f2fd748  sqlparse-0.6.0.tar.gz
-sha256  113c35c75365ab9cc9c7231d68c6428fb11c085fc8e9eb1ad659b7ddbf6cd2b9  sqlparse-0.6.0.tar.gz
+md5  8e1d392847417849baa6b533b608bee2  sqlparse-0.6.1.tar.gz
+sha256  ca722573f848ff2d30e40ea30f53a104b7dea7635ea9285891263eb2c58fb6e7  sqlparse-0.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c1938235b80d39e93138eae89edc3af67e18ecbc40d266529fa57b2dce426310  LICENSE
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index 6dc7b59a96..a6ec641188 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLPARSE_VERSION = 0.6.0
+PYTHON_SQLPARSE_VERSION = 0.6.1
 PYTHON_SQLPARSE_SOURCE = sqlparse-$(PYTHON_SQLPARSE_VERSION).tar.gz
-PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/5f/d3/3f06a1006f2261d1342aefb3c71eed02f5d4ca5bdbecd86ebc12ad38306e
+PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/7e/e0/361c764ea58cc1a75f7b4b424a74b08449db8bfa5e9199c7275999fdd1b9
 PYTHON_SQLPARSE_SETUP_TYPE = hatch
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
