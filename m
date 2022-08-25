Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BC0C28D13
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 10:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0112F83DF1;
	Thu, 25 Aug 2022 10:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0112F83DF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XDnSppo9Q_h2; Thu, 25 Aug 2022 10:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8CE383455;
	Thu, 25 Aug 2022 10:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8CE383455
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8D8E1BF28C
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 10:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 841FD83455
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 10:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 841FD83455
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LspgKfGxItQy for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 10:40:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EE5D833D3
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org
 [IPv6:2001:67c:2050:102:465::110])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EE5D833D3
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 10:40:20 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4MCzxr51MXz9sq9;
 Thu, 25 Aug 2022 12:40:16 +0200 (CEST)
Message-ID: <3b3f344d-f06d-dc4a-e055-72e7b335044a@othermo.de>
Date: Thu, 25 Aug 2022 12:40:14 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20220823194732.701895-1-marcus.hoffmann@othermo.de>
 <705af3ef-1388-85bf-6ac9-f24bca8d8a1c@mind.be>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <705af3ef-1388-85bf-6ac9-f24bca8d8a1c@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1661424016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vsBMV31zofcQikQfrnr+cc421JibzxBVVVZJtw7/Ex0=;
 b=S8zPeNOLPcCadLz18lU6hr2/iol0CZhdRSV528ozKigYge2SPJ5hqCG8cw1uyaozhMyygI
 x/KnWz6EOuuVxi0veFzeGWI1Zv9iVqsahAb5FAon+xPnemm/kq9TuBBfVmAeJZ0fVc+8Gi
 eG5QO5IPwmUINQRe6fMzzIMjBGct6VB9nNuE4/wufiqhmFmm4f5sLpKgpgH7aeUcsYo2cn
 UQWu2uerIavHdJrD5BuIq83nYUKjERwSGFFCsaxzizdjXWCIYStviU1JHxrFVWN+G6WPEf
 6oAVq23uhvHLoVLvwDDofZQhsTU5cDNuxuNo61Z1YQ7p3sdqwuKTfWmRAoIkbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=S8zPeNOL
Subject: Re: [Buildroot] [PATCH 1/2] package/python-paho-mqtt: bump to 1.6.1
 to fix running on python 3.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Davide Viti <zinosat@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAp0aGFua3MgZm9yIHRoZSByZXZpZXcuCgpPbiAyNC4wOC4yMiAyMjo0OCwgQXJu
b3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4gCj4gCj4gT24gMjMvMDgvMjAyMiAyMTo0NywgTWFy
Y3VzIEhvZmZtYW5uIHdyb3RlOgo+PiBGaXhlcyB0aGUgZm9sbG93aW5nIGVycm9yIG9uIGNhbGxp
bmcgbXF0dC5wdWJsaXNoKCk6Cj4+Cj4+IMKgwqAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4xMC9z
aXRlLXBhY2thZ2VzL3BhaG8vbXF0dC9wdWJsaXNoLnB5IiwgbGluZSAKPj4gMjIyLCBpbiBzaW5n
bGUKPj4gwqDCoMKgwqAgbXVsdGlwbGUoW21zZ10sIGhvc3RuYW1lLCBwb3J0LCBjbGllbnRfaWQs
IGtlZXBhbGl2ZSwgd2lsbCwgYXV0aCwgCj4+IHRscywKPj4gwqDCoCBGaWxlICIvdXNyL2xpYi9w
eXRob24zLjEwL3NpdGUtcGFja2FnZXMvcGFoby9tcXR0L3B1Ymxpc2gucHkiLCBsaW5lIAo+PiAx
MjYsIGluIG11bHRpcGxlCj4+IMKgwqDCoMKgIGlmIG5vdCBpc2luc3RhbmNlKG1zZ3MsIGNvbGxl
Y3Rpb25zLkl0ZXJhYmxlKToKPj4gQXR0cmlidXRlRXJyb3I6IG1vZHVsZSAnY29sbGVjdGlvbnMn
IGhhcyBubyBhdHRyaWJ1dGUgJ0l0ZXJhYmxlJwo+Pgo+PiBUaGlzIHdhcyBhY3R1YWxseSBjaGFu
Z2VkIGluIHJlbGVhc2UgMS41LjAgYnV0IDEuNi4xIGlzIGFsYXJlYWR5IG91dCBmb3IKPj4gYWxt
b3N0IGEgeWVhciwgc28gd2UganVzdCB1cGRhdGUgdG8gdGhhdCB2ZXJzaW9uLgo+Pgo+PiBDaGFu
Z2Vsb2c6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9lY2xpcHNlL3BhaG8ubXF0dC5weXRob24vYmxv
Yi9tYXN0ZXIvQ2hhbmdlTG9nLnR4dAo+IAo+ICDCoEp1bXBpbmcgZnJvbSAxLjQuMCB0byAxLjYu
MSBhdCB0aGlzIHBvaW50IGluIHRoZSBzdGFiaWxpc2F0aW9uIG1vbnRoIAo+IGlzIG5vdCBpZGVh
bC4uLgoKVGhlcmUncyB0d28gb3RoZXIgb3B0aW9ucyBJIGNhbiB0aGluayBvZiwgSSB3YXNuJ3Qg
c3VyZSB3aGF0J3MgYmVzdCBoZXJlOgoKKiBiYWNrcG9ydCBodHRwczovL2dpdGh1Yi5jb20vZWNs
aXBzZS9wYWhvLm1xdHQucHl0aG9uL3B1bGwvNDk3L2ZpbGVzLCAKdGhhdCBzaG91bGQgYmUgZWFz
eSBlbm91Z2gKKiBVcGRhdGUgdG8gMS41LjEgKG5vdCAxLjUuMCBhcyBJIGNsYWltZWQgYWJvdmUp
IHdoaWNoIGlzIHRoZSBmaXJzdCAKcmVsZWFzZSB0aGF0IGluY2x1ZGVzIHRoZSBmaXggZm9yIHRo
ZSBwcm9ibGVtCgpEbyB5b3UgaGF2ZSBhIHByZWZlcmVuY2UgZm9yIG9uZSBvZiB0aGUgdHdvIG92
ZXIgdXBkYXRpbmcgdG8gdGhlIGxhdGVzdCAKcmVsZWFzZT8gKEkuZS4gZGVmZXIgdGhlIDEuNi4x
IHVwZGF0ZSB0byBuZXh0KQoKPiAKPj4gU2lnbmVkLW9mZi1ieTogTWFyY3VzIEhvZmZtYW5uIDxt
YXJjdXMuaG9mZm1hbm5Ab3RoZXJtby5kZT4KPj4gLS0tCj4+IMKgIHBhY2thZ2UvcHl0aG9uLXBh
aG8tbXF0dC9weXRob24tcGFoby1tcXR0Lmhhc2ggfCA2ICsrKy0tLQo+PiDCoCBwYWNrYWdlL3B5
dGhvbi1wYWhvLW1xdHQvcHl0aG9uLXBhaG8tbXF0dC5ta8KgwqAgfCA0ICsrLS0KPj4gwqAgMiBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL3B5dGhvbi1wYWhvLW1xdHQvcHl0aG9uLXBhaG8tbXF0dC5oYXNoIAo+
PiBiL3BhY2thZ2UvcHl0aG9uLXBhaG8tbXF0dC9weXRob24tcGFoby1tcXR0Lmhhc2gKPj4gaW5k
ZXggYmYzOTkzZTkxOTUuLjU2NzgzZTNmYzA4IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3B5dGhv
bi1wYWhvLW1xdHQvcHl0aG9uLXBhaG8tbXF0dC5oYXNoCj4+ICsrKyBiL3BhY2thZ2UvcHl0aG9u
LXBhaG8tbXF0dC9weXRob24tcGFoby1tcXR0Lmhhc2gKPj4gQEAgLTEsNiArMSw2IEBACj4+IC0j
IG1kNSBmcm9tIGh0dHBzOi8vcHlwaS5weXRob24ub3JnL3B5cGkvcGFoby1tcXR0L2pzb24sIHNo
YTI1NiAKPj4gbG9jYWxseSBjb21wdXRlZAo+PiAtbWQ1wqAgZTNhYzI5Y2Q1ZGMyNDdhMDEwODNh
MmE4ZjNmZGRkMDjCoCBwYWhvLW1xdHQtMS40LjAudGFyLmd6Cj4+IC1zaGEyNTYgIAo+PiBlNDQw
YTA1MmI0NmQyMjJlMTg0YmUzYmUzODY3NjM3ODcyMjA3MmZjZDRkZmQyYzhmNTA5ZmI4NjFhN2Iw
Yjc5ICAKPj4gcGFoby1tcXR0LTEuNC4wLnRhci5nego+PiArIyBwYWNrYWdlIGhhc2hlcyBmcm9t
IGZyb20gCj4+IGh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9wYWhvLW1xdHQvI2NvcHktaGFzaC1t
b2RhbC1lOGU4ZTBkZS0xYWVjLTQ2MmQtOGFlMC1kODU4ZDRmNWEwZDcKPj4gK21kNcKgIGJkYjIw
Zjg4ZGIyOTFmZGI0YTBmZTgwNGMwZjI5MzE2wqAgcGFoby1tcXR0LTEuNi4xLnRhci5nego+PiAr
c2hhMjU2ICAKPj4gMmE4MjkxYzgxNjIzYWVjMDAzNzJiNWE4NTU1OGEzNzJjNzQ3Y2JjYThlOTkz
NGRmZTIxODYzOGI4ZWVmYzI2ZiAgCj4+IHBhaG8tbXF0dC0xLjYuMS50YXIuZ3oKPj4gwqAgc2hh
MjU2ICAKPj4gNzZmMTM3MjllODRlOTIyMmU1NDMzMDNkZjAwZjg3ZDFiMmMwOTk1YjZhNTA1Y2Q4
NTlhMjg1NjY3ZTQ0YmFiYiAgCj4+IExJQ0VOU0UudHh0Cj4gCj4gIMKgVW5mb3J0dW5hdGVseSwg
dGhlIExJQ0VOU0UgaGFzaCBjaGFuZ2VkLCBiZWNhdXNlIGluIGZhY3QgdGhlIGxpY2Vuc2UgCj4g
Y2hhbmdlZDoKPiBAQCAtMSwzICsxLDMgQEAKPiAtVGhpcyBwcm9qZWN0IGlzIGR1YWwgbGljZW5z
ZWQgdW5kZXIgdGhlIEVjbGlwc2UgUHVibGljIExpY2Vuc2UgMS4wIGFuZCB0aGUKPiAtRWNsaXBz
ZSBEaXN0cmlidXRpb24gTGljZW5zZSAxLjAgYXMgZGVzY3JpYmVkIGluIHRoZSBlcGwtdjEwIGFu
ZCAKPiBlZGwtdjEwIGZpbGVzLgo+ICtUaGlzIHByb2plY3QgaXMgZHVhbCBsaWNlbnNlZCB1bmRl
ciB0aGUgRWNsaXBzZSBQdWJsaWMgTGljZW5zZSAyLjAgYW5kIHRoZQo+ICtFY2xpcHNlIERpc3Ry
aWJ1dGlvbiBMaWNlbnNlIDEuMCBhcyBkZXNjcmliZWQgaW4gdGhlIGVwbC12MjAgYW5kIAo+IGVk
bC12MTAgZmlsZXMuCj4gCj4gIMKgQW5kIHRvIHRvcCB0aGluZ3MgdXAsIGVwbC12MjAgaXMgbWlz
c2luZyBpbiB0aGUgdGFyYmFsbC4uLgo+IAo+ICDCoENvdWxkIHlvdSBjaGVjayBpZiB0aGVyZSBp
cyBhIHZlcnNpb24gdGhhdCBkb2VzIGhhdmUgdGhlIGVwbC12MjAgZmlsZT8gCj4gUGVyaGFwcyBl
dmVuIGZyb20gYW4gdXBzdHJlYW0gZ2l0IHJlcG8/CgpBaCwgSSBzdXBwb3NlIHRob3NlIGhhc2hl
cyBhcmUgb25seSBjaGVja2VkIG9uIGBsZWdhbC1pbmZvYCBhbmQgbm90IGEgCm5vcm1hbCBidWls
ZCBvZiB0aGUgcGFja2FnZT8KCmh0dHBzOi8vd3d3LmVjbGlwc2Uub3JnL3BhaG8vaW5kZXgucGhw
P3BhZ2U9Y2xpZW50cy9weXRob24vaW5kZXgucGhwIApzdWdnZXN0cyBpbnN0YWxsYXRpb24gdmlh
IHB5cGkvcGlwIGlzIHRoZSBjYW5vbmljYWwgd2F5IGJ1dCBvZmZlcnMgZnJvbSAKc291cmNlIGlu
c3RhbGxhdGlvbiBhcyBhbiBhbHRlcm5hdGl2ZS4KCmh0dHBzOi8vZ2l0aHViLmNvbS9lY2xpcHNl
L3BhaG8ubXF0dC5weXRob24gYW5kIHRoZSBnaXRodWIgCmF1dG8tZ2VuZXJhdGVkIHRhcmJhbGwg
Y29udGFpbiB0aGUgZXBsLTIwIGxpY2Vuc2UgZmlsZSwgc2hvdWxkIEkgY2hhbmdlIAp0aGUgc291
cmNlIGRvd25sb2FkIHRvIHRoYXQ/IChJIHJlbWVtYmVyIGdpdGh1YiBhdXRvLWdlbmVyYXRlZCB0
YXJiYWxscyAKYmVpbmcgcHJvYmxlbWF0aWMgaW4gdGhlIHBhc3QgYmVjYXVzZSB0aGV5IG1pZ2h0
IHNpbGVudGx5IGNoYW5nZS4gRG9lcyAKdGhlIGJ1aWxkcm9vdCBwcm9qZWN0IGhhdmUgYSBwb2xp
Y3kgaGVyZT8pCgo+IAo+ICDCoFJlZ2FyZHMsCj4gIMKgQXJub3V0Cj4gCgpbLi4uXQoKQmVzdCwK
TWFyY3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
