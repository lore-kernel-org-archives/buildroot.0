Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A478606A32F
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=isZUShHH
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42C80404EE;
	Wed,  4 Nov 2026 17:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8aGVbVazqoSx; Wed,  4 Nov 2026 17:26:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5DD03404EB
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793813199;
	b=fYN66mUEF6LpwwCezBFLOFITR5RAY3kQmo7wy3q7uO9lYFJGO3vFje8C9OglhyEqctbf
	 G70cHA7OJ7yOU61h/4xA8lmNpIh70g6kzeefOBwE36xaYm1R2yCNlOv/fA0N9M3F2v6Gi
	 TlE8Uu6UGzM38gXQi/CJSktsTtUMm7T7fMtXdOUwXVo2PMMt968YSdWGV2WKBTxvo/8c5
	 gbDY8jGUChTtp7PVyqdg6GZ9xf4YJBtC2y7GKBJGMjX//e7y3Sc85XeORc45Yh4/VzP6n
	 GebaoxhOjckS3a8A5R+tYnWSMGSB740hVUYvM8JD3fVJNWqM/xQsuCbmUchDDIEvN6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793813199;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Uzk1BzKodsT/XSnqsUQgxHJQToIKMyzY6T9NF6sLDek=;
	b=SVK6j+zFpWG702lHMZN6RjxcJM4kokjqQoKYgDl+hYijIJENPHs/7h2ozRIglYmm5GkU
	 Ga5b8vx0QdWNxd9tk2vLyqmDan/IgXW2nX/Xu2c9OuFAC39iLPBGIbutxicY/yq4MXWJo
	 vIx/YBMeHk8H6IThulhCY5L0kwmjOMEkydSg/5Nf8lLkIcdqxOBM5cRjYytILJUihOiJz
	 Wfk4EifzsqmfuMtIwIIePutBQjfzhbAkAjogXSUaobTs7orrxwTBUQKto3WDXBDg4xfr0
	 91LeJWRXr9uQTw2dccC1vOo2SrdiyKONQuDIfFuSMc2HSUNAqtt1kAu3daZtc36w6Wg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793813199;
	bh=Uzk1BzKodsT/XSnqsUQgxHJQToIKMyzY6T9NF6sLDek=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=isZUShHHA2FJM3Kv+40KQpATR+gXeVPsFn4G4LASusbMPL2bhzc8zyRMYHqVpK2Fk
	 8XUeFC0NkJjU5H7hzdan8oXAGJ6BKmDSGHOjchi49gpudSF2CF2+4lL0qaxaBqHpdG
	 oTZJT8h+V+wExuAdc3ahZWo7LPj+meYGGRA06Sni0h4WGwOyRp/MQA7dj+5vipYm+h
	 V8izrOdrj/0c7aG1O7Z2Wu1A0dZ34crajfEKgjn4ih0Uv9hTBMHullR/lMHKLziaC0
	 VN5NY6g0lzGkGHTThUtSyzg/uHwefM88zPEiMZ5m5YJu0tZSpD4De96E+AntlMj7P1
	 ovJW8oPDYWW9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DD03404EB;
	Wed,  4 Nov 2026 17:26:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A5C42B6
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C52A40211
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlPwYVFqmMj6 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:26:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7034440062
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7034440062
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:26:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 180A319F5BE;
 Wed,  4 Nov 2026 18:26:30 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 04 Nov 2026 18:26:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 18:26:30 +0100
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org, thomas.perale@mind.be,
 titouan.christophe@mind.be, Nicolas Carrier <nicolas.carrier@orolia.com>
In-Reply-To: <20261103102334.180654-1-raphael.melotte@mind.be>
References: <20261103102334.180654-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.20
Message-ID: <88a94be208a27f52206edf5bdc8fd0fd@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/composer: security bump to
 version 2.11.1
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMDMvMTEvMjAyNiAxMToyMywgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBDb21wb3NlciAyLjUuOCBidW5kbGVzIGNvbXBvc2VyL2NhLWJ1bmRsZSAxLjMuNSwgd2hp
Y2ggc3RpbGwgY29udGFpbnMKPiB0aGUgZW1TaWduIEVDQyBSb290IENBIC0gRzMgYW5kIEFBQSBD
ZXJ0aWZpY2F0ZSBTZXJ2aWNlcyByb290cyB0byB3aGljaAo+IHRoZSBjb21wcm9taXNlZCBlTXVk
aHJhIGludGVybWVkaWF0ZSBDQXMgY2hhaW4gKFsxXSkuCj4gCj4gQ29tcG9zZXIgMi4xMS4wIHVw
ZGF0ZXMgY29tcG9zZXIvY2EtYnVuZGxlIHRvIDEuNi4wLCB3aGljaCBubyBsb25nZXIKPiBjb250
YWlucyB0aGVzZSByb290cywgYW5kIGFsc28gcmVqZWN0cyBUTFMgY29ubmVjdGlvbnMgcHJlc2Vu
dGluZyB0aGUKPiBjb21wcm9taXNlZCBpbnRlcm1lZGlhdGVzIGV2ZW4gd2hlbiB0aGUgc3lzdGVt
IENBIHN0b3JlIHN0aWxsIHRydXN0cwo+IHRoZWlyIHJvb3RzIFsyXS4gMi4xMS4xIGlzIHRoZSBs
YXRlc3QgcmVsZWFzZS4KPiAKPiBUaGlzIGFsc28gaW5jbHVkZXMgdGhlIG90aGVyIHNlY3VyaXR5
IGZpeGVzIHJlbGVhc2VkIHNpbmNlIDIuNS44IChzZWUKPiB0aGUgcGFja2FnZSdzIGNoYW5nZWxv
ZyBmb3IgdGhlIGNvbXBsZXRlIGxpc3QpLgo+IAo+IENvbXBvc2VyIDIuMTEueCByZXF1aXJlcyBQ
SFAgPj0gNy4yLjUsIHdoaWNoIGhvc3QtcGhwIHNhdGlzZmllcy4KPiAKPiBSZWxlYXNlIG5vdGVz
OiBodHRwczovL2dpdGh1Yi5jb20vY29tcG9zZXIvY29tcG9zZXIvcmVsZWFzZXMvdGFnLzIuMTEu
MQo+IENoYW5nZWxvZzogCj4gaHR0cHM6Ly9naXRodWIuY29tL2NvbXBvc2VyL2NvbXBvc2VyL2Js
b2IvMi4xMS4xL0NIQU5HRUxPRy5tZAo+IAo+IFsxXTogaHR0cHM6Ly9lbXVkaHJhLndlLWhhdmUt
YS1wcm9ibGVtLmNvbS8KPiBbMl06IGh0dHBzOi8vZ2l0aHViLmNvbS9jb21wb3Nlci9jb21wb3Nl
ci9wdWxsLzEzMTQ2Cj4gCj4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhh
ZWwubWVsb3R0ZUBtaW5kLmJlPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
