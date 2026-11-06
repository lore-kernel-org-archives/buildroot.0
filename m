Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F39606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=M+2aGf0K;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O81F72/5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47CDB608CB;
	Fri,  6 Nov 2026 19:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jqb7oEFCKbVK; Fri,  6 Nov 2026 19:16:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3640B60A5D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992604;
	b=bT//qo9Mc9S2DmI/t8ST19TvIWUN8YpFNo4snej0VAfaXgXYmryvFRTSSoJ537uyFOaH
	 YMtqueboJ0PrKX0iha8jpMppa+xGGufhLY4H5Ufl/hoV/xizCgtD6tFLMWf+OcxFqy9wq
	 /zlxmb59QTpeZa8O+IM8y93FKSK9H0TLqIpMMXY9gOUxC5PdMw/duXYcdE2Z/+I96x11t
	 WWLj9PtFKfrI14hxjSadDCymer4419XfvDnr6JTWtJIlFHCfIzlSoODOk7V3GVNqnkHFJ
	 ImV44iEGSiFwTtAgP9mbU5QfPec+MozcQRO1FIgYIqNg4bpBl0h/gd9HrQMiUA6JZ+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992604;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4O98WKuMZFJRTbvbzlnnvgGaYBO/AXydKl0PQzEXKgc=;
	b=e65uV/KkXLdNQ+yyo1dPFuaUlm1olZZwNTnfu/iq/nWJHBjNxX05EMT0e3ZDNeIwQFQ5
	 Q8iO8VatI7Xovif3HtyXvgwxIQ+6t4fpWTTsOiycDwleXWAmBL97tAQjq1ZcQFWkDHuPQ
	 RyljhkNp1VcXo8TiHy9FgL4EQkM4VMjfQbYOWTJ8arCzgkY2sBqjQX/TOsFmTPRhCreF9
	 htOl+xzm4+P+nYrhOY3OnuzJx5bhaFckbVaxx31t/HqMJYD7MQVcMduQcENQMs33PKdUR
	 w6PX1HfMYTrowGblYoqky7bOq0+XU3JPpACUtO4v5o1zxnJXBUSlAks71bGQ4prB7dA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992604;
	bh=4O98WKuMZFJRTbvbzlnnvgGaYBO/AXydKl0PQzEXKgc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=M+2aGf0Kpl3tjYyNiGn6gQFYg9PEINtwnjHxpdDkvcpZz53PwvkRVrxtd56DhJnAN
	 wjq83isLbVOaFIM0Gk+K77fbfBdOBZ4u9tRaZgB8znB1tnwPObzG/MkDuks1gIWtYN
	 xve/KetnfQd9qDeAZql9+44FbpFsPB4E4LAdQ+kQV6HhSS6n1PDBcU/d553/cO76cE
	 3FJzRXE9+lGMIu9EyAewlltpPvyczHcxTXV8EVXNzJVwtqBUqb99hI440luk7naFe2
	 OflDqYWFXPRVCw1pGNENTf6DYBoT3pJd1BuimhMZ53NEOrcXEmbMW49Jem71g9o1QV
	 9HtbUV3iK0kng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3640B60A5D;
	Fri,  6 Nov 2026 19:16:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC4B7362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDB52403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QR156dy49tb8 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0FA69400A2
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=O81F72/5
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FA69400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:36 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-8479f46ecd8so480587a34.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992596; x=1794597396; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=52tjoYqbwf7OWrsIqMUPqV15ejgHiKCLVmlChLttphU=;
 b=O81F72/59nsZKoa5Ew3FReexeNF5x0z8fRCOaVrTBOxdDF5stFWKKdaUeLXUuaDx+g
 hURdJxCtan1ru6r4jZMtwjsLvVx8DfRNzDHgrZuYAjXXY+AH/VbIh1ohUrdJa/VKDRTm
 mDJZZKqWok6n2lGP6oKrzUkh73/wEk6h25fqmpyDJXLqBQLVATxC9l/+rhq7qAjt6SNJ
 MmEnKZnJmcYmg4XPR5VBm63tK+tqSjtOZmMAoVJDhbqStnkv7i9ZKuZWv8QtaSgsKBVj
 qGc8rpSeAW+mT4i8Zmi+VwpsKDfBWaduqnNvx5v1kjgx7+G4jkk16tjd/oxrPmBt1kmZ
 z7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992596; x=1794597396;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=52tjoYqbwf7OWrsIqMUPqV15ejgHiKCLVmlChLttphU=;
 b=ZmvnsgQ+QTzGGHAmOzp7UWJn331TQey84Za4+O7Z56dK3S00RNtSV5Pu08QpdG41Ow
 ydo4hOnUaJ5O9j4nSJGfTmXFYWmCLcn3j0lKIJJ4n4xb3n3qBacWsoxVcai0+goY/Nrz
 IS5h8AeDrYn1TYo3f07cqoGQk3k1vMycOk1Y5Q9/8T/XPyWHEYAdDvaykTWSGy/alX2t
 YPR/pLmQYw+Claqd8GQH23k5aZb3+Z6xj8rjkb0zWax93BtBN96wxTOcMiA9cb+nrXox
 fCbNEwO9luaKa6D3fu5eP4xZMEkEWvhHlmXWsBaodKU1YNkpI98FJfnkIUPJtMr9Sbyz
 abcg==
X-Gm-Message-State: APuU4Z/MgvRgQcxs5Ypc8YoAHw9g2QoVRiatuW4Hgj6UeLWtw2mFO5/v
 j2N2EGlXnmBxP0/Rjk/ddidFsISFRIBo91hAMxZL9czZ94uzPt5HHYvYj1fu8A==
X-Gm-Gg: AYBFou1amZRzUN0ZPZF1JOVTx5U29xYOH4v73NLvUk0QQezvxJYb5ONT0iaIjQK0Z0f
 MnrdTyndrkvIHn0lMUoGEk2uTF3JoBRUMAsqkrUm+fPRtHsRP/6Mm5xct1NzKpPaHvB6zG6H/7G
 UPxwbRWlLUCNgr7BkExT3g6XIwzjjhJBcEwTzSLTM/eXVBedAm1RKzOF1avV9RJbYgizqgJNuRU
 7HiKYHV7fO9VwPVDXw2mJ5zKi4mjzui33n2jUjdeSIC4GfrHNb38EtYX5exvE+WTRN1LNL+op1g
 ErGLcIDomuZGwvX+kkrLZ+Yccrc4NyVRtiju+s8sdTA7uiww+pQnupxm8qU6YVEL6SOPs4n9PnR
 XVog6i/5r7YA7v1QvjGhuJwKn/Grq2HWFvt94ATrlr2FyIJVA3pIGMPBVJNLsboJphYDz4f8WKT
 mVuZxgWSrRt4qRZYwm44XW7nqm1sVpLeyRROTk4nHrXKx/7eU+H5uEGf60SbueJ7szlu+6w2BdX
 iuK7DEKAZNMDfZcyN0z9lQcd+x1ilL83mQJmLsiflDbZpvA35cCSPk67K3U/k1THrK2piBgjSAW
 7ClId6n0zzA2BgLpwI2NM39AOF40xnjoUuEKwKc+sPEKgm5OhcdwsXexUJGBcUTHB7hwTUsLbBO
 STqQ/XgtTv9FqGXzOo2UFGFbrVHOa205saPyxnXBWrQRrwBPqh/UDaVZmbb+/X+tY9vI6mjYP4X
 xM3Es1ipmekrmuow9/b9bUM75+honpjC2KAqmKsWU6LJ43lK/cUlKkRba0fwyOlwPzcmi29cf85
 A==
X-Received: by 2002:a05:6830:449f:b0:7dc:4947:36a1 with SMTP id
 46e09a7af769-85f1cf2e315mr3620989a34.12.1793992595931; 
 Fri, 06 Nov 2026 11:16:35 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:57 -0700
Message-ID: <20261106191536.2120153-31-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-types-setuptools: bump to
 version 84.2.0.20261104
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-types-setuptools/python-types-setuptools.hash | 4 ++--
 package/python-types-setuptools/python-types-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-setuptools/python-types-setuptools.hash b/package/python-types-setuptools/python-types-setuptools.hash
index b16553abfb..89f78b7554 100644
--- a/package/python-types-setuptools/python-types-setuptools.hash
+++ b/package/python-types-setuptools/python-types-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-setuptools/json
-md5  c2d13d00413ef92673581c250430493c  types_setuptools-84.0.0.20261006.tar.gz
-sha256  0f123655f44390a15ec62c9fa30b57f6dafe53014524d28b62cab1edbc303059  types_setuptools-84.0.0.20261006.tar.gz
+md5  ed3288615fb39d436b51f511ec87c64f  types_setuptools-84.2.0.20261104.tar.gz
+sha256  1ec758bbeddf88d52f963fe663beabc2117b6aae73cf3d2902d7dd0df81bd76e  types_setuptools-84.2.0.20261104.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-setuptools/python-types-setuptools.mk b/package/python-types-setuptools/python-types-setuptools.mk
index 0ca0056c54..d342d927b0 100644
--- a/package/python-types-setuptools/python-types-setuptools.mk
+++ b/package/python-types-setuptools/python-types-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_SETUPTOOLS_VERSION = 84.0.0.20261006
+PYTHON_TYPES_SETUPTOOLS_VERSION = 84.2.0.20261104
 PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
-PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/fc/36/012e992d81f3c3575e6428d53c2bbe266858cf1b7df7335476ab99f17908
+PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/d9/08/fe21d9b3e02c6a612ef01ee0212ef82619aec8d2373d74d69c4144ac2934
 PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
 PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
 PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
