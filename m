Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D23CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5513408D3;
	Sat, 10 Oct 2026 16:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoqzBzGe7oSe; Sat, 10 Oct 2026 16:53:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2827D40899
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791651222;
	b=NM5iLSttMG2Djb8gYCVFYh+WItbsul5iFRmjhdw34V3hkCceMvQmmLG4/JUpMi+UHmqw
	 SBSG71rQ3gF032/N1mR0ciZHQIlnNkr/aTg7XBN0Ee0SEb+1DzV8SDWL6PnwWx7+uLam4
	 gFtH5MEFreZ7dzRNbWzDS3bcxSCnMRjJvvhYARNlljDaXQgVLBiPtv27YcFKk9gSW4LXI
	 mfBSjcGRetVjl3I/8mDSFnro0xWiW23VUD+bLTO/Irl1FoykE/OGkTAK/eg090DAgZgjy
	 eDFE+NIzN6CUUI3jN0kk5l6snSPwp5ZDcelOSZEUYZtHXBEGPJZxuDFaW2hF9Z7ZtAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791651222;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=icumQeejqlrQHU53Tfn20oJfsBC2LLOE7RnDr7Ufrrk=;
	b=qr/AvIFW35/nCp9L6XYQjTMA8xDJBVq531vHYv+TGtnwgKDcUdyMTNB5pqPEyQ3wIG+p
	 Bh5FoWWOpvV8m1YiAzb6zs9t5O7HGe011TmrMqLXGPIzOiKTQxyyGjIEB/j4RU0NrH0NF
	 Vx2SRnAwqi1k9p0ayXfcZh3fb5dL3ih4tcncGIT3v32G3pfanOmvvgt+daXM/3rDzCDHX
	 ioncMPcd89MrzSEk8cJkIa1AWyL8Ww95eoG7zIbkRhzV/rJmfeTvpW/7FagbfDA8kDJ4E
	 9nXjCCtPZMWn91785iQ930K9fY3Ig6ms6IPqeDp97YByH+P+FZVf0rBIMukYotLOkjg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791651222;
	bh=icumQeejqlrQHU53Tfn20oJfsBC2LLOE7RnDr7Ufrrk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bX08CDJBCfJuZ5ctioFjokBvVA6nk35qL+c5M3qjPZWX/ij3I07IIBiH2ppW+qW8b
	 K/IHuNEPpAnP4MEevQG50Pbi3XRidXYZHLf0JeGS7JNmK9lr0LMOkDrgMb4InzKWHs
	 3ftU9cWvtby0hleIJpQzXTbmb53uZKYu1sk0y7p/VGcguEb0lUI5cuH95HYr2ZLv8x
	 gPjIdlWmMCRe722NBh11XNGg9H+fFITtoTBBfIBfk4ZhOlpZ/EVhP7dTSmxURe56/K
	 EC/zY+yCRZWnVTEBusCMPo+rc2FOGVjlOe9x/DRv7PE5vikeQ/137CliWSxve6/HSo
	 Lu1r0cZJhinuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2827D40899;
	Sat, 10 Oct 2026 16:53:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4980235
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B63FB60631
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKV5ivjZZoJO for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:53:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7710560668
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791651219;
 b=AuDvenIPTpVKCvx5ELZXi5Is8cpCsInvOvukJEhtv7iEAxe8gb3z0P3xyX7bv4gc+Qvf
 QoqhzFIXrMCeeY5mWBgTlCuMd552OEYesaQIZaUKCOQseeUecwr/Y5VkscJ5A9GKW3JZg
 ZvqOtoC7rk4cYJANGEy+GQdANamIRAE3UDseQUtNkDudBNrV76uTVby4agghnimZcxUSe
 XH3a1+Aeau2YeP/WUwHBLLXiXzoV7t/uFY80N93sEpW/ecCAxqFFEzGb6VESrFTlaZyP4
 VaXO6EpwhmaxmjE3DKLru7KrGfRh3kudblIFeJhH+FICW+080nnIjLjpx0Mp+hj0YzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791651219;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=2y2EiZTzi3kHF8+pvlUJqwY7zrLeScHiQdDH/NIuUsA=;
 b=XEA6orbjxIkq+mJVy8EzHnm+8RMkrl7UAlQIyj5tRVvbxZQAs1SNykOujhi2V9Ws3+rK
 WB290pogivxMZo5RYyTWLNHyVmpyMsnCxFfTaieu0tHzmMkEvXQ6G7hDHwUrsYIyE/gAE
 Bh8uGjufi+/anCVWGlM8SCTrJtS3xp4rkx1O6EmaNUsrILe/tRsKipnoGeW8/JMrRYGVA
 KhQeqrSvBy6SOjufR6+C0kXoV8wPsvZS6AtAj7yU+btx832bI5D6hZ13uAHzk63jSJfwo
 wMnizPTwJd6Ome1YhDCQoajo13NosW7OHisq7DCxvRn6klegzxqsCbly6AKre6XL+mQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=QKHoFGeY; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7710560668
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:53:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E31854E411CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:53:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A32A56075C;
 Sat, 10 Oct 2026 16:53:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EAA7A11D706A3; 
 Sat, 10 Oct 2026 18:53:31 +0200 (CEST)
Date: Sat, 10 Oct 2026 18:53:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Message-ID: <aspth74J4W0zHPT-@windsurf>
References: <20260920175043.369725-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260920175043.369725-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/1] package/cpp-httplib: link with
 libatomic if needed
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Sep 20, 2026 at 07:50:43PM +0200, Bernd Kuhls wrote:
> Buildroot commit 8dad17ea06260ef0bd23eebc47c95a8510310bf5 bumped the
> package from 0.27.0 to 0.37.2. This bump includes upstream commit
> https://github.com/yhirose/cpp-httplib/commit/464867a9cedef2b6185e25e3e912d3f796fe58fd
> which added WebSocket support to version 0.33.0 and causes a build error
> detected by the Gitlab pipelines for bootlin-sparc-uclibc:
> 
> /builds/bkuhls/buildroot/br-test-pkg/bootlin-sparc-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
>  /tmp/cciyXsAR.ltrans6.ltrans.o: in function
>  `httplib::ws::WebSocket::close(httplib::ws::CloseStatus,
>  std::__cxx11::basic_string<char, std::char_traits<char>,
>  std::allocator<char> > const&)':
> <artificial>:(.text+0x6408): undefined reference to `__atomic_exchange_1'
> 
> To fix the problem we add -latomic to LDFLAGS when needed.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

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
