Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128D2606A31E
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rJEi6+tB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E328F60722;
	Mon, 19 Oct 2026 17:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AMVFI7GCxlo; Mon, 19 Oct 2026 17:17:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 28080606F4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792430268;
	b=sg2jSKYLZKRzLleATJb/RuPVaVfZ1Tm4P4CUW+AhtNcSTdCgxarNLkAJRCG4AhfbjcXJ
	 FM2lvRzsQ41duMgxbsAhhTnfXRPHW0rdUS1EsiYkrLATYGsvqfAaNUMalo9tdC4g1ZC7j
	 G/cQixra3QKHCJcfo/KEXScgb2CfN1Ivu5AgbFe2z7cUoDDnNTPMVyzhlDKIxVGZJrBfx
	 1AohU/psR+UXm2scOuzLXJ4z/4JqeVel+vHuAF/D0y509XUTqYN7TqO6ktbU56CPkxmxK
	 TN/hy/rI5o5UZ1RsDamJPy/DeWPWT9Yu0iVUHLkqwWEVmwBu6H3yRz8L8cgFhUQnf9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792430268;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=z/OuCDhJQ7f1GvK7wYCmPtJOei0cLKG9foeXKD/bm4c=;
	b=sWWDntmkrKG/UOjGLNk2KRV1GhSd+ySsQ9jEQTccbih9qMebDHuLUrdfBUj30r83aOAR
	 IsJ/odxv2H/2LCpM/musfSJzakhVOmhlbllWbC/ND4EqN0NsK5Kd1VvC/+DRBrLKjy/Gi
	 /6XAJP0HLPZcFRH1B0BLrzP6Dosbub+K0j6IaDa8XZ6ddzDwemiDQfUDqgDYzrJMSvfjR
	 qFNTlTZQlYQMmSeIjnag/GpXBtB1wfMGGz22lOtM+414yzUvpkKkypk3jp9386B0vyAke
	 WVTZtmMu47lzhA6rett7ozNXJrcsxjDI7xgFxXW83NKNOSCnIlyre8hnC9FvR5SzguA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792430268;
	bh=z/OuCDhJQ7f1GvK7wYCmPtJOei0cLKG9foeXKD/bm4c=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rJEi6+tBORQM0AL0X7H6NoQogL45RBYV3L5fua1BSxxk5AT8koza0xDTnXbbkciZ1
	 FNOpMn9kj/v3+YfOIurCPZ/glx9DNiDli8FvMx6iNqnnkC188zNqBT5NGRgz2cwxY7
	 E0ZsN3GyQR+7G3dQLlNraWETxAwbcGF57bMiy7UNoCN/z+ZpfycGcyIfIsFVXzKPxJ
	 5UwFeNB/1xHLQspGCAIzMSizP649YOjKhX0H7IZ4766bzKJEtHvReRM3cTQ99PGRZO
	 1/sGavEOAEr+CRNChlBmf15hw1q1R+ZjXdfdN/713ppKCJuBBep+xipPBrp0xWc9lU
	 YpCrB1jrCvNag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28080606F4;
	Mon, 19 Oct 2026 17:17:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 360C51E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25E514028D
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egiugE-9xQzt for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:17:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7870B401DA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792430264;
 b=eb9yj3jydQPklpDrouE1CvsVAR89uAqdbg+1WISzQnOC3I8TKcm7D1nxkzRNgxVzV8B0
 swn7EAnSvMqsjwntiUq8dhXbZ/ySrMSnMYkHXIJR8fQ7hOMBjQEDJAR98WwKTyuzsyKKk
 EbwoQtJyE1OpKTfADwhFNEWHONT8lR2JV5c2aUDl2m8AI4+Tnb7APAdI6L4dLwXKrHZ0F
 pGBs2hNGc80mWDtbn0UPmY6I2Z1R+SVWgUngzedCLC9LgjVFwK944VYgK5h5wmd/x6FLQ
 6B8EqS8nUgTC6Pf/epRPT0RsUWX0E8UOKAaAPJGSTcU4RCkWlk6QJjuriD4PS99NGcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792430264;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=T9kjo6/qzder8RoAhu7zuU/8A/1qaaxaH8hmRSykbCI=;
 b=RvKFtJtT0oGoRejxlMwYLCbe+zKb2Wzu+cunrVasrlG6f+LWzEKY35dQ0DVaztMkDZSu
 D4vZmm3Il68lmHWfqkbnMkPwoYKZuJ8La69ZyxDi0JfoDCFwsH2UlKbV/OgxfQ9RK4d5V
 nSudaRMgBqELKODrFkRZHXI5goDHS5dUBmRQvfToR1WzFZduoyA3lEfETLRL5vSuMQh8G
 jlHC6JGyS7STlrGcfV7vF8pJI9ufssWycrBVfzN+YZpsMDzDl84Bt4rSBsJulPBqypOUK
 nA7hHQU7gJfvi2kFXkb1U87BPFp4d5iSdBRpjfxwYfG8V0AAxj2/AaDLRHEGO9mMISg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=H3yoEpOG; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7870B401DA
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:17:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E773D1A1237
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:17:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B345160582;
 Mon, 19 Oct 2026 17:17:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 64C0510328CE7; 
 Mon, 19 Oct 2026 19:17:35 +0200 (CEST)
Date: Mon, 19 Oct 2026 19:17:34 +0200
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>, 
 James Hilliard <james.hilliard1@gmail.com>
Message-ID: <atZQYQamSfa5wqAN@windsurf>
References: <20261016123321.7165-1-flaviu.nistor@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261016123321.7165-1-flaviu.nistor@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v5 1/2] package/python-snappy: bump version
 to 0.7.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 03:32:58PM +0300, Flaviu Nistor wrote:

> -PYTHON_SNAPPY_VERSION = 0.6.1
> -PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
> +PYTHON_SNAPPY_VERSION = 0.7.2
> +PYTHON_SNAPPY_SOURCE = python_snappy-$(PYTHON_SNAPPY_VERSION).tar.gz
> +PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/cb/52/acd87583175fa930e4385f8a6164eb5909acd683c0e62ee01d41de8195a2
>  PYTHON_SNAPPY_SETUP_TYPE = setuptools
>  PYTHON_SNAPPY_LICENSE = BSD-3-Clause
>  PYTHON_SNAPPY_LICENSE_FILES = LICENSE
> -PYTHON_SNAPPY_DEPENDENCIES = snappy
> +PYTHON_SNAPPY_DEPENDENCIES = host-python-cramjam python-cramjam

It's a bit annoying to pull in host-python-cramjam for no other reason
than making the dependency check happy. So instead I've changed to use:

PYTHON_SNAPPY_BUILD_OPTS = --skip-dependency-check

and drop the two dependencies. python-cramjam becomes a pure runtime
dependency. Verified by running your test in PATCH 2/2.

Applied with this change (and a reworded commit log), thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
