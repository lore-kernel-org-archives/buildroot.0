Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC850EE4983
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 16:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6903881819;
	Tue, 30 Dec 2025 16:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NlbdfMt75FcU; Tue, 30 Dec 2025 16:09:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AA2D80E7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767110965;
	bh=ew9tyAiu8zk5MOMZHt3PNajqQbFCdY4vOgr5I4WixpM=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CmhNd7R2cEWvs+Mapkpbno6Hu3EtpY6B/eixp2hyZyYHY/vd1iUWcjJGwU6Jjp1EQ
	 CXfxhcyZO5bXRpK39ZgkJhm1CJwwlrkFrGmnBtISM9vmSR/okv/8g3Vy5Z9/Sag+rv
	 0+LBnol0u1ijTzA2ILBeQlCfAFODuFmwQIMkjg445t2tGlxMb90Cs/0gXGyLQE82Pp
	 5ekoldya8GPbhZNSaKqe2vy7WKO+O5Om7Gp7/6JhYgk+sytfrfPAyB3jLQSEELJf/V
	 JGOgr8/qfh9RZRAO42zLtvleS0kDByYlckY1yub95etlBHmRFUk85a5///ADGD+ZGK
	 9cSiIis3cgSrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AA2D80E7A;
	Tue, 30 Dec 2025 16:09:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 815B6177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67CD960785
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aa2i6f8KRyXo for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 16:09:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 36C6060B7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36C6060B7D
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36C6060B7D
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:09:20 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id acHTvTVKNP2aDacHTvOAG7; Tue, 30 Dec 2025 17:09:18 +0100
Message-ID: <eb63ec78-3697-4e42-a184-2a98688f123a@benettiengineering.com>
Date: Tue, 30 Dec 2025 17:09:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <CAPi7W83eWKi4o5P8gGnYVUxDU1+u_+aXycSNHNRtkF_medg46g@mail.gmail.com>
 <23F59953-57A8-48F0-9809-4841CC10CA0F@benettiengineering.com>
 <20240207164007.566c2d6b@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240207164007.566c2d6b@windsurf>
X-CMAE-Envelope: MS4xfJfeMch7Y1brrIJCCsycfzXSOKvF7L8s9ac9DbcheK94lCEEG3WiqouR9cC/gBVgYkiQrIQY2wsQlaw4Bi1p9E5/oZIrBdzl2C8G5N1G6O82AJ4CPI4Y
 MC7JntloPr7/U1sNXfvQIzHebM8VTYeHdrrCXRg5tTE4xfnes+vBpfkgh5LX1Wxj9zp0OrisjjLbR6NbgQJiLMxQhJnIL/VFzlxF9a3PGCz3XNcUCUsoaYDF
 CBJB0vbKbrzRsHjL54+p6a/rKZf8131KEM46XLaiOagv3I8DVB8Nw3pwvUR60Osb65SVsI4qkKdhmXQ3abeIhHq4J6KRRTohEWQHRy9gmh0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767110958; bh=wYbRrg/e9y9Ww3Mb2qx1cRsuYyjnpeh/oA2tj4J2Gtc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=WxiEYIFe83E8kJrqsk2ctjzZWTpyGCjw/CSs7qRjK2f2DejeDArWG6bo8D+dZseeC
 DS3i/0vGTHEQXuYPfej/6SqSKLFnGqFvrIuP7mg0FMhbvZ+j7UUhOROu9mpr0u+VO4
 dhRRlonWXqvmSviBn+wPJV88pNJqEzYUwci+YjbAuqQFDtUXfAo6mRcyeTgLArfgoF
 6ln/baqNXCIHwoT8hfv2l5Bhf7X+pQ8ZkXou5Ch2ybbKXF75D9y7s+1lDajjMirvMI
 qUP/8ZviGdEgTXFy9LBGlzyXRtCyY5t/2F/xNrLcDgfv98xDkDWSCFfCQ6qaMJWXq/
 Xw79RVPKsMznw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=WxiEYIFe
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: fix musl build
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLCBBbGwsCgpwbGVhc2UgY2hlY2sgdGhpcyBwYXRjaDoKaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI1MTIyOTE3MDMzMS4x
Mjk5NzIzLTEtZ2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbS8KCkJlc3QgcmVn
YXJkcwpHaXVsaW8KCk9uIDA3LzAyLzIwMjQgMTY6NDAsIFRob21hcyBQZXRhenpvbmkgdmlhIGJ1
aWxkcm9vdCB3cm90ZToKPiBIZWxsbyBHaXVsaW8sCj4gCj4gT24gRnJpLCAxMiBKYW4gMjAyNCAy
MzozOTo1NSArMDEwMAo+IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5n
aW5lZXJpbmcuY29tPiB3cm90ZToKPiAKPj4+IFNvIGJhc2ljYWxseSwgd2hlbiBGUkVFQkxfTk9f
REVQRU5EIGlzIHNldCB0byAxLCBmcmVlYmwgc2hhbGwgbm90Cj4+PiBkZXBlbmQgb24gUFJfU2V0
RXJyb3IgYXMgdGhpcyBmdW5jdGlvbiBpcyBkZWZpbmVkIGJ5IG5zcHIuCj4+Pgo+PiBZZXMgYnV0
IHlvdXIgcGF0Y2ggb25seSBjb21tZW50IG91dCBQUl9TZXRFcnJvcigpIHdoaWxlIGl0IHNob3Vs
ZAo+PiBkZXBlbmQgb24gRlJFRUJMX05PX0RFUEVORCBhdCB0aGlzIHBvaW50IGV2ZW4gaWYgSSBk
aWRu4oCZdCBnbyBpbiBkZXB0aAo+PiBhZ2FpbiBhZnRlciAxLzIgeWVhcnMuCj4+Cj4+IEJ1dCB0
aGUgcG9pbnQgaXMgd2h5IHRoaXMgb25seSBoYXBwZW5zIG9uIG11c2wgYW5kIHNwZWNpZmljCj4+
IGFyY2hpdGVjdHVyZXMuCj4gCj4gVGhpcyBpcyBpbmRlZWQgdGhlIHF1ZXN0aW9uIHRoYXQgd2Ug
bmVlZCB0byBhbnN3ZXIuIFdoeSBpcyB0aGF0IG11c2wKPiBvbmx5Pwo+IAo+IEFjY29yZGluZyB0
byBGYWJyaWNlJ3MgZXhwbGFuYXRpb24sIGl0IHNob3VsZCBoYXBwZW4gb24gYWxsIHBsYXRmb3Jt
cywKPiByZWdhcmRpbmcgb2YgdGhlIEMgbGlicmFyeS4gU28gdGhlcmUgaXMgc29tZXRoaW5nICJt
b3JlIiB0byBpdCwgdGhhdCB3ZQo+IGRvbid0IHlldCB1bmRlcnN0YW5kLgo+IAo+IEJlc3QgcmVn
YXJkcywKPiAKPiBUaG9tYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
