Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4575606A321
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ko8kabU+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F67B40E18;
	Fri, 30 Oct 2026 15:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SbnOS0YTh7wA; Fri, 30 Oct 2026 15:29:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CD35440E21
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374177;
	b=jcyCXlJbppgdWcaelxsqiH7LceOO/ep+cL1YG8oBkFq6C+wnrYAMMGySMkMSIPFB+rcC
	 mTBQWiszWwbpKYnGFxh1fsF54l5a6iRNjkTz4LbVLSRpgHi8eDCb5O6IN/+5jemtOhnPK
	 YurUaEgqUvasRodhCJuXUpx2SNlU8EJti0EQPPE5/pxE7+erp4aqXK+iwFFnQj04H+4/g
	 fAIg4TRmbIaZyWvgKnVivoX8MRUQnGdiDibULgP2Rk7y7f3fQO6cUSNXNunCXNQZCE6no
	 SRfKRI0nRwgPxN1vvDVo+Kz/etih8Kx7p6iJ/euRkJ8g2COnHFtwZsmO9yBhhbh5Dag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374177;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Kv9PIZ/wjsadnCFVP1jbVNR9Xf6+B+WmbmJk1nqL3uw=;
	b=GuLHe1QhrGcdCgrdyE/q3q4+ktWLiGiTHsqGSw7DGlm3E++Y0moXuwQtrvljntPsCsuI
	 A1zNS+l1m2R2nvmVMoJbIlLYY2IZk1V0qD1AzA7tEUwvGRYMa3PdpkqN5NjqYpYG6Atjw
	 ptbHQCfxAyLytsViGOUhIlAl/sKjMIe9yUJdy4RlNKmMAIMt5hawAXnMs5EjNiL0of4+j
	 v66Srn01JZPNvQSL/nshdgKPJ+V2hxbpgGvILczfdLl3c6voToasNvNIv61B+XUMBSxyL
	 51pz3YOvi3kGRKMTMBYxefY+2PJ9e8+/JdS/DmKga+9qKFACPpBWcr3kfcd1UUw9T1Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374177;
	bh=Kv9PIZ/wjsadnCFVP1jbVNR9Xf6+B+WmbmJk1nqL3uw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ko8kabU+oflBSywFSlJT+Z1OkqtsRFGjDAv7FytsvPTZO3yZ5hP8tlRqDhas158r7
	 kY70d6gKLbo7jDz7fCGKkp6IYuu2MoQU8Q6vihaQetg6b0dtnRuXyg0GMyLhm/CRUg
	 xOXrXLu9QxTYdEEqvvnDj1kgik7B1jXRdaA5R66UDm9vFcwF9UPac4Lgnqclv77o/q
	 qo21GRhywHMUI2hCihPSAGJRYSxZvd76zRuXtSx/rwiNTCUxYmpd9yVA3F6i3oAfNn
	 L44pJ+kwBo2wgkbRS1E47nhUvpecGYTTZZ1ieczNM7Oibrk5NkbU19u7DcerQyc7eJ
	 KKkBbmdJtI1xA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD35440E21;
	Fri, 30 Oct 2026 15:29:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86F76235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78F9C40530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mj4aRN6zXCa0 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 624DE40211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374137;
 b=tXCD5RBq88HRGNFOyIOBSUQLvFrkSEPyMp/ey8ktG0uzS6yEyc0lqocp02pT6ONGPx/A
 xa2VG7nLsMro3AcBbQzlVqXYQRQ0cbjyIp3mx/cCeB7kAstpRg/eOfVA4chv+JMlwxtNL
 X+zFaUsAt+/kDOL7B19qOfDUov2famKMrCppjEraQv8IkB2hzbootQz8F4WB6gkfXAZ37
 le1D6PpbVTczq0BDpGEhHvsWqWv+dd8rHzHTVa/9yGrMDdkVg1bHRIxJTxyV3axoZ8ud8
 GnuHmIx9ArsTpi6MIrUyYQs7TDX470Dl6Hvz9DfTmYfUKoESp63SFL0NQC3TePUBZIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374137;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=XcqU0F2ntItutDgk4phwn5Enc2lTLxOXnsi2fH/0+jw=;
 b=rq66+oWgu6kdZfGTlKJG30ZMABk95ApvXVWMTzkZDH4FMd5yE0mEilpCndEbnGj1mzAm
 KWYJTD9gR+uzUgkvecBX1YZEde7SkLe3qwMIp2/E1YmSLyroPKpy0UZlWkxkH54bUe3So
 l20W4Hnq8TiRob8u+J4fxZhDhVij1y6G4lVEZtcroh4tQJ4GLbNrLPqq0BjVDm/hU6gE9
 8jauhxzB1XDwW4AwHep83SiXKerA/prPepuz8opFHJLl0pgWIslj18VWMioHyM5/Owvwd
 PjxFpBD3yJVnMclgiIJB4ZmbqrKyeFHKUjZfasX8B3IJTeG0A5LM011+1bLBAO6TmpA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QilxggEL; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 624DE40211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:57 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso8185355e9.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374135; x=1793978935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XcqU0F2ntItutDgk4phwn5Enc2lTLxOXnsi2fH/0+jw=;
 b=INKhIy12jN4CLZz5JjnhaAC82Qahqe1MD30hf58WUKLzZxFdLPyvISjd84ZIs2QzKC
 RP8bajtDhg8Bfoc/BrZVeQ7AW3BkN9J9T0GgF0N3ohROtvC95d/znZ4oVm2y+kynSo+G
 ugvO8CnfeZ+8kmB9sXVF73Eb9rwx3atIGNJSn++djdHcNgxd5ynPZwlyMVzkBQ7YMM/c
 Ak78czuyfMPr28t84xnw89yECPNxQ3HQfXSqfcYr36H/Izr70axodzL2ODY2kOXPT0Qe
 xOpBAGM3a+Le+ukrC2LPZI/V2/5MCI3cOIShTvlnnZnIjFQYJhCNkYEz0R7lzoC7rxIR
 0gzA==
X-Gm-Message-State: AFq9FYId+unGbfq6LA4rGOL2H5nT9hPi8Ybn9hX8sjRNcHnjCDJ3zSkh
 8tq9Tfrg8uPkz6ZQR2pRowt1nV7eJnpAQ9QirQRmkXKVYdEsF+OO6ipOUc3zI8cE+j7gSzFWLQg
 lD2n3sco=
X-Gm-Gg: AYBFou1cSiSfITr4C9DTSVUlFeXX+ENuPYATYc/YyeJx6hc7Dzl7Dlx8u+hpnN63XiJ
 ZAtvyQIoMeESpmRs/JrOwtYt2zcHMnT8FHGq9+OuOqJwq34Tw4cdFyiokbV79dkg3IIfqY/pYLq
 AY5IEg9o2MR4YZgHJeJrvsfAA1BiEJHOLBBr5G9kVlZLlOXi/qsYSdzaprVD9vcXEKpf8lOoQai
 Woybgkap/w6tB+iVsUlYs58lP+dHzRnhl+B+Bun5eT159fy3afNtKUd/JweAun5TX7lAbgK7WX8
 LRKfAtnAcP/Nx+pfEwiV/fV99cMGESVc8ZlYQnw1hD3lr8wFZjW1oaAEIjSHoa6V7QsGIqiYZ/4
 ZNn/GkJL7nCL0TwZBqSzhrVUXXDhHefrByT9oUj/kGycES6L0eF98KeA95hZmS4RzLMqysMPiiJ
 Jf+R8M1zsP/vsyd9NQ5LwXAbnpfGa8mWPjI2FKJ6ycJv+/0fB9X7vccSwqVyBEHFPHkYnEo/Cuh
 fu4/6mrGKEE7CRWTIMWPoxFvAgG60YDTbAMnzYCQF61y46BDeyo0Zp1OQcbvWfzwTsCr3EuZ6cd
 zQAfwXkWYxIWqw+dQ1GbV3VT1rBAU9AbwkNgnphrC4QwuyBRYEe7+jvJ/Nm84HFwc/k8pcP2
X-Received: by 2002:a05:600c:8b64:b0:4a2:84c:52f3 with SMTP id
 5b1f17b1804b1-4ac16fa21dcmr65931675e9.6.1793374135665; 
 Fri, 30 Oct 2026 08:28:55 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa820492cesm156354175e9.13.2026.10.30.08.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:55 -0700 (PDT)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:52 +0100
Message-ID: <20261030152854.1907604-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023181818.920329-12-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-grpcio: bump to version
 1.84.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2026.08.x. Thanks

> ---
>  package/python-grpcio/python-grpcio.hash | 4 ++--
>  package/python-grpcio/python-grpcio.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
> index e533bc1bfb..c230f68918 100644
> --- a/package/python-grpcio/python-grpcio.hash
> +++ b/package/python-grpcio/python-grpcio.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/grpcio/json
> -md5  f217241814a3d2f9bfd0fdc00a5d419c  grpcio-1.84.0.tar.gz
> -sha256  19aaf172fc2edbefccce3f6e92c5150975dbe56c45744e9e87cf72ebdf85bfbe  grpcio-1.84.0.tar.gz
> +md5  1c5d46ea8d18b15a69b59a4f9dcd70e9  grpcio-1.84.1.tar.gz
> +sha256  446e7876b9b991fa124c1d414899fa7cf95f89a3e71237ea0161863dc0b2c09f  grpcio-1.84.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
> diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
> index bf32da46a2..fcd6503199 100644
> --- a/package/python-grpcio/python-grpcio.mk
> +++ b/package/python-grpcio/python-grpcio.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_GRPCIO_VERSION = 1.84.0
> +PYTHON_GRPCIO_VERSION = 1.84.1
>  PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
> -PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/3f/4f/4435c0aae54657258d9cfcba78598f3d9e5fe4c82ff18d78558567b90faf
> +PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/c0/3a/5c8e0eea2af3d30cb20d33ac325a98d9b799c069d63101ca4da20bcc776a
>  PYTHON_GRPCIO_SETUP_TYPE = setuptools
>  PYTHON_GRPCIO_LICENSE = Apache-2.0
>  PYTHON_GRPCIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
