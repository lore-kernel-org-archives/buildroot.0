Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFD9C5DF87
	for <buildroot@archiver.kernel.org>; Wed, 19 Aug 2026 11:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B920380E42;
	Wed, 19 Aug 2026 11:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GvUOV4dPGPN6; Wed, 19 Aug 2026 11:43:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787139796;
	bh=zBa4wwQjWOh2yOJcCefJ3J57s34k5Um2r3B3aQSC9Nk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nlzDz7rTm0fupnKQzr4i0j3g4cXXYUOU43CtTnwftz7+IIlJi8WRy7DpojwP7Npe3
	 rjyiBrSRfTDWSDb6E51hHZMMaTWYHFkuq4vTWL/JzbdPrzJ/4BmJlntCLBnuexn+7O
	 8FyTPXUpKDSzQHGP9prcAWrPKJoz0PyS9NUS7FmS79Y2pbOKfyY3YUwz0oQtKb2jFD
	 ew30Bui5YIZykUhmTNHOOPLi/IBPf+w9UvuooAxQZxueA3KwLg/loLAVb3NaWoCVMo
	 neXHu/GZ18EnthWGeT2fuP9dYfHsGnnw8M6HFJHTHURQ3l0CgjpKJfdB8MwUPYBvcl
	 QCueqx1RB8Keg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF79980E29;
	Wed, 19 Aug 2026 11:43:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C979230
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 11:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2210680E29
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 11:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZuYNYXS04mL for <buildroot@buildroot.org>;
 Wed, 19 Aug 2026 11:43:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 023E480D60
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 11:43:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E93D64E412D0
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 11:43:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BCE365FF42;
 Wed, 19 Aug 2026 11:43:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9218C11C7000C; 
 Wed, 19 Aug 2026 13:43:08 +0200 (CEST)
Date: Wed, 19 Aug 2026 13:43:08 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <aoWWo5NkaaGC3opC@windsurf>
References: <20260802194421.1914703-1-fiona.klute@gmx.de>
 <20260802194421.1914703-2-fiona.klute@gmx.de>
 <aoTSw0AjOev0Ae2M@windsurf>
 <05fa60ef-a53f-4581-8845-0faa1b549919@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05fa60ef-a53f-4581-8845-0faa1b549919@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 2/2] package/btrfs-progs: bump to version
 7.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Aug 19, 2026 at 01:35:42AM +0200, Fiona Klute wrote:

> Yes, that looks like the problem Julien described. He tried to patch it, the
> problem is that the patch breaks building a target with SELinux (at least on
> a non-SELinux host, haven't tested with):
> https://salsa.debian.org/clint/fakeroot/-/merge_requests/38
> 
> I suspect the permission would have to faked by default on a non-SELinux
> host (and possibly inside fakeroot with SELinux), but I haven't had time to
> dig into it.

OK, thanks. On my side I don't care that much about btrfs support, but
obviously it would be nice to not have it broken in Buildroot :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
