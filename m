Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD73CC982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9538480CD3;
	Sun, 20 Sep 2026 13:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0XiIjXwZUVg; Sun, 20 Sep 2026 13:03:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 62BC280CD8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789909391;
	b=G+eEImwMx+mRivk0PTt/Arj/Greq8UgGBFCCOD6QlKX2h1JeYj0uj/HhNE2PWL3wTCWG
	 wc4eSO7MasyA/1J13oDHJx7QUPFxI97eGlippYHMTkH6rBatrlLw+s4Bt4RAjr/M/osTL
	 6/U3Kmbma9hNgNNhIU52TJHuPZDzLCMB0eGEZ6kc4LnIkwoKWePv/RaxYc1CtvPuHTrUD
	 MdJliWU6Nz/DrM3PE9RCPy4lwC7RuNEvkdFFyT4uG8IVQd3+MCMAiiMog5b4aan/eBTSP
	 4yzktqNPqAT+QlpP8SFKVmi2/N6poysODKAlijjFxMoh0eIV8QSE4Rnz3Mw1rHN+qRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789909391;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LkIvBnLdhp8EwIMqJrANeW8l04WeVXhTbPKLwxE8iVk=;
	b=AYCVecHGhfDuki3dz8qC+kd0zhIVlAmWI9ZPkcBfyqHOzeFbdUP2PJXN8WVtXuD81txx
	 zLK9Bqol9cDv2HfMg8ZkdQXoOUCFYAzTBzGtnoTfDBOlYzQLXwKbbGiB0lSLGOtBuaLfF
	 Cr7UPERNrUJFz8vO/PfXhys3Be21o4s1v5cCeVCD+NxejDm7HpV7zlXRewMsO2a/fmKRx
	 9jpkD/wFlYxGs8+dOy9XV2rEawxpWzPDNgegrTxkXYoznUCq1waziwFPKlsk3sy7bKHPn
	 t80dGOQnKCIyfbE79i4lkoRmvtqBdmz5Br5SkIGa0Q4YfbHccsFWisSMpZ/OEzZI2LA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789909391;
	bh=LkIvBnLdhp8EwIMqJrANeW8l04WeVXhTbPKLwxE8iVk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D2XU8TSwsVdPQ2N6ZuzUlcZGzAmj+kydkP94XBr7bhKu4MYFAxJM8odRxUaXLNJXd
	 IdTFbF6m81aO7qaAkCvawFQx+EZziBwRooR1pn77Dqd8rM+1oNsF2v+SRYGrpj/VcX
	 5ab/K/KC7p4xxNuGs1TMwDyVKMbtxdfABd4qhhpTSqMDMtE4dlWFI0H7307zMOmQkr
	 wLYqr8D7AmkBnu50zjd+arKmSDFMEHFY6JMW7aT4qPzJfHMulW1nlpOWEbl2f9QWfq
	 BvuxtkJPGXabq9GNm6KgaWH1FSY41zL5eainXVkNFPSRB8g1G4EXqzKf3IbksB2DUB
	 GF8ZU6xdh7X8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62BC280CD8;
	Sun, 20 Sep 2026 13:03:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8463837A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69F7360623
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6gaXKKBcsxb for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:03:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 11A086060E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789909388;
 b=fUxSYMoR6WZ1GkX0RFYEcZp7TWe3XhgQdL+ekrJ1E/e3e53R6yC9DVUcTZeS0u2V7ouN
 rrQjnYfHrjvsm7SazZf9BiNl3R590445YrfzZTYkaQIqTpaRJ85q4qVC+k5kDueGuf43h
 g4zil+JK/xkK+es4E8ToTMWEv4RNG8ZiJLpkatKXlmCVdBK9whP94ymrfNiYl+XwEjJP7
 sdM2eZ/07orh1PbVz8a/XEULh+kPbHli2wbGMr3GeA6Frlmom3GdE4K/3/lJXV+Qb6NBO
 dBNv+Py0pYkaFx3ocOIoKfZ9iWCHt818vjU5zHlUViY1268O4rm6mzdhCH5fd1r3gOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789909388;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=RqWYK3l6HsNWKBvPXNXw92YF+eQOnal5iHADycqVnqA=;
 b=LQyneJwf4JdX7Qs2IJdSXcQLhgXfEcbAS9PuJs2aKCJlLU4WzUhMb7nTjdt0/Ye+bGLz
 r97kMDfof073NTqNLIFk5AsLL4fGaQYa75fIt7okLGzte4x1Pn6jNOHjWsTNDQffu9tCr
 urw2skJCBv8Tglf/HCU30vgT5Wxpn5LM9SozeZUmV8scPW8URi+QJkRcP566pPGwgrdzb
 tPAsLSY1gVVHSuDaV8wSbOKdVrG52Mo8vqkD1XnD9Iry0zCbqoHOtERQhCzsdPp6G/F+S
 H7FB1K/xPUzn0FCzb16W1WFex6l9onTK+wEKNrpGad13F0Yzo0TeijO8yR5p+nYdrAw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=2ayEJIk4; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11A086060E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:03:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 15A7A1A085A;
 Sun, 20 Sep 2026 13:03:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DB1D2604C9;
 Sun, 20 Sep 2026 13:03:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5F5CE1032829C; 
 Sun, 20 Sep 2026 15:02:57 +0200 (CEST)
Date: Sun, 20 Sep 2026 15:02:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Koen Martens <gmc@sonologic.nl>, 
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, 
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>, 
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>, 
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, 
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>, 
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>, 
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>, 
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <aq_ZfOBramiQcK1n@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-12-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-12-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 11/77] package/boost: remove dependencies
 on Boost.DateTime
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

On Sat, Sep 19, 2026 at 05:57:36PM +0200, Bernd Kuhls wrote:
> From: Michael Nosthoff <buildroot@heine.tech>
> 
> Boost.DateTime is header-only since 1.77.0
> The Boost Release Notes[0] didn't mention it but it was introduced in
> the documentation of DateTime in this commit: [1]
> 
> This was bumped in buildroot in d39d8f7cee9b4634e6f490020204f63fae419e8e
> 
> So analog to the "header-only" move of Boost.System we have now to
> gradually phase out the dependencies on this library. Ideally before
> the stub is removed as it now happened for Boost.System in 1.89.0.
> 
> [0] https://www.boost.org/releases/1.77.0/
> [1] https://github.com/boostorg/date_time/commit/33dc6136f193a100c753c819694d6d11e9ab4123
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
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
