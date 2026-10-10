Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1541DCA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B440440880;
	Sat, 10 Oct 2026 16:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVxY5aGH2SAK; Sat, 10 Oct 2026 16:30:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7DC5240881
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791649825;
	b=C+cjtWZYUnACIRXftdi7TbWHIn9cbiB+yhRcEy4+J315ZO5quYWJn/HWQmPRBBI58/Rz
	 R9H94sUiBYzr7+1qDzgT2Vup50bgVVwA+O8PU/DgGwUc1VpQQBiarM95zaz0VHXeKJ+HT
	 kR9TO6LfIfU6vRqXC63h7PTeJ1wOYdlhfiIaL8Q6Uepwg608rx980ZhBJzpOz6oxylbFO
	 kOYya2asQTfE5+LicqNdHp/AUSyv+E9kqK5qImIIFE0LZiWEJsuv1Lkusp+8XLe3e0IRC
	 G9U1T8ewICjDCvK/0GWaQHNRCh8ZCH2wnRUOXQhnH0ZYP+yAby+bxPgaD3ui/ZELk9g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791649825;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/Z/L+PAyPh2jlH/KDXLJd9IXMf/3Tsr/AmOEu0keXQU=;
	b=JSw1wMqZ6ou4utAxde8bwxow1GOv5V4L7540MDwNMLIb1fwiSwoknUg0kLkwm3NJ6vig
	 5PsyBhiFBfYl71e9Ce+jP47B4Bmaj6uL2VIInpg43/IkOXVGJETrURod5sU5TTbmTtuRw
	 pxqtYDFWtY42VD0sdwTrEVzBqfMHvBTHwMfLTH745205dHK/sUFCdZkMpt+lWR10bTmkJ
	 NzoABQT2Zxr9eUVswyQ+s1YmxQiTNulUDuS1gFUVEIent08Obtr+ZIZTCER9Ihc3XYLjE
	 /HWBB6ZwiYUAeJBp0OyWSMglio5dxuH517RvLP36uzrIrC0E7gw/3CISQS4NmUMVJpw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791649825;
	bh=/Z/L+PAyPh2jlH/KDXLJd9IXMf/3Tsr/AmOEu0keXQU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pVqZGSuMyjLv4SPTVY5E2TqB1GFLtg2zNVYsQHPB4HXgYe0GLgll4DvG4dZysliAD
	 XKSzIBVIfvO/0xKxqRUAk7cfeHNCZRvee5sO2t+coMGLuXqjLjHx567eGeq85ReV2f
	 lG3euBgyw4SVIKLlURUhN9aCTiO7p8IO4DYi+YIPkFOdt03lMoHuBZr5LdSFdw1e8l
	 nXo8uilPWsFLubzJbkOSXtdh7zvS5P+4P4U+iDcXl9BY1NQ+0TvdsJk3W43k1zwqvW
	 ac9qBHYSOAi5FOUUFjYpdYch0YP5dTyawzPyTA8jyShsXiewyBdenCAxSRIYmpNLrj
	 MSvLRjZhdo+mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DC5240881;
	Sat, 10 Oct 2026 16:30:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E823D156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9A774005E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avM4a2Q1knQT for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:30:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 70E2240004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791649823;
 b=bqWBEs2AkYQOy24a0EAAR5M7vw9MCE6VoO17eIlrJgdPEJP4Hre5a66BywW1VVvFZI0a
 uXbkgnHfaoq+iq1asaHbIRiEq14ZmCZvZRipf+5/6H/L5KdIsRU6tgWp9Z3XxGfJFfMza
 q41GXMlvnFwDR989E9qnvej3urOAmCcZIPo1sWtH/1ujCRxOLWLsizkjJb0U9bPdTNxPT
 vbj3zPWSoGN4W4GaeJN4tRS0XTE2nrK5hd+coiZeD2njfazl30YNMf7FSb39E7skP1fIL
 ZwEdfGO8li9EiLSBCbWO4l0+FeKts2uaiJcPj8uO5c6miRjgR6tpU46RlBzBqecsSDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791649823;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=/xtR9BQinJvix3b83vr25wCRKmq9j2YWMyDZaSd1u+s=;
 b=rrWp08xVQp4i53EfWfHES7T3Bo6DUr8f6e/tuJW1umFWilw5kkP2mnUljdYZQn6Edp2Z
 xFoIzgV98Q5I6S5bXkvkn+MKqNDaH8fawpfVXgnstso+vcmi2HQ8KgkVX5I7TUoacurT9
 5YgTqvcNTSH+tWvA16E2100bnKzIS52ivqhd7EWcu204iD7T/Pgs0KfIqau7VEP2HcTKE
 fBwT5GydhYeT2SF14LeWoXWTakRYn86h2Eoj6jk7mkbnpKVb0jUiCnDpIV2GJ6Y3e83bF
 OAP+4dBTzsLHytfkn++Ie4uzVnqYFkC3bBuWiuTn/flgd7DXLD8yVcpw1vp8La2c0cw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=RqLrs6eO; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70E2240004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:30:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 21DB81A11C7
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:30:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 67F286075C;
 Sat, 10 Oct 2026 16:30:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4633F11D706B1; 
 Sat, 10 Oct 2026 18:30:17 +0200 (CEST)
Date: Sat, 10 Oct 2026 18:30:15 +0200
To: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org
Message-ID: <aspn0e8-4wvBMpzB@windsurf>
References: <20260820105705.1502630-1-raphael.melotte@mind.be>
 <20260820105705.1502630-2-raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260820105705.1502630-2-raphael.melotte@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/3] package/gumbo-parser: update hash
 following Codeberg changes
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

On Thu, Aug 20, 2026 at 12:57:00PM +0200, Rapha=EBl M=E9lotte via buildroot=
 wrote:
> Codeberg has changed the way it generate hashes for at least some of
> the generated tarballs (see [1]).
> =

> Since it only affects a small number of packages for us (3 on master)
> and the upstream discussion seems to consider it a "one time change",
> just update the hash to match the new one.
> =

> [1]: https://codeberg.org/Codeberg/Community/issues/2861
> =

> Signed-off-by: Rapha=EBl M=E9lotte <raphael.melotte@mind.be>

Thanks for the patch. As discussed, the patch couldn't work
as-is. However, Peter Korsgaard suggested that we switch this package
(and wmenu) to a Git download. This way, the file name being generated
in DL_DIR changes, and therefore it is fine to change the hash. I've
changed both of your patches to implement this solution, and pushed to
master.

Thanks a lot!

Thomas Petazzoni
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
