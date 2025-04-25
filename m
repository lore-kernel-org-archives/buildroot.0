Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BF2C369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 09:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BE7281064;
	Fri, 25 Apr 2025 09:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUiPq4m9oX1S; Fri, 25 Apr 2025 09:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4504810D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4504810D5;
	Fri, 25 Apr 2025 09:17:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB13B159
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 09:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBC6280EAE
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 09:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ir-0UR4QYMx4 for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 09:17:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CAF8480EC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAF8480EC6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAF8480EC6
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 09:17:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0EF814330E;
 Fri, 25 Apr 2025 09:17:02 +0000 (UTC)
Date: Fri, 25 Apr 2025 11:17:01 +0200
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@free.fr>, Robin Jarry
 <robin@jarry.cc>, Julien Olivain <ju.o@free.fr>
Message-ID: <20250425111701.061609f4@windsurf>
In-Reply-To: <CAHHRULU-eMVN53TCpOxC=rXqOV731eq2iXWn5g0wGUDg-FKJbg@mail.gmail.com>
References: <20250328084743.8759-1-maxime@leroys.fr>
 <20250403153950.6407-1-maxime@leroys.fr>
 <20250403153950.6407-3-maxime@leroys.fr>
 <20250424235146.4ab41fce@windsurf>
 <CAHHRULU-eMVN53TCpOxC=rXqOV731eq2iXWn5g0wGUDg-FKJbg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheduleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehmrgigihhmvgeslhgvrhhohihsrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepvhhjrghrughinhesf
 hhrvggvrdhfrhdprhgtphhtthhopehrohgsihhnsehjrghrrhihrdgttgdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745572623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RgAjmJq6zTleBU5vjVqrj3FJl6tg9/sIBfuJQ3pRPOk=;
 b=Ntqx7pia16lPr8DtSiHP75DHtRtmpC2MXwjTQLTpaifh+pmgY+4UPGrrbcDNERXpAY7bA4
 Fzg/0znndxh34Xj7RTTSQ7l8HsVw3YcmQfnU5RvhSjYa0+4Fs0zDzHlxhbJjcJI1ygY8dD
 VYA2tKqRw+aYVHKjSGpJqwMbBcYrAAx2Jv9EuViNU1EdHd1W8pi+UxTlSRoFw4UsaIfYgh
 j2ytY5bjoJE3q2dnLEZlQWcfjqGs4LaDN6qyCr1IrXnUKrIKus3tGrdMxTcacDi08tG9Kv
 CrIQKhVpon6iiqsyqLQJhYRIvj1HPjTTBhIbtWCi9cfrIieQU5RWQoHI+QMDsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ntqx7pia
Subject: Re: [Buildroot] [PATCH v4 2/3] package/grout: new package
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

Hello Maxime,

On Fri, 25 Apr 2025 10:19:12 +0200
Maxime Leroy <maxime@leroys.fr> wrote:

> Grout needs to have UTF-8 local present to run, else it doesn't
> properly start.

Problem is that BR2_ENABLE_LOCALE doesn't tell you an UTF-8 locale is
available. We have no mechanism right now in Buildroot to enforce
having a UTF-8 locale. It could be added separately.

> > +       depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS # dpdk
> > +       depends on BR2_TOOLCHAIN_HAS_THREADS # dpdk
> > +       depends on BR2_USE_MMU # dpdk, numactl, libecoli, util-linux-smartcols, libcap
> > +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # dpdk
> > +       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19 # dpdk
> > +       depends on BR2_TOOLCHAIN_USES_GLIBC # dpdk
> > +       depends on BR2_TOOLCHAIN_HAS_ATOMIC # numactl
> > +       depends on !BR2_STATIC_LIBS # libecoli
> > +       depends on BR2_USE_WCHAR # libecoli  
> 
> Thanks. I am not very familiar about dependencies with buildroot.
> I was planning to change 'select on' to depends on 'DPDK' on a V4 serie.

Using a "depends on" for DPDK could have made sense indeed. But the
other libraries need to be "select"ed, and therefore you anyway need to
inherit their "depends on".

> I thought having a dependencies with DPDK, will be enough to inherit
> of this one.

Nope, that a Kconfig limitation. If you "select" something, you don't
inherit the "depends on" of the thing you select.

> In fact, libcap dependencies was introduced with grout 9.1 released.
> It was not needed for grout 9.0. Thanks for the upgrade.

Ah indeed, that explains it! Thanks for clarifying.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
