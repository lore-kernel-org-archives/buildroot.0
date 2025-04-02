Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC30C36018
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 21:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19B83605D0;
	Wed,  2 Apr 2025 21:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITQVb0Yyfr2x; Wed,  2 Apr 2025 21:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52DC260884
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52DC260884;
	Wed,  2 Apr 2025 21:17:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5548123
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 21:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF44E405B3
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 21:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqzshQkU5NCd for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 21:17:06 +0000 (UTC)
Received-SPF: Temperror (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C726940AFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C726940AFB
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C726940AFB
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 21:16:42 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id 05Rvu3CYDzl8E05RwuZICX; Wed, 02 Apr 2025 23:16:40 +0200
Message-ID: <8427723f-3260-4b1a-864e-c7e45326bdd8@benettiengineering.com>
Date: Wed, 2 Apr 2025 23:16:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <46b77ff81a96ebcb9e707d4de114a79e@free.fr>
 <20250401194506.317668-1-giulio.benetti@benettiengineering.com>
 <83efa708da680e88394c89f786e661be@free.fr>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <83efa708da680e88394c89f786e661be@free.fr>
X-CMAE-Envelope: MS4xfH0gZdylQEN0y2BSAfnxo+uAIImXmXeRe8vtgLoN1W0mzYwJwRtgs1X14oLppK2rp6L3/Qop3P6IdheJHCwLafSqNGVs10r7HiFVZp03Zcmi4go8wcY0
 sRn6b9u2VyS1dUpXdA3+ftK6CIL9lccbAgKufVVkr7fix0PBR/X/SRPx2CW1X9P5xUjoEMyqCQluTwNg2wUXMX+69JXzmhu3ZpVhcXJHzDsu1101awJ58zQR
 QRSgXnY77LlEVYrZnPtQXA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1743628600; bh=pZANriNRVUI6Lj8QayVuB0AW3M+CD2tCMLXns1oPfdI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=MD68we8YrxEwKwWAEWVQk8yPbYap1iVS1lBNcIOAs803qxut3gB4t6PRA1ql192Aj
 JNNJolCKmna86xD/yBlbp2Q4IKkwtSF8wv+NzH6d/kOEPWT12eAcYLqYhUztrvSwHU
 S2SZVQ0r7rPuxHXNpsBTKJdk10tBketL6n3J+l/1qynV8Jm2UoBg8EG6VU+EnFM4Ok
 VYxtT5NJ8KGduFBwz0314zvapg/MMP6WGRILSryGeh8wXnBOKBoCLm5X8DFlZDVOPh
 MZGMiMPis6bRse2jI785VsKaucObgZ1HVPu51sB8TetbSc5DyM9Lg6oukjHFBH4rxu
 z9Tnr0pXCXUTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=MD68we8Y
Subject: Re: [Buildroot] [PATCH v2] package/libfuse3: bump to version 3.17.1
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

SGkgSnVsaWVuLAoKT24gNC8yLzI1IDIxOjM4LCBKdWxpZW4gT2xpdmFpbiB3cm90ZToKPiBIaSBH
aXVsaW8sCj4gCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlZCBwYXRjaC4KPiAKPiBPbiAwMS8wNC8y
MDI1IDIxOjQ1LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPj4gUmVsZWFzZSBub3RlczoKPj4gaHR0
cHM6Ly9naXRodWIuY29tL2xpYmZ1c2UvbGliZnVzZS9yZWxlYXNlcy90YWcvZnVzZS0zLjE3LjEK
Pj4KPj4gQWRkIGxvY2FsIHBhdGNoIHBlbmRpbmcgdXBzdHJlYW0gdG8gZml4IGJ1aWxkIHdpdGgg
bGludXggdmVyc2lvbiA8IDUuOS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkg
PGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4+IC0tLQo+PiBWMS0+VjI6
Cj4+ICogZml4IGxpbnV4IHZlcnNpb24gPCA1LjkgYnVpbGQgZmFpbHVyZSBieSBhZGRpbmcgbG9j
YWwgcGF0Y2ggcGVuZGluZyAKPj4gdXBzdHJlYW0KPiBbLi4uXQo+PiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saWJmdXNlMy9saWJmdXNlMy5tayBiL3BhY2thZ2UvbGliZnVzZTMvbGliZnVzZTMubWsK
Pj4gaW5kZXggZjVjOWRhZThmNy4uMmZiYTY3OTJjYiAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9s
aWJmdXNlMy9saWJmdXNlMy5tawo+PiArKysgYi9wYWNrYWdlL2xpYmZ1c2UzL2xpYmZ1c2UzLm1r
Cj4+IEBAIC00LDcgKzQsNyBAQAo+PiDCoCMKPj4KPj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
Pj4KPj4gLUxJQkZVU0UzX1ZFUlNJT04gPSAzLjE2LjIKPj4gK0xJQkZVU0UzX1ZFUlNJT04gPSAz
LjE3LjEKPiAKPiBFdmVuIHdpdGggdGhlIHBhdGNoIHJlc29sdmluZyB0aGUgaXNzdWUgd2l0aCBL
ZXJuZWwgaGVhZGVycyA8IDUuOSwgSSBzdGlsbAo+IHNlZSBmZXcgcmVtYWluaW5nIGJ1aWxkIGZh
aWx1cmVzIHdpdGggdGhpcyB2ZXJzaW9uLiBTZWU6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2
YWluL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy8xNzQ5MjM2NjI0Cj4gCj4gQ291bGQgeW91IGhhdmUg
YSBsb29rIHBsZWFzZT8KClN1cmUsIEkndmUgZm9yZ290dGVuIHRvIGxhdW5jaCB0ZXN0LXBrZyAt
YS4KClRoYW5rcyBmb3IgcmV2aWV3aW5nIGFuZCBidWlsZC10ZXN0aW5nIQotLSAKR2l1bGlvIEJl
bmV0dGkKQ0VPJkNUT0BCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
