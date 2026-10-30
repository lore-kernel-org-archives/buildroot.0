Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABF6606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oQmagIlz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A8DD40C56;
	Fri, 30 Oct 2026 15:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NefwS2zTJl87; Fri, 30 Oct 2026 15:29:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 66F8740C64
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374143;
	b=DC+DtKnsscuay/KW+is1Q+6rg7/nCnoU0FRca1ILxoX+UCi+s3wA1QUkB2OX2hlNV1bm
	 0QdP2CGQxb9yYTBGblLSeyQzsu6lSUUmm/XUPbXG83drFlYFbpZvR7jNHEJg7hDrU260V
	 YvnpDdtUxTT+KmZ3vuM2gzdPrSM28pN99UcUOcLtogNJFA1O8AgHLdEOKXbzA/MU98Vwt
	 vfOB5X04NYz6w21XICr6nGy03gwpipnKbNuPU7O2wfCj+T72+bJHUQ0sA07PkdYsMIQ5d
	 lqhynK+SB4HdCkiRZ+fqmMYUAit4Ri+yFnicASyiuf3YoJCuFrcCt/DfusSbKUZ39Tg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374143;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CkFiT+3l/TR90hNQq31tXN0vtDyfVoddoNOF4+I+G0U=;
	b=kmhUnicekyrIMBFUNgL3gMeryl/wSGV/H9SycXs9Q6FgL7jtWex/aIwYGJ2HyHzXN4Zg
	 SHlOhspTRSGWePhV5y5CGlFTrkihxer/KHeO7nE0vK2rZUPwJd3KP+C+dnhShWwIfUCWb
	 A6RCyhopfWGpElob/zsDPyeq0Yf4WxUH6Q/unkNXaLutHJrfFGKRKhx+2HB0TNByUARYe
	 psuIeRTcGqx18xR0sCvqIAkI0MsQH2hAqYN5iy1o7NoKaicqYNi9yVXSzXnjwHYX7Hk/8
	 FFheNd0AzK7e5HITyz3w2L4FMmLmvsZ3COGzZwIS0Ku0PVn9CekqB/FmxKPmNJd5ItQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374143;
	bh=CkFiT+3l/TR90hNQq31tXN0vtDyfVoddoNOF4+I+G0U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oQmagIlzKG3tMpaRzLOR4IjYeI2ShfAOaVyb+vF+hK+apg5ghHggDL45ybIojseHw
	 RjtnJmR6JOWfxRExOHBPCe2HCoOira1kKr5Y0ZgU5YRiXM/CQx5HmbmfmX1qzuxZkm
	 1qEIAIN+jedpdMwnWKrCCUcsmhfjx5qP4Q9nppQldWouBe3QH67lREuVPQYTSHbVh0
	 J9sEnb6t/L5M8bLiqdohprQ4s98lkD9LUNzLS8SzT0m1CuaegmhBleuFYmedVty02G
	 AJHQaIVejvgCqpZEI77UWuy3ES/jqFOc2rqy5rya0kzc5PlFFibiK/xp68pjnhSZ8P
	 GhrJL9U2GKEtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66F8740C64;
	Fri, 30 Oct 2026 15:29:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F7CBD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81DE340530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id suyxY4-LYwUZ for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:27:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2A2A640211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374077;
 b=atU52LmolkCHAcrNcg46D4RBtap5SkQj78T/SyMpxgHaP/LhkzIiyzu2nHh+zlLKE4js
 cILSTOxBySUAL14xV3Zsn+0AsRE6MOfrL8x2T6l+gRyoYzdwMs0kqDERR/0M5EQKipdha
 i+xUGARZFob7p+uyrhBeY8MpfIISFI7IrgjCT+pnFXE5VcQOhzuwIhHo9qwoKCvcGanRQ
 UIVkTwMhJzcXvffhTznohEPwDbSHJalf4tpqUYoFbRy9ZY20/iVPoMEWjDWoYcweKmzbt
 2/KAizlI84S2XcwUJTp1rDWU0ZL+uJh9znmc/BtYlbBo3NVzidfCmkfNu1bMTYElwjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374077;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=mU148vf52kCtOsN3AI0oOJh9aaxEvocOjBEYcA6XhPA=;
 b=BAwlbJS8DERKq+uvmqQo8/Cdf8Gu3to1fq6xrM++xSqRTZgfXhfJtrdCji45gQ7YSGk/
 Z33gh+t+LWaHQow7pBEaqTIkxfH/dDMyGb8u3XKnnUbb2JO2C5fPEUsEzzVJ0g8scDT+h
 vdEg4wAPjcPhrPb/bNYPIx6Fw+ev6ceup2sUqQRDx3rqe0xx2WjbAKwcFez4wR9MgyPD/
 UdGaQvqM2qjbtwWTZNEEzpLnZUu0djT6vddrq3wwpuLZzXJohlOufGNAmj7e9dJx3N3Gr
 9ikrx/HGHHc12y6M7qFUyPxpQN9lnXpSy6gXRn9JxPcW2K1lp+RdMfhqL8xaCQxRx/w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bmhpXZzD; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A2A640211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:56 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48e46e449e8so540992f8f.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374075; x=1793978875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mU148vf52kCtOsN3AI0oOJh9aaxEvocOjBEYcA6XhPA=;
 b=24L5EUHP4jpAbSWnnUaCifjALN/1Jv1IuwOBXzJ+OV9CPDiVTNmOxkgDFcDU9a2Z73
 uORvRwcLA9gU9ZrZy/DixgBuyzUESXN0l0iusQpCFemNd+uysRy694cxt8uqJZSOOj1/
 VDSeSMLHU2DyJEBeYux7/oWxmfP9vj+e/GhhsmJldNT9RO9YON23g1LSo9fvvXXYg3cb
 hqKU1FZOCnb9twr1E374OlQmFG8mWSEj7lCFsk1unrX0FvkfhC/ARw7r1mRV7LbELBZr
 a1l4rjaKoFAZa0RhqPBgNytEdmROmS1QexWXynnZ9BWFNlHvnf6XdP/YfxoCrjTsnz9j
 oW+A==
X-Gm-Message-State: AFq9FYLKF6VbYIssnml6si61AIx6mBEu4BfU4xkhq9SMuF77glhS2YfL
 xz8O2d9n2ZKM8VeJTaFFjnm2tisIMGdgEARfadEEPKCDGKPSzoTzJDkSIBC3vlurW0xJQqLlFWZ
 Z83IRUJM=
X-Gm-Gg: AYBFou27ac8gdAimGHJOfPd8J/pNBwogxpILSHswvp4m92YgyQO3h+pwznHl2W1s0xO
 RzQ8drN78bDj7qhtuFvvZEgHZn0av1HGa8c0JzS8son13DUr8E2Kfm3JR75iwjUd7VSpFnsZE4J
 fUcVUeIPZd/kUpkKQ8FwRk9qEjamNExkJvdXf+A6vyi0u2Pz5dy00OaX8D1UnzHI92hlPwLs3kJ
 bql8+8D3UcILX3CM1lsJXX4kXKreXQk6VjQInkO1LAR4FawC59trQIKxZeDTUq1HKnpZbwn+BNx
 WFbRhUhK5SXPz0V6u6XGo7cEzHWZnSIMQJkL+g7pBvSuMkUUE1/jXfu/KS+Wb6BiR9DEe71Hm80
 REpsr46ci4KYJTa3oIlq6lZhVqBxd/RRg9rN8ovBaxdHVhhsKgpLDq4nSGYKnEdiT9ef2c8fidt
 nn9sxMhaoqHIkGqbFPUZAPWxs1nXvT/4NmEddr5SymbJMetRwf6SBuP5Wye7jF5N3rrWltcM/Is
 jR0icrRaog1KvmVFgbSg7CYzHzxup/putM7uPpxJh6oenykcGHrSjLo690oH1QK4+1cVgjWbd6U
 zda5KMXmomlgDpePvg8TMrUMB/fBLx3eaF82pd16QMOMU0xWedSHG+X/Ne6sjFfr/RFnKaB+
X-Received: by 2002:a5d:5d85:0:b0:48d:df08:307c with SMTP id
 ffacd0b85a97d-48e6e518e9dmr5846560f8f.44.1793374075025; 
 Fri, 30 Oct 2026 08:27:55 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b78a1dsm3704065f8f.24.2026.10.30.08.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:27:54 -0700 (PDT)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:27:52 +0100
Message-ID: <20261030152754.1907024-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261021203410.3114473-15-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 15/16] package/python-pkg-resources: new
 host package
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Setuptools 82 removed pkg_resources, but older U-Boot Binman versions
> still use it. Package the standalone PyPA snapshot so these consumers
> can keep working when setuptools is updated.
> 
> Add a small setuptools pyproject.toml to build the module from its
> repository-root layout, and include the license addition proposed
> upstream. Supply packaging, jaraco.text and platformdirs explicitly,
> as the standalone module imports all three at runtime.
> 
> Add a host runtime test covering resource access, dependency resolution
> and cache lookup.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2026.08.x. Thanks

> ---
>  .../0001-LICENSE-copy-from-setuptools.patch   | 39 +++++++++++++++++++
>  ...-metadata-for-the-standalone-package.patch | 39 +++++++++++++++++++
>  .../python-pkg-resources.hash                 |  3 ++
>  .../python-pkg-resources.mk                   | 17 ++++++++
>  .../package/test_python_pkg_resources.py      | 14 +++++++
>  5 files changed, 112 insertions(+)
>  create mode 100644 package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch
>  create mode 100644 package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch
>  create mode 100644 package/python-pkg-resources/python-pkg-resources.hash
>  create mode 100644 package/python-pkg-resources/python-pkg-resources.mk
>  create mode 100644 support/testing/tests/package/test_python_pkg_resources.py
> 
> diff --git a/package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch b/package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch
> new file mode 100644
> index 0000000000..3ecd63fc8c
> --- /dev/null
> +++ b/package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch
> @@ -0,0 +1,39 @@
> +From a5315eb2caffc9b4a43439df81e6a0d7f7647352 Mon Sep 17 00:00:00 2001
> +From: Achill Gilgenast <achill@achill.org>
> +Date: Sun, 15 Feb 2026 15:58:35 +0100
> +Subject: [PATCH] LICENSE: copy from setuptools
> +
> +Copy the same MIT license from setuptools, just like the rest of
> +pkg_resources that is compied from that repository.
> +
> +Upstream: https://github.com/pypa/pkg_resources/pull/20
> +Signed-off-by: Achill Gilgenast <achill@achill.org>
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +---
> + LICENSE | 17 +++++++++++++++++
> + 1 file changed, 17 insertions(+)
> + create mode 100644 LICENSE
> +
> +diff --git a/LICENSE b/LICENSE
> +new file mode 100644
> +index 0000000..1bb5a44
> +--- /dev/null
> ++++ b/LICENSE
> +@@ -0,0 +1,17 @@
> ++Permission is hereby granted, free of charge, to any person obtaining a copy
> ++of this software and associated documentation files (the "Software"), to
> ++deal in the Software without restriction, including without limitation the
> ++rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> ++sell copies of the Software, and to permit persons to whom the Software is
> ++furnished to do so, subject to the following conditions:
> ++
> ++The above copyright notice and this permission notice shall be included in
> ++all copies or substantial portions of the Software.
> ++
> ++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> ++IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> ++FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> ++AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> ++LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> ++FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> ++IN THE SOFTWARE.
> diff --git a/package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch b/package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch
> new file mode 100644
> index 0000000000..e9982cd1a0
> --- /dev/null
> +++ b/package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch
> @@ -0,0 +1,39 @@
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Tue, 13 Oct 2026 16:36:30 -0600
> +Subject: [PATCH] Add build metadata for the standalone package
> +
> +Build the extracted pkg_resources module as a standalone wheel, mapping
> +the package to the repository root. Use a static version for this snapshot
> +so building an archive does not need setuptools-scm or Git metadata.
> +
> +Upstream: Not applicable [Buildroot snapshot metadata]
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +---
> + pyproject.toml | 19 +++++++++++++++++++
> + 1 file changed, 19 insertions(+)
> + create mode 100644 pyproject.toml
> +
> +diff --git a/pyproject.toml b/pyproject.toml
> +new file mode 100644
> +--- /dev/null
> ++++ b/pyproject.toml
> +@@ -0,0 +1,19 @@
> ++[build-system]
> ++requires = ["setuptools>=77"]
> ++build-backend = "setuptools.build_meta"
> ++
> ++[project]
> ++name = "pkg_resources"
> ++version = "0.0.0+git.7fa76c17"
> ++requires-python = ">=3.9"
> ++license = "MIT"
> ++license-files = ["LICENSE"]
> ++dependencies = [
> ++    "packaging>=24.2",
> ++    "jaraco.text>=3.7",
> ++    "platformdirs>=4.2.2",
> ++]
> ++
> ++[tool.setuptools]
> ++packages = ["pkg_resources"]
> ++package-dir = {pkg_resources = "."}
> diff --git a/package/python-pkg-resources/python-pkg-resources.hash b/package/python-pkg-resources/python-pkg-resources.hash
> new file mode 100644
> index 0000000000..e80a20de6f
> --- /dev/null
> +++ b/package/python-pkg-resources/python-pkg-resources.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  5fc3f3fd8e23438a83d366897ce4389d2983d977b4339303359a0ffa0a33c15e  python-pkg-resources-7fa76c17eacf8a67c6932c9c2dd97861f42439cf.tar.gz
> +sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
> diff --git a/package/python-pkg-resources/python-pkg-resources.mk b/package/python-pkg-resources/python-pkg-resources.mk
> new file mode 100644
> index 0000000000..35076514f4
> --- /dev/null
> +++ b/package/python-pkg-resources/python-pkg-resources.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# python-pkg-resources
> +#
> +################################################################################
> +
> +PYTHON_PKG_RESOURCES_VERSION = 7fa76c17eacf8a67c6932c9c2dd97861f42439cf
> +PYTHON_PKG_RESOURCES_SITE = $(call github,pypa,pkg_resources,$(PYTHON_PKG_RESOURCES_VERSION))
> +PYTHON_PKG_RESOURCES_SETUP_TYPE = setuptools
> +PYTHON_PKG_RESOURCES_LICENSE = MIT
> +PYTHON_PKG_RESOURCES_LICENSE_FILES = LICENSE
> +HOST_PYTHON_PKG_RESOURCES_DEPENDENCIES = \
> +	host-python-jaraco-text \
> +	host-python-packaging \
> +	host-python-platformdirs
> +
> +$(eval $(host-python-package))
> diff --git a/support/testing/tests/package/test_python_pkg_resources.py b/support/testing/tests/package/test_python_pkg_resources.py
> new file mode 100644
> index 0000000000..72acde3dcd
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_pkg_resources.py
> @@ -0,0 +1,14 @@
> +import infra.basetest
> +
> +
> +class TestHostPythonPkgResources(infra.basetest.BRHostPkgTest):
> +    hostpkgs = ["host-python-pkg-resources"]
> +
> +    def test_run(self):
> +        cmd = ["host/bin/python3", "-I", "-c",
> +               "import pkg_resources; "
> +               "assert '__init__.py' in pkg_resources.resource_listdir('pkg_resources', ''); "
> +               "assert pkg_resources.resource_string('pkg_resources', '__init__.py'); "
> +               "assert pkg_resources.require('pkg_resources'); "
> +               "assert pkg_resources.get_default_cache()"]
> +        infra.run_cmd_on_host(self.builddir, cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
