Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5689ECA5FA1
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8845C606EC;
	Mon, 28 Sep 2026 21:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dOI8XOc4MRbx; Mon, 28 Sep 2026 21:38:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7558E60625
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790631533;
	b=WNTCNMGO84g71nUnWh+/5x/OHBuS1GZrQp/w/dCZbmv1E2OySmNCu9WNCp0lgrP3UWOo
	 Fkr2arNETOM8H8w2X5rf16UtI3OUWvMrR37ldrQoyGDqTy3EYm6IAhisJZqawy8c0NjoB
	 NrVi/Oj4bTjv6Rk7bW5bxcwvjRKeGMb+riFdBEl8EK9bzsUW/ERbLoEIyz1hpajIBqzeS
	 4YSjwrDFNwV/U6+sxlX++VOaqru948hyk5cIHFwPCfwaFnNZWmYQZK2zO13PQeI2UQoYE
	 ywhtGLL4/aoFQ2ldLLCYavIArJV/JZmzknyXDKsRHubJY9s9CH5So7i5e+8WNShwa9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790631533;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eNQdoSjVPN2hp0HS5VKsmU+I8CsZD9HXtdRo8yYeS5g=;
	b=LPJZcZocRA2qufR/xvnWIG1uCkHT4shk0MBGWN0uL5FjGlHfg2I8F1W3ArH1Kaom4FU1
	 vF5kQtjskU4UiQjzdN8pHdfBZT8Z28X4vtJCMbGKz+Sr1l1IACVg1jYXCwwA8Zt82ZrdE
	 NKJKgGh/lcL0W4msUWczGwZTW2IemECQ5M5ZV7TXCVQS1xRlrDe3m4mE8CWsAgp5xmmcU
	 xjMeGGSFJlEgHGjT6wLxVgFkwRhmGFFgQASJxtRWm+HvMVpvB4+8Yc3FU6yTHHaFlyl4T
	 Emgt6ZLrdIHmnxNTPlK4hG+lIM0MpDCTAtQVffami7LbWSa1EpTHwD6ubexJ9nIGshg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790631533;
	bh=eNQdoSjVPN2hp0HS5VKsmU+I8CsZD9HXtdRo8yYeS5g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IANZpAphrvEzpHbKZKJEZtbhHYRNFOlNcK/8BDWmEIClpje/WUqsv/njQD/Zu0QFm
	 pruRh503JInAj4+rJR8F7Af71wxVR6YYYySprJ1sjI36marmwx8TL85Z6299V4+st3
	 ygK3XO4rsYctswWhinUhRDJ9f530GsSRGGED/oB9eDdLAhPb+KSnIvQLqDVCVoYo4y
	 +szDo9SXXPui3xp3V66Nd2jUpoMNIogBbcD/58DnJ4pu0zqT+xu+4v8n1GF+smb9cP
	 hjlXZgfwETj0rfv187oa24bu7iQFuw8IWgqLmMZsDJlVwMHS02fGioySFlVs5QGPu6
	 77g47qoxCcO4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7558E60625;
	Mon, 28 Sep 2026 21:38:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BB5772
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 711BB403E0
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGHZx1dq5VNH for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:38:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 17FF0403C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790631531;
 b=mZjxoTIhhPSpIURRTU3jNm/uw2StOx/sx0+ySwK5/jSTPkvj4H2tMmO3owGLGDGHS558
 pUai7VDdr6OAEdEjzO3s6nIDiJw540O30r6uZIoVPzAUkM5T4i0cvn3N+qSamQ1SH0Oi8
 WqlfM6m7cxF+Vp8cF9M2OrnSF9mWHoJXVibA2DWgshOVoioTIKOGHoANHYQp1C69v0grc
 kOYlZqnh7TBy0A7ztfepQQppWcrH+ixzD5MbKbAMx13Ck0JG2X9C/CyQTKdJJa8tihgh0
 /Esv0+MQwTcPu1ssD+9EDFmQVqQlMtFGzjv9yQ9XZ15JGXGyZ8skcEFPJqKi6BAjRNA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790631531;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=WVO/Cip/2XDjcDOa0yz4LaKpxbkYVdu/+vu2DN5BWxI=;
 b=itlx+1J/I43jwtirKvp5slcIQ7V99Sdv4cM2VBpi0Nc10btrRuA5Js2cLgQQo2n2OsdI
 tsbnymV+HHK8K62c6opOQB8wnOS5fEgTxiqYuPHHjEM7/jjDxc2UdQzgqaVXmg4in99Pf
 a65+tvsfn/S0WkHGvqGkkVwnlv5Aeq44XjXN8qqrJiuHpeIN0ZwJY/H7VyMcUS1VCg/32
 3fl3jaRH0F3rmtX0dhq5CeNXmNEs5cFCZnzTTvEk7+9VQQKn9406ieAtQKNTlivuORkIA
 j9Y50RGYNRkefb8Q5dpqRyKhCpWYzE/e5GtYC509TfIeYDZsnM1wxuwhgFq0SdXgvzA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=PsrTx5N+; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17FF0403C8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:38:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C5C9A1A103E;
 Mon, 28 Sep 2026 21:38:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 76048601BD;
 Mon, 28 Sep 2026 21:38:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 52FED103296C4; 
 Mon, 28 Sep 2026 23:38:32 +0200 (CEST)
Date: Mon, 28 Sep 2026 23:38:31 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Marcin Bis <marcin@bis.org.pl>, 
 Robert Rose <robertroyrose@gmail.com>, Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>, 
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>, 
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>, 
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>, 
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>, 
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>, 
 Sen Hastings <sen@hastings.org>, Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <arreUpL9UjsWZcbj@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-43-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927104301.1801638-43-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 42/82] package/ecryptfs-utils: remove
 OpenSSL support
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

On Sun, Sep 27, 2026 at 12:42:20PM +0200, Bernd Kuhls wrote:
> OpenSSL 4.0 removed support for engines.
> 
> Please note that upstream considers eCryptfs deprecated:
> https://lore.kernel.org/lkml/ZyKf6ZSZrETI+4%2FS@redbud/T/#u
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
