Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A7CC982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DA88404F8;
	Wed, 16 Sep 2026 20:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rcq_rox8XBji; Wed, 16 Sep 2026 20:09:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C71E9404E7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789589347;
	b=jAjdlg4Fn46oYqf8xKqLfLPEz7+HYkJNpxKQAuVlB5IlHf+Jl2oeKxBtsoNy0/f98P7X
	 dVS44YR8BozTw14gDOB3F0yfoq/eyTqnqk+DcywXwH3c2FvB1XE2lCF19u3pOmCSiuhcI
	 Ev+/WMlXMNqJXiRqmgcGOtmUqV9uAQwDHUGnRdanRmo8e53vIkJPm+Lfd+a/tHuLuwndU
	 L2NgUlW8cnS/9e4NegqPqPvkxGVp3a24u6++c2e10r1CI8x0pOSPt5LlcjsUMuWJr55ur
	 31BDE2zklULlcKnXLnf0bZNeee/SZ2zzhKBH3U3qFs8Q6PLhBqEzcVCoErCS/dHkjlg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789589347;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OUGdnhwnQIUVwO60TS0VRBJPL9zHA2UkJPvIujwQxo0=;
	b=BhMwQmo27iNfe+FgJxEG/BJKnDGZDE78fnk+jm5P75JwFGwdGR5LRKSqkdvjKUHBmURv
	 rqb/EQwhaNUvbeRaUk4UItKLOcBJrUwilps6in92/XDXB3ORoyN/pcdPqlqBgieNR6LvI
	 FU7ykrCCaQNa52wjE3IsOHqfktXG9Hk6qlN/A2oSJk9GprVaEo45CdPSVYQe+IsqrWX68
	 OEo19PBLgSp2tNi8bKhPLqzS49EyBzkEBOXBXlVN2OQeVrfE4V/g5vPuFh1PAiA5iVyOl
	 kNCT8n188JtBxpwaQakCHJJijy6t7jmNbbDu8faKapdeEuR2NYAwjwKsKASN73xi8+Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789589347;
	bh=OUGdnhwnQIUVwO60TS0VRBJPL9zHA2UkJPvIujwQxo0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b/qoyVWK72gWM6JC/D/AHQP7UkOpljUvNKSrmLY2btk9sc3spA561lOitx4w6I8zD
	 giSkkRrQjd1P8EwcAjjwt4wy9dD6Ma4wcoHFYjNuB0H/O6re5oo6NOgfNRheU1/d/M
	 IqpCyfU3pKFbT97YYpZF6Lt45r3vBZ3U/AP5YvwI6BbjAS0/S7XdAoH/YuEkSR0Krc
	 LvlITCGF+IS83p4hmEJVM7BksrYLTekMowXYpykS0Bch6d+4lrgh+4E/sbQW6lmmyg
	 CxOPPDKbAGeIf9D8CbQJH6mowCDc8sVTch1HbdPBhyO2qvIIAXjAqWxvSmSjaWXlnc
	 KNgxqGIOOdVVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C71E9404E7;
	Wed, 16 Sep 2026 20:09:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34A2424D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 169F680AD0
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ig-HNdmiFrSz for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:09:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 85881807BE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789589344;
 b=cvQuVx06PxMXJnrf6EY1uyl6KRryl1VXG+9KtYcn3KZJ80XsAIfZQyUrdx/qnPdRbVE5
 yz3GNBNyPvRYnrYSHRa7/9ONCZ80PU2QO3h1XdmpELHcCDwAsrUFxo+l2R0c3zZF1zDhH
 HxkmEv4XS6CGDPWA78j2vi92O90pt15ih0IWh/clrvKGtWucQabRmUTvh9hYmAYShoalr
 pWaWVdWtSL2+S+tkVdNMbpscVj6PXFWDxcGeY/tqPqNEh7jWrDJfq1Zhc0R/NmHJEk8DV
 DjjlOdE1zVQk2SZ4fxNdJZUkW1NRnse0PxXCaCzuHW7sykFTuuR08o6WdMY6AvNQqcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789589344;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=Qk1rP/5r9hw87WBv+qrnDyTFnUPvdqykJN24drZkS5Q=;
 b=IfbG2G97JfbrAPCzDQCL2KNiUllH7Fnm6c2j1cfAgU3rmTrAHQ3pOXvxGAgr1zkrQ17i
 dPehfbfyo85zhurWQJQyNEgCCjh/2jtrD4qyDo8eU86vUNHPgDq1ZRzjaFGFS12QmdaoY
 kpeexVJ9LnZAycEv7Ukcer9N2QYPH2F+nYA7GNoq0wCrKSUM0UWz74/nl+oQot4FVQF/1
 8OTl07/0XfoYQhM9noJFDLMivtmBqmyGJfUxi3Brpfh7Ow4FpMDapLUpsDZA9rfG1NiWy
 O+48boFoHBowUvsfl074O5s8QlzGRge540gsgKKR48e8E7lgSlkkm2p5R//bLtKmsWA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=EqfeZsKO; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85881807BE
 for <buildroot@busybox.net>; Wed, 16 Sep 2026 20:09:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1BAA2C5CD6B;
 Wed, 16 Sep 2026 20:09:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 06AAE60337;
 Wed, 16 Sep 2026 20:09:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 01FAC11C7B053; 
 Wed, 16 Sep 2026 22:08:58 +0200 (CEST)
Date: Wed, 16 Sep 2026 22:08:58 +0200
To: =?utf-8?B?RnJhbsOnb2lz?= PERRAD <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <aqr3J_GSDINE2k5c@windsurf>
References: <20260911080611.55857-1-francois.perrad.86@gmail.com>
 <20260911080611.55857-3-francois.perrad.86@gmail.com>
 <aqZSBEd2SO0aHS6V@windsurf>
 <CAMTop881hu=pLy=3N+rPNtorZFawAC54-xfvWbfAaPz7UrE+Bg@mail.gmail.com>
 <aqZvcahE2rYBiBL6@windsurf>
 <CAMTop88UPXqzwQHz0suGGjQaA6hBWO_k9iNjqvT9zWZQUcMHKw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMTop88UPXqzwQHz0suGGjQaA6hBWO_k9iNjqvT9zWZQUcMHKw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/3] package/lua-lunix: fix incompatible
 pointer types
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

On Sun, Sep 13, 2026 at 09:03:05PM +0200, Fran=E7ois PERRAD wrote:

> autobuilder does these tests (https://[3]autobuild.buildroot.org/?reason=
=3D
> lua-lunix-20220331-1&step=3D100).
> there are no failure in branch 2025.02.x, which uses gcc 14 or lower.
> there are failure in branch master, when using gcc 15.
> so, this patch is for branch master and 2026.08.x.

It would have been nice to actually make the test, and send an updated
patch. So in the end, I did it myself: tried with gcc 14.x, tried with
gcc 15.x.

Also, the commit log should have contained a "Fixes:" tag referencing
the autobuilder failure.

I've applied your patch after doing this and improving the commit
message.

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
