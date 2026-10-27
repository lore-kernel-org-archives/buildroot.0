Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222A9606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=djJQpKz4
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0151640738;
	Tue, 27 Oct 2026 16:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTL-r2YHTLRd; Tue, 27 Oct 2026 16:26:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 22A9C40638
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793118409;
	b=D1KlD543A/eAUsX7HajVJlgSoD4GHJi2oQwSnkIi7JY5B4WJbgHQRs1I42y9SQ1UnqXm
	 Phqb+Eqru2pD/wywjJrNqnCq1342rjpwGYtsc8mtdTxrOYanNkLvY+5kVSOeYU4UQa4pI
	 GPkGRfSrm+vPpJymqVZ8OT6B/DOaiSknNuUNo+6IHk6e4WBN346Ndz8mkQM6UrbJDRhpe
	 sS7jw4ANzoAeVjXg9cru3jQBMk+fyvShMFHbvE850JzhSI9CEE+qOa3we5fuHqfnj+y2Z
	 /AHGWtVCL4z4ga6rBxmibaqqbhyvCPZuOToUKeDm4ACX7+K5Bk5cQhNVIt5BqVKVZvQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793118409;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rUZD+ycBtMjFV8M8jLMHqMuUqpKmXPJSqHO2t3i4EL0=;
	b=gOGuttck6W13rNIgdS2xMpRWMV/QPUTGaG2eFYXJx9kr+2UGkZy6n5uXafjdCGwC2IWp
	 5Hu3Urk+1QI4Zw6lmZwLGY+6OPkJGfOAYJvywio+16BDVaCOUPE7pCb8CIYCu5Enpyq0F
	 7jFbi1VmLV0szlbbcLTD8d7+L/4fXY9kD1tMDao3W42Z8fVuqht1yMcBdM9hMoU2oB/t9
	 si8c74V6dDIZHx05CDd5OueLO8h59Wu27kscUONbNLfF6DWYfOGGt2H7BCGtYPHRbb1hX
	 cYF0BsJzP+dDYoJL7D34VceFHpaY9qjeEGfJAxHw+BB7ZGXOEUbudpiQ9jUUY3jDPZQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793118409;
	bh=rUZD+ycBtMjFV8M8jLMHqMuUqpKmXPJSqHO2t3i4EL0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=djJQpKz4n9o8q0zI8L94+ZHOEJ7hvmK1DP48deFosDPvzsQrY2GuDkEUkrCPDwNpU
	 p9ddfbzHY/MMTxrbLssR16RHt1/JwWe82mdJi2oYEyvVz294157JA+GfMkp7QTy/U8
	 oY83RvfH8vc9d6bbYIgR5Imog4d97tsPsm4uehSD7l+Ua4i5sekbGy3Tm1xzgOWpFi
	 pYQ8fbYSVtbxB0lhvyUVs17/uLx8YBfwp33pVoSgpBeQFsbupOh2JheCnTYEIGWqL+
	 CyoiUxfButrsGl1DLgHkXwfr267C/MJMAbrHvkI5k9Ax5dI90l7RTcDOcNYWzyIxY1
	 7C933ca6vz5bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22A9C40638;
	Tue, 27 Oct 2026 16:26:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 059E02F5
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFAAB40636
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4fnpmuptlFx for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:26:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8CAC14061E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793118405;
 b=aIo3Sk309FQLR/b1vch/U4AEOpqHWqhoGvxH1nT4ojRuf3yTzsR8NVjUIJ6n5E7eOmgE
 ClR8OOjkvxU93KUr5XQqLKWhoxUh62GmU6OqF/43sH18y1x9AmxV+QajUpZFoqqwtAQhz
 DklQeiK2EDPWRJ7wqtILgEJwuhduSYV1FzzXcLW9KWdmzm+fZCAMLZaAYGrtApd/zdAG0
 KGis3P4aOeSl6yWKYsO/yP1U8ZXStDw71U1soJ7985LRZUQeTOCDC2NdtWx98Sqd/EodB
 JQbQKBVgeJce2JDqlDWqnU3HIR5pBZSWU83JCCgFrwSjDZFYrYVE57LpP1DjjruzM0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793118405;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=/QuvtqzbU3w6PaqcUPnBPypO7mLT8w0iSrKXInIhhr4=;
 b=ZjvsevC7cfbYabVuevQ8FMEG+MW6NbUmEHYeJkU2PHm8J+YD7FnzKh3D3R8esrz4kETL
 ZhuO/XcM3YAF/NLbrNyk3yC7+boz/rg3i4gN5XeMTeKIbhUE9Kip3cNqCeYSf9BeXHojw
 t4NKiQhz1NTlxsfK7NNnCnWd9fmvmFPzwptPknUXdnRUSnLJbsrIBXuCgtS4Zw8U/FzH0
 ZIYV4CSTptvSE6beh0EGQnqImVKP4XCJlqx1ZartMH1DsA12hKcm9jKuEzLjNQYg2mSDD
 JJOr6CKvOuozM183lK8tvGohO81Pt+V6T+/hjGffZzmelPehWnDqva+OQjWttMpehRg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=rIVIhe5E; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CAC14061E
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:26:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0374B1A1365;
 Tue, 27 Oct 2026 16:26:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BEB29603BD;
 Tue, 27 Oct 2026 16:26:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0D00A10328A20; Tue, 27 Oct 2026 17:26:36 +0100 (CET)
Date: Tue, 27 Oct 2026 17:26:35 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <auDQqsk_xf6qlrXo@windsurf>
References: <20261027144159.1097876-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027144159.1097876-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/drogon: fix optional TLS
 dependency
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 03:41:57PM +0100, Dario Binacchi wrote:
> The trantor library bundled in drogon looks for a TLS library at
> configure time, and uses OpenSSL or Botan if it finds one. Since
> drogon.mk does not declare any dependency on them, TLS support ends up
> depending on whether OpenSSL or Botan happens to be built before
> drogon.
> 
> Select the TLS library explicitly, following the same order as trantor,
> so that OpenSSL is preferred over Botan.
> 
> host-drogon only provides drogon_ctl, which does not need TLS, so
> disable it there to avoid picking up the TLS libraries of the build
> machine.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master after adding a Fixes: tag pointing to the commit
that added the drogon package. Thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
