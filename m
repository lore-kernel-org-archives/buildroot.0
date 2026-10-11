Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65EDCA9ECC
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 20:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8988140606;
	Sun, 11 Oct 2026 20:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1pehZAZPpdr4; Sun, 11 Oct 2026 20:16:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 927854060A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791749806;
	b=GuXxmVlaCwqc2XqkytrOMt/XQtp1ZWYm7YuxTGh+eM3mHnMm2H9sRjWKWsWMg5iHPhW1
	 cow7PrLKp5CaNp5qHBiyz9xL5ZDgn02UfNkLfZmdYeu3Qp2g6S6JD/5TxPBSEurgZAabM
	 3LRPbx6sybs4ItPnaqaRPMIyTyj8QMqKFQ1ExdZh3j94oznZ7zfOe0AGeMmfS+rIChqdk
	 h9RwslMjqw5MVnuljFShQNKrLlPnudxMWMV8gjeAsk+QosIB8JCEWGM3evVEkxE8eLblV
	 8PUC8ByshZpJl/RiycBzkK4ZDV9zkTF7WH+9b/S7G64j+PyOCfpErl4aJqeeaDqfu2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791749806;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=tKs/ln2fmEmzqn/Quts+JPcP8Al5iulbjb+EaEofsYw=;
	b=ZH5KygwEtYyRNaXTnkBd1N6KdrjzwG8MtXSPDeK3t4Jh+WFcolNwxHLdPfZSDlg1AJvp
	 q7zgIpzMGkUtyhSmnFZz4YpcLBx2I2QJZE/hysTl1Ss3P9p11Xr6UWj0mTVw8BzrQA1kO
	 6TUTDj0VH65/fftSuq5nVQYX4ENVOJXWND6aptBAD7rdbaMnMulN0hCiNpRiJ+V9VtPzg
	 d8UI3PlQOi8hMj8xZv2kscAj9Y+cjJ3Mi8gtvz53mnUPpALT/bi1YrT5iVcbDTeFv1d+i
	 LkKbkHk4P8Bjc5zjU8XVoCYgexOq0M0fqCZTiBBALjo2DB0GtIe+wKxyAgftr+YCTwA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791749806;
	bh=tKs/ln2fmEmzqn/Quts+JPcP8Al5iulbjb+EaEofsYw=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=klGYbUQTl2bgIOOuFXHvEcxzIjsAjq0o3yevlkpwBXjixg/xQJMzr2IRQ9KvL1NgZ
	 4P8L4Jq4B0W8t4iwx3dBLkOeROMxUZnx1q+I8DpbFub/TG1/UHuxYN6HDMZrRmvcNn
	 GU3HAW3R6dcnCnErNAfUHVzfcrhQnWjk27PcIQgXBCcZdoVx0E1h1i4ePXc/FqJiiq
	 xlr5Lpow1/F1eANhe6TzP2XxfdtbDaHa9rfFNcyKYy1vF2QjK3zdynquO1AvYKE7RR
	 CvNIOnWe3l7Yayo9YS5KZ/2G/kMfjEDpbeOZuVaONmJouOhHtc4WAGdqCTO7oCY3NC
	 VSek/xegEfFaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 927854060A;
	Sun, 11 Oct 2026 20:16:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F258E75
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E412140075
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0v5l61JOydhE for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 20:16:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1B2F54005F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791749804;
 b=ppOpmFFQ0Qyr/p9scGDAdOoVaPiuiJFUmChC0JM6xV3gY4CvhDnx01ZJp8Yg+ipNfY9F
 zMSWQji2QfVDD4u27Rs7ONEz8X0jG7M1qZsUczRlX51WQOX/XPg1sL0WkkKEiWT/NEvb4
 Vijn81HbH2jDKyonC6/tGWcFlgZVypfydHie4k0zuJ/+PZKRA+qg+t+vTnHM0AFa/43Me
 80cwDvuwpZzZKMi/y2dghT3EulKvx3PqgVFe/v1yQegMdECvJELHkEkJ/3AlmGvuWveCx
 y4jPoZN/lkdzBzP7UJrssgRI264NpMsbWznm1Vy0iz91gLsxw/lGyUR4WtsrxH6UcXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791749804;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=cnZ3AnCoybqjkmPIBQIhfVkELx//mc26eRux38aaC5o=;
 b=dLQDWyl0abu/+nRrzdKjxN+fUixtMruhp0YvlZpk8XfvF3kBgqfTvJ8JOKsvxNpFUoGj
 a/boKogF+e8qK31aoJB7BoxSR/53sK92OU6JVIrDaT6xlyTuihfcRb15mooyNKoCvcujN
 4XxeVGUaaS7e+/G4TCwwgEXWCIaVdYKVCzvYxHVZv3v0RSAbP/dl+75rWwRaup9PPZHy2
 Xt3/6ZXP0sbfqmZyTXYtoWTfQVG2f+nsYVvRibFwerZaDdG6vhDID/agJE3QZ1HsviYwt
 ogUH/mV6TA3ot2sGFoMl2hWi5T7eHlO+dQB/vQ1NBVddheQUJQD1nBbtsncREl+FdFA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=c3PE0ziD; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B2F54005F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:16:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 26D6EB97A133; Sun, 11 Oct 2026 22:16:40 +0200 (CEST)
Message-ID: <19b0bc07-a423-4d8f-8e63-8f83ab560c53@rnout.be>
Date: Sun, 11 Oct 2026 22:16:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
References: <20261001072630.546933-1-raphael.melotte@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20261001072630.546933-1-raphael.melotte@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] utils/bump-stable-kernel-versions: fix
 newline in commit message
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBSYXBoYWXMiGwsCgpPbiAwMS8xMC8yMDI2IDA5OjI2LCBSYXBoYcOrbCBNw6lsb3R0ZSB2
aWEgYnVpbGRyb290IHdyb3RlOgo+IEJ5IGRlZmF1bHQgKHhwZ19lY2hvIGRpc2FibGVkKSBiYXNo
J3MgZWNobyBkb2Vzbid0IGV4cGFuZCBlc2NhcGVzLAo+IHdoaWNoIHJlc3VsdHMgaW4gYSBsaXRl
cmFsICdcbicgYmVpbmcgaW5zZXJ0ZWQgaW4gdGhlIGNvbW1pdAo+IG1lc3NhZ2UuIEZvciBleGFt
cGxlOgo+IFVwZGF0ZSB0aGUgbGF0ZXN0IGtlcm5lbCByZWxlYXNlcyB0bzpcbiAtIDYuMTguNTMg
LT4gNi4xOC41NAo+IAo+IENvbW1pdCBkYTAxYjcyNzFhICgidXRpbHMvYnVtcC1zdGFibGUta2Vy
bmVsLXZlcnNpb25zOiB1cGRhdGUgZm9yCj4gc3BsaXQgaGFzaCBmaWxlIikgYWRkZWQgdGhlICdc
bicgbGluZSwgYnV0IGF0IHRoYXQgcG9pbnQgdGhlIHZhcmlhYmxlCj4gd2FzIG5ldmVyIHByaW50
ZWQuCj4gCj4gVGhlIGJ1ZyBiZWNhbWUgdmlzaWJsZSBpbgo+IGZhYjUwZWQzYjEgKCJ1dGlscy9i
dW1wLXN0YWJsZS1rZXJuZWwtdmVyc2lvbnM6IGF1dG9tYXRpY2FsbHkgY29tbWl0Cj4gcmVzdWx0
IiksIHdoZW4gZWNobyAiJHt1cGRhdGVkX3ZlcnNpb25zfSIgd2FzIGludHJvZHVjZWQuCj4gCj4g
VG8gZml4IGl0LCB1c2UgYmFzaCdzIEFOU0ktQyBxdW90aW5nIHNvIHRoYXQgdGhlIHVwZGF0ZWRf
dmVyc2lvbnMKPiB2YXJpYWJsZSBjb250YWlucyBhbiBhY3R1YWwgbmV3bGluZSwgc28gd2UgZG9u
J3QgZGVwZW5kIG9uIGhvdyBpdCdzCj4gZ29pbmcgdG8gYmUgdXNlZCAoZWNobyAtZSwgcHJpbnRm
LCAuLi4pLgoKICBJIGRvbid0IGxpa2UgdGhpcyB2ZXJ5IG11Y2ggYmVjYXVzZSB0aGUgY29uc3Ry
dWN0IGlzIG5vdCB2ZXJ5IHdlbGwga25vd24uIEEgCnNvbWV3aGF0IGxlc3Mgd2VpcmQgd2F5IHdv
dWxkIGJlIHRvIHVzZSAkKGVjaG8pLgoKICBIb3dldmVyLCBJIHRoaW5rIHRoZSB3YXkgdGhlIHVw
ZGF0ZWRfdmVyc2lvbnMgaXMgY29uc3RydWN0ZWQgaXMgcGVyaGFwcyBqdXN0IApub3QgdmVyeSBn
b29kLiBXb3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gbWFrZSBpdCBhIGJhc2ggYXJyYXkuCgogICAg
IHVwZGF0ZWRfdmVyc2lvbnMrPSgiJHtvbGRfdmVyc2lvbn0gLT4gJHtuZXdfdmVyc2lvbn0iKQoK
V2hlbiBwcmludGluZywgYWRkIHRoZSBuZXdsaW5lcyBhbmQgZW51bWVyYXRpb24gd2l0aAoKICAg
ICBwcmludGYgJyAtICVzXG4nICIke3VwZGF0ZWRfdmVyc2lvbnNbQF19IgoKCiAgUmVnYXJkcywK
ICBBcm5vdXQKCj4gCj4gRml4ZXM6IGZhYjUwZWQzYjE1MzIwMzdmYTY3NTgyYTZiNDdhYzQwODRk
YWFhODggKCJ1dGlscy9idW1wLXN0YWJsZS1rZXJuZWwtdmVyc2lvbnM6IGF1dG9tYXRpY2FsbHkg
Y29tbWl0IHJlc3VsdCIpCj4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhh
ZWwubWVsb3R0ZUBtaW5kLmJlPgo+IC0tLQo+ICAgdXRpbHMvYnVtcC1zdGFibGUta2VybmVsLXZl
cnNpb25zIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3V0aWxzL2J1bXAtc3RhYmxlLWtlcm5lbC12ZXJzaW9u
cyBiL3V0aWxzL2J1bXAtc3RhYmxlLWtlcm5lbC12ZXJzaW9ucwo+IGluZGV4IGFmODVkMzI4NTIu
Ljk1YTcwNTliODkgMTAwNzU1Cj4gLS0tIGEvdXRpbHMvYnVtcC1zdGFibGUta2VybmVsLXZlcnNp
b25zCj4gKysrIGIvdXRpbHMvYnVtcC1zdGFibGUta2VybmVsLXZlcnNpb25zCj4gQEAgLTg1LDcg
Kzg1LDcgQEAgdXBkYXRlX2xpbnV4X2hhc2goKSB7Cj4gICAgICAgICAgICAgICAgICAgZmkKPiAg
IAo+ICAgICAgICAgICAgICAgICAgIHVwZGF0ZWRfcmVsZWFzZXNfbGlzdD0iJHt1cGRhdGVkX3Jl
bGVhc2VzX2xpc3R9ICR7cmVsZWFzZV92ZXJzaW9ufS54Igo+IC0gICAgICAgICAgICAgICAgdXBk
YXRlZF92ZXJzaW9ucz0iJHt1cGRhdGVkX3ZlcnNpb25zfVxuIC0gJHtvbGRfdmVyc2lvbn0gLT4g
JHtuZXdfdmVyc2lvbn0iCj4gKyAgICAgICAgICAgICAgICB1cGRhdGVkX3ZlcnNpb25zPSIke3Vw
ZGF0ZWRfdmVyc2lvbnN9IiQnXG4nIiAtICR7b2xkX3ZlcnNpb259IC0+ICR7bmV3X3ZlcnNpb259
Igo+ICAgICAgICAgICAgICAgZmkKPiAgICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgIyBE
aWZmZXJlbnQgbGluZTogUmVzZXQgaGFzaCBsaXN0IGFuZCBqdXN0IGNvcHkgdGhpcyBsaW5lIG92
ZXIgYXMgaXMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
