Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0D0CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 11:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE24D40E6F;
	Sun, 31 May 2026 11:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLKAuV3mhf8H; Sun, 31 May 2026 11:41:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65302409E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780227683;
	bh=lZ2nVTpJk9Yz0BQaofFynTlgn85UmHDTE75fzv57h0Y=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cDgaIz2EADy/Wz4fBdje9e/HnLdb06OVrc5GxEJiDpK+zJiqepIxt+lbMNHeHiMXJ
	 +cmEqcAqY4I/H3ZnT90y7M50KUm8+oH9i8EdDOdS6oVL/45rfykl+zUiXy+2xXAs+G
	 xb91CnPZIPdBHUgIygVBZKK2iaeYW4/jzvZRQtEzFxgIL3J8H0YQ36mg7CATa2JRlM
	 tiT47rQsXe6UnbVmSSwED8XzqT1YEYc+mi1+BtX6V10lk3o/GrDPvzW9lnOWHHOYP8
	 utvWghg4LE9ceC/uDOggMxiAN9soCMnsr9cEYGrmGzBy7qWJJ+yA8Y+L/980nsbnBj
	 zvkG9NCaDKu1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65302409E4;
	Sun, 31 May 2026 11:41:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B38E2257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 11:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF0C084EBA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 11:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sy0-q7iFsVSq for <buildroot@buildroot.org>;
 Sun, 31 May 2026 11:41:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E5D284CB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E5D284CB6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E5D284CB6
 for <buildroot@buildroot.org>; Sun, 31 May 2026 11:41:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 3747E2003C6;
 Sun, 31 May 2026 13:41:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 31 May 2026 13:41:14 +0200
MIME-Version: 1.0
Date: Sun, 31 May 2026 13:41:14 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>,
 vincent.stehle@arm.com
In-Reply-To: <20260530215124.1786348-2-titouan.christophe@mind.be>
References: <20260530215124.1786348-1-titouan.christophe@mind.be>
 <20260530215124.1786348-2-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.14
Message-ID: <a727674311d267bb627d151155450524@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780227677;
 bh=WE6vMvx2MslSbf5pDCR8fjhwj8ISVjArbVMmUe1AvY8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dEeSvzAV2SEnmSG+vP0mmnvjg2JdzJSZSu1iyM2d5Q/HZPQJmuJ2chFVqML/URHey
 NntnJtkeUWhmHXN01o5KZ3KHLTmkFjXfD05i0wJtmaNGzlow2ZTz1CLmuqj0iqkYzD
 qu7gYj4x8P6tuAyY00Mo9Sw34mHEdlQYxLSsGwt5KJdAS2KimG32w6m3WLAtRogTr3
 hobPRoXmwExsszT4QiVbGgsGWxs/FB+lxdoOWbStaaqbr/TxF60Gx7NHyxFbSyTli8
 EVJbveME3bpQ5o6v20t95WqrBDoAjIsJAhVQ8///nMUIuaQqg6bGUuGeUTzJTRZ/Kf
 dzltAX3JVNaAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dEeSvzAV
Subject: Re: [Buildroot] [PATCH RFC] package/xen: bump to v4.19.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGl0b3VhbiwgVmluY2VudCwgQWxsLAoKT24gMzAvMDUvMjAyNiAyMzo1MSwgVGl0b3VhbiBD
aHJpc3RvcGhlIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gRnJvbTogVmluY2VudCBTdGVobMOpIDx2
aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+IAo+IFJlbW92ZSBzb21lIHBhdGNoZXMgdGhhdCBoYXZl
IGJlZW4gYXBwbGllZCB1cHN0cmVhbSwgb3IgYWRhcHQgdGhlbQo+IGZvciB1cHN0cmVhbSBmaWxl
cyB0aGF0IGhhdmUgYmVlbiBtb3ZlZCBhcm91bmQuCj4gCj4gVGhpcyBmaXhlcyBtYW55IHZ1bG5l
cmFiaWxpdGllczoKPiAtIENWRS0yMDIxLTI4Njg3Cj4gLSBDVkUtMjAyMS0yODY5MAo+IC0gQ1ZF
LTIwMjEtMjg2OTMKPiAtIENWRS0yMDIxLTI4Njk3Cj4gLSBDVkUtMjAyMS0yODcwMgo+IC0gQ1ZF
LTIwMjEtMjg3MDQKPiAtIENWRS0yMDIxLTI4NzA3Cj4gLSBDVkUtMjAyMS0yODcwOAo+IC0gQ1ZF
LTIwMjItMjYzNTcKPiAtIENWRS0yMDIyLTMzNzQ2Cj4gLSBDVkUtMjAyMi00MjMzMQo+IC0gQ1ZF
LTIwMjItNDIzMzMKPiAtIENWRS0yMDIyLTQyMzM0Cj4gLSBDVkUtMjAyMy0zNDMyMQo+IC0gQ1ZF
LTIwMjMtMzQzMjIKPiAtIENWRS0yMDIzLTM0MzIzCj4gLSBDVkUtMjAyMy00NjgzNwo+IC0gQ1ZF
LTIwMjQtMzExNDIKPiAtIENWRS0yMDI1LTI3NDY2Cj4gLSBDVkUtMjAyNS01ODE0Mgo+IC0gQ1ZF
LTIwMjUtNTgxNDMKPiAtIENWRS0yMDI1LTU4MTQ0Cj4gLSBDVkUtMjAyNS01ODE0NQo+IAo+IENv
LWF1dGhvcmVkLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogVGl0b3VhbiBDaHJpc3RvcGhlIDx0aXRvdWFuLmNocmlzdG9waGVAbWlu
ZC5iZT4KCkNvbnNpZGVyaW5nIHRoaXMgcGFja2FnZSB3YXMgbGFnZ2luZyBiZWhpbmQgdXBzdHJl
YW0sIGFuZCBpdCBoYXMgbWFueQphc3NvY2lhdGVkIENWRXMsIEkgYXBwbGllZCBpdCBvbiBtYXN0
ZXIsIGV2ZW4gaWYgd2UgYXJlIGF0IHRoZSB2ZXJ5CmVuZCBvZiB0aGUgUkMgY3ljbGUuCgpJIHJl
d29ya2VkIHNldmVyYWwgYXNwZWN0cyBvZiB0aGUgcGF0Y2guIFNlZToKaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzQ0Yjc0MzVjN2EyZTExYWMyYzUy
Mzk4YzY2Y2MzZjVhZTZlZjg1NGEKCk9uIG9uZSBoYW5kLCB0aGUgbmV3bHkgaW50cm9kdWNlZCBw
YWNrYWdlIHBhdGNoZXMgYXJlIGEgYml0ICJoYWNreSIsCmJ1dCBvbiB0aGUgb3RoZXIgaGFuZCwg
dGhlIGJ1aWxkIHN5c3RlbSBvZiB0aGlzIHZlcnNpb24gb2YgWGVuIGlzCm5vdCBzdXBlciBmcmll
bmRseSBmb3IgY3Jvc3MtY29tcGlsYXRpb24gZWl0aGVyLiBTbywgc2luY2Ugd2UgYXJlCmRvaW5n
IGFuIGludGVybWVkaWF0ZSBidW1wIGhlcmUgYW5kIHRoZSB1cHN0cmVhbSBidWlsZCBzeXN0ZW0g
aGFzCmNoYW5nZWQgaW4gbmV3ZXIgdmVyc2lvbnMsIEkgbWFya2VkIHRob3NlIHBhdGNoZXMgYXMg
c3BlY2lmaWMgdG8KQnVpbGRyb290IGZvciB0aGUgbW9tZW50LiBXZSdsbCByZXdvcmsgdGhvc2Ug
aW4gZnV0dXJlIHBhdGNoZXMgb3IKd2hlbiBidW1waW5nIHRvIHRob3NlIG5ld2VyIHZlcnNpb25z
LgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
