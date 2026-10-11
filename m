Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9151ACA9EC9
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 07:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28C83810B1;
	Sun, 11 Oct 2026 07:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXak_nT3b1C5; Sun, 11 Oct 2026 07:25:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0D8C6810AA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791703515;
	b=SeuOvg74p9vneqv7Hkr7OWExSsFizJ4gcoIyOAjwVPI/GKiQcrg7CzK/5d77XGkfjNmV
	 rsPO/imzrqV49kgxQAH5959mDsNyT5UJhnYlXEzEdjesESabi0uHRS1eKStoa8YkAUlMQ
	 ja0jaRQjoLDVdlWzdpvfGIZToIKb7XowHrEHSSrO2w+MyJ5k01K9cqVirfkWn6aFU7OOU
	 7qa3FQVQR80S8DN5DpzPymBtiYjJJu3qsiOKREvU6bIOrlg37GBJVF+ggFxl2a3o0EDGW
	 y8Y3/EbTnr5t8ft8qafbPbF7mPXo9KEoZbpdgzKrSIDLkmTFAMEBV5nB6xxIN92+IFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791703515;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5BtHszJe6UZwkOqkSGOGHP23s5upemo+aSvh7KUlyMg=;
	b=SyLC8ciFj5HF+RyZvZePjoZ/nnMlRl6XqzZWmm0whsQqBC1YnhvcLa/HzqzSGMjI9rfO
	 oZoFHtsKtbo9byFtC4BNso8n3V5bOY/k2NGhZuyq2xj+HC7V7qz68BQ4+QctMuREGMUud
	 eDEmx/PBX5XuLgrchUMOrNIIFjGz4Pc8jy1SbQ8csVsowtlm3XXWtGpbYdz8u0JcC099K
	 lRDbQm5ULPQXsNngNPdTfij2nJtxvCbzaPo05Q6NM4wWWXnz0Yjz3TKEFoeJxF016w6Iy
	 AnaEmuVZaYiu38quSZ5BsNOeJodc+BqL5FZN8prOYiQkeJm6gbWKN5iU5f+yJ94qMMA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791703515;
	bh=5BtHszJe6UZwkOqkSGOGHP23s5upemo+aSvh7KUlyMg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jm8Ulp9OUAldjVoh/szDWBQcm7sgkdOD3HjOlBG6W2kzcIk6fxe1GJ2NvybH9f+CI
	 JoPTnteCEGLkcP86MAf70yKjcAc9PtY9i4MA33EGM6tjq0028LJ7JIKbkyExgR+9IW
	 h7hV5Bb46n+XrKbymic5jxGe/O05BqT3Wz/r2T39QxyQlA9koxYZl54wGAdUUKjBoX
	 FSkYmAvr66YtR/7SaHiVXvfZLmhGWVlsrqV9MUIW/wWHbxGscwNH2j6tSgc1sFuK+G
	 db35LQw+8DZQgNUXR/tuCLdJ2eNSKtjH/sKMu/rRqZAOLBQq2MZeWFnnnIin9Kp/E+
	 xxYj6MyJcNOwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D8C6810AA;
	Sun, 11 Oct 2026 07:25:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B4A58156
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E29D060634
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-8cazKAWOg5 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 07:25:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4CC1460623
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791703511;
 b=ncn1y0Rhuh7vAvCbbYGIc5IXstlkwGC6o3J+LBZbVjKPmxEliM9TC+gd6VaNCXOo/7XJ
 ojrLUKBCREBKTKU7gh6eH3MHkC2J+MN/6JZ343lHCdyThbF6Wc/K+UxwrHdLnDHIB+Msp
 UCrLAE63amMlp1gBXfw0KwvmkQk9JSAZWif9f5xe3HvHOTMJye0bFC9ITNQD8/FWzLvNv
 2Jhs67HCwB7y8Wx10+psgKB9/ammOjEKMbL06Hv2/c/GbmvlySMsZgIb3hE9PjOwupYlX
 t6KRCHUvwAefpSUL1aQZWybYdJf1pwmkIym3P7zh2yJX/yck7px0H8ccYfLnwmJxd+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791703511;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=47D+i6qCkA98bhtflH8eV+zoSJYT4q77d7Y1ZRp82P8=;
 b=O6I4pmRUkLLS9wHOdaf6yk92EWQ3v3Z7ZcWQMgkLPittTlK3qsnglvyT+HglHQfmkH7G
 o3306fYPqW7X4lhXw7hbAjmiBSgbep4usEdTcZII3f3vZbwL7I7Ayb1fHH1FPU6fw6rkj
 9RpJ+fXc6LR82Hd46Aog668uJ/xE9VPxmhfezxsZ3T0QVBNR/fJ7aPURBK9TjFxqyTA+Y
 WA1jqvi2qANdrJilYDelr42NMC6bQE6ilZpR372jbJHVh3GXau4ML7Q5XL1beLyTX9BM3
 IE9eF/mPQBlNaxqbjuBrNvzRxKAfwBN2K3Ibs32bNAtBKzelSFhDM96IPlHqxwdkaLg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Y5DB3zLX; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CC1460623
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:25:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3DFF71A11DA
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:25:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C502C605CC;
 Sun, 11 Oct 2026 07:25:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6BC6311D701E4; 
 Sun, 11 Oct 2026 09:25:03 +0200 (CEST)
Date: Sun, 11 Oct 2026 09:25:03 +0200
To: =?utf-8?B?5oi057u0?= <daiwei@sunkaisens.com>
Cc: buildroot <buildroot@buildroot.org>, 
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>
Message-ID: <ass5tH9_w2Ps5Hfa@windsurf>
References: <20260920074056.1320014-1-daiwei@sunkaisens.com>
 <aq_Qf67Tgr75QV-B@windsurf> <artm6-0i7bQ4gJSM@windsurf>
 <845128ba-bcca-4acc-97b7-658e7bdf9859.daiwei@sunkaisens.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <845128ba-bcca-4acc-97b7-658e7bdf9859.daiwei@sunkaisens.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] 
 =?utf-8?b?5Zue5aSN77yaIFtQQVRDSCAxLzNdIHBhY2thZ2Uv?=
 =?utf-8?q?strongswan=3A_enable_kernel-libipsec?=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpPbiBUdWUsIFNlcCAyOSwgMjAyNiBhdCAwNTowMToyOVBNICswODAwLCDmiLTnu7Qg
d3JvdGU6Cj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5IG92ZXIgdGhlIGhvbGlkYXkuIEFmdGVy
IGNoZWNraW5nIHRoZSBvZmZpY2lhbCBkb2NzLCBJCj4gYmVsaWV2ZSBQYXRjaCAxIHNob3VsZCBi
ZSByZXZlcnRlZCBhbmQga2VwdCBvdXQgb2YgbWFzdGVyIGZvciBub3cuIFN0cm9uZ1N3YW4KPiBl
eHBsaWNpdGx5IG5vdGVzOgo+IAo+IGxpYmlwc2VjIGlzIG5vdCBpbnRlbmRlZCBmb3Igc2NlbmFy
aW9zIHdpdGggaGlnaCBhbW91bnRzIG9mIHRyYWZmaWMgb3IgaGlnaAo+IGJ1cnN0IHRyYWZmaWMu
IEl0IGlzIG5vdCBvcHRpbWl6ZWQgZm9yIHBlcmZvcm1hbmNlIGFuZCBidWZmZXJzIGVhY2ggcGFj
a2V0IGluCj4gbWVtb3J5LiAKPiBJbiBjb21iaW5hdGlvbiB3aXRoIGluc3VmZmljaWVudCBwcm9j
ZXNzb3IgcG93ZXIgdGhpcyB3aWxsIGxlYWQgdG8gYSBvdXQgb2YKPiBtZW1vcnkgY29uZGl0aW9u
IGFuZCBhIGNyYXNoIG9mIGNoYXJvbiBvciB0aGUgd2hvbGUgZGV2aWNlLiAKPiBTQSBhbmQgcG9s
aWN5IGxvb2t1cHMgYXJlIGFsc28gbm90IHBhcnRpY3VsYXJseSBvcHRpbWl6ZWQuICAKPiAKPiBJ
IHByaW1hcmlseSB1c2UgdGhpcyBwbHVnaW4gdG8gcHJldmVudCBpbnN0YWxsaW5nIFNBcyBpbnRv
IHRoZSBrZXJuZWwgSVBzZWMKPiBzdGFjay4gSW4gc3RhbmRhcmQgWEZSTSwgCj4gc2Vuc2l0aXZl
IHN0YXRlIG1hdGVyaWFscyBsaWtlIEsgYW5kIFhSRVMgc3RvcmVkIGluIHRoZSBrZXJuZWwgU1BE
L1NBRCBjYW4gYmUKPiByZWFkIGluIHJlYWwgdGltZSAoZS5nLiwgdmlhIGlwIHhmcm0pLAo+IGlu
dHJvZHVjaW5nIG1ham9yIHNlY3VyaXR5IHJpc2tzIGZvciB0cmFmZmljIGRlY3J5cHRpb24uIFN0
aWxsLCBnaXZlbiBvZmZpY2lhbAo+IHdhcm5pbmdzIGFib3V0IE9PTSByaXNrcyBhbmQgcG9vciBw
ZXJmb3JtYW5jZSwgCj4gd2Ugc2hvdWxkIHdhaXQgZm9yIHRoaXMgZmVhdHVyZSB0byBzdGFiaWxp
emUgYmVmb3JlIGFkZGluZyBpdCB0byBtYXN0ZXIuCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4g
QmFzZWQgb24gdGhpcyBmZWVkYmFjaywgSSd2ZSBtYXJrZWQgdGhlIHBhdGNoCmFzIFJlamVjdGVk
IGluIG91ciBwYXRjaCB0cmFja2luZyBzeXN0ZW0uCgpUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0g
ClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
