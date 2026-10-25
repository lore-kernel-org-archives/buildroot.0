Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70129606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=h9iWviRe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=D3zZPEBs
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34254405FF;
	Sun, 25 Oct 2026 21:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DhjOGEcDvJrD; Sun, 25 Oct 2026 21:11:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 66AE5405F5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792962678;
	b=QZHlG/ZUL1liAMGQfe0D0PeY0ezu3A4xUvQqh6/+aJTa+h4Urs11HUgFz/Jgi06cQ45e
	 O11edbVuqWq1HUk4aj7gTggpyvVySPlh7hYmH0PXUHa2ritENOf2yEW1sW++6pfcBiKwh
	 va+UByss6e+BTatYK+iIiH59q17Da6vi2Kc0zDe//MZHZIJ+xg7AELL3hK/x+fslRBd4A
	 MTd2SmR/xiccaoxeIg59EUhW2JPpBI+I8sj/1FTv0ZSOStqMrElOqMTfAUijHBlu1oMXj
	 HymHTrOA01gmWEwHkNt+6lK/ObcsB8O0+59P6ODbjdrEp55nXq1EFgjeVbMf75lkotw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792962678;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3TGT3Gor5KXzYj9zadzlNAgazdvyPkvXQD8ai3M53/c=;
	b=dOTvVBl6yI+uYCVIwlXJZVVAMDUAr7VwgS48tSh60yPCSMKv3nZHW2gOdrtkYVhh+Lwk
	 nnA9HvUZqxXPL0Z2egyH8YOOTpDBqy/YvJIqURYcfO61+lsiDtbXKz7AdJycuUYaHdzBZ
	 agir+yObEBC9oYJG1GkeRTnI7KSP9Lzj7+xngLXSXePDXCG2N5I8WrJea5UtL4LJyVBbn
	 WkpjqSy72Dthuc/JKVxAIfTrvcRlQw1LRPoQfZKbTHlnPCXuSJaTfe13AsWjiG6iikl5A
	 FiVf6x/O4YJUojlnQWORL0nFKYacJngHAkwANLk/DFO/bGZoSG+hEAG59YyNe1VBZGg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=D3zZPEBs;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792962678;
	bh=3TGT3Gor5KXzYj9zadzlNAgazdvyPkvXQD8ai3M53/c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=h9iWviReHQU+oE6Q0pGMmZw4af4ARqVeXsmAj/1pWXCr4GVFh5O9bsu7wZU5wblUY
	 GyOolGpsDpurYCXSEOExXdtBk8t9HMDktn/gVD+hxps46X7JLjNPpQKzuAT+GxosuZ
	 ibGQcFDSwMiDU+ILkGPIJY1c8pmOTIU8YCOLJVUA+kkcay282he++tSGQUWox2TYq1
	 TKcmmX/8tCp5fzwiN9CS1HxJqngR9KCm/n+feOc71qDof3F75dixX6MCiprcGuDniF
	 HfJdYjl+FwsDYOISD/UX0nCYbIN56f8VzR3LXBUqNFG/6jh2nRjVl9UGKhLmyj23Mx
	 xqVgZe4sPqTqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66AE5405F5;
	Sun, 25 Oct 2026 21:11:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A3C08279
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89961405F5
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0atLnokrUcn for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:11:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9FDCB405F4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792962675;
 b=kf3DBEpXJzshWoZSlXV6vTmZ2vwDddz11bGOBzGpKefQ65bbjE9N44THljSkW//2bnPt
 0zgfilPPciGF9RDAx7gdRSVWtkm6iV0icRmMtApv1h9gvbQheleBqgggicNziZBXwg5HU
 uliUr/pa9Uqw/wwGzSW9aYogifvHGydy3NSfpola3eb2nBZSp9Ag9L1kuVilkVMOqAK68
 5r0S0wmoxzrCiCFGIuugIb28EHvFeNxD+enWDTNUW6OdX1Sj65l7Jm4CLRNoFg/fM2bSs
 JL590r79b1RNYHJseHsx8Dj1pNdJXIe50UBVB22n3NwgyISoam1bmLAqQqsloMJKM8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792962675;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=fy9wz7XM+t17X2erpImxr64iTQX5JXMY5qOakKlxKTQ=;
 b=EJXZ5Gy+7UkW+d6iayIe4nXQCpTuqOLThmkJyX5gYe7cnRatZDxNd5+sdfTWRkSLcw/l
 K7mBAHvZhrHUValpaMxRvgwz4idsgX+nnYP4UX++VDX0+GFDdcAM5wOTrq6McvR7yWgVF
 /EmA3l4O0hK5M+ymUB4LvUO9I0tfLlaJc57ByZgcCx5xYjthJZutUohwalgVsu+WgMYBG
 zjkES/nUNo1GUv61LKMRu4xthORDWgEo7eXOVUyJPaUT4KLLUMssNiB3aUE2gCld0sfMw
 /0E2POmS3cjUos3BxkYygii6ZwVJ4C8kTMZyMHZskaqZ1+n55dSlfIS3hazPT/zbunw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=D3zZPEBs; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=D3zZPEBs
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FDCB405F4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792962673;
 bh=fy9wz7XM+t17X2erpImxr64iTQX5JXMY5qOakKlxKTQ=;
 h=From:To:Cc:Subject:Date:From;
 b=D3zZPEBs2zfaqdPB1WUn5X9S9Er9GOF6pb4cSI6bYbDaGjMr+zNDKcbVQ/Tmkcy/8
 9uB/yn0MmeuSsHz9IsM/FGqrUQsU9mS9bKkgc8tWf/XNm09uVZA2HhuQmTMEA2uhB0
 L954KVvV3QFzMYMegpKiUiibDG5M1oByi0JSDWH7QuteBb6SsURDCLx+1HLXDQHjBU
 Lk1REBMAOklpWny0BDU/D1pnzqK+dgskURrQcXDkt9JTPV+Tl21DIjI36m2BZ/31k2
 C86DkQ1XFMj2A4j5JEH9MIieMO23Ji6lekENCOi7Hnme6USwOlD++pu4zEVxxI4ltt
 Ud9REVmi7phdg==
X-KAS-Sym: v3:f51bdf72230551df:iVZcjZqEkY0mT81rvb4fyt8GQn994A2swy76MoxvKQm5F
 gPbbCiyUhPQv0DozOe5Y+Ff9XX1g665KIcnBC4UyWhVewIo7CvoLwwOmbrXgTK7YeKPn1c30zsH
 +8c15LPVz7DTOiMcI0s9rifIufp9EQ+bq3ZOpggPRQlQCdN54/V3OpcivkNsXiknVR4wAWhy8QM
 qlV2f5NUba0H/5jisOt+aP6tAND7f9YWlRFhunM9ZB+sD+KOIWWewBOokJu7E916S9pd8+TLgLS
 QbUjyKkhd+UsKXxFlR96Nzd9rgCIzfQfGJJt3mlI47B9SZkpntuj1+dmhY6iAWIcXPynKSJA==:
 Ti8CcVRKpouIIKMJ02OHmEyVA++39dZN7LQxnfP2e2YBLWxIkjcffa7Kmo/I3neV3oohCl8C3fu
 FlKrJ6IX/nCqnF+qsZIXPYR+hd397/66S+i4ghcbNlI3N/Wi5B2anOiIfkKjnhtVJxK5H7fyyj5
 uf3dRaWVEIKlIp5fZPQ6NByzcYSZs2FMxLXf4fBL/ex7uZCzXOR4/mexQaOJqLL7b9sdXJSyOan
 R5Fxbrj07ljHTpnSBvC+RBtx268a6upjfKxxUCGsSTRIpmXdEKsQ0S+iPH9Zdo/bcPRAwmsMblu
 Pm9+/7jZyTj/1UhS7FpgqeE2pPZ3rXco4lUsShXNWy1BnjMJ/z639u1PjD9JqYoe1hskbExlIWF
 173hhKDb+DP2d4SWj5GHONWKCcB4sRqLUwjnUFXMdr+RPQ73AQNDZGgwNoYVengWzBtOQxzXsdm
 tdhj1JMoc4BhBerktUVLtrhpDwu6VJ7sOzoxIiufgawPCP4oUZjT6a02+DqkSCsx33OibcTrxhk
 vxmQ983KvO5HMpQ48qVcj/Ow0nVchcTUn4G6j3JhJv6Pg9VFjxp8IcQymoUyDUQrQT/kmPR+ge5
 sgIQJe0T6vBScsej5Ax3wiLzRV3/gWd+ftloku2O30ZebS+J7pTo3oe3Ii3u3Q==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C566AA4C6A1E;
 Sun, 25 Oct 2026 22:11:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42208)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL5Un-000000000Ee-2tlB;
 Sun, 25 Oct 2026 21:11:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 22:11:13 +0100
Message-ID: <20261025211113.561701-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: fix
 build with setuptools 84.2
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit 2027954db7f5f42ed976ea2f4655e0cd224c7ee7 bumped
python-setuptools from 80.9.0 to 84.2.1 causing a build error with this
package:

ERROR Unmet dependencies
 (checked against /home/autobuild/autobuild/instance-38/output-1/host/bin/python3):
    setuptools<84.1,>=68
        wanted: <84.1,>=68
        found: 84.2.1

Fixes:
https://autobuild.buildroot.net/results/036/03644dd6955f4f8ccee2b0fe14f4500f0332c2bd/

Fixes: 2027954db7f5f42ed976ea2f4655e0cd224c7ee7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...1-chore-allow-setuptools-84.2-builds.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/python-charset-normalizer/0001-chore-allow-setuptools-84.2-builds.patch

diff --git a/package/python-charset-normalizer/0001-chore-allow-setuptools-84.2-builds.patch b/package/python-charset-normalizer/0001-chore-allow-setuptools-84.2-builds.patch
new file mode 100644
index 0000000000..67969bf499
--- /dev/null
+++ b/package/python-charset-normalizer/0001-chore-allow-setuptools-84.2-builds.patch
@@ -0,0 +1,26 @@
+From e836793ecb0bb79b87a14e369370591e87a8bc97 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 25 Oct 2026 22:07:00 +0100
+Subject: [PATCH] chore: allow setuptools 84.2 builds
+
+Upstream: https://github.com/jawah/charset_normalizer/pull/828
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index b80909b..aae3185 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools>=68,<84.1"]
++requires = ["setuptools>=68,<84.3"]
+ build-backend = "backend"
+ backend-path = ["_build_hook"]
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
