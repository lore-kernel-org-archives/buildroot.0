Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCB6606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ACwITkcZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46169810E3;
	Sat, 24 Oct 2026 21:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxWBUtEYJX5X; Sat, 24 Oct 2026 21:24:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BF9CB80EC6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877045;
	b=ag/p3OQRroU2sIe/gtp+TTHHifBGxsAmVIXx25EEOgYfFQDWuLvJMEU+EHn+EUdR281Y
	 AOhUQeo/jfNImQW9wxNg6vl7rcX2oE9JvBsXfbwxnn36y1k+7+OvcOBD0WqDMviMasrVy
	 13eeTaGakwrC4iZ6L/yKhIBoBvwKxehl3s2Gm0ptCPiqqcR2URK7SMOXn59zAd+nvmu0g
	 0Spp3uQo1C27mz1Ba15rkHfP5Q5AC/2IO11fy1CvD2CnNXToOAdPHA3shATBf3T/81dlH
	 vJVwE2zWEbeDxkPmoyUokGE889R9+3i6eodnkL0PuoeRWD6V7iGetmJXWEmhZ6/tjkg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877045;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yxylXVCAB2ZWaJ/ZlDHTzbsrOnBsJ1iVuLDctiNMCzA=;
	b=I8nV/W3oTJgJvMxudhJE1ANKHDTO+0apzmyLDnvKUTqDWYTgAL9oLgTa+UHZH+JxJdeP
	 1+rPl7wcdnJLVqjng7s4Y4L4B0Nb7XC4KLpp+gh9lHIyxqpQZD+H75zltxRLQqKEZAIPr
	 MjjNNIAz7Ir//vFqiUD6FttJEwnOOQacJdUvVPZntYEjg9p5R3PXmxCLGnNbLRyuWI/TS
	 Wjssy352DTDtJqlFZzo2jivjSOPN+3W3uOabj/EAQX/C+cMFWYaOwv/5PfDhINlq9D+KS
	 Ueud0OyWm4NZDRoC7DCFCQi83NOTYZ0PELstArER0zToU41GTgNs/Q0JYYbjtFu/e6g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877045;
	bh=yxylXVCAB2ZWaJ/ZlDHTzbsrOnBsJ1iVuLDctiNMCzA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ACwITkcZ5tb3E2hn21ctBxwCe6mr5LWoDtlcF8fkHPzTYvheO9MYRE+g+dNceAM1P
	 yy0SetZwGur01kdiIW+ra0lAvlCkRnVODzXjOhph2rC8i2Kwls9+Y7baFIxef2u2Bd
	 KIFB+lqTGNlP5Za1hQwrjPidYqTnuCxtsHRMZFiM5kt/NwBIswxAjgpctQvEyWyK/6
	 JumqxFD3u+qwRqZIyC0qmEBp60ifYFp/IWEvXJ460I+6JEVRG9I6zCFIPNCK84wQYF
	 OmGsN7kQiKJ+INcBSzsMyqnES5954ZuBgIIdMudmu9YVpner4lXrxez4A30n4nlGaB
	 71PoNEsnnuMxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF9CB80EC6;
	Sat, 24 Oct 2026 21:24:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EB054380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD0F740079
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDrH3bdhhgKc for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:24:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D586C4006B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877040;
 b=RC9mg3d2EmV7qZc6nSHDL4+YtHnEfesNysYi8JfhQAx3VmlR5jiC2q4xKTUcFaJG9nji
 gn+s8vFHFVJVpg7D1tcY0ntgI4cei8DLSbVkaISYK39dScLOtGiHn0PDnCZfHS4jUv/Ix
 nX4/kHsVnSwCkGukC2le77xxUVbcvvCS6+rtFKrL9yUui2lOSP9XdhbAbffPMEus+AZB8
 1ASlecpaV61yskGI/U6t0AYLCK110GUTlIHGDz6lnbFet7I47ZoImo3N0zYYJf+Ih6Xyw
 uU6JY2DpweP834l79wqI4NW2dvU3h7JzztQjaJaYYeRdZ7SKeVduHjbJ2YVwaWvHgqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877040;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=iZ6mGcH9BoIA1XyNORqZAsd67NDGEjCnF+qbM0nSPOs=;
 b=WZEPWIJuiNLKOPpz9hGgBT3IKTl2EL5ZE7JthSZhA6CIs0biE3HQvM+ZInmCeGhNoqFa
 LG2LAdmtJnuYpdC4y3AQaK3KQtYv/zDU3x7yxlUMrsiuBGGfi7+7ZTPmLP6BUGNnQVo8T
 dmiOGvmwVo/LYkjIMqThvaxnD+Wv1oP4YQlZn86FI3g6u9JkPAn/oXIvGnWXwM3kGfnz3
 mf3HRyYrluEC+5HDHBV4P5cebt8TxyxDpXTmCz2/BmjepC0c5t3i3ClsuSrjPlGD98FbI
 dY+6xmZrTNITkPhDWRy6B923vMHNiAKvMeFaojGMRRgda7wvCAI6mYvaTqLRn16vZBg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=y1Fy8D3s; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D586C4006B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CAE9BC6344F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:24:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6FA8E60769;
 Sat, 24 Oct 2026 21:23:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AA2B210329027; 
 Sat, 24 Oct 2026 23:23:56 +0200 (CEST)
Date: Sat, 24 Oct 2026 23:23:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <at0h6PZZ6rM-Ax3R@windsurf>
References: <20261024210728.2817095-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024210728.2817095-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/transmission: bump version to
 4.1.4
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

On Sat, Oct 24, 2026 at 11:07:28PM +0200, Bernd Kuhls wrote:
> https://github.com/transmission/transmission/releases/tag/4.1.4
> 
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
