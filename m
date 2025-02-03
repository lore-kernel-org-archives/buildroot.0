Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0188CC02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 11:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3147402EB;
	Mon,  3 Feb 2025 11:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqGNBT82nClV; Mon,  3 Feb 2025 11:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78F4C40301
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78F4C40301;
	Mon,  3 Feb 2025 11:45:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26CAC1A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 160264155C
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3aNXCd0q6CW for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 11:45:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7235B402EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7235B402EB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7235B402EB
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:44:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.178]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mdeb5-1t5rFP2hOL-00nEQk; Mon, 03
 Feb 2025 12:44:54 +0100
Message-ID: <782533c1-7da0-4d66-9a9c-0dbfa1d009db@gmx.de>
Date: Mon, 3 Feb 2025 12:44:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>,
 Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org,
 Christian Stewart <christian@aperture.us>
References: <20250131212420.5956C8678A@busybox.osuosl.org>
 <536f4074-7be7-4c4a-aadf-4d9bf0a028f6@gmx.de>
 <38f38c04-5983-4f05-9045-31d5e86eccc2@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <38f38c04-5983-4f05-9045-31d5e86eccc2@mind.be>
X-Provags-ID: V03:K1:k75fOlUXpn/Ua+NpvVcQsQ2Vca0nZO+J1371aeoTQ2AGFd7g4Z2
 +j3t6piyKoZ1O1tLX1M555YC2CvqOldrVueuxlH12cArc5bYdTnYzaI/NErFUcqkNM7k7Cx
 5v2GjPF0LWp4pTdyLyHkfJkKhbjkTf+8gY7STznhX+mv7alm3PtOrgyS1c6SWV1YNJP5uiG
 JrGuco1qnOWWxmMiHhj8A==
UI-OutboundReport: notjunk:1;M01:P0:Gt/gY2Xx14A=;6bHyps7U0TFrGq1JHWao+cxK++f
 lv+TknebzbmAVlzlzJYvrYDjPiNNKpPZqCASJnhFxw5jHg+k/PnxdDYeT9XlKj9HxqnkHTTkh
 vUaC+bM5/327A/2iZr1YeVsZia1c/qIxv5sDcSLezmESzBSwVfM2xy3Y26uGgYs3K4vx0VFSf
 vY2hAWv62Z0bFgEMcMPNFaOJgfEUhv2OIhxPoTGnhoFD+O12843Dk2I+y5I0pQIYs25TQUJia
 8DAI1yAWyPxFumyrBhsNXvexllbeYYdUPlaPd+Bl1FUdGcslul6KmXZEeYfdKlH5WwA1Ygh4x
 K7ESAm2UijcAq4GnLe5ZZBY+8pDsbuBq0uchy+ZSv/0/wFkrFYX2hRs3ELiJKFUDkjCVF9YVX
 aotJBofS5rNMtfop8LELDXdz/fN2kzlGNkE12N0pSvulio7m+alj3MJ0tzU9C5D+J8YBMiTzh
 VlmzcnLch89V4RWUjdBdBbpm7w30XFtOS7vVmTNQl1AX7ZL0UZrlgUjcdo6CC5kAm0ogGTIx0
 GiBj+orNfjnR7vqhEZ3orRbFyYerk+wnGkMQM5u7Fla0K4fDPRBGN6oZ1efCHLEqKMo4uyX/0
 QtYowoNx8MBbo68cs076p0vXVb/RgBJKKJBODtaGRbGNS/PfLwWrYzbsakNyhlHivQWcv6+Hx
 ATXyizUPkPC/SObiSDzg8iZxHJImyf2ETt6GmO9hPRdso76tgufbudEz0uuT6V77bt05fpUsP
 UhIGHs/LtjLb0M0c7vGSgmgWkTQjSnKzyrYvKfq1am78mkHXYFgFdieo1fGIlZ7PS1zJq2Qy5
 znjQedeeNQNqz3aMwgy4oSD1WyGFV6llbyxIVWxDDxUsTJpgb/U8COmrUbNPLhXfYxMk79UFc
 KRmgQvQ1G2IGZyBhOoYXS/KxCmuRaC9rAxcPfXL/vdha8A0ylkQOW1wIoS17EUQ/67VkJEBcO
 nXB4ADdSN2CBx+Dcbg4vSYu5TpOSYXbPrli4VF12W6wfBdhqweAtQShYBsdBM6v0RQVZWEE3w
 kXMCxWYTC1HPG+v/HgDnuXmnpHUzwM+AwX3IpjqmFN9xRdUK7jxeGIR49hGPgUvXcq6ySQaRw
 wdRaM+BrEGIvaa8TYZxegu1omKOKdH/pklzMbEaH41Qpe1f6H1YySEJ8btSxX+MdbKaj/+UIt
 2F1MLQoDcdRdgvi2oCcqvzLA7vca9+FjggyHe/JrX/p8GCbsVSsAj8BpNL43tsfDzRwPAMx7U
 dvo3JrSW0dS7O/sapuj+h0S/bRZ2v21TIqvl5fjyHwHM4tqSwWwFn7kwY6p3irkpcnNAg1oNB
 NNFG5NG0mGrKgPowUUyzwmAM/5d1r0YM7UMvUtSPNhaT3r+29yRzXS7/ek4UqkdAkFyAo+9bN
 rYpgTT1uyqbtLRc14zsdY0SjryyV0IusnqcTg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738583094; x=1739187894; i=fiona.klute@gmx.de;
 bh=sRiZjQyzRX5VClAbhM/9Xi3JccNyjMN9BYjODRV92uY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Cd+dl1L8sCmGNAHEmfOv1FC9VxgE/uSrAid7jMKf3IeAVWkESaMj9ixHjnlbtD7i
 vhDSilBdWQaVVrHOIAvr3KKvTuDmeBPXX5mrFmxAtnPnhpeywYXufCGqb9N+iM5zV
 gc46efKQVlZqQKkLji5Y9pJhvI4DrEfSCGWdQcJMAfAyLZrSIVUfp1QE+7xwFop3q
 nRxiAMTgYWlafCIHNruauGESfW5zDpZIkZ81fMJNGBcGwoPgTAJJsaIlJY8/Pz5wb
 Ge9XosGNB56IgTMTD+ATYjc+oJC03884JSzQWcv/IUNTu1P26Ydo+CUN6GuGBbMXv
 lU+BYzubWz5xBj8i+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Cd+dl1L8
Subject: Re: [Buildroot] [git commit] package/containerd: bump to version
 v2.0.2
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0IQoKQW0gMDMuMDIuMjUgdW0gMTE6NTcgc2NocmllYiBBcm5vdXQgVmFuZGVjYXBw
ZWxsZToKPiBPbiAwMy8wMi8yMDI1IDExOjM4LCBGaW9uYSBLbHV0ZSB2aWEgYnVpbGRyb290IHdy
b3RlOgo+PiBIaSwKPj4KPj4gY29udGFpbmVyZCBmYWlscyB0byBidWlsZCBmb3IgbWUgYWZ0ZXIg
dGhpcyB1cGRhdGUsIHdpdGggdGhlIGVycm9yCj4+IG1lc3NhZ2Ugc2F5aW5nICJsZCIgY2Fubm90
IGJlIGZvdW5kLCBsb2cgYmVsb3cuIEkgbm90aWNlIHRoYXQKPj4gaG9zdC9hYXJjaDY0LWJ1aWxk
cm9vdC1saW51eC1tdXNsL2Jpbi8gaXMgYWJzZW50IGZyb20gdGhlIGNvbmZpZ3VyZWQKPj4gcGF0
aCwgYW5kIENDIGFuZCBDWFggYXJlIHNldCBpbiBlbnZpcm9ubWVudCwgYnV0IG5vdCBMRC4KPiBb
c25pcF0KPj4gL2hvbWUvZmlvbmEvZGV2ZWxvcG1lbnQvYnVpbGRyb290L291dHB1dC9yZXZwaS9o
b3N0L2Jpbi9hYXJjaDY0LQo+PiBidWlsZHJvb3QtbGludXgtIG11c2wtZ2NjCj4+IC1XbCwteixu
b3cgLVdsLC16LG5vY29weXJlbG9jIC1mdXNlLWxkPWdvbGQgLW8gJFdPUksvYjAwMS9leGUvYS5v
dXQKPgo+ICDCoE5vIGlkZWEgaWYgaXQgaXMgcmVsYXRlZCwgYnV0IHdoZXJlIGRvZXMgdGhpcyBg
LWZ1c2UtbGQ9Z29sZGAgY29tZSBmcm9tPwpUaGF0IHdhcyBjb25mdXNpbmcgbWUsIHRvby4gSSBk
aWRuJ3QgY29uZmlndXJlIGl0LCBhbmQgdGhlIEJ1aWxkcm9vdAp0b29sY2hhaW4gY2xlYXJseSBk
aWRuJ3QgYnVpbGQgbGQuZ29sZC4gSSBldmVuIHJlbW92ZWQgaXQgZnJvbSBteSBob3N0CnN5c3Rl
bSAoaXQncyBkZXByZWNhdGVkIHdpdGggdXBjb21pbmcgQmludXRpbHMgMi40NCBhbnl3YXkpIHRv
IHRlc3QgaWYKc29tZXRoaW5nIGluIHRoZSBHbyBzZXR1cCBsb29rZWQgYXQgaG9zdCB0b29scyBp
bnN0ZWFkIG9mIHRoZSBjcm9zcwp0b29sY2hhaW4sIGJ1dCB0aGF0IGRpZG4ndCBoZWxwLgoKSXQg
bG9va3MgbGlrZSBHbyBhY3R1YWxseSBmb3JjZXMgdGhhdCBmbGFnLCBiZWNhdXNlICpvbGQqIEJp
bnV0aWxzCnZlcnNpb25zIGhhZCBhIGJ1ZyBpbiB0aGUgQkZEIGxpbmtlcjoKaHR0cHM6Ly9naXRo
dWIuY29tL2dvbGFuZy9nby9pc3N1ZXMvMjIwNDAKClRoZXJlIGlzIGEgcGVuZGluZyB1cHN0cmVh
bSBwYXRjaCB0byBkcm9wIHRoYXQ6Cmh0dHBzOi8vZ28tcmV2aWV3Lmdvb2dsZXNvdXJjZS5jb20v
Yy9nby8rLzM5MTExNQoKSSdtIHRlc3RpbmcgYSBidWlsZCB3aXRoIHRoYXQgcGF0Y2ggcmlnaHQg
bm93LCBJJ2xsIHNlbmQgYSBwYXRjaCBmb3IKcGFja2FnZS9nby9nby1zcmMgaWYgaXQgZml4ZXMg
dGhlIHByb2JsZW0uCgpCZXN0IHJlZ2FyZHMsCkZpb25hCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
