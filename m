Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD5A606A31E
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 01:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ME6mXnX8
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 513EE40A15;
	Fri, 27 Nov 2026 01:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICXPi7_CMluo; Fri, 27 Nov 2026 01:01:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 821BC409FE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795741288;
	b=p4/cIle7RvsiCagkaEOH4SPn5xRyagiOvXUbr1OQghEfeq+Tc0gbo6jxnAQ3iSI0fpoa
	 tbFikK5+SB/kuS5A2eJqXkHMZvjvrTqxD6bQ/igXGlbZWCF1JuOkN9lGFI9x/Lq+aMvfA
	 xrBSzZEooV+e/NZXEnS1fEzO0VglFwBf5B552uNeck6S8zntVp7N+D0CT4XX5vd9E9Z/e
	 DKeHGN6AYiSMAVSkPcvDN3/pDiU4bAO+U18JDpEymW6XfWsA9jaU0F7d0vL2+Ej253S/1
	 z5J5iwAsPMJ1feOHMaFXVERghFk/iJyvdfmnRrMtvN4RboZdtYSuAXBHWGM90wiOhGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795741288;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=MM9gMnRdCzx0b89qkJGVaI+sBO2UNwg5qFo6rMV4mNc=;
	b=dKzAOmIc4p35NtlERt0JVNXTri2plLz589VMHtkARD0ZGz9Yk7xaU4190iZiDc/1M2aM
	 Rzj39sS6rTDaMKsDuqKj+0HnwtZpJ1q/srhcZ95jau0fYo+Hj/A3JO5mdg8kXexysUIrZ
	 EttsqG7+DU0YBbO1xzUiju6hAwrSk509mRZ7SrYX9IjeikzWkfM9bVUoa2I4EWVgRv9hO
	 J66QeGX55ZRv8QYCmxEu53Vjt3YBAImqfVA2+kweHzGnVq/Ydi1eG/bEo+8lPjjFt4/FO
	 YJhPvuiQCJotcmc4m1AKEkDsm78NDGyI7XSbNy++RWL30DU6wqcH0N59DOjE5OE1KJQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795741288;
	bh=MM9gMnRdCzx0b89qkJGVaI+sBO2UNwg5qFo6rMV4mNc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ME6mXnX8zRX8lqEEgGuyZsBgtvUvqsK0iJPzeiZYX0HMx8x9jCD/ZyKnFP2dHKYHa
	 1T0FDY1Us+ptz76XjD53DRnOPS7f7GEPBi4cKY+LNHltzAPycLvLbBaaT97iJVmSht
	 FW2KtD3Mx9nEY5bKVsYM6Y7YW3Vln0IzWAAc8xw5mt+Y9QP4M24bduCSZyO4et5cYo
	 AI267JpZ1n1PiIGXHUzpcfLZugknaG5gEha5lpfbNpkXPs8M07BQTN2zfe9pQS5Qsw
	 QBKlA70LoNv6yC8nMIffLWmhzP9ZJK7FYYypSW1m65mkd9uCo4dQ04iflOZL79RaOO
	 kuVU0VWa2TYLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 821BC409FE;
	Fri, 27 Nov 2026 01:01:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A73101AB
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 01:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 988A3409FE
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 01:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6C5ZJ0QfVPI for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 01:01:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E104B409EF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E104B409EF
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 01:01:25 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 73F3F2C82647;
 Fri, 27 Nov 2026 02:01:22 +0100 (CET)
Message-ID: <196d4d9f-94b7-4d49-b762-55c506a9091c@bubu1.eu>
Date: Fri, 27 Nov 2026 02:01:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Thierry Bultel <tbultel@free.fr>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>
References: <20261126192435.1826415-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20261126192435.1826415-1-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 00/10] Update dracut to v113,
 enable proper cross-build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fiona, all

On 11/26/26 20:24, Fiona Klute via buildroot wrote:
> Several parts of the dracut code expected dracut to be installed a
> sysroot, and to be able to execute binaries from sysroot. This led to
> things like the busybox module being unable to install applet
> symlinks, because it tried to run "busybox --list" to find the
> available ones. Most of these have been fixed in v113 (in no small
> part by me, see [1] and the various PRs split out of it). A few
> remain, for which this series adds patches.
> 
> On the other hand, Buildroot was not building dracut-util for the
> target, which is a helper tool to be installed into the
> initrd. Missing it breaks a number of modules at runtime. Including
> the cross-built dracut-util into an initrd built using host-dracut
> still needs a patch pending upstream.
> 
> The first three patches set variables that already existed in previous
> dracut versions, so they don't depend on the update, but they aren't
> terribly useful without the futher fixes.
> 
> Technically most of the patches after the version bump could be
> squashed into it, but I hope they will be easier to understand and
> review this way.
> 
> The result: Most modules (from basic ones like "busybox" to
> "systemd-*") now actually work, and I'm including a test to prove
> it. :-)
> 
> This is quite a big change to still make it into 2026.11, but v113
> also contains security fixes (how relevant they are depends on
> selected modules), and having (most) dracut modules actually work
> seems useful. But I can live with next if I have to. ;-)

What about the stable branches? Do you think we'd want to bump dracut 
there as well to fix the security issues? (At least one has a high 
severity CVE[1], not sure if that'll show up in any monitoring, it seems 
to be a RHEL CVE).

Or do we want to backport the 13 security relevant commits/fixes 
separately? (They apply cleanly, so doable, just a bit annoying.)
Thomas, Tituan, thoughts?

It would maybe help if anyone currently using dracut could chime in 
here? I've never used it and I don't know how usable or not the current 
version in buildroot is.

[1] https://github.com/advisories/GHSA-8pxm-cr92-crx8

> 
> Best regards,
> Fiona
Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
