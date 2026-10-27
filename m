Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBD1606A31F
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 12:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jf+bEqmt
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E103860708;
	Tue, 27 Oct 2026 12:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3341LtE8tyN; Tue, 27 Oct 2026 12:44:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 091F860711
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793105093;
	b=OvwsHYoNsenMNkkgJAmfHQJdKRFswq3OKskc8kgl/TXXZqmH8mcC/0h8DVoA6tvIC9SF
	 DfE3MEqyfovzAvjQbXP/YIW6IlrmS7uPM3gLumIlRHEjxAMafmndicR2dzY6JzH39lT5j
	 MXvDIsc03Bqy0EvtsuFQbQyn8LuH3QiI7Rlqv0DfdSLT3A/HcVehvASwCALG4lheL4GGN
	 rwmrzmvSlJM48nonSLl/lBlkf4nQKt8nU+g0hR0g1aUyWoRL+EFWpKPtf8JE9x0J9rP4g
	 QC41bMTMx8p+AksTcV1X7ohFwd/k9dpxwh/qvcR9xuGCsxT1RAJeBrfvhe3/yZ6MXVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793105093;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gvyjBnZDjeM7J+4fQu39TD95i3XamV7FeXK++CS219s=;
	b=KoRoHDtI7aDhoVwEyQqIZ4zrVv+qa8YKaADxkh5jhAXJgN2EpNfZFYn5506qN8lTcXJs
	 zhfiNs2Y757KFGvTucELNN2pELaZiQetf70uetBQfJN+ovof+d4+TDFSw0KIyi4ZjhM1T
	 tkUEd/KhVMct+8f0pyAZUtzjrAVmsV2zmO3MWdVci+yi8nWrFe3jNF2mBiHOp3A/bOzGH
	 b/EfpuFYjUI5B/UDdUHTMm4Dnm4eCWKK0qqQu3BCEzeq1dXb1zjTwWvHFGtCmAQ6bujWo
	 8Pyvepx6wCXXyxvCrAEqFPjPViLt+hxUFYt6qeelTKgdiNPZEUKJ/KOoA/maLFhxtNg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793105093;
	bh=gvyjBnZDjeM7J+4fQu39TD95i3XamV7FeXK++CS219s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jf+bEqmtYlFY3SgTRnsUPYmuPxzDXa8ivG5SuPoLE5rAVCrWH2vyswVubSP3nUQ4h
	 5F77J0ckS+OLq34TBCDsT5FE7zzKWcPAO8eFHZdlfsoFFavLMwuNYh9OdrioiNug9X
	 F3ubkX+QT21R9zLbvOKUoyx9JNfOEkO2ug/1E4DYIAcqfOjyhF9iyp49pIZQePN4Fo
	 7SqJJtKtk3DwEhzRMngc5xze/mbZN0IEnfygTn1NCnXTMjosfofmtVfi2ZYlT3Xepo
	 LLeze7/4Az6TApA7VUY7flQW4QYGcWjJ7CClnsdPbmpY612b1uBWRJ1PwBUUoLzo+D
	 A6aXx3r1OMqWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 091F860711;
	Tue, 27 Oct 2026 12:44:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CB1A3D9
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 12:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02ECE4007E
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 12:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPfWU7VEyXI8 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 12:44:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 480774005F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793105090;
 b=NAU38Pg7+NR2xLEMiSeS3pdJBXZuHuIuw7se15fdCyCgsvyxYfaHgRV4fQQpViji+WcZ
 vV07B2496RZl+5qbfg6xrjJJFHudWds1eTzuGGMAMR/N+ZpZhZbQPtChYBQ3B7TYaEMWj
 fgXrQ0GjvfxTg0lXctiVZpMcfO4bJNWkWUqaxM0tn76UHDPNWs17pHH/2K3Hkg1GxeMpF
 SGz1PPtQ1hYHYCl8NOMrT6PDjzdj7X3OZrmo0W2h+yP7ifohNPlG40Xjtl6yTZjBagFaZ
 UgHTacDwZpyE+0q5J5wwAFr/qwR/qX7wsVcr1Hfmu7gRRO3jCJabWbNXJAi8jGK0nPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793105090;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=B8yq1UL6OzJnvuLsCK/rpmMS0R+674R2Bg+dOrk2AzE=;
 b=ilt9vKCtDxJNyv3gREywirVtkCrIubaQ1AWnsJ8wr4xlcXs1eJPW1tCCXdWGn1Z0j3Si
 gBD+1V3fmZTVpN+zxRIA4IOaZimnEXLywKg9ykKR7kdS4DZwzAcNPiRMpwatNeWKdc0FN
 USmd02JebgGB2kGLNt4TXRkBe8O/ucbbr4UdFQT9mwiYTPibpeNNHkpU93b88LqLLGFBa
 pgdBMpD9q2+0ghoVjYSg8gFHygHB5dguRhrJbZCJs0u/SKk9GL5J+x+T0Ah1wCyaur2t3
 s3VlTO00t6OVV4e31ALdvezxzp4Wy5BY//aqHGmRx4yqpizz0s9Md9lP+iuL8OnHycQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=sGC6mDGJ; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 480774005F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 12:44:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1011F4E4133B;
 Tue, 27 Oct 2026 12:44:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C2445603BD;
 Tue, 27 Oct 2026 12:44:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F0B3D10328FB2; Tue, 27 Oct 2026 13:44:38 +0100 (CET)
Date: Tue, 27 Oct 2026 13:44:37 +0100
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
Message-ID: <auCcCZK-kGH25_uM@windsurf>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <at0YSHfI0gcUfMtX@windsurf>
 <fceb1e19-e9d3-4342-b1c3-d10e175dc47d@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fceb1e19-e9d3-4342-b1c3-d10e175dc47d@broadcom.com>
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
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 02:49:53PM -0700, Florian Fainelli wrote:

> > If we were to merge something like this, we would need to switch to
> > out-of-tree build completely, not just for the specific
> > <pkg>_OVERRIDE_SRCDIR situation.
> 
> I wonder if this makes sense however, not arguing about it, but trying to
> think whether it brings anything?

For me, it's mostly a matter of consistency, i.e all packages and
workflows work the same "way". I'd find it odd that specifically for
the Linux kernel package, specifically for <pkg>_OVERRIDE_SRCDIR,
there is "special" mechanism in place.

You're focused on the Linux kernel package because this is what you
and your colleagues are primarily hacking one, but I would imagine
that another very significant use case of <pkg>_OVERRIDE_SRCDIR is the
development of end-user applications, for which the Buildroot users
have the same need of quickly iterating between making changes to the
code, building and testing on the target. They use
<pkg>_OVERRIDE_SRCDIR for that, and would also benefit from
out-of-tree build. Even though I admit the size of the Linux kernel
code base makes out-of-tree build even more appealing. But I would
find it strange that users experience a different behavior of
Buildroot depending on the package for which they use
<pkg>_OVERRIDE_SRCDIR.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
