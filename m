Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171EC606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MEIkuw+v
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC59F4096D;
	Thu, 22 Oct 2026 21:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2H-NP7sWr4j; Thu, 22 Oct 2026 21:16:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 781F24095B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792703794;
	b=c1lGeTgN7cl3jJ81Bu2ISMppn3+QVSA3F3mfgsAjZJAU+TE1M6BvutcoQrm+thS3xEMR
	 DLREKOiZbrJcp1bzXJqL/JeDBUeezzFpv9WpI4W/LMU8+6vn410Hf4s05cRHGF+E0Kmy3
	 3BfQon5z+I++UnFX48EB3F84q8DeUkvVVKrP2BIoKX/wg1Qsl6c3yZs8dG+PPeT6YaFCN
	 bdRh4Wl90lHCYQgNGWYH5MhrreD914AqEW50nStOGdgXV71tCReNX8bh6iLJgSMU1Ajz5
	 8tyFAEiLULSc2oS1oDKzYLk49jlJM4xEpO/fUhi6/4kb1zs0l5J48FquDqil+lFchTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792703794;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=J+PTMxXAIyp75ole+DJHf1z+VNUixzOACse+X+YI8aw=;
	b=QWo+MYuQB07C6h4eevcIeTGABjgze5nEvLxHQfUnWB5um7bYMk0K2q8kthq8wNteNqmJ
	 sZzDjGleJ3Vq3KykAm43EG9v/XQEGNf5neP+2MBwXw26IBu5zSoMux8iZmUaZILT9umIO
	 aynqh0Bxw6/YTSspCvclD0NePcC0IZSFjopMkqgy6QjFQsIE7hU8Aj9G/Tif2oLcNHH8K
	 F1y8w22I1/ixXg9fqwZqIJSbemPw+OxAzKgGWWif77xhrRurAU2t6r/INro8tCJ0f8/un
	 jpogSXBzC+D0vJskG/Li3N/mm49LfbBiOzLBKctF0mIpJrdgKFRLGTlMgMQVrabrLyA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792703794;
	bh=J+PTMxXAIyp75ole+DJHf1z+VNUixzOACse+X+YI8aw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MEIkuw+vEDgJmJQer+8ifszC3BY0tdCQLwW93gzH7e/QzV+t45xTKk+neqNmBuUZD
	 PTFhYuPqSR0m/1BF+kpuyWpjqUr5ai5KBwBLQX49ihRbasKN1yKCqjakIu91O+extn
	 FNpC1p+JlwmpTuPd/DMRjLRWkEH96cjGiCwFHYt1lojvZQAHBOjxFwNngPW7Pus3p4
	 wjEweRnD3hGGdYPoIgPEEqInV5GzHtFNzE7juVxoAQ41SocmVgRcaXlqBSNzQ0H1Fz
	 6JShUDxcmn2winEuNWsyVGD0hC6PWxl++IFaii9wHLvmOR/8DUjXUyQivZ8Q5JwVKa
	 Ddie7cVCZHQXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 781F24095B;
	Thu, 22 Oct 2026 21:16:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ACD34BC
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F065D6080C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7bp1opmD564 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:16:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A8195607E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792703791;
 b=DxeGpdhodh42x4Nbx2eGDOhH1ElwoiFhZLs7itSLTn2y0ACE+503pUSZLm2ps8Dg/FPm
 5K/m3MFwvCP8Prnjpny6dnEzVnhKOFnQOxxjtpbVHIMo/H2krogU/g+zEgwEqm03doy9v
 NeYPEHATPmF9z2I69fua7YVEEQbFpGhEZEtDy7NUem4QAaMZDly0U8VAG+PSTNysumy8L
 EK3iJFDYYPCqKIaxTaBT/WRJMAQDOqL3wsvtiYhPGlfXYDH9kqXGxihL3xKT5XITMAVFK
 U/rHuvSt1ccfkOCM4Au1keFsU1bx6GkwvvJ8QU6vqG9A3sVgk+psyqeZiUjvKsYYs3A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792703791;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=lzHPO9pYNLQdGaw9tK2Gus5h5gu4FGhhZVf08B5/KSk=;
 b=Ii8xZDQxT0hSiSyF5I6yJgm4A69zvzl/iIDNYVCm5xhLXKxK/3Zys8WVerAm2A7SKGyQ
 xb00k4HRoxtjYHvHJVgummbgEnBXNoCmm/XwCcAfx5BOEBz66eULeQ3oL3yU644usL1IB
 X8p4hFyxdwxlqXYEiXRDzbwKubh5Nn0X0k5GEcmRlV11DwoWPstnJifdeEdgIOyze3WGH
 idEPZ3srYBTXYslYTqJj6AGwzOF4lCcK8hgZY1UO3ZAg6SXR1OADQkUXT2CLXe0Fa+0p1
 JIZWUvimVJprwQP7qGpAHICadtLotcbsVtS50UDp50LdTJvGdKHkbDySf6eDkaBC6eg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=pwAWiMF8; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8195607E7
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:16:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CCD1B4E412BD;
 Thu, 22 Oct 2026 21:16:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 980FF60763;
 Thu, 22 Oct 2026 21:16:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A8CA8103281B0; 
 Thu, 22 Oct 2026 23:16:19 +0200 (CEST)
Date: Thu, 22 Oct 2026 23:16:19 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: buildroot@buildroot.org, bernd.kuhls@t-online.de, chrismcc@gmail.com, 
 yann.morin.1998@free.fr, fontaine.fabrice@gmail.com, markus.mayer@broadcom.com
Message-ID: <atp85fO_nF2HH91a@windsurf>
References: <20261022181803.1291476-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022181803.1291476-1-florian.fainelli@broadcom.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/linux-tools: fix PCI endpoint
 tests build with recent kernels
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

On Thu, Oct 22, 2026 at 11:18:03AM -0700, Florian Fainelli via buildroot wrote:
> Since Linux 6.14, the PCI endpoint tests have moved from tools/pci to
> tools/testing/selftests/pci_endpoint. The existing build commands still
> use the old location, causing the build to fail with newer kernels.
> 
> Detect the selftests directory and fall back to tools/pci for older
> kernels. Set OUTPUT and INSTALL_PATH to build and install the selftests
> under /usr/lib/kselftests/pci_endpoint, and pass the required libraries
> explicitly.
> 
> Update the help text to document the binary names and installation
> paths. Check that the selected source directory contains a Makefile
> and report the minimum supported kernel version if it is missing.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied to master after adjusting two minor things:

- Wrapped the Config.in help, some lines were a bit too long and were
  causing a "make check-package" warning.

- Adding a Fixes: tag, not pointing to the commit introducing the
  issue because as discussed there isn't any, but instead pointing to
  an autobuilder failure that your patch is fixing.

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
