Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF49C606A32D
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=O0EA9Eo4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=luJxv2Rp
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D4F260A7B;
	Fri,  6 Nov 2026 19:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOnhZjEsAYiJ; Fri,  6 Nov 2026 19:16:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A8038608F2
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992607;
	b=jVjDpM3U+Zx1A9BWqKaOjt6GfkiuucbGUdIQk0hV91KJLnkEtiALsK/138yYJ0mv9zpc
	 y7j+neKfTwPMaTww6mzKBu8U2BIPMkzVbMRBAs79Cf2DjWeMjAqhnzNS+2dyfsD2dOq92
	 jkT6M+vpDhfVudqLd7xcrSEl80pJDc9P8qmV0IzROWvRTeB2LqedL9eBFQ0kEelu9nRd9
	 5Pz42QUTf5RRDSkGIvKdfTCu9A1JdVsB/hj6OwGtJ0JLX2GzRPL8uaHfvNNqAQEzWE8IG
	 qd/5CGyhMcXZtbMpmeKC1Pw6fArWdeHojJY8HhoUheAfpLdXwNasBy9tx4upLI48MZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992607;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tXxs2E7WGSWUgn9GIDlgSOIHP4al7I0Bl9ZE1ckKnDI=;
	b=lzlFtwuhGUf3u1NL99eNPchN65XNCRQKC2mQpxCve9Ov8An2JwxLNe0GNRrHq79eVUaR
	 0iOHBgnhSXlA9e1k4lLFEg3lvw34kYloClGiFkW+1N4Wv4bmV5WQqjAnVqXBq2yLQIjr7
	 Ersm8PoGJeFRTpioygAsNllJsns8lHU24RjpYZ/jc5Osa6FljMw0YOTFj4SHXPaH1u7Re
	 heZ8YGdioyJGWp1qg3O13gLusVo52l6lNPN3zQbhVkjOX6VqjFbdQ+apy9WW2ZhmFcFwQ
	 pPHByrtZsBpUO3Pnjq//3ZEsjUxG5GuXZ0VlB9G4pH9PIFPU4+RfXQfRPkzLbnzTE4A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992607;
	bh=tXxs2E7WGSWUgn9GIDlgSOIHP4al7I0Bl9ZE1ckKnDI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=O0EA9Eo4MUIiuUFBK2lVxjJc1g8ody9/rHcjFA3QL+jxFouS5jSLC7HN0hh04ETjF
	 /eOgyq3zhelNHMrj/FWHdNiwXnUvdPUGEXGaHZITWdLI6jjMj9seBCBcHDIgrVqWGO
	 gloaeNp16Yg8NUVbb2kCPx6r53/IBhwmc87skuo1Nzzxis56bIAxsZiIX/t7pldX0F
	 P8xkoxN72J5mfjJ7cADQecwwfNAaCHL79TYZ1pRENw1M8Co8Su5L/Wd7iNOjQ36z9m
	 GnU58DzVjzX5GJqVvy5D2oyGXUJXSPAZlXyb6i+Q3kpgWOB8+vOBdsz+c3OPK7dOqN
	 Fi5KGdMc/pqhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8038608F2;
	Fri,  6 Nov 2026 19:16:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6F444B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACE66403D8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCqEMHRLmbH2 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DA3AD400A2
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=luJxv2Rp
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA3AD400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:39 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-846566246e8so908714a34.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992599; x=1794597399; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bpdeqO2MiMTBPjG+AWCrqWgXCPx5a18CZb601XsC4O8=;
 b=luJxv2RpPiv83OibzkePqs7AvRRQCxXxzVAi2aFpI0venzh8R3DJO8DHuIl05HQZjY
 uAPENfQcG5p3iKZNPaHg1Zir4730dFVfI72/hVxwSujgV9XLwJprjvjJLBIOd836+vzv
 nsQtUymwtZfEQF0G5EPBEthbsYTTd0gk0XccnAGiDnaRwdWiLxHq0n4PuaPAWP9Aj5Bq
 fJWeEBKc3aVVYJcNyIXnyvnQpSQ0BM2Xf9dIHmEdsZDIGMwWRAQVarHhI2j1yjcB15zx
 YNdW0cOsRhS9nTfQ00MlfWXGSMDm7aslvuq1p+xy+FEVjtiWLpe36FRv6Ymm4hxvyFmg
 wRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992599; x=1794597399;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bpdeqO2MiMTBPjG+AWCrqWgXCPx5a18CZb601XsC4O8=;
 b=MHWJBX4QfTIjgfpx+TRQneUXMGXe86RKMcoOu+iAf7Qp4ID7L5x1Uq6cdIwFl/i03U
 Na8mAhPGvAb7XG1k+cAMoZCGa7k7DlzxBZdEHc8fMor3F1LM3eEwkeECKFnjmXTjMSpo
 AHDMiel/8jSNShNrGD5klRg+Wrz7tkVcjiCDSHszJD8/aCtpH6C6kZfPGmzuWdtBcJtS
 fC/mlf/udQZ9t5Yg67oPU5w7kyxicFML4vzIgq1dEzaS60PHBdmTpijamuvimE7DJa5A
 TSwoE7OTgcOB0IN0obIk1OUcC9J3MrM/vQo7l7+8HcSHOWSkrnuKXHRa66Tv2M9EkAqY
 tumw==
X-Gm-Message-State: APuU4Z915+DQk91hnRxhga/YszPq3T6aHTBWROA+kHRdBc8esbAe1irt
 /huniV76t9vMyIbJTIljFvDPQbJTmlxxqjgNtpk3SjYD3yZtkjUPVHX8lFQJhw==
X-Gm-Gg: AYBFou3sC5hKVd3dLei88Ins7hGgzUWbvNJlJpidC60Fs3BI17cL3DV8GjjMK8HVXqq
 P8R5B5Z3inO8Opb3ZjArKfMuTKlIlF4UZx3XDclK4MOR7194Nr2WUm6XSxu1e1d9uZE56iPJyTW
 Vu+VOt24kcKKEXsj6IK2GhEtAlhiQpKQmEIN6v6l//MItTj/yN6uQfUrv7np4AwsHjA3T4p1VBz
 e4QoOmfz+xQ3vw8WH6sYfDF2XvQoli0kZvl/sfY+lA0YL79R7GRWMUD/JJNg3uX1JJPbexUgFmq
 IuEk4GAzwD7aeq/3NMtqzKqcg7BTr1ZOoi6BVXj4s8KK6Uh2asr0uEuxTr4SRMuYrBrAzXHIvJO
 +R8R7sOmTO7UP8MndI2iR3IDsin5p/PWQbe6RDayePbGPqjHFkHccoRCcNoiJPk8ZP5QiTFCTWr
 //WBa69dwOOt/JFVm4StILxYGkTUA4dwQFvK/da8sIKq6Ywvw8K8ev+c8d7hnz+K53cK79FyUZO
 g5rkervFXEqhFURIQLRgk0yVa9DtKvPJmsW1p7UzPZpgmJZLlBWtzra1m/KyoTcrqawBfcRZ5RB
 x41eQoMjxTGQwSmDjADn4Uuvqoe5xk0jMvjFsxaCHReKjTOu0IogP+Fhh6XL/JklqvPD6VRt+E/
 GfWWJz9jMIXjlcfOKD5G7qUGBjyMFz37EERDOZ9Skje2jDt5qCnEKukUQewXtcWpmLnq+HytqIp
 /oCm3JoSNXU8lMaopG9F+h0wjWDqPHis50V0oPWDkspOrU78LKk5pT4gs8gbX4yTDvgB/nXiRIX
 FMHxUz/GziHFbxbk/JQslI=
X-Received: by 2002:a05:6830:270a:b0:844:53b7:9890 with SMTP id
 46e09a7af769-85f0586542dmr3778625a34.8.1793992598930; 
 Fri, 06 Nov 2026 11:16:38 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:59 -0700
Message-ID: <20261106191536.2120153-33-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-ujson: bump to version 6.1.0
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ujson/python-ujson.hash | 4 ++--
 package/python-ujson/python-ujson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index 0d5fff4145..14b1159f4e 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ujson/json
-md5  0821265a819a657e8b9fc5147e4cb3b7  ujson-6.0.0.tar.gz
-sha256  80e23393feb707582e0ad495c397a4477b646d08094d2df64f7316f9fafd8aae  ujson-6.0.0.tar.gz
+md5  b6e936a6267ceba1ee44a40358f34cef  ujson-6.1.0.tar.gz
+sha256  aef7ea4cd9e2e9f8a35c4538a9780d58c80d76c5da66a8dad269b4cc6d930c29  ujson-6.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  36866344f0a486541bd9800f1a407a056c0c214a82c658f059694daf3dc394d2  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 11059ef2eb..8769cede36 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 6.0.0
+PYTHON_UJSON_VERSION = 6.1.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/64/7c/e1fa3fb70b53192436d751b5cb671f0ee960baa188b8351a7fec735223d3
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/e0/60/ad782f70ce03d12ec23288292a17549ca537f9d188227340ac0d082421b3
 PYTHON_UJSON_SETUP_TYPE = setuptools
 PYTHON_UJSON_LICENSE = BSD-3-Clause, TCL
 PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
