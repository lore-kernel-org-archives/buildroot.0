Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971B4606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=S8B45UEb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F57C40723;
	Mon, 16 Nov 2026 15:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xm9kRDBmyVke; Mon, 16 Nov 2026 15:39:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 755D240729
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843541;
	b=tQ1M+kqyiCkY4NnVQmgyix6L0gp12shW/dPMFZMoh2DOXgQerRR7T5lIc9P3jwG/0zwk
	 56BX1rk2NNLm/9n8IwFc29h3YOpR4L2m1/BaiSsdfg93f8rI314NFtpLO6PFTqRVNRtaj
	 EBM42B6chp0Oml0r2p5N4jk4vbZtJxYSecASZfn2jdTlgdqjwTFduWXLEkVDtIFKWm82l
	 pZWDbqqW6bZCYAlD/0xqGk7zUN9E8SE85xqe0pu6yjygsNEP1skqJcWHNKVc4MXB1ZuxN
	 IX/BcWuWA3DykhZHE1qIv9Jt/3P70BiEMjzxJTkNlV28wlV2z2fBoxfQGG497bc3y9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843541;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OuhsFUQtLCkoeVWdWBUWmpqoS2dPYRDCjEc0zpPIv1w=;
	b=PtyNvOKs3k7YkrVJI5+GQNSS8tQQ4fXp2XlvZCF91osaUi6vcQ7moiO9bs0F6J/zzGgQ
	 gelf5CQ6sH3/NXXtTfonZi1HQ5Ft3zcPi4J+i1NjQTRpM6xFIXIHEMzGL8ol73nDsKiq7
	 ypj5GL2yoYEdv++ccyeWLvbJY8wI68R21hjcKTFYrrJiyBfsiW0TX+hVwChhD4MRqWAXJ
	 6lTHDXNuZVku56aZxLTqyZ1Do1bfdcou7wkH40/qD7SIfMlHdOHzU35tmQHxA+qfdiaTk
	 YhnIURkVy8Cj8kOexsNrx3alHrbEUzBhqv9Pzw0Hu8/1LBC8hanPv3QEmb1MuvZnPjw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843541;
	bh=OuhsFUQtLCkoeVWdWBUWmpqoS2dPYRDCjEc0zpPIv1w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S8B45UEbm+7TbaDI2j6PkS12jls60sPpjGPB1+wru/+qcs/K27WHwR7CQXpHOq/0B
	 Gwe3Zv7AlM5UhsgtoVFDEdsdxeMzf/n1rJdSKRtRXVpScH4zbpztN3q4ycsJ/bh9is
	 4Fgq149UqT6G4X/19szprBP10oeyDvtDkcAsF+E3VF3sI8vV7IrH/+DByc0jKAvWOJ
	 GVaBWntAV7OhJ47tP5FLzeum6TBnn06FxrJtzaIesdJ95JjLWEgxLomwdsX5RKwe36
	 ET5WiCfBZ/jgvUp3erXpgV2F7a4ewSLR2H8//tc2AQDQZlqH3zx8WrKO2hAhBFc9/U
	 78SrDRt8Txzzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 755D240729;
	Mon, 16 Nov 2026 15:39:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E17E32FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D31EA607F3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xk0Yqg1cvyL4 for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:38:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4696C607EE
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4696C607EE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:38:57 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4a2f4ca0dcfso180385f8f.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843536; x=1795448336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MgkcmtV9XXj4bYIgGbTd4xw1U+VjnR+vruwFZ3fUoD4=;
 b=1AH9pG340SOjF/xZdq8dng3eR8Ij2iwU7++gT1BLVb/kyk8YSBLO/9WVADQAsCk1xF
 70ZAOCLM437uj1ab0+/oBbp67dCbsRmMyc/NKpgBh5UvSCgd5d5i6ZGAi2kNw20oghSo
 0kWegeg2mN9pjk/mLc4uKQ/+/eZ4rjstFWid4fnJ4JZdsARbHi6WtNTLL3mJRFvYk0IT
 HqQke/aoONoOMsTbys4oeNmwJvSyufZiGu+P8MJRmhH128ewP0Yb2Oe4wD2OEsCwNKhN
 96xa2xqf+nrKs73CCCsQgsSJeaOFO965bVbVvqPOg80u1D2blK9nFyW1nQIKvBvdaJUZ
 237w==
X-Gm-Message-State: APuU4Z9yfDLHczcx4Jl7AVF0reMia47zS/X4pd/j8EF79pl8INDYlcmT
 ML5vp6CEPrMgnF0WQMkGaijgGCzyafNyjp3pBYt1v/UN4XAT0puulhIzgKhBLtGmYyQmUQuTyNG
 BwPimGVg=
X-Gm-Gg: AZFdTZcezilJ5FRAbp4Y6urqzujh/CgfJRCaDK4z76UBIVHG3fryZwmDj8wA5oPz6ZS
 bvHDhXRubHJ+A0nxK+qxFhCA0JMg04sM0DDd6eLpkQHYvRje1mth5B7bDBiiSvr1arTr6RXiIhJ
 Etm+SB83V9EPdi0YkUeXk8a7hHtbL0gizzKi8mWy76CgaTT/ln43bDLqNEiyqQaBd0AnlU9/TLY
 zQKZ640aJAfsoedEkZ6D3PUC2w12AgUTMvFBNSnrYaso8/feBD/ab3ZderYF5F/+wyUtwHqWIOi
 K9iIwwP2/3eVhu3B56fhLx/NiTrDetjRYOQGQ43Mmr5W6xF8RykRSU9pbHUQO/bn466IR+6R19e
 b2RPj9g2esngwpK7XB+0N1LDWkgqX6ZVKTEcKwMHnfTR5J2Hl1um3ucwvLcTjr/SDwFyfGG4Kyu
 pMubWugelCe2Ap3ml6DE5YiGepSxPP0Pw+tSosCCMvPletdQRMGTr0dvd+C9wKgZ0xxqXk3Z9WY
 TL8ms/ASXCp38/zb2M61wkmXCkPnbptKWnTi943iulvHa4nEiNNIVndHoS+un8Bmz0NuwVKYzHp
 z6K+NY/8I117C3exWs/1u4km8r3rUS+lf4dVxnILRrmFjSvocSc8
X-Received: by 2002:a05:6000:26c9:b0:493:32cf:ff9a with SMTP id
 ffacd0b85a97d-49c7325c195mr25289522f8f.56.1794843536138; 
 Mon, 16 Nov 2026 07:38:56 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c609c651esm23428115f8f.47.2026.11.16.07.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:38:55 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:38:53 +0100
Message-ID: <20261116153854.725056-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026191003.2809788-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/piglit: bump version to git
 commit 37b7926902
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Added patch 0001 to fix build errors introduced by the bump of python3
> to version 3.14.9 caused buildroot commit
> 1af96e786ef1d420bdb66c285a77d18df97db689 which is not part of any LTS
> branches. No autobuilder errors were recorded.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
>  ...-reproducible_mtime-should-be-an-int.patch | 33 +++++++++++++++++++
>  package/piglit/piglit.hash                    |  2 +-
>  package/piglit/piglit.mk                      |  2 +-
>  3 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 package/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch
> 
> diff --git a/package/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch b/package/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch
> new file mode 100644
> index 0000000000..0a30d8bfe3
> --- /dev/null
> +++ b/package/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch
> @@ -0,0 +1,33 @@
> +From 4c98e386fd91fa7306ba88d609748d21902c7eea Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Thu, 22 Oct 2026 14:09:08 +0100
> +Subject: [PATCH] tests/serializer: reproducible_mtime should be an int
> +
> +The mtime argument is an integer not a string, so parse it with int().
> +
> +Passing a string breaks piglit with Python 3.14.9, which does integer
> +bound checks on the specified mtime.
> +
> +Upstream: https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/1269
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + tests/serializer.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/serializer.py b/tests/serializer.py
> +index 5ee9a1578..f7fdadf43 100644
> +--- a/tests/serializer.py
> ++++ b/tests/serializer.py
> +@@ -140,7 +140,7 @@ def serializer(name, profile, outfile):
> +     tree = et.ElementTree(root)
> +     reproducible_mtime = None
> +     if 'SOURCE_DATE_EPOCH' in os.environ:
> +-        reproducible_mtime=os.environ['SOURCE_DATE_EPOCH']
> ++        reproducible_mtime=int(os.environ['SOURCE_DATE_EPOCH'])
> +     with gzip.GzipFile(outfile, 'wb', mtime=reproducible_mtime) as f:
> +         tree.write(f, encoding='utf-8', xml_declaration=True)
> + 
> +-- 
> +2.47.3
> +
> diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
> index 83c4c1fa3f..eec163e17a 100644
> --- a/package/piglit/piglit.hash
> +++ b/package/piglit/piglit.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  b7892506de63d4f5b62c6e5dbb0c7e0d14497cc4617f8784e4e446bfe81941ec  piglit-ec0fc2fef0755b1595c3799ab25129174a4b2007-git4.tar.gz
> +sha256  9b9e1ca74351e32627c74a95ae3e18c47feb953b5b32c5c65aa2b275a5bbee4a  piglit-37b792690245fb543d9e9a84a6484d6d8cc99ec8-git4.tar.gz
>  sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
> diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
> index c4c004c824..24119ac10c 100644
> --- a/package/piglit/piglit.mk
> +++ b/package/piglit/piglit.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PIGLIT_VERSION = ec0fc2fef0755b1595c3799ab25129174a4b2007
> +PIGLIT_VERSION = 37b792690245fb543d9e9a84a6484d6d8cc99ec8
>  PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
>  PIGLIT_SITE_METHOD = git
>  PIGLIT_LICENSE = MIT (code), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
