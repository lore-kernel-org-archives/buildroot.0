Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256B6606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CsFIGima
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9D3B81283;
	Thu, 22 Oct 2026 11:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kedU74SZts6n; Thu, 22 Oct 2026 11:09:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 033F581285
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792667396;
	b=FJIkfXkyrTzBGM2DzQFtMgRWVRzLU1odWNLkQH1ODnPgUa6iMFrfPyn9AKHV0JcFAGK0
	 O0/9RlOUh4W7tXfUAgl4Ed35DtLs4e9jb4K/24rk0BdjcEWUnWetBJ2yfLjTn+zDN0oQA
	 jsOA+tZLW7iDlZuCFue3A3M3oDiLA/jLYFWjekkI8NpuOTeGgSEYzx6k6GtFng0ii5zHo
	 97keCaKt96vJnFWdX9+4aCiBf7v05Hfmrf4GXVOvaoD9T2+ChJEJCRWNQTdM+R86sWKGO
	 gAsHk9jUPskbDKyGo4vPkZUj3BMKgE5aiLYgYqEyJ2369EKQ+673QF1Es/00tsbW9PA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792667396;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xWJUWLdgvalEh3cTjGEsZwW+QIxGJaO7wB7buv+jSA8=;
	b=CFXWA3Uw0wltM7i4k11POjTmwTb6b9saUUd0AMCCZsXSZ4n4d8aLaikXmonDPY9EgXnd
	 GFz6AuTwwe43FG3wFPIkFPUc7vlI7moZaUUVgL0E5DN+0xgT9uIe8c9ULrDRxg8a73pDO
	 iYJCVu6S6FLzpkkG3UECSweN2u9hNkL4A4WM59su1JbaBgzVcR2Yp4+inwAUHmuNvbMg+
	 AhOPPglB8XDQ2Ne9QDn3osYllUJS7OMd12mvKAEH/XsoMn0zU+3vT74REuXOtxoAQrqk4
	 WUshI9fF/elbmsKBgtqzpIPwViA+Fv9wRuSiclcF2C61kaGdx/bTrqEDQW2qkIc8HvA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792667396;
	bh=xWJUWLdgvalEh3cTjGEsZwW+QIxGJaO7wB7buv+jSA8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CsFIGimaE3ZUZBtyJDB+g0N4J9CGCkMWf/+6/dsOMTnwyuplWcf2L3ZrNCts5P0ie
	 xXuBZuZpR4G8TLYyaiHCId2YtkPpkJ+OySMJWOBUjGfvrPjnRuuoUH2EOtNY0ywbah
	 fttjY/2I6zpIPmy5SRytlucG25072UK39KmbXpVj06CTfZICPO++sFzCRUtf4MNE1X
	 GZYVKNvSjrGmRGWMDMbHPyVuuvN+KZVRInSYsxH3+1v5KLLOI9uSYfCaMsTN7m1xwE
	 w58THz13TKIEm+RmNVGKHaUx5sBk4VSLF1yZOolDSIWUQxMss5C0wP6biqJ3vCMrLk
	 aeh0oA5Q1v5Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 033F581285;
	Thu, 22 Oct 2026 11:09:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F131A3A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3B4A608A9
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_L0swO7Nw0V for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 11:09:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 881CC6089D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792667393;
 b=ZImlbWOt8YoFKu7VdjrlauzqjJKiOd542o7ca+L95EuGuqpDqad3bYz/QgTIurW4rprF
 e9A6J+z+iz6ZlIBN5pz7VG1CmBz/RoEfClDbQolgKnmp01ifRXVmvQFB6SkxkFXfUZMbK
 60gwnBGxmLo76AL6STJxMjgaVQEGSRF5EXLnUI7985zmFWRbCj5q77t/Qjs78Xl7LqkXG
 NooEnqdNqld5axog0WuTWIE/7HWc7KdxWbvF/wQU7VuEXtqWcSGNbIslCOd4P70kNDqkO
 wuFv8kmshutmuaMg7U+X1HLMYfVoGYyqYJJd/iecIurKbgZf/+jQFMB0p4GV7ebUm1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792667393;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=1AyevP304Dja40pO+Pm0yLlNJo/sjB/Os2nFPS2Nxw0=;
 b=R0xK5WxkpzzbEw3ThdF/xARzBvFI5Ap7nVX5Obgi2VoH5AsCOPszgusiTtbOIzLhVTVJ
 GbCUy1vXQMA0VCYepseRMIZ/MD0Zes97YfIj+/Tesm7+cDU16f51m20NWAlL8ukSKrVPD
 eODdM3sRR6DVK93VPjM/GAdStbfinbOtNqi43VjqdLmrSROO3OQ9uQUT5s1t7prRhDe+5
 roqjah6G9eSenbGLxxlG9R34RTcWER1FI7tHlFJhwWUIokB7kPlcSuoq5puEY9OaKytbH
 11LsAfMjKvCdgAXYIB9b9gt4Zrx+yxoDoFFoChpySJDLd9WSw2p+c9Pum3Dixz0MNZw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GBMQ7XAH; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 881CC6089D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:09:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6DBEF4E412B2;
 Thu, 22 Oct 2026 11:09:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 36FEA60360;
 Thu, 22 Oct 2026 11:09:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0D8F310328F2E; 
 Thu, 22 Oct 2026 13:09:44 +0200 (CEST)
Date: Thu, 22 Oct 2026 13:09:44 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <atnu9AJPcgHIssPN@windsurf>
References: <20261022061520.2428309-1-peter@korsgaard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022061520.2428309-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] configs/imx93frdm_defconfig: new
 defconfig
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

On Thu, Oct 22, 2026 at 08:15:19AM +0200, Peter Korsgaard wrote:
> The i.MX93 FRDM board is quite nicely supported in mainline, so add a
> defconfig using the latest mainline U-Boot/TF-A/Linux releases as an
> alternative to the vendor BSP used by freescale_imx93frdm_defconfig.
> 
> Mainline U-Boot uses binman to assemble the flash.bin boot image, so we do
> not need the imx9-bootloader-prepare.sh post-image script.
> 
> The existing imx93frdm readme.txt applies to this as well, so add a note
> about the choice of defconfig.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

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
