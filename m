Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0C8606A334
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JzrsGKPk
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52034810DF;
	Tue, 20 Oct 2026 13:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICwZo0b2qv8Y; Tue, 20 Oct 2026 13:17:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 84CF980D1B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792502243;
	b=H8B6VLJnhv59twyrW3F1zyMk+lC2Vd++wkybmmJgds+p8WFKcWL0+Ay0Hmchz/VqaJtU
	 VtNEp0e6FqGLx6c+LA+xxtX/huUKcpv0uQbS+Datt+uVMksJb/+gvsm0qf+VvzWJciied
	 hm0uLr/rXJlURHTG1JzpbysZuZ+UPd5wBDsy73lvgO4kbpp117tJ6tj2V8igWMdTLWSGa
	 mIYsiK06qPIkidehLy8AG6RzBaTPplOi6KiWBimU8zSOm5MtNI0hd1kVJY1v+7uf1JYhE
	 3E4508Ng2xIvIyqZ5Q3kM3fBoLLcYHYtX7yUe49aV/H1QvjRyqJJCK/11cul7PTJULA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792502243;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IYeOUuP81TeOf6FunpW0xAGCoH/28x00V989xnUjMQs=;
	b=PcVL0L/RZ0OadGRRDlqaHnyPW1Jx6qewhMXMmlcIgXsNaJgjVsObUIsDHXTqfuC1LsXF
	 lupFmZr7NFD2vFR9NFyyMIICcmfY8IGFtbw6l0Sy7ZvrSMgnSbpuEQ3zcVqNSpDI4ZZwY
	 A46r8HUXsUr3Vj7EMTqOsHabyvrNOZWycdXrmPZW0gOGZ2gz66eqLtrdpN/TIkMdpxe8I
	 /DGLBgpCC0TCgQfR5FfcE47+bC18puvdxvtmIAMPtsEh2bL7kSsNLws3rlORARTzgaD5t
	 0V04Voq7qvcCIflb+m2D6kb7tkpoMud0VFgzAZ0ciJskjLJ1LKoUl0MvPlbF5borL1A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792502243;
	bh=IYeOUuP81TeOf6FunpW0xAGCoH/28x00V989xnUjMQs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JzrsGKPkcNFVtMLzA/Z4/sYfvjPESlTRA9Z70w7QkDgNWem6I6DNppYVptwjn3I2Y
	 O5x5tvEjyEovOjMu/8yb8jenQPmh/tLYWQBDzwgGKdr9KYT5jUVd4O4aSLuvcAu+Kl
	 TsRidOiy7deCaWOATwWFiDRGBzRlx6Bi97EVMVlm0ZUUa+so6IUxjdwRjkWGzASqY8
	 Mm3Fxf3Hg8icltMN9g1wNlUq6DfC9Llvwa8jWMhTOxW2RBLPo59AEP189uD2q2qWVq
	 Ti36jP0adLjRv2S9s+5KMYONTeOdJmDCkBPQHKfKMBWWGWGdl15sRNkVtZfhz8TTni
	 E5dcDb8GYhXFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84CF980D1B;
	Tue, 20 Oct 2026 13:17:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25B6475
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2394380FB9
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwsn8cc2Nk0E for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 13:17:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CC6D280D1B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792502238;
 b=FhLRMEbvoUSvsLe/REkzZDVS7nb99YP0ynYoHxakXXUBJM90ZhzSrMPV14H8Ihx154Gr
 O6U7jXEYHSf+wdjuqwn/F/oRkURwZi2uvn68cm1oxndsU9amC2yNtOg+00TQnm/QhUKCS
 LLgUYIulxG3VAQEWokR86b+BXGpdX1DIZHDp4YMejrl7Ov83FWMAUxJbRaiG1zVi71bhQ
 OXkTnRfjzd83IQvW7ESZAXVbsNGWNpGHxb3gPcOSx8+OKBGzn/KJT3kXWwEv/UEzWSRpF
 BEPAeHNoIglA5sCCrHSyPpvNwg31LtL+iyu48cxsyGQuPcoW63qR/AyI7Nxn9pzqdHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792502238;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=ofN5bhWi3uWkDl6fZUKG9GW78YZUs0+mOWZtrKgxfT0=;
 b=mtbrfJB6ZXgT7rKYBvhFIQ1vm0k9H638GPKBvMjeKXZjZW/GCJuKkGqYN0AieqRvuw7O
 02zYJQdSZHY5anxPjsEfrJLzY9Q+ur0Zm4ydF9vEzijjyb18WFWykNxW1oP52tMTZSKDY
 tnM57hUK3JE1hxeg1dYpLp+ENZu2ptcCp22EkqPYr7CsmzuI9iZh9TFqBWssvh5Lo8Dy1
 AI+gpkIDb0fY4aTnyRhqbvUDkN00/CDazV01/IY8mm8SWLx+5rHCCiUcyRVBd2Yq8iqRz
 VZ4sSpgKTA2QRvJjZLA7WRH4DuvExa+erez3pqcWGNwPoXB0t5t9ttvmTLdZQzmZzLQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=dNhcakZT; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC6D280D1B
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:17:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E77B3C5CD64;
 Tue, 20 Oct 2026 13:18:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6413E60393;
 Tue, 20 Oct 2026 13:17:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DF39F10328D20; 
 Tue, 20 Oct 2026 15:17:11 +0200 (CEST)
Date: Tue, 20 Oct 2026 15:17:10 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, 
	Francois Perrad <francois.perrad.86@gmail.com>
Message-ID: <atdo86oTqhAX5Oes@windsurf>
References: <20261020120646.1306735-1-thomas.petazzoni@bootlin.com>
 <20261020120646.1306735-2-thomas.petazzoni@bootlin.com>
 <8b5cbb21-caa0-4935-b2d4-35908b5ab0d8@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b5cbb21-caa0-4935-b2d4-35908b5ab0d8@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-hare: move cache directory
 outside of $(HOME)
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 02:55:04PM +0200, Fiona Klute wrote:
> Am 20.10.26 um 14:06 schrieb Thomas Petazzoni via buildroot:
> > By default, hare will store its cache directory in $(HOME)/.cache,
> > which is a problem as we don't want a Buildroot build to write outside
> > of its output directory (to the exception of DL_DIR, of course). The
> =

> And CCACHE_DIR, if enabled. Not really critical, but might give someone
> who's new to Buildroot a wrong idea. ;-)

True.

> I'm not familiar with Hare, what does it store in its cache dir? The defa=
ult
> path suggests it's intended as a global cache, so I'm wondering if someth=
ing
> like $(BUILD_DIR)/.hare-cache might be better than a per-package cache. B=
ut
> of course that depends on what goes in there.

I must say I'm not sure. On the package/hare patch, I asked the
feedback from Fran=E7ois Perrad precisely for this reason. For what I
can see, it contains "object files" for each source file that has been
compiled, along with a bunch of other things.

See:

  https://paste.ack.tf/3839b9@raw

(from this I can see the path within
output/build/hare-dbus-e9a89f8bc5ce783fa25f0eb67d7d8932db90bcc2/.cache
seems a bit crazy though.

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
