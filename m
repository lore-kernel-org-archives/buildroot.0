Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E6D606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Pie/TNPC
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B3C40531;
	Sun, 25 Oct 2026 17:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6M1uUQEccPG; Sun, 25 Oct 2026 17:34:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7A3F640533
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792949644;
	b=n1vDtfOoNB0Gc5plNY68UXUEZaHytHz/M5j9Ti19p0rFdALXPynHblcNC4f/kDjyVx09
	 V07C/vRDcVDJAvjNcH7+BqUxfwpqZDBqsn/mA5/ILRuOLNppZZwJPEMQuUCHsYQUCawGI
	 HUx10yNQ80wE5Z2j39vhCZ/GfxYdu1JomQ16/LBavc4mqMDyK4HuLMncrZsM3uZxguJLY
	 ov1vJZBI4tBb+Axkn2N1lSxDf2s4M4BWM2QiUaWRtBu5RB/4rSMuSmXr0f/uMUrPYSDoN
	 nvvk5xCyL3+4W5Fy3pFOCoFLEsHyLP6PIBDl8g3DXmPpTcix0Vxqcu4tL3bn5gi/lCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792949644;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7Gy6T0IekyRRbayWj/3mziZqafCTXs3gmeMpHn0AP4A=;
	b=smgPOdU2mAh8im+5YZ7bOVpquf+qpJm/cCOFdi9Fws9Vrwhj5GSy4Lg0IMN1ID13sbL2
	 Hm9vxlhkmG4l3Gh+jFOC3YUKoTfuuTDqP9/6qEj8rRCHfWxSJ+qRXQA3WIN4WfUBOLCOf
	 bzC8aBvLcza7HWGV6VPu3lP5VdlyTq38s2J/BsroNUz92Q6wWjX0gml7X+II3nUy3cZVA
	 BjKEVSt6Z9S35oZA4gLjZi31nu4rmwdsys1FhO1569gL34eGAa/h7LCBJSSk8yY48AI9w
	 Qli9NRyubKYUewnuZoV0T/PenoZCYUCIVu8hf3CpaH2gunoO/PTPPp44qXAaR1HmyTw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792949644;
	bh=7Gy6T0IekyRRbayWj/3mziZqafCTXs3gmeMpHn0AP4A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Pie/TNPCHlqfbUZ1rMfDkqQj+Km4euGsFtLDF+jq3aUe6dpo1TY5HXTwUzWYDkHK/
	 o0n7pn+naflczvH5MnxvdzJ9g4NF19IfX9KymMFWg6Rfw3PkOKn/+4smqr13/kSOk5
	 E5wgj9V9c3SHoTIxD3oZc3FmkyzWeLNqlmZ3h7NUKSXOtJTfEjoZswr6qnANZOPk9U
	 NSTB3RNP8RHT1zPj6TCg7eTm6dNs/E6nrpoHo9Jq9zErtZT/JoWdcPfF0PaK6xjqZ4
	 vW5tQd+6u+BB5WwGoNQm+VrTKdWeQAb/bxrrgDNGJNYlMQmnN06HeBMoop5fbNvYH2
	 TF7884b8Sec6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A3F640533;
	Sun, 25 Oct 2026 17:34:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 21C8C356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07C6460600
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYYBZf7y-x65 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:34:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6297B605F9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792949640;
 b=DNQcc3Iu+PucvZingJLw/WbFVn/TDoE0XDeylm92pfMOaMDRB2C1SMXE4bS9dgGwlNoz
 WrqE7eILdEUrMxeMFyvChy4jspouh71K+doXdGN68Pc1A0eXBKTW6OTT4oDADJaWDdL7f
 Vh2egIODGnpOlM3t8vt6Cc5GodCaiCtFWr8W/fEOWwy1+Rm3F1xbMLEmdVe17n7CaAKQs
 EReqdN1UvUXIeULm5ZKrSEyJtump+cwQeOzxqiyUD4GFfJc3uVcR4a8CtKnl51Jk7yYaY
 dpwForwMf8svGxuRis4aDbvAprwtZsCX29OqAEDgHEwyA0l1k4+S8F8ZoWD0zKKvFlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792949640;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=i7M3SwJN0QIM62kNt2T26b29tIPuihn/H01oJLRkfxM=;
 b=fJovMc8HOPLHG9/L7GNDxtlEveKXovoG/hqPZKORMDHcJdacfx+S4ertKQYp8F83QKc0
 zZJ36XJG/L7Cksj7ICHFH9Edw3dWbr9FSH4d5xyHwWhGQ+an73ymOTkci61EM3d1J7JQF
 qsgd+QPwNirR6pg8VuEkVqFxKpjGfWHM32NrzMtaa2lR8xF862l2nP+43GNRcjz4vZb18
 UJFNs4Ubbyp2mxZ+HSPnnIkLiHKEO5k47xMp+vjEeG862o+QauFXxfvtK2WM7dvSHvnGe
 tQH9pOr9sUehGY67pcEfTXzjBk7NdApMpdswAghzkoahZvykygEoiVGFVKs76HpXeGQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=oEivt4yZ; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6297B605F9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:33:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CA3274E41308;
 Sun, 25 Oct 2026 17:33:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8393E60740;
 Sun, 25 Oct 2026 17:33:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1249510328E76; Sun, 25 Oct 2026 18:33:54 +0100 (CET)
Date: Sun, 25 Oct 2026 18:33:53 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Boerge Struempfel <boerge.struempfel@gmail.com>
Message-ID: <at49fQaUFcnZqSAT@windsurf>
References: <20261024132350.3708324-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024132350.3708324-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libgpiod2: fix static build
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 03:23:50PM +0200, Yegor Yefremov via buildroot wrote:
> libgpiod 2.3 switched to meson, and builds its libraries with
> both_libraries(), so the shared library is always built, even with
> -Ddefault_library=static. With BR2_STATIC_LIBS, linking it with -static
> then fails, e.g. on ARC:
> 
>   FAILED: [code=1] lib/libgpiod.so.3.1.2
>   [...] crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC
>   [...] BFD (GNU Binutils) 2.47.20260726 assertion fail elf32-arc.c:1815
>   collect2: fatal error: ld terminated with signal 11 [Segmentation fault], core dumped
> 
> Add a patch, sent upstream, using library() instead, so that the
> libraries follow default_library and only the static ones are built.
> As a side effect, shared builds no longer install the unused static
> libraries to staging.
> 
> This issue has been present since commit 1d132d04fc0e
> ("package/libgpiod2: bump to version 2.3.1"), which switched to the
> meson build system. It therefore affects 2026.08 and later.
> 
> Fixes:
> https://autobuild.buildroot.org/results/7dc84554b75a370136bfa2451f4b4c3dde0d92e8
> 
> Fixes: 1d132d04fc0ecac014be003b7e1662c47672328b ("package/libgpiod2: bump to version 2.3.1")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

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
