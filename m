Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0402F606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 20:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EEmnBqpb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C77D5406E3;
	Sat, 24 Oct 2026 20:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eM86zW9w93uO; Sat, 24 Oct 2026 20:44:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EB385406CE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792874687;
	b=GbHROFqkf6ESnnmJX9RpzGdEgYHoN9VDTlMMIz86FDa8MlwGxbV3t88FqC2dBAoaEPuu
	 UZ0bfk6JQ3aKYWRAPEdcvYUTuraQT53VZftdDBNlS7kHWIq3leXqnn/K57HCWsB0FzA7c
	 O5y6plx8w+NhDg0MIl7qTVe1khtyUJSPRnYONoJ69MYyW+x0xOzRtMKJN0+TN10jw+t1D
	 7p+KXKPKLY7nemsAPKFDA/uiXNeTC1yxSOGHOa0PWjuDxpjMN3QHmXXNV+2ZpfbzFc/YP
	 hzHQWCQGy9Ig2kPyCWUxAdY9ct6haBcJrLvchV/sqgZ4WNN6+x+uU4afi8F2thnwtTg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792874687;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=m5Lb2F2lGJ0li7N395XMMk+6J7ftvj1OyrFhiL+YXP0=;
	b=qcZZVyAF0A715Wf7Qreg+575elH2JyybwPZKwG7eoxxvxSYknjLzE+ypC0Gj4A9qJWuq
	 SbGxFo6kHPtxabnw5aFud6MvkYZmOK7eiSBWfK8LIeLIWgil7z99akCHNnJF06CZ5yDR2
	 lGi7gPmOL3ZzlzJlnr+1UV8lzCY0r8YsPAIDZutn2/5LTyrEvxNGD6zWpl27WqF98bjmB
	 5ayZJWvTn4r53sx5+Q0wQv2phvqjasTdc21O55d8cG2N4huClRrgiFbRPklrnI6QsHSj3
	 rTDMX3jV0cVskaBvSXu5fWFvAzuRgsrLNdfjiWocxW2Jmw76MxDPduKvqoB5TPfalJQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792874687;
	bh=m5Lb2F2lGJ0li7N395XMMk+6J7ftvj1OyrFhiL+YXP0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EEmnBqpbNcACbbwqWHSiA9HTANX1bQZZSU9yqXUfJTp0DucV6Nzdir7WwJHC7ENHH
	 L2qSw6XaeJmpMg9KXjHqFVi2xxu2Po72VTaYIdyRO303XGL0abS5xvyWDzaRb1Y8TO
	 t55fLrK9tI08Wj4AUl2YWSnbeW1OA2phuE6c67g/apJwjKd8hQ5rA5yTrLPZupGjch
	 GDx8e8ZA42PaYqe1Crqx2uVCHi9ytPHkD3ogv/x7VOW3Sj0UiAtoP2C1idZZo1hxX/
	 29gjIvF07jPjV8+AedwjITPxXBBzsEAJCxrhnoVmflXodUAoGd7eTT8wcAulU6JsZ6
	 1PraWzifP40uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB385406CE;
	Sat, 24 Oct 2026 20:44:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 628604D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 544F5406CE
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQ31hkUzhyT2 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 20:44:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E72E14067C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792874684;
 b=sP84YfgLY42VLKgXSe1vXic1qtfT/uoXpR8Xhhk5uVMHF1A1mPkjWAyGEmiGnajAg96m
 HGIV2nNnzTSnCmm6RlpOusW5HnCSu7BOrOJe3XDhIHJVl79vcnpzjMvhM/rM/ybuhHhKO
 tGUfkSBHl3+6C7GdmXkKrlRHVV9e5vERB+FV3dV7lptzEu501Fz0uiaCCSpx3phPRK0Qf
 jziJiiX+vcWLHgAm5PzXlE/pL7Ha16Vw9VQgejsIwroVp2qrGbNyCJvQLMrfnBfVs5RMn
 p6+OmXF5UTu2KiG3kHFPrOh3OG1ZW02hqhuPcmt1wc3HmczbsDSR0AR4+HTOjMz7wMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792874684;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=uCdlnWHXk9ATR+d7hb5UwhwPQNxEoidUljetL+HPF6o=;
 b=E75JmHm0iABPtJBY0lCp9zCqjDl6DwgLLD4sS52ArS0BkW2bl8gjshK3LmMPBNIdqOPB
 0jKT39wMHBQ5jwwb2wC1CRQrxBoBFKIvS9kEgv+kLh5UXaS8yjP9KKHO+7k3wSx70bW+O
 yl9/pXSwNxk401m/oU0h7HBdbU0K8LSa9n8Iz/d0p21wMalGEul+2ch/zCQgc2soByLnY
 /V8gIMefoaQ9UfV4bOFjZRlkFtxj9pFmgBcx06CXwjZC6EnkefCJSRCWtUCEzHXUYvzoH
 az29QGIlt0+WcR+OSKEJhI6iMWqVzWT5TVpK8TVLMZCh5CLIY/ifJEPIJZHwkkHINtQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=kGHWWIs7; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E72E14067C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:44:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7649B4E412E1;
 Sat, 24 Oct 2026 20:44:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3765A60769;
 Sat, 24 Oct 2026 20:44:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0C96710328DD2; 
 Sat, 24 Oct 2026 22:44:33 +0200 (CEST)
Date: Sat, 24 Oct 2026 22:44:32 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Gary Bisson <bisson.gary@gmail.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>, 
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, 
 Francois Perrad <francois.perrad.86@gmail.com>,
 Arnout Vandecappelle <arnout@rnout.be>, 
 Petr Vorel <petr.vorel@gmail.com>, Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, 
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Message-ID: <at0YSHfI0gcUfMtX@windsurf>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 00/23] Support building the Linux kernel out
 of tree with LINUX_OVERRIDE_SRCDIR
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Florian,

Wow, blast from the past here. Tough (but interesting!) topic.

On Fri, Oct 23, 2026 at 02:47:44PM -0700, Florian Fainelli via buildroot wrote:

> Patch 9, the kernel:
>   - add <pkg>_SUPPORTS_OUT_OF_TREE. When it is YES and <pkg>_OVERRIDE_SRCDIR
>     is set, the rsync step is skipped, the stamp files go in the build
>     directory and kconfig is called with -C $(SRCDIR) O=$(BUILDDIR);
>   - opt linux in, in the same patch. Kbuild requires a clean source tree
>     for O=: a tree with a stale .config, include/config or
>     arch/*/include/generated is rejected by kbuild itself.

So it means out of tree build is only used when <pkg>_OVERRIDE_SRCDIR
is used, and for a "normal" build, you still use in-tree build? (Note:
I didn't check the patches yet).

If we were to merge something like this, we would need to switch to
out-of-tree build completely, not just for the specific
<pkg>_OVERRIDE_SRCDIR situation.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
