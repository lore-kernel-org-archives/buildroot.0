Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E220A606A319
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j9KU0/kq
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE7C380F44;
	Mon, 19 Oct 2026 21:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id baHjWnInH7ZC; Mon, 19 Oct 2026 21:49:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4D7DB80F52
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792446556;
	b=Mmd7X6+flmPQ0jgbuhgL5fZdgSlgLKqViFHK+6b5ECj+kK7rF5F+TT6TTtql+PFf9BQ0
	 AKDhIpPt8B1XpP73woCMHhmT7PIm0mw8ZhzmcnOPmGhXP2ftiW+iRuvy/M4VH4KSlJsE0
	 UWMZrIGht9jSSNSR5DqzuLM6IoPy70oo2OHmX4zTx98+utj3c/kNYbJd7EJirRoQRWRoF
	 jWSro6jiACxMa1o0tmZcCab/XpmsFnAEotle0h6GbjPDg4dk1m/YubedplKHXtYMsd8Ox
	 IOi1EmiSIGX23KsTLmnyNfMXmoGdf/QK57IRKtRUe08yVhsXGaMzsxwLu6y4/mZpC0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792446556;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VfZ0DcQLsezAqrmP0Inu03Fv1XzMUvpQEnKUoCwXGnA=;
	b=kiNw8MUrKxiK0GKeRu5rnf599WkLxLntDMUCgccPdylAvJdVoDd0Ic7ChVIC3bvnKrl2
	 7vRU0GVbRPAJa/8wl85lCYIKK4B++P6v6YKGs8RdwlCAilEvqYLodMr0srVHfZjYk7qZ0
	 Mk/o22jlWiOiXxZV9Iz4sAqnDfReyjmfHoj5JuK5C6G7llIYr4Yp37M/4z2soTWOQRBWh
	 vpba82bHDQaSCQ9fFWSvGYHfrgQY9mfuaStvuNbLyX5Qw205YIh4xrxcBHulr7udvXi54
	 +G+UCEcwphMdM4xfLAi+sBI+QCXS+VkVXEEy4BvBIS47o7Zty20j901pahAG9fa9adg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792446556;
	bh=VfZ0DcQLsezAqrmP0Inu03Fv1XzMUvpQEnKUoCwXGnA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j9KU0/kqPdfis21L0gao+ygGrGspqiJ41/kul/jQCoMzvocKRHZusVgWAEMNEkS52
	 6j5U1e+s9BQY6gnBW/LNRoAkiw9zLsme3nIiPQyJxMN9RDD5eW1U/ROkm6ZSXLdVDL
	 Qo82cKGTtZqNyp0W5ZDhI37ZILQXgsupqy6+55qA8pUnFzD+TyDshETrWw+vDEThE5
	 seFdCO+oXyi9cxfPwtz2cyibjtJLhqxz/z7/j4GxLjysoeHQ/aL9uoRfUHwUJQiQjv
	 49ltNoJIW+j5BY9/YfmUj/35JVfAh329dE6G4jpnBG8V4icubWHygI9U4hLZwyj30f
	 TlCuRX17RXBmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D7DB80F52;
	Mon, 19 Oct 2026 21:49:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB65123A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC48860790
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qp0v9SgK2-ri for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:49:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 44EEC607B2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792446553;
 b=SBslxZrJ+Cjk6m1fAnG/lsYt267KgfNY+yxwPDv+jDaAWYICaSojGLejpwnsdtuTZpHC
 nVYKjbH1HVErO8XkjWFRdAlmgG5x7rTqV5sg5usE4v6Kn5ScF2ikQdQXKNqWx3kuLI6Hx
 DlNfRQtkuOn9a5iCh04PUjGZKF77YC9Y5mbVZRce4JAf8hidGKr51QulsDbtx3zHfZwUP
 HghhxBftYbRR9mppAffRcwK6hkhEmD6dxKkXG27D20SDHsSh0RqaVDgx6ql/z2PYWo92n
 965+D02DDL5xZokBlmoM1ZrqJzj8Bfn65iidSlk80TMcBzHLoLExKwircSU1PxIun3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792446553;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=kSj2JyRL5Q9/qWN6z/7oRydzwHlitLx79aFXjp6Arf4=;
 b=MJM9ndNWJmWKZLSDkzxJZJvWfL6QuhNjZLyUapVr3gXqgbcE53Tkm/FPAfmcfkvt1Ukn
 AFpHSM9n5eyNYYkli2IjaNs1WjxEHKVQJSVaqv4ldFJI0Xb1AUFCWiVj3ANatHxvPjsgx
 9HmkSOH1Si9+RKeBS/12ff6PmeI0yXiBipDDk/fdpOk+e/l2W0Fr1NUtLSx1ZsXuL6H9+
 CLcitEkxbFUQNdOy6TDKvyuIcO6wQaiSP6Ncwbo07xnt5/jELGdb8H266GMHbmnidpBsU
 383snkXVGa0b4mZHG4TsfQEp9d0U13ztozdsBPkt3iR6ZTLpaNGDQK7/sEFZ5kDIZBQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=G1Gdz1Gb; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44EEC607B2
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:49:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AB33A4E4127B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:49:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6F13360582;
 Mon, 19 Oct 2026 21:49:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8C4A910328C22; 
 Mon, 19 Oct 2026 23:49:03 +0200 (CEST)
Date: Mon, 19 Oct 2026 23:49:02 +0200
To: Alsey Coleman Miller <alseycmiller@gmail.com>
Cc: buildroot@buildroot.org, Michael Fischer <mf@go-sys.de>
Message-ID: <ataP-bZm_e2dheWg@windsurf>
References: <20260816191830.533747-1-alseycmiller@gmail.com>
 <20260816191830.533747-5-alseycmiller@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260816191830.533747-5-alseycmiller@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 4/8] package/sdl3_image: bump to version
 3.4.4
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

On Sun, Aug 16, 2026 at 03:18:26PM -0400, Alsey Coleman Miller wrote:
> 3.1.1 is a prerelease. 3.4.4 is the current release, and the option
> names changed with it: PNG is now SDLIMAGE_PNG_LIBPNG, with
> SDLIMAGE_BACKEND_STB selecting the built-in decoder used when no helper
> library is available.
> 
> Build the optional format backends according to the image libraries
> already in the configuration - AVIF, JPEG, TIFF, WEBP and JXL alongside
> the existing PNG - rather than PNG alone. VENDORED stays off so the
> copies of those libraries carried in the tarball are not used, and
> DEPS_SHARED off so they are linked rather than dlopen()ed.
> 
> The formats SDL3_image decodes by itself (BMP, GIF, LBM, PCX, PNM, QOI,
> SVG, TGA, XCF, XPM, XV) need no helper and are always available.
> 
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>

Thanks for your patch. In the mean time another version bump has been
applied on sdl3_image, but it didn't as much as your patch. So I've
taken the bits of your patch that still made sense, and split them
across multiple commits:

bc8a47c1ef07eabd14789bf11a41eee97d887466 package/sdl3_image: disable vendoring, use direct dynamic linking
1f02444f51c07b9cf7d9d4a644a2709bca8fad7c package/sdl3_image: disable examples, tests, man pages
785365def77065e0338061b9cad5aeee481946e7 package/sdl3_image: be explicit about using libpng
396e388f83af8c54bd27ac59e584fd6daafbc2d4 package/sdl3_image: add optional support for avif, jpeg, tiff, webp, jxl
145d360b9ba62cb918563c034eb1218956db61d5 package/sdl3_image: fail if dependencies are not found

The one thing I didn't pick up are the CPE information. Are there
already CVEs against sdl3_image that allow us to be sure what the
correct CPE identifiers are?

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
