Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4D3C79F9A
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 13:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B39B080A77;
	Mon,  5 Jan 2026 13:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 656SL26lb8RW; Mon,  5 Jan 2026 13:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEC7880A7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767621382;
	bh=nKtzQJOIErPwjYx1Ly0jHUvFUTd/ncD707eN6WJ9DDU=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=RiOVCA4y72vFXAu41lCCNzJzZMPHP42AdmwQJLXmTiq8PPPubjvy4NbSZhnpL1fGN
	 fN9L2shFlL6hFpL4dfL2jLMtmwRrTFkmhEH12OpUHL6Fhbat60ZvUojpchPb115XKo
	 S0FxddfRgM3aFO78fPI4hN2MGvrsWLKS+aIsnlQKO0kvnB9rqIcWEnEM7ILl+TiuxW
	 udPD8XkwgyLYrypd4MTRLEFIbPKuABnN7CzzpQyC1pB1r+0N/2sYbQeO8w9tm7febH
	 prTy+uX/kFTT4UuuVtpQoV/w7hBOJf+qGs+OehNYwKF6NWtUhFjgsyQbjFB663IkEo
	 FCXdenINcGZcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEC7880A7B;
	Mon,  5 Jan 2026 13:56:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B8BD2DF
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 13:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D16280A7B
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 13:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AJqpHLhXQ-jB for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 13:56:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E76A80A77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E76A80A77
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E76A80A77
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 13:56:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BFE491A2662;
 Mon,  5 Jan 2026 13:56:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 95E5560726;
 Mon,  5 Jan 2026 13:56:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7B36D103C8550; Mon,  5 Jan 2026 14:56:12 +0100 (CET)
Date: Mon, 5 Jan 2026 14:56:11 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20260105145611.7a99251d@windsurf>
In-Reply-To: <CAEyMn7bBCT4qMbJbMPkPHVuvC7rGM-LcQsNaL8=rMw1790mp-A@mail.gmail.com>
References: <20260105132326.4867-1-heiko.thiery@gmail.com>
 <20260105144206.6305e4e4@windsurf>
 <CAEyMn7bBCT4qMbJbMPkPHVuvC7rGM-LcQsNaL8=rMw1790mp-A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767621375; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=c59JxHD5KBl35iS8vqEmkNiEtNS2D36mE+0kaIVWqPY=;
 b=1ay0Lo2xpff/KAajmPCBsmObME9arxhgpMIAQf5pYYVqDyiycHjTPyiUrLW+tdIv7O2zc0
 /nnYzVPcjY/LeunNM//CatGzRQUiWh9+oTh3GGjEuYh076udMoWADqq6+B8gR5i2Bf5jfV
 ww46CRnW2vxRjyTr6CFNlhhmSvAeNa5L6nwFKE/pcTI+15J9iBGpSGQZO5t2FIs25mGoxr
 5k2j8lYVdzpLSE9lQaXxd2YOON/A7kpomUCT8fWVT8XiXinGQ1dv4nhg/+SV87g8r0QZUa
 J5hk++A2iPikGE3fdQAgDZAH1cPtWmWbIWdhOpgyXFZ4o0/6CP4bEcoxb356eQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1ay0Lo2x
Subject: Re: [Buildroot] [PATCH v2] package/uboot-tools: use U-Boot host
 tool printinitialenv to extract environment
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
Cc: Matt Weber <matthew.weber@rockwellcollins.com>,
 Michael Walle <michael@walle.cc>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 5 Jan 2026 14:50:44 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> > I'm not sure why we're using $(UBOOT_SRCDIR) in all of this instead of
> > $(@D), but that's a comment unrelated to your change.
> 
> At least for the first case we need to use the file coming from the
> built U-Boot and not from the used sources from u-boot-tools package
> (an older U-Boot version). How it is for the "old" path I do not know
> if we could use here the script from the u-boot-tools package version
> or if it is also related to the U-Boot sources related to the
> environment.

Aaah, yes, indeed.

Isn't it a bit crappy that the uboot-tools package does that? This
logic is in uboot-tools, but it uses nothing from uboot-tools, only
stuff from the uboot package. But oh well, we're not going to
revolutionize this now :)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
