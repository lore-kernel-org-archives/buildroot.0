Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9301F606A326
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Cju1whj1
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D3626065A;
	Sun,  1 Nov 2026 17:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xq8j5CteNUgf; Sun,  1 Nov 2026 17:45:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4F30460612
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793555126;
	b=WZefQ1TVYQo49pLtox5g54TOOGaJs5GnvUq2h0c+DfXk7nIT0JNg/nubO3+JuGUwaepV
	 ssno2PHPESTswLfBVMQwhdYNd1melgCTarP+WstDDSNffUd20UH043X3aHFT/ILUhosr/
	 8/UEFTry4wo/ayr0Mg4Oiz2pdgABAmfl/zOvYWm1MDwBJaR2Thw6H8wqVIilDlDYsnvyO
	 otAU3PxOonFPk85AmYdzDXJpw06x2m3PNtDmE7zsmcLy5KMAm45oNjMkOLI5fX8R5kkrY
	 8anN2nGVM1GiQXghu02AH8sNIEJJA5ablaYN/LW7DNoUb/fxbzUEhbIjbd5KTjMhEHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793555126;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=t+bBOehj5VQBdkgO8R/yBceqx2iKONKA/YO0Esn0ScQ=;
	b=INQEQvREgMuEPDwiwM11ddIvD3TeuygL8o54rGS8nSP3SZqmSrQX/F+v8mVyqcC/TR2B
	 IPevng/pB62ojp3aBiak0dQsAiDugRuWkhpcVE1KMcWCAk5SDeolR/D9Lnf8fjldX/DOv
	 XQ5VvyCr1fFap+EinmbyZ3+i2XcCHmkvPvschhFuGme1Wf2z+S7fj+p9VJMnUsFK18yfX
	 IBAZtwDaafLfIAUJCMkfcuxo2lmSsnvW0ahAivdZvFeEXVciaxl6OiIsCo4ykhYG2tQ54
	 Rnx/5UmhIs7fv23wyLuBipIvWqbmByHVy8YH98O4DaoZO/280WlW7zyNRFLVULCVJxQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793555126;
	bh=t+bBOehj5VQBdkgO8R/yBceqx2iKONKA/YO0Esn0ScQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Cju1whj1fhflwhIuD/3mJgY9F8bbwocqi1Zu/DEJAiFIOUTopt6jSmDgjfHwPKLot
	 lmoKvweS8D/wPw+ZLok60AQAYPKXeFzkEZLOskuGSQ/fF6rQPdtm+HFTxmBV9Btdz5
	 b+fx49aZs14S9rRzlZSBF5GuT5py7SIcgDKeJqBk62Rdck7EkXZNVDnwA9EiJzDf8g
	 CU4uTEp6EwfD58/tyPD7zPRrYPaYiOcrG3fiqFph+6Yx1uVVA1BklSgBimGEwS4ylg
	 O51VYbGumCO2/RB6dRyj26pE/3W7a60sskvCht2Zo7oKVPnYqdBdUUkkx5eaDZshq9
	 +9pAWDAhUWu/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F30460612;
	Sun,  1 Nov 2026 17:45:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DAE123A7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC59B80D89
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfVSs6w0hY0c for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:45:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6EDF880D88
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793555123;
 b=D0hbNa5MpAid6zryhkBcMuUX4nkLAjlnpcQ6v5n+Hwm8jfHruSx2s0ZcL+jlGtz/7uAJ
 7ESilTAwTMzs1RyFtKVADVYwv4r4On6rYlKcp6AyRFla7brGbEVnCu3ZNbxvDJuIZ5qbB
 f4gQC0iaygFimr1wSkZtCZGeJZTvyFZjMEKeJgTV8WpZOW+YKBT6lt+VhidOdNi95Vdan
 smEQw4KxOrbdcZ29rVJ92j9q/4jexv9Rp22vQwX+IAxf3ZPmsXnoqJH7vayeHVjlz+6ZM
 mxYKXQlRtXpeaCaDIu2016kD7o1ihSCnDDAsB6DrDj7DeOMDZ3evAPkOOHeIq84q1dQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793555123;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=rU9GMTf0aPjmlzYQ+xobpXl96J2/zakRzQkiZY/990M=;
 b=iv8v87915SOIP57Uk3rXxMWaO9NANOCGw87RyWnHWZI1XJh/itLJgG5A1mHrJfqP4K3o
 quc+SxQ5gGCfPYWnZaqHiggnY/PTNtIbgMUYnVpuHhPfw/6LXTgyBvLihb5z1Tck7cODo
 naBiSde2s06WqyFZpxhZXpJkogd9rn0wXmmwEdNOH8zGM6B6NFchG5J5hPhfJOBN4YzIj
 UgCb3Z6tIuueASskQ8oxYYh9aehhUfkDJgryySXBpergxTpRkVSFEDJk969+Cuj8QA+XQ
 myjH1jDvGrrSzOhnWtTIqirIn7bT8/35boMQ07pmxjb0R3YymDPLIj2vly2eyJ/6npA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=QS7S7ioj; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EDF880D88
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:45:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id F01AC1A13F9;
 Sun,  1 Nov 2026 17:45:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B636E60750;
 Sun,  1 Nov 2026 17:45:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4E94A1032855F; Sun,  1 Nov 2026 18:45:06 +0100 (CET)
Date: Sun, 1 Nov 2026 18:45:05 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, 
 Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Bryan Brattlof <bb@ti.com>, 
 Meena Murthy <meena.murthy@amarulasolutions.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Joachim Wiberg <troglobit@gmail.com>, 
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Fabio Estevam <festevam@gmail.com>, Javad Rahimi <javad321javad@gmail.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Roberto Medina <robertoxmed@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Neal Frager <neal.frager@amd.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Gary Bisson <bisson.gary@gmail.com>, 
 =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay+rtone@gmail.com>,
 Patrik Olsson <johan.patrik.olsson@gmail.com>, 
 Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Vincent Jardin <vjardin@free.fr>, Dagg Stompler <daggs@gmx.com>, 
 Michael Durrant <mdurrant@arcturusnetworks.com>,
 Gilles Talis <gilles.talis@gmail.com>, 
 Akhilesh Nema <nemaakhilesh@gmail.com>, Xuanhao Shi <X15000177@gmail.com>, 
 Michael Walle <michael@walle.cc>, Stefan Nickl <Stefan.Nickl@gmail.com>, 
 Stephane Viau <stephane.viau@oss.nxp.com>, Dick Olsson <hi@senzilla.io>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bilal Wasim <bilalwasim676@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Message-ID: <aud6iiLLzaphkJeI@windsurf>
References: <20261030171632.206916-1-ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261030171632.206916-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] configs: remove undeeded BR2_aarch64=y
 now it is the default
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 06:16:32PM +0100, Julien Olivain via buildroot wrote:
> Buildroot commit [1] changed the default CPU architecture from i386
> to Arm AArch64. Since Buildroot defconfigs are supposed to be kept
> in their minimal form as generated by "make savedefconfig", all
> defconfigs using the AArch64 architecture are now including a
> superfluous BR2_aarch64=y.
> 
> This commit removes BR2_aarch64=y from all defconfigs using AArch64
> architecture.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

There was a minor typo in the commit title, which of course I saw
right *after* doing git push. Anyway, applied to master, thanks!

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
