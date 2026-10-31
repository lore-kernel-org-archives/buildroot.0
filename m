Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6197606A320
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 21:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DRFqliNz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CFC040654;
	Sat, 31 Oct 2026 21:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uWKK30Z7I8o; Sat, 31 Oct 2026 21:19:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 93F6A40650
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793481576;
	b=Ne4vNGBu2tDUyBQMMB2C/A2Jw+2S7VzarSbdE5d88rs/7WpP9Db01+tuwYBahqDGFYjR
	 IeF+QLy3xI/Brs+t4vHQt/VzZINM6yHFNovrQmXm7uvQdb6bGQ/YBNYoNA9/pW5W0Q3CF
	 S6mhXT/CDLjXS0Exw4zjDXuHgZ6Rs/K4IQd1H0XBT8QNyDcTcov4Ix/GdmFuigwODWxnl
	 37i0zYo/hb6bJTigdxokqhBKejAe4V8MHSFTUw63VUWn45ucXcr5c3sB7FHSSfoVWkH7X
	 wCnOFLojCRKQAJv7+pLVvfev7rWYwNsDBivRC8BcT3HDHnlxJz56ixnxoI6w1uy9vgA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793481576;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=xesFP0q61Li7r5/bjICAEcliwdM/z+ZQHIqGPE1C03w=;
	b=ZSwJgai+XQOO9YpC5WzhNw14y8YBhljyMT0Ab17ticyEVcRY+fHfwesomTziIXMlngpy
	 fH6QUXyhH/LGQ6K/6tQXU40P60dk0ZY/ObGdPUwu72+pEwZCwY6BosjED+XAUXRC/uHPG
	 tL008xViU7GYw7p7TCRTk/bQlDq38xv2kMFHlPEh4FdZ/0mzLHf5ooZoQSNYVrgGKzYQT
	 ADkzr38YRXTHsethKDMiZDecBfV/qugo0ai4Ath+/1wzt8NkdvS2GRR0yaNooC/B7baA6
	 zVtr+FWFSrAcinFicQcxaHyv138nHzNJW06zxJkLDOMmAmdN2li5Omlb8Re7USerQfw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793481576;
	bh=xesFP0q61Li7r5/bjICAEcliwdM/z+ZQHIqGPE1C03w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DRFqliNzR3mHK2ZWW0VsVYAinm8sC7KrL5ffcSH8ji5HlIze1V1ZiDH7f+nkC6wog
	 mgJbUKZa4uhrdG0caKitc3Q2OIAPiSO+ve56oDOugOcDICXGx8TI54mXfcEk0URPe4
	 se37naLTYZOSd+gQ4jNm2RLiGlAJtYqe4SRg2L9/zV2/WaB8pbIYKzceIFGYTwvtMO
	 jRb2ao1vmC8B1d9k5b2CWVSXGl1MZ1nJLHBdrqco0hHJJEdjPZGLjczjoXdniPN45n
	 DWZpZjDGVgthTOAHMwvTa6kDO0MFJ/V5Sv3LQ+rCrkZwidizWEwaIuffMRNgfBiF0+
	 Ol61XVbtCclng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93F6A40650;
	Sat, 31 Oct 2026 21:19:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FCA6411
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 21:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40ADE40650
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 21:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e3-bN_f2Sxkx for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 21:19:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 136EF405F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793481574;
 b=n+Ivtre79eIHYfsubLfTIZ+FozRdpsCTQycnZmVZ1VMp8uKgFFvTuUNE0X6FetNE7D86
 xks5aCvKBLTypN4UfdQ0boKu0k567DbPGaUPnqdJwWHWBOKTVTMHJCNwN24IVmDnLRleU
 +mgMCB57MKNfHRDRzjGs8n3N2lMv/83z/0myz2NkkW3X8cuKbm3DKrqGiVvhyxWH6xTfG
 zt10i/v0ee/IMWnznzYHvAdPiwXzI4BOEX+Z7hvcmrFMVTJSZAh0yxDD4JMrf4OEN/QjK
 P0LgNzKDt/jn03Gp9X38JZb7gzTsJiuCokcTsna8wI7/qryLh0WznIHAyGGgQFYnmmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793481574;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=gL1CknH5KDwEWwUNJ+l2nQ9WymRBZlNx3pSVIMGaubo=;
 b=OS4I2SgnTYcjKY6wsbQ9OUO9UdtNa3w2xQ+VRbK5HlJHFAjftuDV2+KEOfsh6LPYLYoD
 RS8hZaV66tPlic7vDR76zHjGLQ94U6djhB/4fVvhcp5WY5x8VgWhSVRCNUf6S5mh/OAVa
 j8UrlpW8p/HvyKY2sOgkLuGHQucUDPYFiM2V/N2AS7pksidpp6yjFmCel3M2epotZ+dFQ
 ZG+f/EVpPE0TSLxGwR/V34ZAI8RT64O0TEYL4WUOvqAsZ9iN/1PzC7GFBWY8Ocmyn7cxU
 +xFLWNu5PTjZuQPip05Ts49myLq7pFGn+UozyAjQh3wUS5KWy2qh6x2TiQfi0lY1a1Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="Q0YmT0c/"; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 136EF405F1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 21:19:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 74F8E13F879;
 Sat, 31 Oct 2026 22:19:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 31 Oct 2026 22:19:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 31 Oct 2026 22:19:28 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>, Sen
 Hastings <sen@hastings.org>
In-Reply-To: <20261030200552.779306-5-fiona.klute@gmx.de>
References: <20261030200552.779306-1-fiona.klute@gmx.de>
 <20261030200552.779306-5-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.20
Message-ID: <018b86b919ba692408f5d04d6a212d42@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 4/5] package/systemd: bump version to 261.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRmlvbmEsCgpUaGFua3MgZm9yIHRoZSBwYXRjaC4KCk9uIDMwLzEwLzIwMjYgMjE6MDUsIEZp
b25hIEtsdXRlIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gRnJvbTogIkZpb25hIEtsdXRlIChvdGhl
cm1vIEdtYkgpIiA8ZmlvbmEua2x1dGVAZ214LmRlPgo+IAo+IFRoaXMgdmVyc2lvbiBhZGRzIGFu
IElNRFMgKENsb3VkICJJbnN0YW5jZSBNZXRhZGF0YSBTZXJ2aWNlIikKPiBzdWJzeXN0ZW0sIHRv
IHJlY29nbml6ZSBydW5uaW5nIGluIFZNcyBwcm92aWRlZCBieSBjZXJ0YWluIGNsb3VkCj4gcHJv
dmlkZXJzIGFuZCBwcm92aWRlIGluZm9ybWF0aW9uIG9uIHRoZSBpbnN0YW5jZS4gVGhpcyBpcyBs
ZWZ0Cj4gZGlzYWJsZWQuIFRoZSB1c2VyICJzeXN0ZW1kLWltZHMiIGRlZmluZWQgaW4gdGhlIG5l
dwo+IHN5c3VzZXJzLmQvc3lzdGVtZC1pbWRzLmNvbmYuaW4gc291cmNlIGZpbGUgaXMgb25seSBu
ZWVkZWQgaWYgSU1EUyBpcwo+IGVuYWJsZWQuCj4gCj4gRXhjZXJwdHMgZnJvbSBORVdTIHBvc3Np
Ymx5IHJlbGV2YW50IGZvciBvdGhlciBwYWNrYWdlIGJ1aWxkcyBhbmQgcG9zdAo+IHNjcmlwdHM6
Cj4gKiAibGlic3lzdGVtZCBpcyBubyBsb25nZXIgZ3VhcmFudGVlZCB0byBiZSBsaW5rZWQgYWdh
aW5zdCBsaWJtLiBbLi4uXQo+ICAgQ29uc3VtZXJzIHRoYXQgcmVseSBvbiBsaWJzeXN0ZW1kIHRy
YW5zaXRpdmVseSBwdWxsaW5nIGluIGxpYm0KPiAgIHNob3VsZCBsaW5rIGFnYWluc3QgaXQgdGhl
bXNlbHZlcy4iIFsxXQo+ICogIkluZGl2aWR1YWwgYmluYXJpZXMgbm93IGFsc28gZW1iZWQgdGhl
IGRsb3BlbiBFTEYgbWV0YWRhdGEgbm90ZQo+ICAgKGh0dHBzOi8vdWFwaS1ncm91cC5vcmcvc3Bl
Y2lmaWNhdGlvbnMvc3BlY3MvZWxmX2Rsb3Blbl9tZXRhZGF0YS8pCj4gICBmb3IgdGhlaXIgZGxv
cGVuKCkgZGVwZW5kZW5jaWVzLCB3aGljaCBhbGxvd3MgcGFja2FnaW5nIHRvb2xzIHRvCj4gICBy
ZWxpYWJseSBkaXNjb3ZlciB0aGUgc2V0IG9mIG9wdGlvbmFsIGRlcGVuZGVuY2llcyBvZiBhIGJp
bmFyeSwKPiAgIFsuLi5dIiBbMl0KPiAKPiBOZXcgb3B0aW9uczoKPiAqICJzeXNpbnN0YWxsIiBl
bmFibGVzIGEgdGV4dHVhbCBpbnN0YWxsZXIvc2V0dXAgdG9vbCwgZGlzYWJsZWQKPiAqICJpbWRz
IiBlbmFibGVzL2Rpc2FibGVzIHRoZSBuZXcgSU1EUyBzdWJzeXN0ZW0sIGRpc2FibGVkCj4gKiAi
aW1kcy1uZXR3b3JrIiBoYXMgbm8gZWZmZWN0IHdpdGggaW1kcyBkaXNhYmxlZCwgbGVhdmUgdW5z
ZXQKPiAqICJzeXN0ZW1kLWltZHMtdWlkIiBpcyBsZWZ0IHVuc2V0IGxpa2Ugb3RoZXIgZml4ZWQg
dWlkIG9wdGlvbnMKPiAKPiBQbGVhc2Ugc2VlIHRoZSB1cHN0cmVhbSBORVdTIGZpbGUgZm9yIG90
aGVyIGNoYW5nZXMgWzNdLgo+IAo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0
ZW1kL2Jsb2IvdjI2MS40L05FV1MjTDEwMC1MMTEwCj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9z
eXN0ZW1kL3N5c3RlbWQvYmxvYi92MjYxLjQvTkVXUyNMNjA0LUw2MDgKPiBbM10gaHR0cHM6Ly9n
aXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC9ibG9iL3YyNjEuNC9ORVdTCj4gCj4gU2lnbmVkLW9m
Zi1ieTogRmlvbmEgS2x1dGUgKG90aGVybW8gR21iSCkgPGZpb25hLmtsdXRlQGdteC5kZT4KPiAt
LS0KWy4uLl0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsgYi9wYWNr
YWdlL3N5c3RlbWQvc3lzdGVtZC5tawo+IGluZGV4IDdlOTVlMDk4ZmYuLjM4OWI2Njg0NzcgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsKPiArKysgYi9wYWNrYWdlL3N5
c3RlbWQvc3lzdGVtZC5tawo+IEBAIC0xOSw3ICsxOSw3IEBACj4gICMgLSBEaWZmIHN5c3VzZXJz
LmQgd2l0aCB0aGUgcHJldmlvdXMgdmVyc2lvbgo+ICAjIC0gRGlmZiBmYWN0b3J5L2V0Yy9uc3N3
aXRjaC5jb25mIHdpdGggdGhlIHByZXZpb3VzIHZlcnNpb24KPiAgIyAgIChkZXRhaWxzIGFyZSBv
ZnRlbiBzcHJpbmtsZWQgYXJvdW5kIGluIFJFQURNRSBhbmQgbWFucGFnZXMpCj4gLVNZU1RFTURf
VkVSU0lPTiA9IDI2MC42Cj4gK1NZU1RFTURfVkVSU0lPTiA9IDI2MS40CgpUZXN0aW5nIHdpdGgg
bmV3IHZlcnNpb24gd2l0aCB0ZXN0LXBrZywgd2l0aCB0aGUgY29tbWFuZHM6CgpjYXQgPnN5c3Rl
bWQuY29uZmlnIDw8RU9GCkJSMl9JTklUX1NZU1RFTUQ9eQpCUjJfUEFDS0FHRV9TWVNURU1EPXkK
RU9GCnV0aWxzL3Rlc3QtcGtnIC1hIC1wIHN5c3RlbWQgLWMgc3lzdGVtZC5jb25maWcKCnByb2R1
Y2VzIGZldyBidWlsZCBmYWlsdXJlcy4KClRob3NlIGZhaWx1cmVzIGhhcHBlbnMgd2l0aCB0b29s
Y2hhaW5zIHdpdGggIm9sZGVyIgprZXJuZWwgaGVhZGVycy4KCk1vc3QgbGlrZWx5IGR1ZSB0byB1
cHN0cmVhbSBjb21taXQ6Cmh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvY29tbWl0
L2Y3OTVkNTQ1OTE1MWFkODRhY2Y3NzU1N2NmNDdkZGRkZGIzYjRiY2UKaW50cm9kdWNlZCBpbiB0
aGlzIHN5c3RlbWQgMjYxLCB0b29sY2hhaW5zIHdpdGggNS4xMCBoZWFkZXJzIGZhaWxzCndpdGgg
ZXJyb3I6CgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vc3JjL2xpYmMvbW91bnQuYzo1OgouLi9z
cmMvbGliYy9tb3VudC5jOiBJbiBmdW5jdGlvbiDigJhtb3VudF9zZXRhdHRyX3NoaW3igJk6Ci4u
L3NyYy9saWJjL2xpYmMtc2hpbS5oOjcxOjMyOiBlcnJvcjog4oCYX19OUl9tb3VudF9zZXRhdHRy
4oCZIHVuZGVjbGFyZWQgCihmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVh
biDigJhtb3VudF9zZXRhdHRy4oCZPwoKbW91bnRfc2V0YXR0ciB3YXMgaW50cm9kdWNlZCBpbiBr
ZXJuZWwgY29tbWl0OgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC8/aWQ9MmExODY3MjE5YzdiMjdmOTI4ZTI1NDU3
ODJiODZkYWFmOWFkNTBiZApmaXJzdCBpbmNsdWRlZCBpbiA1LjEyLgoKVGhlIHN5c3RlbWQgUkVB
RE1FIGRvY3VtZW50cyBtaW5pbWFsIEtlcm5lbCB2ZXJzaW9ucywgdGhvc2Ugc2VlbXMgdG8KYmUg
Zm9yIHJ1bnRpbWUsIHJhdGhlciB0aGFuIGNvbXBpbGF0aW9uIHRpbWUuCgpUaGUga2VybmVsIGRl
cGVuZGVuY3kgc2hvdWxkIGJlIHJhaXNlZCB0byA1LjEyLgoKTm90ZToKVGhlcmUgaXMgYWxzbyB0
aGUgc2FtZSBzdG9yeSB3aXRoIF9fTlJfZXBvbGxfcHdhaXQyIGluIHN5c3RlbWQgMjYyLgoKVXBz
dHJlYW0gY29tbWl0Cmh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvY29tbWl0L2Ey
ZGU4OWY2MjJhMTdhNDdhNjk3MjJlOWZjMjY3MjQ4NDFjNWI3N2QKaW4gc3lzdGVtZCAyNjIgdXNl
cyBfX05SX2Vwb2xsX3B3YWl0MiB3aGljaCB3YXMgaW50cm9kdWNlZCBpbgpLZXJuZWwgNS4xMQpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGlu
dXguZ2l0L2NvbW1pdC8/aWQ9YjBhMGMyNjE1ZjZmMTk5YTY1NmVkODU0OWQ3ZGNlNjI1ZDc3YWE3
NwoKVGhlIGZhaWx1cmUgaXM6CgouLi9zcmMvbGliYy9lcG9sbC5jOiBJbiBmdW5jdGlvbiDigJht
aXNzaW5nX2Vwb2xsX3B3YWl0MuKAmToKLi4vc3JjL2xpYmMvZXBvbGwuYzozNDoyNDogZXJyb3I6
IOKAmF9fTlJfZXBvbGxfcHdhaXQy4oCZIHVuZGVjbGFyZWQgKGZpcnN0IAp1c2UgaW4gdGhpcyBm
dW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhlcG9sbF9wd2FpdDLigJk/CgpidXQgaWYgdGhlIHN5
c3RlbWQgYnVtcCB0byAyNjEgcmFpc2VzIGtlcm5lbCByZXF1aXJlbWVudCB0byA1LjEyLAp0aGVy
ZSB3aWxsIGJlIG5vIG5lZWQgdG8gaGFuZGxlIF9fTlJfZXBvbGxfcHdhaXQyLgoKQ291bGQgeW91
IGhhdmUgYSBsb29rIGhvdyB0byBhZGRyZXNzIHRob3NlIGlzc3VlIHBsZWFzZT8KCkJlc3QgcmVn
YXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
