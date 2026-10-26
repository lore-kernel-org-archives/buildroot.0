Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23957606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 08:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UiXB6699
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 011C980CCC;
	Mon, 26 Oct 2026 08:12:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SluZggpDs5Q; Mon, 26 Oct 2026 08:12:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 10D2280DA4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793002331;
	b=RRTg14cheUMmRpnThJImPwJpmBCkXM0vaqhbmHeKqFiXvL85EqJVk0xL2RVz4F6qdp1i
	 3Qcjle62pVeUNTMDm6PiNoDKRAoPCM2x3+j48LMxvAG622kql+aQOJ3z09IfeH4cxmdWq
	 k64q3a6gVEEXrxf6LhwNcFDfCxxNOwVfGTRYnBijULTSjESsbqtO1txoTj4PRNyda0NVr
	 H0MlnrVCKqgTXQrhFr9/wNHiugRVswI4uGQNygIOgabkbf3mDthuts9xFA7DK19DMRMD+
	 K4Z77kGjMaNavsGSGiCz7f8igZZoI5QepvlZj0/YPDzo59Pp0Du0H7TdnXe/0FTp4jQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793002331;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lYMfmstZ9tje4ky45n8RYeLGh1VSHcAkHe+zjEcFl6M=;
	b=jX4gehL2a0WNL35YyA36dWz0OX0z4sCvd3mr4aPLr3U1eVqUF16VTPw1oCShwl745mgS
	 2wNXHZPYhGAMvb8xyCOg2yfNtqNq/lJ9+y3W0IswWfthl2WW1g4Mkt81lzIQGBpCY91gN
	 cezZg5Fnjhkj3mIxntNQhhAeCS5GYTkeEfTOyUlbOFxFLiXhCpY/h4+6+RYF+kJahz89u
	 iBGsjbsvxvmnwERTtAc+p1GdVp+3pyuCZmHfvzsj0v1wt4QLOn6SoTb0i2ozJP65lxVUz
	 9IR3e7twJ29NKWwNtuTvQO3MZxh7iDzeQFEWd3yNfkO6MhACF5qjCKDYCCyr1cS+SiA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793002331;
	bh=lYMfmstZ9tje4ky45n8RYeLGh1VSHcAkHe+zjEcFl6M=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UiXB6699E7XHQGyknAaR5azJUY4P7B1UOqhJBWVvRs6DbEUEUKZZxF4aV6421/Ndj
	 /RdCxBNrwVNM4UVlJp4EoLFoKwpU4ILuzqKvAhxmK80E5/Tgt3ILYIqPqo4JnT9FFA
	 Zn0izk955szOZ/LJLFR+1R6CKT2vSpYmGAHAmhtOarKhCLWcsdIhe6JK0Z8bIWYWN0
	 4RqKm+U+CawNNas3xExqc7K4Xm2Csad3jQI87EISGkSyyFtel4ZzzPuwomzTGQdMuO
	 kOgOn7M+9mBH47lTMr7holQlWb2ITnt0RhVRqKW5Gb56QheBUX1TDaF81WA5Om8mPB
	 HUjZj29pgOiVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10D2280DA4;
	Mon, 26 Oct 2026 08:12:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C6D14D1
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 824BB80DA4
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkUOu38LWhgT for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 08:12:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 76F9080CCC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793002328;
 b=KrKuzj1ariW9a1wu6QXTE8heAhUdw8xv809Ex+IsUbyCLXMfLXoyeMaF5JEO9gEu2PKI
 fa0t33FlJpc1Em/cu8EUYEyjF0XAWVKzexJpFscj00BRGpiltBJD9oomheGABfIEcdtIH
 KtXZtH+u2rggLWH+5ZmXa1H3ogvAB9OYu1qm3QK6c0U/2Yr5imcHeuDCu6wsNYZcZHSAP
 d5BsC6PWb+elEqDhw9iRS0/CZvw3CNv6i0T/r8iJh8kknPwP6rcFMtTSNISgeLHhBAQyZ
 JYHl59QxG2noziYiYqD3TaX2M63+FDnFwLj6XaUgivuKMJpZ/hpZJNobTQi/y4AazQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793002328;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=XxXHRTze9fuk/1inoMXdkvB+QW4DJP/Voa8x7rannAI=;
 b=L5uRwSsCq6ssV+S59gOKx5YvYHlQbe/pZNPGk7GVriHk9v8F5l8CBpZGYjO13e7dk8tT
 zW7Wn3P0IcO2M76BkZ+pYdIsZoW06T+sV+Wr5/MiMdgQT2mnSerhqB39nlaLqCj+p5Gws
 hLfVFVJ54O3gLMdBTDr6UHOWyOfBVeXIaRDAtoeggg84hVcRgKx1DDoc5fyg24NZzAX7x
 M4A6a+W06gkzN+FRfhln6iXq2yMh89G7M8G3V2nV644bfmiWExqwcKteojYnRQ0bH5HsY
 bePzfbYLIK4wmWWbXEmri92K3bq8bSsG9KSD5ocZhO+r0SlxldnqUusyB3D5v/Kmwbg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=gHS9ZBfc; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76F9080CCC
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:12:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5FC19C5147E
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:13:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6003660740;
 Mon, 26 Oct 2026 08:12:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7659D10328E76; Mon, 26 Oct 2026 09:12:04 +0100 (CET)
Date: Mon, 26 Oct 2026 09:12:03 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <at8LDvBotiu7gDNY@windsurf>
References: <at7t6Uwmu1T_lD8h@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <at7t6Uwmu1T_lD8h@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] perl packages for LTS branch
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

Hello,

On Mon, Oct 26, 2026 at 07:06:33AM +0100, Waldemar Brodkorb wrote:

> I would like to ask if it is possible to add my maintained
> perl packages from master to LTS branches, namely:
> package/perl-cgi/
> package/perl-cgi-session/
> package/perl-log-message/
> package/perl-log-message-simple/
> package/perl-switch/

Hm, why would they do so? The point of LTS branches is to maintain
them in terms of security fixes and bug fixes, with the same
functional scope as the original release. They are not designed to add
new features, otherwise it's a dangerous slippery slope with no limit
to what can/should be backported.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
