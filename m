Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EA7CA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 15:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9014460748;
	Mon,  5 Oct 2026 15:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sBuVmRBO6R29; Mon,  5 Oct 2026 15:59:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B50276070C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791215976;
	b=CwXGGQFVNxOpgusPWHKldnJTdMdxRQQTgmEwsLoVmsDh1folc+R1xr8Es1/t2CH3D6Zj
	 AeQ5Ku0HavKD0bBUVcx2zRwvaytsxqbVP2Axz9AI7XOTNzx/3baDBMt6VpKp1iNuG9ICD
	 DWI+p9AWhVnixOmcKy/b+0CphrFkbhToOrv8AmvKjOJK083oGGfaRfUupg5CXxTDBR+5u
	 qnire5aI4NyDR1wLhsPfNg4a2BuwfnDqQVOWYIGaFz1zJ4aLlKlSSNAUT7RG78HCqkZLf
	 waWfw3U8JXdtn3sJLj0BjO+6uNxbMQxjafZrzLWq/WZQxZvxsQ7wFbQHhI2hI88ELmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791215976;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=98Sso6Mhx4/Ox+R/TzG//K8NzXJ5o2pHmjSAsbBoZnY=;
	b=gl8mKD2xw6I90NNh90L0cTYB8PYgCp0Dnjgz3Vib67s46JScAOyAjcH5USCa6EBLO74v
	 2mXylUiNgjaLuUqxWV3eCWghHmkJcxR3PRfubw6yOwllr1MLKNX4IMqTvbzRsgz4WJwPr
	 TanLnKwp1/QD4Uq9pWHNfTDVqOCh4qHiC3oiqTOMWBFIYxx0rOrwC62RDM/SKrR0/oTJM
	 JWydBbj5wMQ6rqYrCig38DqGDDcNUp0aNMsoRlYBUOCGOQHP/8G8Q1nVVvUewTNsWhxvp
	 KsSU3VfWR4Z0lPpBBrg5hZaOePbUhJTJJlDDtWmGR8SbL8RXkn2AkczUo9q2WhoTeZQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791215976;
	bh=98Sso6Mhx4/Ox+R/TzG//K8NzXJ5o2pHmjSAsbBoZnY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s0BDJ6kK0cg0F3WvgLPtJK/41hv/oxOiSvjqJdMUtOL8vQlROQXEz7cOfZygAvulm
	 opRC4R3eANGx5oap2Sc7OjKEwv3IeSWYJ+5voFThNjrrfDWm6UQTn4SXclLb/bWSdn
	 /QiyWhvbtCkhmGYGeBZsvLKJwFhyuK6lwmJNs7Hp5EyfteQZ/D6xsGlYqvcGvNda7s
	 CU33JgDJDgmZfgQQwRDHNOXboH1SoP+gItcJK89KUcUFkeHXzFKEy7SpS2OShcc8lF
	 Tqc1efaWC+Ut2HR4yNaMkUt3oHPEWrT7SNTqCcWKE14S0SCKe7ElaOceh+7+xxr6HD
	 lGatPzZS7r4yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B50276070C;
	Mon,  5 Oct 2026 15:59:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6776A338
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D3BC6070C
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VpoVTIYep_dP for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 15:50:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 993E9605E8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791215421;
 b=B2hx2aGjnzF9UCbc8tnDsfokkxenBhcwlYYkeBR9D+LmRgm46/Q53d4GJqP7r4xXcgx/
 xLl9HpdazF+ZhwVQ6CblKTwi512ZhS4AFh3hy8EKaIR+nScH4X7r166dY6IfYCzxhwlVC
 /osRa11LcreplqLM9Hfoz4ygrs+4qZF38VY5aCpzlIXIUxmfTdpU60R+xhTodUG/WNufu
 wncKBwJylwYOcToN5a3deIxMejfTwB06AVxsgw52hyeYqN+BVjMJsLWlwXyNPzvuSD8Hc
 7E9LWqQKoAyQvJnkpQZSRThWLAUom/bHsZUOZ6bCrzssm9limmgLoptoSaILmf+/XZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791215421;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=JJ1jTljnSjXCZ0/rziVpRycn1hBP8yiPjfVQsO8IXOs=;
 b=nN4Pa8VMw1hsMjjuuOX/L9cDnQVu5RkiSJjZupchjz/QEUNFsCyuZ2vAAiqqPk1Z9XPx
 DbQzDCDP52PBPlYmqpJvehbLyTxTSO4dl8mx8SuZxwRXOr7g7Ww/PEBlBn0kST21jgO/k
 5SONV9hbe5yHJFYKC3WAuBxc+A9Gc6JsMB1taOrtoEfe4nNyGCz7DaO0hm4nwF/g+sH6y
 Z4sd+jX/GEdN/FUFYM1frEyDIFhana2tdaxxAG26KcA35MIqdOxqpZFbuUpMHj1IoLLrD
 SsutMKwirVQQz/Q08CCHckmkOCuMLOELZorB08ADFTEY4KI3Y5gk3O+0dVQNSeI5cOw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=OF6UFS9E; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 993E9605E8
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:50:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BC5711A115B;
 Mon,  5 Oct 2026 15:50:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9006F601A5;
 Mon,  5 Oct 2026 15:50:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8E8D510330482; 
 Mon,  5 Oct 2026 17:50:15 +0200 (CEST)
Date: Mon, 5 Oct 2026 17:50:14 +0200
To: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <asPHCM2j8FJcUQgn@windsurf>
References: <20260930120101.474560-1-raphael.melotte@mind.be>
 <20260930120101.474560-2-raphael.melotte@mind.be>
 <asJzHhtAaiN13HMS@windsurf>
 <bf405ebf-ba9f-4033-8150-a5069ad151bb@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf405ebf-ba9f-4033-8150-a5069ad151bb@mind.be>
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

On Mon, Oct 05, 2026 at 02:47:37PM +0200, Rapha=EBl M=E9lotte wrote:

> I still hope they will be eventually (at least the ones that fix
> build issues), but given that some of them are more than a year old
> I'm also not that confident they will be unfortunately.

Meh :-/

> > So should this commit be title "security bump to ..." ?
> =

> I did not use it because our documentation says to use it "If the
> new version only contains security updates compared to the existing
> one".  In this case it's a bump across several major releases, so it
> definitely contains more than security updates.

And is it possible to backport just the security fixes? Otherwise our
LTS maintainers will have no choice but to bump the version, but you
said yourself that this should be considered very carefully.

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
