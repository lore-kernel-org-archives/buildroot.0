Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A9E606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 21:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f3K9uFWf
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26DCC405D8;
	Sun,  1 Nov 2026 21:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmUg50wKtdWt; Sun,  1 Nov 2026 21:27:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5765340556
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793568438;
	b=saE+Zsq1Yjbn+KK4cD2DQ0CXT7+kbFkJoqrQ3G/lM+2K2UOH4lpiTU3SgAYYfGMl5sEX
	 guxyApgFlDWhquODxaKwNgb+7HW7q2VYsv1J2fNTO6zPtKYVqUAgt1vz5woGP/KukvEIU
	 +Mkg1s9+HSXzYujQQO06K6fdxJcT17yNbG7xDb865VxX2dUYdbolwZxCW6DsIrIBDO3aP
	 aau7mvybxeVeQXcxRT5Rnfbe2HUhIkjMhCzDGI0zW43sQePpas5LEI800gc5NJEMIt668
	 DCRKItJhxwiwzw9nz4tPZnO3V851SiZp3tDoJB8HbY3i1D4v8E4+cR0+j7CNG+FGDtA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793568438;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=UrR9RT3qCOeic/uR0cilKw4c102xHEP9C6Vrw1TeJuk=;
	b=S004jQjDhlIJtduS15O5IUDxH3JoRDlAJG6iBlf5EjoICiw9qkkcl7wnZdotnOgWZhmi
	 S7Cpo8ams2vwvzPi+ecvl7V15vVx43OacB0ruZajUabCOlSu36niY9vObs6VV/aCV9X7i
	 au3sGncdkamDyn0DSiMpTpMHjexEEiYhw40Uszt69dyBuVFFydcpE4wtsGv2u5sOoJjob
	 jYlfT3PO6xJUIL0UE/7BD7ZwEUa8daWi0U3a5s+ksVZDtDQVo/7Gwjv+FXragVkk/ILXg
	 n3HUcsUIhOmjfVatKJKtDINZzMV+s1c0xctK+e6hJdkafjlUqCVKTSKUd3mZV37Bf/g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793568438;
	bh=UrR9RT3qCOeic/uR0cilKw4c102xHEP9C6Vrw1TeJuk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f3K9uFWfAuEKo1Lw9XFcYQAqNz2v7w6FsiPUJBeRlriVkNTOaErCyXTFnDTt6dD6O
	 bQ1lPS5gYCmIl3MHfrh0w7W/LwrvzPA+UAETlyre7X3p4QwiVLfYuzxzXfh4zMzs+l
	 VQ332sLGEpXOnpUTA7itx/Y8rUMR0rPb5xHnxvxbN8Ecv8YTnazPd+CwH8ge0RzdbE
	 WXIAoBoVlmsQNt9fUY7CIDHiaRoHrMZxxkNSR6eGByX4ccFk7Sgtkj6o7uVrUBOa4o
	 qDntwxD6ZUVc3wn0oc2MZ962xu+E7GCQo8l/Q5EhFRrFcsaeSc2tWGDS5RJ1VVs5Bo
	 jD8tskF2DPcxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5765340556;
	Sun,  1 Nov 2026 21:27:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 634DC156
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48F5780D97
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q58omier6ngI for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 21:27:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BEFF480D96
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793568435;
 b=in56ptPGWdHlTIqkjLFWfKEXaylw6f0uph3YR+48OdLh50GDNHpYP//SVhWOeCQKLdAO
 4+XBqKcrDZHCqvC3ePOLR0Yq4tJzzFur/UImriDnG3gIfMTBkKUZ/i8MyvhQohv3iiOum
 mtkEvLZLyAMj+Pl8J76pmbKixzNyUiO3myW7VrHf5pGZ7cix5oZpHslAhkWwuXlZo1g9G
 PDZC1EFqEqbj+O425HUeKKLiW+q6gI1uB6PjQQwCl07y+rH/69JVkUk+wR7Dg40VAAWy3
 ylt9TJiyn8fzRZmNJdv8+bzFP/YlvmPaf+rRWkzjU828BWFkRjPUiAl0gzUSY9D2BqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793568435;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=7fyMbFsHYlQ5D/8q9bJnHou5TcU05kelNdxGsUAT1dI=;
 b=Um0euqh00ARs+Ru43M5TDNfF+U9b5RdDAyOFS1KBNu3Ef5Z5sDuNAMGjBYiLfudE+1AM
 NblRcV7D41xhqDHCXjOn+KFe+yzRIxHfWNVkoZn0p5skuXfGybjFL6E4Vzie/6BpEdPmm
 YJ3cJ5zbqIU8rsERqs+tZVS/QKZ8y5u5jvFWh+feRO+jk3bNQRA1CPm30tFgEsTpbuT/b
 Gtyp7fukUr4I6GxILuLyFQDeJgH87ExWx7BRIvAJ1AeUa9XJLO1+bfSpo/dY71ewhteJ0
 ZqIXQrMqJzdtUuyRyKs+6dlUyQbly9siFz9D8CW/m6X1ozw+1i1deM3+7HUrDzuft1g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=tvQpcolb; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEFF480D96
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:27:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3A2B31A13FA;
 Sun,  1 Nov 2026 21:27:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 081F460750;
 Sun,  1 Nov 2026 21:27:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BC82910328C5E; Sun,  1 Nov 2026 22:27:09 +0100 (CET)
Date: Sun, 1 Nov 2026 22:27:09 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <aueuqAZFNujUYNj3@windsurf>
References: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
 <20261030152434.3738285-2-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261030152434.3738285-2-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/9] package/webrtc-audio-processing: fix
 build with musl
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

On Fri, Oct 30, 2026 at 04:24:27PM +0100, Angelo Compagnucci wrote:
> webrtc/rtc_base/system/file_wrapper.h uses int64_t without including
> <stdint.h>. With glibc it is defined anyway, as <stdlib.h>, included by
> the C++ <string> header, includes <sys/types.h>, but not with musl:
> 
>   ../webrtc/rtc_base/system/file_wrapper.h:86:21: error: 'int64_t' has not been declared
> 
> Backport the upstream fix adding the missing include.
> 
> This was not noticed before, as webrtc-audio-processing selects
> libabseil-cpp, which was not available on musl.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to master, thanks!

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
