Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210C5606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sQzflIgp
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6DBF409D1;
	Thu, 22 Oct 2026 21:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tCXZ4d1Wwjan; Thu, 22 Oct 2026 21:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4CFB94099B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704441;
	b=M7NPKfDEF4t8YcG6wgoi1w/8GZHAjpK0o+tG3xdQP7ddLiu3PkIg/RrJPrBlerTKCck6
	 VUk6oGppU/NxDAPyGgm6Iig594Ya+/7EPpU/069xwQeT/O1ZiQzeX3npS1gZLo40bxin1
	 yJdxo5Ih+NvjjBx83nmcZdMKQ7JDx4jAuzak42juEX8Ix8u6YcbY513KiNrSCxbFQvmph
	 vb7uX9K7sZ1nLuMvMWicZbefiEggQC/mxSNPBy6mxddzxKovbIdeCRlv1vbQDTTXVMa6w
	 RjjVBQ6KPXIOkxYbRG5vp6yYoaX0JsI6bs718q2Ks8JoeYRpgT6VBpCS1/k8lCKz73A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704441;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dVu68QKaq5ym63wg9Vb03nhLug2xmvodrQSYx++aJ+k=;
	b=lsaBON9RhFXrzXXeWFSkRsnimXvnPsMpo3Gi4spevabprQutypCfAx6C0D3qiMUShDOo
	 EMQlg+yRl5RUi5+bZGOor8X9mUQ3RvGYRkp6ie7F8NXbctlwjhmksC7aGCi74fDQXBO1z
	 u/W5dCMuLFoQ6TwiJqIvfMVj1fIEjNGkAHKarHHi3grHOjLbSjPdihoxovkSVoCG+du7H
	 5Fc+HYU5c47MDuxKc3i2IjNdlT8U7EW/jU93jgZIP4Fh49PnwHMvmM7AsOexzxqh4HaKR
	 W3l8HgmUK+cceZFCEIHU23go4vmYyGpgJNepwPDmzlefcXDaNh+yWO2o2GhaeoTat3A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704441;
	bh=dVu68QKaq5ym63wg9Vb03nhLug2xmvodrQSYx++aJ+k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sQzflIgpY99LnHLqzqPoEZSJibmJTg2P4ue6Z72UdMGxlXFNuFtMo7bMj50QKSfgh
	 DQImMHeH4fKisfflNX99bGWLDUaruwsrg2O8FXD03hvZ9su81wg7Gz3r1B6XMo3JF0
	 vSmjwI62aUhDiUO4jJcU1gfqNVzWTwLmnNumyWTmMyzCdGAtDA3u7UlKkWo2hHwwC7
	 bCrzaH94FZH/4M0WVykweESPEzxX0VlOdFd92BJyUe29yZy2x9ttg0Hq2aQP5cmT9C
	 yR4e57Rxjb1ihf5Pts06liU1+706XphkWWy9arpSuR9BM3ME1gp0v8/wbFFuqIQADB
	 5y4cNKotog6qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CFB94099B;
	Thu, 22 Oct 2026 21:27:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89C25356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86D99401DE
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqWtqiW6vW5s for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:27:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 78EA9401D0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792704438;
 b=UpIcuexR9bhvpzYexHnek5wok+yOjyqssUe14HvXraYqjrKYW4k8LJxdMNu2QpX1MqLI
 pk72EbKitFVAvXRm1+NrquidYYZrlNrrMU7BKgc6s3rRAQLHYzzMHIzUuPGcrxBpYl79U
 qelfu8CsM4tIuZV8WUYKwSMqkLc5FmdOOQLGbcc6L+WQmLrts8v8XebAkkx+LqglRyrbL
 7YanaZksdgoq+Uta+yeKxJJ6kIijIqO5cBo2nn59CjVGloYi45FqmXu/lZPRrEczi+n+o
 GPcTYHtai7LeVUVkxGzPckRO23xOxej/oU/HM8cPc9tTu6ABC70bzDKn+5maLVIINRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704438;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=G4iUaBCOMgJB9ELpREmDp+uQKaiTaiCXyxwYRohthag=;
 b=Fd9rPZtO9g4tNu+nA0uFmBveXBQvRT76fE0/cuZTpQWigmM+zS5u9Is6Ow2IUtFsVpU9
 xYVIaWSXjPpnShOup318abFAFYXvYgWVMM/enxNM2bAlAaA+fXw1/mndmr7s+XFLdoTaB
 7V8rAS1HGyFQY0MfKbyNyEPOaG1QRHFbYMOXuVXymGFgRjrS6LqF/Hvhvas23wJszBhka
 g25Cj9Do7x4JHtKfLCX3d93A631fqurML+hABavzsAUEapNjFt/xOhpSJPJXUeTF+KBar
 9WzBw7SdLc6g3Ihcx7nwuMsEcmKrV5g3Tq0IL77U3I51Mo4OqowNsFThf3m07xb7Jmw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=olUOz4aS; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78EA9401D0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:27:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C401A4E412BD
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:27:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7B73760763;
 Thu, 22 Oct 2026 21:27:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1A56310328501; 
 Thu, 22 Oct 2026 23:27:09 +0200 (CEST)
Date: Thu, 22 Oct 2026 23:27:09 +0200
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, Vladimir Oltean <olteanv@gmail.com>
Message-ID: <atp_qA2kksAlBj99@windsurf>
References: <20261003205402.2056139-1-vjardin@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003205402.2056139-1-vjardin@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/qoriq-ddr-phy-binary: bump version
 to lf-6.18.37-2.1.0
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

On Sat, Oct 03, 2026 at 10:54:02PM +0200, Vincent Jardin via buildroot wrote:
> No change: the firmware files are identical to lf-6.18.20-2.0.0, only
> the release tag moved.
> 
> Changelog:
> https://github.com/nxp-qoriq/ddr-phy-binary/compare/lf-6.18.20-2.0.0...lf-6.18.37-2.1.0
> 
> Tested with Buildroot's GitLab CI (test-pkg on all toolchains):
> https://gitlab.com/vjardin/buildroot/-/pipelines/2909708419
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

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
