Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD9C606A872
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 20:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jT9Ih4A7
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 539B4407F9;
	Wed,  4 Nov 2026 20:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WgATrqYpNHC; Wed,  4 Nov 2026 20:32:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 36E9B407F2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793824329;
	b=nTBJmaNqQGH2CiF7RTgIA9IkEG+0mEHKcudj00CTGdESUJoPn2vimx/Q5gML9FdMkrcl
	 tWvtEBS8RtAQczpIamXatULdDR8advLUQbB4/QjFKuntor0mhqSoaM8fxu8zER+eYV595
	 s/+croG9VOfjIfxgqsifw0sGreEsI6Qoww1BRt3Rsx+y7/kTb221UBSfr63AL3zUZiHRH
	 Kf4AxCJ6mLmPJPD1KS8mzxMlKpsawQmkb6N2pDkNMNiQm2Nt33zxrAPR6XIBXE5cvUAMD
	 0dblZ0Pkkj+5ykqNdmLgN9FKIezQy1r5pYTePHGeZhz19dcw4j7/Q+zdDufSytF1v8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793824329;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rwc7jZclUV30u7iAscOMwC2RkgrHFi/O6+BCTHpVH+E=;
	b=baxnDcQL0jz+78cFqcj44IEiYlQzur2SJYKgaoAt4WCCrVuQutclzvLmdM+sge5hl0F4
	 Y3GIpyOCY/ex+wrs/bJEnya0Nx9rzmY8bSTICVy1ZgpKkhVDUnuRI7/VRSzn2uhn0JSKE
	 RK8TFbNihIRyOcyV6baDlc05AZV9P1wHq0raR5xyT8va0K4G22ZRRBZ+Pml8JogHWYTxU
	 fHSq6NpD0ZlEuZjbbvDSh7hGijrXGiHIqG4A89MLgYOoB2YGsVu/G2FRgLgnePUUeAMDQ
	 AJKlmpL/O2SegYLr6BmZx8CR9oGq41GGgJ1VMA/MAtrclpy/A1b5zm09jMD6V16DDnQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793824329;
	bh=rwc7jZclUV30u7iAscOMwC2RkgrHFi/O6+BCTHpVH+E=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jT9Ih4A7VKIiCGwQkPxqEgft7UZ1Qo/Pk9lnmUAl2E5uuNlp0xrx7iiF3/d2mtEgr
	 oSJ2/Z3Zfos0KI1lZ8JqX8xmhDcnYkK1rhUFa7TuFcfcIt4CH942iDvRl8jZ/XhDKZ
	 A5VtfO9ORcKm7biGkc2PVHeXEl1OkhtqhJCFHkTNifVaJPv2HS7qY9h6+p8gB/CiAH
	 0SfdZ75rzQI5tviUSRhEdJp77OWHeycC7QS0+cHfXB4YqvCTf01r+D61yNiuWLfn6i
	 yO2LKj1hTwckAksQQ4nMdLR8HXU3iMOFrr2qB9Zh739P/u62QpnJTKMPB7CUq7YCtY
	 phFLJY3BxYa2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36E9B407F2;
	Wed,  4 Nov 2026 20:32:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BF2C1789
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E61BA6080B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYGCHXIaovkm for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 20:32:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D0FDD605F7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0FDD605F7
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:32:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B188C4E40146;
 Wed,  4 Nov 2026 20:32:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 860185FAEB;
 Wed,  4 Nov 2026 20:32:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6718210329206; Wed,  4 Nov 2026 21:32:02 +0100 (CET)
Date: Wed, 4 Nov 2026 21:32:01 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, fontaine.fabrice@gmail.com
Message-ID: <auuWPYnf9d3krdLQ@windsurf>
References: <audrTUDPjZfZpyNG@windsurf>
 <20261102160505.1754919-1-thomas.devoogdt@barco.com>
 <20261102160505.1754919-2-thomas.devoogdt@barco.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102160505.1754919-2-thomas.devoogdt@barco.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/libgtk4: bump to version 4.24.1
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

On Mon, Nov 02, 2026 at 05:05:04PM +0100, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas@devoogdt.com>
> 
> Changelog: https://gitlab.gnome.org/GNOME/gtk/-/blob/4.24.1/NEWS
> 
> Highlights of the changes since 4.21.0:
>  - librsvg is no longer a dependency, as GTK can now render SVG
>    images natively; this also drops the rustc host requirement
>  - New GtkSvgWidget for displaying (interactive) SVG, used for all
>    SVG icons and GtkSpinner
>  - Wayland: support for text protocol v3.2 and
>    xdg-session-management-v1
>  - GSK: 10bit image formats support, rewritten cache allocator,
>    clip masks to reduce the number of offscreens
>  - Session saving support is back
> 
> Drop librsvg from the dependencies, together with the host rustc
> architecture requirement that came with it.
> 
> Also add a patch to fix the build on uclibc toolchains, which lack
> fenv.h.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

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
