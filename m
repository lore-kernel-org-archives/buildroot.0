Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11766606A31E
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kobobolk
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E241F607C1;
	Mon, 19 Oct 2026 21:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id npRwdwn0pi_C; Mon, 19 Oct 2026 21:51:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 03D7160792
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792446716;
	b=gJivFSC9qU8iqiuGdxd6ZFtReqI4v+8bhRQ/DYa3hwKs85DCkSnFpQHG0wkQr7jg5bQu
	 k8zrxsfvTj3JbDMg2wsStEsr6VTOKA/nvdqn8ItiAXJJq0VSJ+cvfaHOfmNU1HlpMUrOV
	 ZCpf3B5AyIZOWru2J+IwdqXn51lCeJqOhqhQdtwuJZDGhdyNvQ/h8JuPrNkRKW5eBRI5q
	 9lYjiCmqTxTxyS24BDNpVRqmqqhFe3ZlB4Kv6AolDxwPLBnpD8WvFfPjH6ACH6CaGfwab
	 E3d7qMNl7voJQCSKR1C8TykPEBwWuU4JUGCvTbJB+3gvyDlamH7h7aH992bZaY1pYaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792446716;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=u23RP/a+OkfKyyA3mEinJ9NOJgly4ZBsp1ICoJeJIPc=;
	b=ENEuJV78ns40f7h0FgcysQuKzh/2kSrwU+aM2wbPQ4YazhE+aur0xqGc0v1nsijEwrZt
	 t7q7/8xJD1EcX53Amk3hS1vOVIn708iejJYAhc2gjj8YMDCT1+5hT3bfSXV49jhN2hKAc
	 xhRY6eLr04nAt7dx6utbYlSltIPAcyyLcup4u6Il/gEMwaMcHyf1F8mIUnPjIcChmuHzA
	 9f+QeZ08le0tpL79i2mpv3j0CzeDF/WbNqK7MBsRDX0rWSYNS85JeArUGjRkutYV+wGTD
	 46vTHevV5rMIvdKQ66sUEL0lmiARVfjuWPM//V5MQGmHo2O9fWxg3c2dSAswSzn3rEA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792446716;
	bh=u23RP/a+OkfKyyA3mEinJ9NOJgly4ZBsp1ICoJeJIPc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kobobolkDZulF4vJmFRx5z+rD5/UbY7x23TXwMHqA49ad3V9q8PVJAi+d396ht1Qa
	 U9UN5mZGbcccBp/2fipr5S3ASRyysXh01Odv1TYenoNdeX5lKa5xY6rpOfwfD0awxp
	 /Hp69dOtr0O37Xcsgtssxqxu1Nhms4eYkkYoLNuGRmZRTgDJvk3cDctsoRH+X6hV/7
	 RGemW0bIRY0ueTA7KlYWEcCEyqLX+ohX4D7qtEvJln2XCggbpuUTjo6eDDGf4+ro9Y
	 1u21wSVGBMUlidd5IwzLgD30wvIb2CAubn3ezgX0Vv/6f+eJO4CeSxTbUVDML8r/mN
	 k0fhugZxQgi6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03D7160792;
	Mon, 19 Oct 2026 21:51:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A7E4A23A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A57E740318
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QpPX18_WVc2 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:51:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 00EC540313
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792446713;
 b=s3Z1Hn78UiLH2qZPW0XmhxD/ih3X6XTVX2CGrRSBu2DO2zov5BvFeTRNjL5qkw5AUx9K
 mivXC1K9kbsoqnz5wBXmNCGwCH+lG83LxPGPmyIN3bMt4aA8Xbjm0FFIPfoND/RueNNlE
 6RXaoDX5uRaZhdpr+22O87wWLR9XJyd3nJCrV/Aq8DrlVQ1czDLhSW6k1Lttn5CvUt4a/
 hEB9DdhAVn6L+mEAtVGQsIj/dE5Pg29sXua32jVDloJuvhHWtJS9auUXGJxi2RmKxR4mS
 SfRIswQTRy3qad+wYBaYFhUrJQshkUpc7mGYgICHdywatcNRi+xyu1nF9JWtmlOvORQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792446713;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=A2oYGyG4UL6j/G91H0AtZA9fIk1d/YAMVvYUC20kLw0=;
 b=tYHbSs2cMVtcDjZYn3hy5nolXQwkHzFu+/DkSoxXSv4svrukV8kmh5c8AKBzl7mrGsGZ
 YO2ykFMkqgyaIERFEPO1zWkJ00VhtLIAYNOrXkCz84FeyNiOquV5z/EXfsP74kLBOFvZL
 ScFsLG3AWv1heCiP8MRud6DY9Inn4j36XspR6FRMx2PcVGjnLtcSWaHV+2+o0nGAzdhjU
 na6xb5E3M9NNQvM/zYB5WIOeiLrW5lIqr9F2P3Uu/KgKNoDVTL3D8018PYHNEYUMv8Loz
 v5TOX9dwtYMarc+aq4n7nVuYmVGODqP4W1rkbCFOWGxNHYN4SKle+cbmeY+P5fZacjQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=koch54Uc; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00EC540313
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:51:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4A0C3C5CD5D;
 Mon, 19 Oct 2026 21:52:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0FE0C60582;
 Mon, 19 Oct 2026 21:51:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0997C10328C22; 
 Mon, 19 Oct 2026 23:51:44 +0200 (CEST)
Date: Mon, 19 Oct 2026 23:51:44 +0200
To: Alsey Coleman Miller <alseycmiller@gmail.com>
Cc: buildroot@buildroot.org, Michael Fischer <mf@go-sys.de>
Message-ID: <ataQyeU2xf_5uKqh@windsurf>
References: <20260816191830.533747-1-alseycmiller@gmail.com>
 <20260816191830.533747-9-alseycmiller@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260816191830.533747-9-alseycmiller@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 8/8] package/sdl3_net: new package
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

On Sun, Aug 16, 2026 at 03:18:30PM -0400, Alsey Coleman Miller wrote:
> SDL3_net is the small cross-platform networking library for SDL3,
> providing TCP and UDP sockets and hostname resolution.
> 
> Samples are not built and the man pages are not installed: the samples
> are demo programs that are never installed, and Buildroot removes
> /usr/share/man from the target anyway.
> 
> Built with CMake, like sdl3 itself, rather than with the autotools setup
> the SDL2 counterpart uses.
> 
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>

Thanks, I've applied your patch. The only thing I've changed is that
I've dropped the CPE identifier information since the commit log did
not provide evidence that these were correct. If you have such
evidence, do not hesitate to submit a follow-up commit.

Thanks for your contribution!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
