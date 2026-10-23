Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E46606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 07:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hOuK612E
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82BE2811C5;
	Fri, 23 Oct 2026 07:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXq1LcJUTy7C; Fri, 23 Oct 2026 07:32:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 95E6980DE3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792740721;
	b=LtBskiXkeAbEvCs3vWJXJAcNrNFOLOZiIIKHniS//ZmkR8ol83BK3DrROvSTsE6AFV0j
	 rcHvX9Cv6XBwdc72MSWECI4ZcZpGC5fSw2aIQaeQYQmMUblfwsAKeV+QLUIvYt3CYSwEk
	 a0FGOJ8iIjcSSrqjL7/s12WHXD9YiblWMGXOkEG53BNPZsbSbTDJ32dpD7SBLtXxib0za
	 OpYeZ8W2aoi679N3bXprGXzdHKwVyvSYsj2cAkwhUU5DVNh/4miLgFnIVmQcUF20h9N50
	 cPGZRnYDdPr3sV4FlTUM3S0S4ktLoP8JDFxqD8ps/cmE/YneIaIjfHTN2VMF0Otn2ww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792740721;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wl8/94HQt4YzsMulRAVSrTiy8VxhUVHI4/nY4u5hcXM=;
	b=Y9SXZCFX3r9yCKDn801efaxk+IXxlTEH/zoxu+G7wIQr3nxjTyK2T/NWXDeIJBS1shGi
	 KhJiZAotGzy3wKR+utJIA2aU1g1g+5FDZg7R45CiZLvND0j05FT8179sanE5BnxxFGSl1
	 y3B/RraJGrHlm23JGhgnq9fGFLOEIl7EJgpX/M77c3pNu20hxuAp4Q+DfraiTGWgSanI/
	 j7srA4188/lT5sf7PYpZJhJYkn+alr/NeJ8eCOJ4966Riat9ZTkMM0wM93MOJVR6pdEpL
	 v73QQgEeBidcj3oKhLvMZUHhZkRa3lhsayG3iSPLT9BDSkhbrOo/NrQ/Xmk5UWCpslA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792740721;
	bh=wl8/94HQt4YzsMulRAVSrTiy8VxhUVHI4/nY4u5hcXM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hOuK612EzXyvn1aHc5xm7xiQEeb2IXrPn11mFBreO41utmEmczzRfYZv/FY0t3iXk
	 cRmstr1BneX7s45k106bzrIXDpG8Dk3jYjSAqUeoMRUETW8+aseSPoaMBKBJ24gjYA
	 3iiO8mX7kaqiY98rBXcUZdZyfIIjpcFmTxZi/s2zwVx2xsNCBCAltGEe0z6uS8DMJ6
	 o5539M1Hsx7M05uyYe2L0QTA4TzX+FOyaaIKV8R3SYLqe0oetAFvALx8Bge4VUfQhT
	 YQYkrX2qya3czACbnI+SQLnAP9mXWVeCyP1gKlhH6+Jad7ro7g3KPBpb34t/pBuaYj
	 MU+H9b0U5nDjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95E6980DE3;
	Fri, 23 Oct 2026 07:32:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B28CA49D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97AC360650
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bo0bLu2x96a8 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 07:31:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C1CD860621
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792740719;
 b=HBv1e1u3Z8I2uZ7HekkpT3obpoyVb++NCoL3CqeDt3B/pnnailJRQ1jgJJlnc7kKhERv
 seb2H9QEaNxN4qHnejIeC/b5PAC5SYUHt6szuan+dL/4lzoPbkmg/XOqUkRyhTXQYFMKK
 upAH5SUN1Hi4JIb+Y9LudHADWz3JvNAf0zz9bZMIMpWxwAhU62iC0mUHNv8PR2NsRm5Yf
 +o3l/F4iX7liM0KiPXu0kTQVluqWMad6oV9cBta5cxyPCK4ZldDaGHf+YGYcQsiFUxPOZ
 D/H+PGxXOPfxejskg+Jf4EgJ7WmzyCvbzZBA+UCXOYZXJYDF0inynk9e+Caoje9oAEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792740719;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=u9Unt1thJFrFXFfV3tnt7+f+ZAlrg7LIW8cUbD0jp/o=;
 b=jWNuV/FLYaEVx51zGpT871lgxY7+mGvVUm4SuG2TAAbEQzGuY5sur68Zc2CpFZA4enmc
 cKActbjM0yCyUsfuqzqYxOiECjw1wDB1Hg7AzU06M/EMS0aOwoEWYWgiDj3xvLTmJtKIa
 WHYFKycoKGkojpHvvRyNIDcrto0Y7m96AqlDR7OVJjLsMzO21pRrv4TOSjKG9x5Par+yb
 g08SgVkTS5OrLgNX+2w+RhsBpQb0Dsy2E6KSG7/a/q59YGcSN/shCc9TSNO/qzXoABK9i
 OfNNm+8OkOtru0HlbAeiOCClzX20y3lHmRkaKTIbTzK+Zs1zvg/mt7pJsBpHEJsQ0Fg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=JLeTWI2i; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1CD860621
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:31:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 03D004E412CD;
 Fri, 23 Oct 2026 07:31:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C490060398;
 Fri, 23 Oct 2026 07:31:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1FF8C10328EBA; 
 Fri, 23 Oct 2026 09:31:54 +0200 (CEST)
Date: Fri, 23 Oct 2026 09:31:54 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
Message-ID: <atsNY7X6T5l8o0Hy@windsurf>
References: <20261022235328.3259902-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022235328.3259902-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/nghttp2: security bump version
 to 1.70.0
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 01:53:28AM +0200, Fiona Klute via buildroot wrote:
> CVE-2026-58055 [1]: nghttp2's nghttpx proxy through 1.69.0 forwards an
> HTTP/1.1 Upgrade request that also carries a Content-Length header and
> body onto reusable keep-alive backend connections, re-adding the
> Upgrade and Connection headers while passing Content-Length
> verbatim. A backend that resolves the resulting ambiguous message in
> the attacker's favor enables HTTP request/response smuggling and
> cross-client response-queue poisoning.
> 
> Upstream changelogs (no specific mentions of security):
> https://github.com/nghttp2/nghttp2/releases/tag/v1.70.0
> https://github.com/nghttp2/nghttp2/releases/tag/v1.69.0
> 
> [1] https://nvd.nist.gov/vuln/detail/cve-2026-58055
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

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
