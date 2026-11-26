Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9919606A31E
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 22:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bQuJfPec
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B32CB811C5;
	Thu, 26 Nov 2026 22:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOGzlHpnW4b6; Thu, 26 Nov 2026 22:05:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C45FD811A8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795730707;
	b=FKa3z9XrBqAIqzMv1xB64L3KK9LkPd4PpQRgZ/E07hFSrOzgoHyciEMrPjGftJZM5Df+
	 xX/eRVB0FnKP3pVe9SJ+48dXEMU5Hhhjl9dQVqChyUE9TAZ60t8Jln9nY7tRrRsBWf+yD
	 B2hhRUbXKa6CmMHBX7HfzSNZMLyYKBgbAOxeabVnmSnjIDRQC/NijNBvSMp0vqDWLCYHq
	 oWMfxNxtK0Rb6yFRxdqMQXtZEbF/Yh3jRuwBtYDhS6wJIbL01Tg8cSTmvaCAC6DtTo/dI
	 KrDpwJ3W/YWc+HiBl5I1X8TzBWZ20S9MEH5vrZOAamyvlRQqOvvkzyrSr3oOflHq51Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795730707;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nsYwK1b7Wj30ySkzU5+rpuy3QVMeeUQ9Pna1tHxO+aQ=;
	b=f7BEPaBDSiQDD/9iskBjbfbI6el35Qp6gLUlfjD2efu4nCUSsBxV4mE9YGcf6YlsXj5J
	 ZchBppiToUy9K2ImZ2E+pioaRmRHzvuptrr7t9tZEal3RCzIAWSUVKe/ZM9owi9be+Gck
	 l/FlxLI+Yfbd3CeCj2ucrzOd7moIo5Tqxb737Nu849IQ8vQvv4E4ukO1zzORk2wnf3smE
	 GsZdDCia43Hj5kC79IR0bcajDDBlqUd2MI9McVWF4zZifQ/JLCjGsY68toKfOeB3/EcTM
	 NTOq40gk016DY72fGiLMeB438KOARWwZtDTwzn9wi6imYrSRz6ns3zUJFA0bAtLAIGw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795730707;
	bh=nsYwK1b7Wj30ySkzU5+rpuy3QVMeeUQ9Pna1tHxO+aQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bQuJfPec+yQwaIg8QyR+Pq3N0ZfwhMf8oF6/JKGUFP2ydfsr8baGjF63SAsSlmJue
	 Aqf9lm0C+E97wr9S1txJX6RaxBWQXbz5wOgRM2r7fI+m2BlEbEc63qDe2L3ULI+MJU
	 IYDPmt8tq3bacQwbFFewNBCRcR79QjIn7WD/DA0ZaLj/iemdBQ9T3VaBYKH/+8R5+/
	 /6ZYLaW0Yz2xKNTAmOFQi1mlWB+0LY0eFAu4rv9LY8JqBW5xI3KGgUiG18BRNjh2Ub
	 6QNKbfZ8leTRJ+eMqiMeaYePjKPggAgJ0PXUuY7ah3xrKhWSTePKYcwAiWgp0MtSds
	 +gujwvG696bQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C45FD811A8;
	Thu, 26 Nov 2026 22:05:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B14922B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CBC840974
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLXOh55FOe0G for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 22:05:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F06FD40963
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F06FD40963
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:05:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AB56BC2B9F2;
 Thu, 26 Nov 2026 22:05:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1A24660558;
 Thu, 26 Nov 2026 22:05:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 253E811E691D1; Thu, 26 Nov 2026 23:04:54 +0100 (CET)
Date: Thu, 26 Nov 2026 23:04:54 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <awitAthWZxNkuyTe@windsurf>
References: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/9] package/flutter-engine: never build the
 GLFW shell
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

On Tue, Nov 24, 2026 at 01:04:35PM +0100, Adam Duskett wrote:
> When BR2_PACKAGE_LIBGLFW is enabled, --build-glfw-shell is passed to
> flutter/tools/gn. On Linux, the GLFW shell adds the
> //flutter/shell/platform/linux/config:x11 config, which is removed by
> 0002-remove-explicit-x11-dependency.patch. When the desktop embeddings
> are also enabled (i.e. with libgtk3), gn then fails:
> 
>   ERROR Unresolved dependencies.
>   //flutter/shell/platform/glfw:flutter_glfw(//build/toolchain/custom:custom)
>     needs //flutter/shell/platform/linux/config:x11(//build/toolchain/custom:custom)
> 
> The GLFW shell is just an example desktop embedder which isn't installed
> by the flutter package.
> 
> Always pass --no-build-glfw-shell and drop the optional libglfw dependency.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

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
