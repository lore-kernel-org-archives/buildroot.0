Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB925CA5FCE
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 04:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01CA280CBA;
	Mon,  5 Oct 2026 04:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 41MVSWU7XFHv; Mon,  5 Oct 2026 04:48:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 35DBC80AAD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791175688;
	b=KXpwdJvb6vWIxOjUe+qeLXJS87pPBQPGfv+yGDgqSUXwyiyV33bWk/TVQI/9Ta4HgNZg
	 JSr1iytz87xU19ed7QGrN18Phawl3EOzMK9pWSpBXCqucw3P/QZaahDXJh3B0hcP02oe/
	 G3zgyfuiGsPH5/exT+jqrf0LLrGlTN3iczuY9ON8Is/aI+yH+uaNm94t2b5rzeinihf4Y
	 uRCHXEZ2k7lkjo6pvR1HaEqi2UgrXOTWxRRQYSZgYpgfytEQGgKQFyE+60D3DKYWydvWJ
	 dvZeWnXhAxVTvBGwEu7gg0QodgbBLe0uJLrfIcy6LbHnfBJjfRKkTrO4sqN8aUMHMYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791175688;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Operating-System:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6GAjYdy33VQRGgILJzPrqLNjwku888fhG917vWzXgx8=;
	b=pl1uP5Y0yahdPoWpoiZkDSKhHCq2PmdqytOKQueDUZ1eVfsWKfews9n6FNoxAiDM95Uz
	 OUarjUtmLTLGwFIiBlxqW9Ppb+ol4VeWyLY3fT4C72Er+/eXEct8YIaUqwgiI0JUdxmBf
	 qfx4Td/2peOhii3eYFpIz3Ro3R+b+B1tr3cIh99Vro7Jn/WgJUDpmxBJyQxTyb+VTKEs0
	 4EBuGVW9Y/NwObJwcXZFcpKFn7tXgZCAepo7CL4AGpwI4VeEK3B+S95pL7N8zEIRTfFgs
	 VW4Li1JqbIAvp/YsD0piHnI5uwV+ZTxJBi35n0yKfVfjK283M2CzifgAynOzMgaoG8A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=none header.from=openadk.org;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791175688;
	bh=6GAjYdy33VQRGgILJzPrqLNjwku888fhG917vWzXgx8=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=H830LPxR9+05smL9Uh9EcHuLyLdH2+LbpBnfLw/lVlCAzUVTynZzP/nc8SFV2EIBA
	 b/pFstct5sNznBSOwAD1ZKRPtvfrp85F8lLxyW87uYtPWSPGUu1c+22rr7ozQWXQvn
	 KUNrxT4QZIRnihH9mudEclRwgB5WHf96i9tP8L1OG2d7I9ClLxlHM8pjJkQRs1XFOA
	 BvrLnsuKrVXoHTYQ+4GVEAbrq0FtHhM8DnIrPYEoAxJrkgyAmm9CYopnwuiUhn1t1O
	 rfwabLNjPwoFmsoKJGWxPUXkMCW4rysmx/G835whouUqT+wC1drUTI8Z/QiuGzsPJD
	 2lEB2q/fxcrSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35DBC80AAD;
	Mon,  5 Oct 2026 04:48:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 303B31A6
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 04:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F64980962
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 04:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1pXwqqqcdGHf for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 04:47:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6EFEF808C8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791175636;
 b=oXE5OC1a6klSAIzR4RfqC3nfLYxeag5I7y6G7nMUuauyHkgwgiufWPERFZQpGx73mn7M
 Be9FaxCOhTN+iev8X2SoCygAGvot9Ofy1E9xSbc2eAa11GMys8lQ4Sa5JYGhJb9vsg1Fr
 cVOal9lbrVswqHhMChLV+7w52rvt7/2iuHfriBDJfLMBjq4uOQf+QkVIKGrvhoZ0vZfzS
 gJuHzC3AnXbsQ72fsEjcgnN3k+PbxAkJx86LtSD2cfBWeZhCX6gpDAEy8KVe9U4tfJ+nh
 qSF8bxMY8+cERSweWrTDeAwkx+cout/AckCimu2Wqp5HEjtpsaY7/T7nuVzT06ejeRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791175636;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To:X-Operating-System;
 bh=QuPGTA3KI7Hwpy05VBKMeepgP5DjEqQ7aGiB5Ah6AoU=;
 b=VOXIMlGEiYxtlA2LQB+ysflchFM9BXfzaMz8lJAH2Stoz2IsHzE22dxObcehWOCf3q38
 A1qUka8t0xXDWWmZT761kbkyXP8eEq7gZw6ubaL1ZOgbYw7KL9W3NcFZpEsDPDWkJutsQ
 au/6XfE7CqWLjHBFK/LIfbBdw6bFGtPgIXahnHy/COmiUAmJd/2a0nbvInnQ4XQWrr6eA
 vfjEtyfedeg9QJF0C4YPD0rPDugBuotZuYsZIrfQTY++6ePBM2UZr4WACoraQWEuIpvGB
 8ftrixxlfzEWI2IyBRqIlnGIR2l5WByoWKuf2sdXZ1JM95dfT2iDJq+QKCYJr082SkA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=openadk.org; 
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EFEF808C8
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 04:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1791175632; bh=2EMwv4ArruyUbIe5NveiVLBIWrIObLs6IJvMXCtp2bg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kQHWsuv4FPlERkS+/C0y9mpWot0s8V6Zw6+AZ9Bba+qN9OZ4npdHbJGiQ21waOtXS
 LOhFxwSZbHIdn41OTA4PNwgyatXxt132e/GfqOHOvOFSl2fPagSuqaxWBa/TxhKL0U
 t54joS2KwP6x1eUHfT/7nI8hCGZYYoeDxwqKOI7OJoWCjLjsdjT4wY8VsWBHHkoxK6
 lIGrrRWiow/Itzzpt0/hFYJjeGNHbvYdfzA4gW1vJNr52YBU3IWDdBUjrniKDtDrXq
 tjvgoMO/z6NTE3ynAAm5EuqmF857SV0uFBGIxySvNiLWlUa1TeAaWUmPbjhVD0RQJy
 IsLVhxAtxbl+w==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D122231E0BF9; Mon, 05 Oct 2026 06:47:12 +0200 (CEST)
Date: Mon, 5 Oct 2026 06:47:12 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <asMr0C4RA8lilEgO@waldemar-brodkorb.de>
References: <20261002135956.354969-1-ps.report@gmx.net>
 <asJEBMQpD2FYJql2@waldemar-brodkorb.de>
 <20261004155114.12d777ef@pc-1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261004155114.12d777ef@pc-1>
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH v1] package/gzip: bump version to 1.15
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,
Peter Seiderer wrote,

> Hello Waldemar,
> 
> On Sun, 4 Oct 2026 14:18:12 +0200, Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > Hi Peter,
> > 
> > I am having issues compiling gzip after the update for
> > qemu-system-aarch64 (defconfig, glibc):
> > 
> >   GEN      zmore
> > In file included from gzip.c:61:
> > gzip.h:120:21: error: expected ')' before '+' token
> >   120 | #  define head (prev+WSIZE)  /* hash head (see deflate.c) */
> >       |                     ^
> > gzip.h:120:21: error: expected ')' before '+' token
> >   120 | #  define head (prev+WSIZE)  /* hash head (see deflate.c) */
> >       |                     ^
> > ...
> > 
> > No autobuild failures, yet.
> > 
> > Any idea?
> 
> Sounds like upstream 'build: avoid failure to build on linux aarch64' ([3], [4])?
> 
> Will try to reproduce/fix (and send a follow up patch if appropriate)...

Thanks for the fast response.
Patch works, thanks.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
