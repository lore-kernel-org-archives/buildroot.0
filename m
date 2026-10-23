Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4025606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 07:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ACSwTvIL
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7B4260621;
	Fri, 23 Oct 2026 07:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCwuEZrhNKjr; Fri, 23 Oct 2026 07:32:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D3CEB6064E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792740729;
	b=Dudeti7w/gv6BcwJDSN8Vu6C7vVJIoOhE4LwYqy/2S2djzhYjUYai+w4kte3odmzoXSi
	 nxPaJsHawNCdi48zBGjEFthtzN2hlsoh6qsnRYl97YAQpQyVDAftohN9P2VAliQn8Ww61
	 RcGnaI7oyDsF+mDdiZDhs00o3COzxt4Rgfr0o+zUCZT2ltkTI+dzIH3hcKIFIhyqZw2f4
	 Nn8b2bxpKRNhoSL0k0i0HqLACIenmH6XVEM2xMnB1TjzsPu+Nub32gclyi+ZqFGTvx6Pr
	 p1o1W52c2w158rFArsdFQ1w/GVAbvqcUO2SaX1rgWG9ENEsJP3I6Y5pADZCqsaDEt2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792740729;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZLGyhQAl1pQRVdzWBjO/TlKOJ0srzA5+xf2KKLklk6c=;
	b=AEGmD4kzPZg/egM3b5CFff9KX09bVWK0m86WJOyRxevHzzelIKwtZcuC9kwV6mI3xKLV
	 bLVnbstoYOYNoKTPitadKn75Nz/hxeTUTXufnIiCJGnL0SFI7Eqz8YGcvnkd1hvfg8AIX
	 TEK+kVEbS1JRBi/yjIjUfzb2iWllbhX9T79NlZcFO1gDWF2A3/eaKBLRi3HfgE/KDnPXP
	 ZjP7PIy93SwokTJFL5mYr6oXqYwbEURlEUw5OrxCK72LFelfhuORnZKp6ta/afyLQTWwL
	 SzW2+tr+lOev7a2PBm0qZQCYrcD4h1LZb719Ssz4wHtx6mhQ2Mrt/JBvZDseJgSlJlA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792740728;
	bh=ZLGyhQAl1pQRVdzWBjO/TlKOJ0srzA5+xf2KKLklk6c=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ACSwTvILutKiFY2d3Z4CnvlzGAOrKNbwZYEqAGkZHWlT9iHgbXIHW+EE7bauaoEi7
	 SlvPfFDB+H1fk7yn1umUJYyvFuw3ayUFy+Ga2b+1SjOuJouFaaxZsABX6Igq3chTmH
	 XfP/CRD5mVOIgie5YzBJJ7IDVPCOiZhG8WDu1Zgd/XJ+yNWzAMTYQKVCEFXVjFhN+j
	 Ii2INI3IJcApR0ubFlyeUrG5NrUtnHZMrwCFTOdj8bUfK/0Ah9mlARTx9cDNzHEVET
	 Exs7Sek5pjAcU/fsezzM6UTTIRt82M91P9TyaFybCuvDkJI4mFHJh5t93vpHvUnJxf
	 PpG1DkNE+HOyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3CEB6064E;
	Fri, 23 Oct 2026 07:32:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D09AD3C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B726280DE3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-2zdgln2A0Y for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 07:32:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B1A3F80CEC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792740727;
 b=F2WEZIvPgTxsjOFGiffxSnVBFSUnnads/ssyjItTVq0bNff6H7S98newVpAQRdle7JOC
 cGv2QQiU9TXp9NlDYSpsq64oS586C3ouL+P6SPHHGqAne50xduqPIp+jaPgSgl2IDAbyS
 ugtOH8Iylnk25NPTPnxGYKde6PogreIRVHc2WNrPUBZgiTBFZmHsuHTsljKEOo14mfQLr
 Ls11KewhufY6t6sop77/NcDP6LXts1LHwMKZ/jvhxiOOawYTiJaHuX93QCXw5CF7HsQPB
 6eIjs9SZx+Jrh41MXjLu7hmdlNzO8VIScY4WASqlqYm2xe9P0Esh9X5u/6UM1sMTH3A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792740727;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=SXNNtc5EteFKMCVqypRImSyU7psx5ZzTCegYEwM7rjk=;
 b=sQ664/2LU70yyC+2VhjdYQQAAv65svrWcSnI4Xf/izLrqiyEhJKiIoQA+hB9bdgoQ1Tq
 iq60DPq+Drfeae+wf0ny2sfP3ibYJ8+Pwi0Y43qrPA00qSL9S00rcyT5mHHd8x3wNb4S5
 qAnyIXZLXd7XKHfWnZqxka2daAHppUoqsXMLGFkI7ZiWNYR5rf2NR/zkIdfJlFsWmzX/h
 1rGEgPmUufUZu2+PWM+PE4bT1xToNq+FWwST/DdO+a/EYEQSqQVPHOa08/MCdUIhDWQ3c
 D2RXuTS00kfMSX73iOL2hsfXea8X3jUYlOwdYStc+Q/JGZj9G373A/bFqF9dh46/jzQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=e5eU5eFB; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1A3F80CEC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:32:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 90DDAC5145F;
 Fri, 23 Oct 2026 07:33:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BCB5960398;
 Fri, 23 Oct 2026 07:32:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C1BC210328EBA; 
 Fri, 23 Oct 2026 09:32:02 +0200 (CEST)
Date: Fri, 23 Oct 2026 09:32:02 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <atsNbiU-XL-N9Ws9@windsurf>
References: <20261023001113.59344-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261023001113.59344-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/tailscale: disable built-in
 client updates
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

On Thu, Oct 22, 2026 at 06:11:13PM -0600, James Hilliard wrote:
> Tailscale's built-in update mechanism is not designed for Buildroot
> systems and is likely to cause problems. Disable it with the
> ts_omit_clientupdate build tag.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
