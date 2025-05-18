Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977D2C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 20:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54ABD405FD;
	Sun, 18 May 2025 20:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id krv-ydMQG1P2; Sun, 18 May 2025 20:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E16D4062F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E16D4062F;
	Sun, 18 May 2025 20:43:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B5D271BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BA9480F2F
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qE0RtBu4Sy8O for <buildroot@buildroot.org>;
 Sun, 18 May 2025 20:43:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7DCFA80EF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DCFA80EF1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DCFA80EF1
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:43:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D393C4438F;
 Sun, 18 May 2025 20:43:48 +0000 (UTC)
Date: Sun, 18 May 2025 22:43:48 +0200
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Cc: Lang Daniel <d.lang@abatec.at>, "tuzakli.refik@gmail.com"
 <tuzakli.refik@gmail.com>, Gary Bisson <bisson.gary@gmail.com>
Message-ID: <20250518224348.1f1ad6da@windsurf>
In-Reply-To: <VI1P190MB04933DDA75BE1BC9A23B06929FB99@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB04933DDA75BE1BC9A23B06929FB99@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudelhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudegfffgfeffveevfeekkedvkeegvdeiudfhkeekffffvdegteeutdevjefhtdfhnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhor
 hhgpdhrtghpthhtohepugdrlhgrnhhgsegrsggrthgvtgdrrghtpdhrtghpthhtohepthhuiigrkhhlihdrrhgvfhhikhesghhmrghilhdrtghomhdprhgtphhtthhopegsihhsshhonhdrghgrrhihsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747601029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K2fUN5MsRBuMe/F2wlr8BG4r9Js3yFaDJw7Q+ggKqjw=;
 b=Un61sENQQ4Fh4ysaiHk7m3zPctAo/uDBj1I+E3nMJ5IvapDMkm9Dp2oOPzrKqal+zqmdOI
 5H8KnK5lFNYc3Zj+r+9aCNzE9/5FiOh8FZPPZcRyee692OYMwqYzk9A+UXDvgAF6G7TMcy
 K5w6EmMhrGPI9G3QkeR8kEdhGZfv1P1ROSER5Gect0nhiASkpH5/28hzNaM7Udt2azSeAJ
 2g250uJRasWKyYV7+16w9TMhGl85fsBYl9B17AVXuk+2bYj1smBBTqbMHGGj6oF/CqkeEN
 NTqiNly/wy2cxkGinxwysDSS4hp1ojdlMmijlnmh8mXnWfUYACLa2SGqrshCrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Un61sENQ
Subject: Re: [Buildroot] [PATCH v3] package/freescale-imx/imx-gpu-viv: fix
 aarch64 framebuffer support
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

Hello Daniel,

On Mon, 13 Mar 2023 09:16:31 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> Since e8df0f7 (package/freescale-imx/imx-gpu-viv: bump to version 6.4.3.p4.4)
> the fb folder for aarch64 is no longer included in the archive.
> 
> According to meta-freescale [0] the framebuffer output can be enabled on
> IMX8 by using the wayland libraries together with egl.pc.
> 
> Tested on an imx8mn by running kmscube. EGL and GLES support detected.
> 
> [0]: https://git.yoctoproject.org/meta-freescale/tree/recipes-graphics/imx-gpu-viv/imx-gpu-viv-6.inc
> 
> Fixes:
> cp: cannot stat '/home/d.lang/buildroot/output/build/imx-gpu-viv-6.4.3.p4.4-aarch64/gpu-core/usr/lib/fb/*': No such file or directory
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
> v1 -> v2:
>  - Mention current build failure
>  - Add information for egl.pc selection
> v2 -> v3:
> - Introduce BR2_PACKAGE_IMX_GPU_VIV_USES_WAYLAND
> ---
>  package/freescale-imx/imx-gpu-viv/Config.in   | 16 +++++++++-----
>  .../freescale-imx/imx-gpu-viv/imx-gpu-viv.mk  | 22 +++++++++++--------
>  2 files changed, 23 insertions(+), 15 deletions(-)

Believe it or not, but we finally reviewed and applied your patch. I
did rework the Config.in logic though, which I found quite convoluted
in your proposal. You can check the final result at:

  https://gitlab.com/buildroot.org/buildroot/-/commit/faf2b8a6277c1a10ca08e5ad8ecb488d70a03de4

Also, the commit message was reworked to better reflect what is
happening: your commit was no longer "fixing" fb support on aarch64,
since it had since then been disabled.

Don't hesitate to give it a test and let me know the result.

Thanks a lot, and again sorry for the delay :/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
