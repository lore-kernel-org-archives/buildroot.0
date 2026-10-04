Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E53CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5889F6060C;
	Sun,  4 Oct 2026 15:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JHH7xz9EbIM; Sun,  4 Oct 2026 15:41:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6C7346060D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791128476;
	b=d9rJH4bTLSOGioF219xv44OnTMkYygGQlMwDOvIfYvSiZDGoYc1FyBvQU7Jf+fhY6Cay
	 8ZMA/FQCIbqWKbJqvYBICuj1Dbeba4HBkJ0uQHX1KZAqQnchw+k/8natKr2JGGxd50Xhn
	 amyEeBCxxcsb54D+wU9MtSSHEjkXXG0dg6cTwrCUtqMpmJns2baCaNNwczwTU1R/aahUA
	 YBn6V6pPSSds/IJjb73wnFonWBVcMh+10kXdAtjrbN+9kA6JA+iAFM6bWQCHtu8hGINyy
	 JrJQYRtwiQ2jNSzAkoQP9+wH9K5+ku4b4E8m651BkB5FPCcQyX81JxMTauRUvr0oesQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791128476;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VJeezzrKzBVROUh4OEM9su4wJjBKRewGtwfnbCMjNZc=;
	b=iKP19H9TJEdEMBLQ5DMa74puMQ/HFfEEbzveCRYfCxSNzfjzLElU3OxMRtfsYFE3QzVT
	 hpwWvK1/ks5MCqUE/WotUPdn2DaSbDHpLOBVFVWLW8c3uIfYaMq/SD7/7ORlskB9ZZSIi
	 1wOfrkuA4bRQyUZJiwauPs6OBB7DcwxTS0xPup13X5UQYaYhqKepePriBt7aVNfiS00rR
	 nP2cU0mwJ5pbYqOyo5LVUL8nH+WDIL8mWmd2XEjAU17ZNbIrWc6RMPaP7jq7mGnBCTltE
	 zfQO32qScTflensUEYQE3i/i+bx4ukoPUYcVInqYoV2VR4MYp0Noc/hzCuTrkRthb9g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791128476;
	bh=VJeezzrKzBVROUh4OEM9su4wJjBKRewGtwfnbCMjNZc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kgaJHL+VzuiGbAiTTcgt96BQ+V77Qrvr7tI+U5DAPmkvEkSkt3AGjpmvwn93CWi9z
	 hgGZdzDOIwBmJlHQmF7FOnj/WamXNrU6ZG7OcRvQX4wT5ox2756R0ARU6Rmjh2teVG
	 UXJW1zPV5zOjgVM3HQT0KUBaEVXVmUifcColOl5/emL36aads0+pCjgLgknTvGeL9x
	 q5g7Cn5Bt9+MDjNscicmJdMfCv0o2Xx0JtcknZlyst8rv8HzTUZwTSHPfSwtZYQ7nw
	 jCLKxUvnlOb7tv5pjmV+9Olb1/aczmkF3zpu+0q1JdQXqSzTYo/2oAK2UmI1kpYVQX
	 asL0qUN7nfThA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C7346060D;
	Sun,  4 Oct 2026 15:41:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8659E22B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C74280CCE
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vkTiDIMRKk0j for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:41:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CD1FD808FC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791128474;
 b=dzFA/nAhCB5a0mSPV50zMJlZGMHIVA2ley3k4QsBOkjIlJsBXxihE2u906RSLnIDRTY4
 Ya2GauaXoi1+CV5b16C8iWcnpVxVbEIk/5FfPrhN7aF29p2XSy6tD3GlAs4WT5e+eeZN9
 hgubX+GqOxRFrTxmqk21jMuVvClahbEncOGp4cpUGNyLehlO/K28b3u/MhBTTBlbrg1Gr
 XOq3TTE0+3+u1+9WVrlESCZod3FjdTrUerNGp+xRH6MXNQqENooY9d4nO1J+qXqpUGrHC
 YWn6MkUTP2OvpP6RTzlQdvVIxXOUCMR28YA/fVHeCVnV+iJO6edZpgdHv7vM1R7WP0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791128474;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=Y9L7LAaZf2LPfF5kLBSwQYyvN4RSI71Waq9z/gYSbMk=;
 b=mRKtUumHSxqQUaOov++KV5qeB25DnsW6qyDhK+Oc0RYfXEZazqizai6RoyEhISRPHMUL
 2zcB/9hz2V/8np807LFzTijMmfdzj2IrpOL/34qcYgbYHQG+wcN6itsbdemjq8Po4gjx2
 gLEtOI2+yePr7IhKgsH3FjmeNjLcNvf3loNfuuQyHSpkUwlbcZs3X/PCc8fClTJ2GawqR
 EKxZLqaxrafirMOoKyW/LnYyXQoqqmWkrFM+i79K3mtPKI4POSosDLHfB80C8epY7/r15
 AX9tBEGcH2u5qK1LwuwZ4P7WxbqcT9/GwvJq1RCoAewvOYvqfs6z3Vm9tW40JcLsmZQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="F/z2PT/l"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD1FD808FC
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:41:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 41BB64E41156
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:41:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EC709604FE;
 Sun,  4 Oct 2026 15:41:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1D66710328192; 
 Sun,  4 Oct 2026 17:41:07 +0200 (CEST)
Date: Sun, 4 Oct 2026 17:41:07 +0200
To: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <asJzHhtAaiN13HMS@windsurf>
References: <20260930120101.474560-1-raphael.melotte@mind.be>
 <20260930120101.474560-2-raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260930120101.474560-2-raphael.melotte@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/mupdf,
 python-pymupdf: bump to versions 1.28.5 and 1.28.2
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Rapha=EBl,

Wow, lots of work here. mupdf seems pretty crazy to build, and their
usage of clang doesn't seem to be making things simple. Do you expect
some/all of your patches to be merged?

More comments below (not many).

On Wed, Sep 30, 2026 at 02:00:58PM +0200, Rapha=EBl M=E9lotte via buildroot=
 wrote:
> Release notes:
> https://mupdf.com/releases
> https://pymupdf.readthedocs.io/en/latest/changes.html
> =

> Note that this bump fixes multiple security vulnerabilities, and at
> least the following ones:
> - CVE-2025-46206
> - CVE-2025-71382
> - CVE-2026-7233
> - CVE-2026-40505

So should this commit be title "security bump to ..." ?

>  	select BR2_PACKAGE_HOST_SWIG
>  	select BR2_PACKAGE_FREETYPE
>  	select BR2_PACKAGE_MUPDF
> +	select BR2_PACKAGE_MUPDF_PYTHON_BINDINGS
> +	select BR2_PACKAGE_PYTHON_PIPCL

As I reported in my review of the previous patch, this option exists
but doesn't do anything as python-pipcl doesn't exist as a target
package. I assume this can be dropped?

Thanks for your feedback!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
