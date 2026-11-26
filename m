Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88B7606A31E
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 22:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SFLdpQ1C
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E51681115;
	Thu, 26 Nov 2026 22:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C41WUo8lHM2f; Thu, 26 Nov 2026 22:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B3E8680E76
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795730909;
	b=U5D0kCTDmov4+bei1txIhV9Zys0xwUVIbZgwKaZBNfxeQV7818qABKSrwS6EsdmPr2MQ
	 NRjgmZeWdFUgrw1Txz8YPRgx1DRozjRJPpCj07lJRat941WjEUjppRDFAGxhinquKU+pB
	 mTm3Ei+hxR5bvubwpD1RoYqNJdt96vGYjXaJH+SMZqpcj7yzFuIO3T9J3f+GYPm/JWurT
	 nr28FpoayRTCwaS9zUXrsgT65jCOgwsZfarNAvOYOMAN1rYykby5iXczhmepd3bXMP5/p
	 PbxqQLwfpgZDwCmAowkme9XHUXEa81lau3L3FNRWkUuuGztnOgBKCFiSr7nmcrNLI+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795730909;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KUlbpgNfzbypieAwmk5ISWn1IKRWqvgYR/YgdYDWHmQ=;
	b=MRrWLsZDNSESfn7bS7FnVyPHgybDyk6swjHEkI4kr2Sfni9CxF/gGqdujwFBlrXW5UxO
	 SpuDy/2CvOirOh/UQOfcsUP/qNPdap83Qj9EfWErOJEgSabWSMy2wHLC66K2jGCq+arZP
	 ZmhTzbj9yag1yXDluf567+VIP3b+VOCkk+w4jPUtmjgzbKsiM0RE6ZGnEV8OwjZobqlAc
	 cn6uCIoZbV7VGCuXARjk4A+ZzmroPnVgVFU4TnOflKrMYbuxqUJw+ahnG0Wnptz2gHhQL
	 FhjVfwOMK1fTorL7Bz92PuIB39BqRUiCtgU/cSkGZ9gLg95rzWLG9KtdqfgycFPP9Ew==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795730909;
	bh=KUlbpgNfzbypieAwmk5ISWn1IKRWqvgYR/YgdYDWHmQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SFLdpQ1COANC7LBfWH12VUAknjyPoHjFF4vrcwLyE9DAs28Nf4md3IWSqibUmN4I1
	 tPoCdwl+3uo75whroQGKsBjzVAlkRoxv6WEIyE+mfQjpcl60AlMB9/XXgTCsjuTscc
	 fptGYcLIWH8r4Yye+TFVJUwXHcOaOem6t6NCVVlQH8J9gn4n6EsHztJTFtJ99ex/4m
	 +MVEEofPPtvl00zfJ4I2J3kwRuEIk7OxKAwfQXms1rFHa3P0NVripaTzJRvMpx5ibl
	 gt+/IIB5Ik/G4VYr5DdKX6xWFCaxJuZNcq8CfmxmEncRJiGtERx9oknW+XKaLN122l
	 9uEYUSyGZm/7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3E8680E76;
	Thu, 26 Nov 2026 22:08:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF09D22B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B072C60AA1
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMq7-yrNIy0Z for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 22:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 95965606F1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95965606F1
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:08:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9C39EC2B9F2
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:08:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0F63660558;
 Thu, 26 Nov 2026 22:08:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6618211E69117; Thu, 26 Nov 2026 23:08:20 +0100 (CET)
Date: Thu, 26 Nov 2026 23:08:19 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <awitzPXMDKBeq94V@windsurf>
References: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
 <20261124120443.1909297-2-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261124120443.1909297-2-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/9]
 support/testing/tests/package/test_flutter: do not enable the service at
 boot
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

On Tue, Nov 24, 2026 at 01:04:36PM +0100, Adam Duskett wrote:
> If the service file has an install section, then flutter-pi runs
> automatically when the test qemu boots. Depending on how fast the first
> frame is drawn, the test measures the same CRC over and over again because
> nothing is moving on the screen, and thus, the CRC never changes.
> 
> The test starts and stops the service explicitly, so its safe to
> drop the [Install] section in the flutter-markdown-example.service
> file.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to next, thanks!

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
