Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB48FC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B495960829;
	Wed, 16 Apr 2025 21:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4u7QJcoQXbsL; Wed, 16 Apr 2025 21:33:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E3F860D4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E3F860D4E;
	Wed, 16 Apr 2025 21:33:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18D9511B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 153E283640
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FU2Y8bk_YScA for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:33:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E235980EF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E235980EF2
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E235980EF2
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:33:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EE7A11C0083; Wed, 16 Apr 2025 23:33:22 +0200 (CEST)
Message-ID: <a7b5fcd3-f34d-4483-8ead-143907f8e31e@rnout.be>
Date: Wed, 16 Apr 2025 23:33:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Joris Lijssens <joris.lijssens@gmail.com>
References: <20250409163334.687686-1-thomas.perale@mind.be>
Content-Language: en-GB
In-Reply-To: <20250409163334.687686-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744839203; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qEDigVn/uQBDvjK+hHUL5tfwUGEYY518GbyLavavTGE=;
 b=b5vQX/ajMsaXDtR3g3Bewon5UhpQ3L1sD2yIiHftP1fumPLZmKt/P9u9VyM5sbFQonJG+f
 mAxzVO6EnKexUlSW158VbrZrSmGpj5VNP1J9Xkfqvt9LLoKpHbAyy023LB1K8ZnZW3pM0O
 xl/ixD+EeL/OxsrsmSH0Z943y5DNgtycGUAh8/mYfzr5iph+2DPboHbRp6ZOf7hKleR40c
 9r/6M2QY4/PlHvC0vWaFTi5PnfXYoOlkcKcgcX6HAlbc9PoyGOL6KkLihS/hhscFRkRsmf
 wD+Zh7xAl7FKnLOp+iUnFKihH9Ry86hc0LbLl4E4taVLwOtIGClwD5nNdbHj6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [v2 PATCH 1/1] package/libcoap: bump version to
 4.3.5
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

Ck9uIDA5LzA0LzIwMjUgMTg6MzMsIFRob21hcyBQZXJhbGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBUaGUgcGF0Y2ggaW50cm9kdWNlZCBpbiBbMV0gdGhhdCBmaXhlZCB0aGUgQ1ZFLTIwMjQtMDk2
MiBpcyBub3cKPiBhdmFpbGFibGUgdXBzdHJlYW0gaW4gdGhlIDQuMy41IHJlbGVhc2UgWzJdLgo+
Cj4gRm9yIG1vcmUgZGV0YWlscyBzZWUgdGhlIHJlbGVhc2Ugbm90ZToKPgo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9vYmdtL2xpYmNvYXAvYmxvYi92NC4zLjUvQ2hhbmdlTG9nCj4KPiBbMV0gOTAwMmI4
MThiZSBwYWNrYWdlL2xpYmNvYXA6IGZpeCBDVkUtMjAyNC0wOTYyCj4gWzJdIGh0dHBzOi8vZ2l0
aHViLmNvbS9vYmdtL2xpYmNvYXAvY29tbWl0LzJiMjhkOGIwZTk2MDdlNzFhMTQ1MzQ1YjRmZTQ5
NTE3ZTA1MmI3ZDkKPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJh
bGVAbWluZC5iZT4KCiDCoEFwcGxpZWQgdG/CoDIwMjUuMDIueCwgMjAyNC4xMS54IGFuZCAyMDI0
LjAyLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0KPiAgIC4uLmluZy1P
U0NPUkUtY29uZmlndXJhdGlvbi1pbmZvcm1hdGlvbi5wYXRjaCB8IDM4IC0tLS0tLS0tLS0tLS0t
LS0tLS0KPiAgIHBhY2thZ2UvbGliY29hcC9saWJjb2FwLmhhc2ggICAgICAgICAgICAgICAgICB8
ICAyICstCj4gICBwYWNrYWdlL2xpYmNvYXAvbGliY29hcC5tayAgICAgICAgICAgICAgICAgICAg
fCAgNSArLS0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlv
bnMoLSkKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmNvYXAvMDAwMS1jb2FwX29z
Y29yZS1jLUZpeC1wYXJzaW5nLU9TQ09SRS1jb25maWd1cmF0aW9uLWluZm9ybWF0aW9uLnBhdGNo
Cj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJjb2FwLzAwMDEtY29hcF9vc2NvcmUtYy1GaXgt
cGFyc2luZy1PU0NPUkUtY29uZmlndXJhdGlvbi1pbmZvcm1hdGlvbi5wYXRjaCBiL3BhY2thZ2Uv
bGliY29hcC8wMDAxLWNvYXBfb3Njb3JlLWMtRml4LXBhcnNpbmctT1NDT1JFLWNvbmZpZ3VyYXRp
b24taW5mb3JtYXRpb24ucGF0Y2gKPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCBl
NzUyNTBkNjEzLi4wMDAwMDAwMDAwCj4gLS0tIGEvcGFja2FnZS9saWJjb2FwLzAwMDEtY29hcF9v
c2NvcmUtYy1GaXgtcGFyc2luZy1PU0NPUkUtY29uZmlndXJhdGlvbi1pbmZvcm1hdGlvbi5wYXRj
aAo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSwzOCArMCwwIEBACj4gLUZyb20gMmIyOGQ4YjBlOTYw
N2U3MWExNDUzNDViNGZlNDk1MTdlMDUyYjdkOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiAt
RnJvbTogSm9uIFNoYWxsb3cgPHN1cGpwcy1saWJjb2FwQGpwc2hhbGxvdy5jb20+Cj4gLURhdGU6
IFRodSwgMjUgSmFuIDIwMjQgMTg6MDM6MTcgKzAwMDAKPiAtU3ViamVjdDogW1BBVENIXSBjb2Fw
X29zY29yZS5jOiBGaXggcGFyc2luZyBPU0NPUkUgY29uZmlndXJhdGlvbiBpbmZvcm1hdGlvbgo+
IC0KPiAtVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9vYmdtL2xpYmNvYXAvY29tbWl0LzJi
MjhkOGIwZTk2MDdlNzFhMTQ1MzQ1YjRmZTQ5NTE3ZTA1MmI3ZDkKPiAtU2lnbmVkLW9mZi1ieTog
RmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gLS0tLQo+IC0g
c3JjL2NvYXBfb3Njb3JlLmMgfCA1ICsrKy0tCj4gLSAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+IC0KPiAtZGlmZiAtLWdpdCBhL3NyYy9jb2FwX29zY29y
ZS5jIGIvc3JjL2NvYXBfb3Njb3JlLmMKPiAtaW5kZXggODNmNzg1YzkyLi5lMGZiMjI5NDcgMTAw
NjQ0Cj4gLS0tLSBhL3NyYy9jb2FwX29zY29yZS5jCj4gLSsrKyBiL3NyYy9jb2FwX29zY29yZS5j
Cj4gLUBAIC0xNjc4LDExICsxNjc4LDEyIEBAIGdldF9zcGxpdF9lbnRyeShjb25zdCBjaGFyICoq
c3RhcnQsCj4gLSAgICAgICAgICAgICAgICAgb3Njb3JlX3ZhbHVlX3QgKnZhbHVlKSB7Cj4gLSAg
IGNvbnN0IGNoYXIgKmJlZ2luID0gKnN0YXJ0Owo+IC0gICBjb25zdCBjaGFyICplbmQ7Cj4gLSsg
IGNvbnN0IGNoYXIgKmtlbmQ7Cj4gLSAgIGNvbnN0IGNoYXIgKnNwbGl0Owo+IC0gICBzaXplX3Qg
aTsKPiAtCj4gLSByZXRyeToKPiAtLSAgZW5kID0gbWVtY2hyKGJlZ2luLCAnXG4nLCBzaXplKTsK
PiAtKyAga2VuZCA9IGVuZCA9IG1lbWNocihiZWdpbiwgJ1xuJywgc2l6ZSk7Cj4gLSAgIGlmIChl
bmQgPT0gTlVMTCkKPiAtICAgICByZXR1cm4gMDsKPiAtCj4gLUBAIC0xNjkzLDcgKzE2OTQsNyBA
QCBnZXRfc3BsaXRfZW50cnkoY29uc3QgY2hhciAqKnN0YXJ0LAo+IC0KPiAtICAgaWYgKGJlZ2lu
WzBdID09ICcjJyB8fCAoZW5kIC0gYmVnaW4pID09IDApIHsKPiAtICAgICAvKiBTa2lwIGNvbW1l
bnQgLyBibGFuayBsaW5lICovCj4gLS0gICAgc2l6ZSAtPSBlbmQgLSBiZWdpbiArIDE7Cj4gLSsg
ICAgc2l6ZSAtPSBrZW5kIC0gYmVnaW4gKyAxOwo+IC0gICAgIGJlZ2luID0gKnN0YXJ0Owo+IC0g
ICAgIGdvdG8gcmV0cnk7Cj4gLSAgIH0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJjb2FwL2xp
YmNvYXAuaGFzaCBiL3BhY2thZ2UvbGliY29hcC9saWJjb2FwLmhhc2gKPiBpbmRleCAyMGFiYjk0
ZjhmLi4yYjBjM2JjZGU0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliY29hcC9saWJjb2FwLmhh
c2gKPiArKysgYi9wYWNrYWdlL2xpYmNvYXAvbGliY29hcC5oYXNoCj4gQEAgLTEsNCArMSw0IEBA
Cj4gICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+IC1zaGEyNTYgIGFlNjFhNDhjMjFmN2I0MGUxNDQy
YzllMWRhOWFhYjllNmYyY2YwZGVjY2IwMmYzZmVkNGRlMjMyYTBiMDUyMmUgIGxpYmNvYXAtNC4z
LjQudGFyLmd6Cj4gK3NoYTI1NiAgYTQxN2VkMjZlYzZjOTVjMDQxYjQyMzUzYjViNmZhZDE2MDJl
MmJmNDJhNmUyNmMwOTg2MzQ1MGUyMjdiN2I1ZiAgbGliY29hcC00LjMuNS50YXIuZ3oKPiAgIHNo
YTI1NiAgMDlkZDg2YTAxN2JhZDIxMDUyNzA4NTAwOGNiZjcwNjYwOWM1ODIxMDg5N2I2OTg0NWFm
MTQwOTk1NzdlN2ViNyAgQ09QWUlORwo+ICAgc2hhMjU2ICBiZGQ5NGRkZDhlNzUwMTBhZWJkMDQ1
ZWFkMWM5NTExMTA3ODgwMDMzOTVjNzA4ODExZDY5NjAyNDhhY2IzODkxICBMSUNFTlNFCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbGliY29hcC9saWJjb2FwLm1rIGIvcGFja2FnZS9saWJjb2FwL2xp
YmNvYXAubWsKPiBpbmRleCAyOTE2MTE0MmY2Li5jNWU1Zjg1YzYyIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvbGliY29hcC9saWJjb2FwLm1rCj4gKysrIGIvcGFja2FnZS9saWJjb2FwL2xpYmNvYXAu
bWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4g
ICAKPiAtTElCQ09BUF9WRVJTSU9OID0gNC4zLjQKPiArTElCQ09BUF9WRVJTSU9OID0gNC4zLjUK
PiAgIExJQkNPQVBfU0lURSA9ICQoY2FsbCBnaXRodWIsb2JnbSxsaWJjb2FwLHYkKExJQkNPQVBf
VkVSU0lPTikpCj4gICBMSUJDT0FQX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ICAgTElCQ09BUF9M
SUNFTlNFID0gQlNELTItQ2xhdXNlCj4gQEAgLTE1LDkgKzE1LDYgQEAgTElCQ09BUF9DT05GX09Q
VFMgPSBcCj4gICAJLS1kaXNhYmxlLWV4YW1wbGVzIC0tZGlzYWJsZS1leGFtcGxlcy1zb3VyY2Ug
LS13aXRob3V0LXRpbnlkdGxzCj4gICBMSUJDT0FQX0FVVE9SRUNPTkYgPSBZRVMKPiAgIAo+IC0j
IDAwMDEtY29hcF9vc2NvcmUtYy1GaXgtcGFyc2luZy1PU0NPUkUtY29uZmlndXJhdGlvbi1pbmZv
cm1hdGlvbi5wYXRjaAo+IC1MSUJDT0FQX0lHTk9SRV9DVkVTICs9IENWRS0yMDI0LTA5NjIKPiAt
Cj4gICBpZmVxICgkKEJSMl9QQUNLQUdFX0dOVVRMUykseSkKPiAgIExJQkNPQVBfREVQRU5ERU5D
SUVTICs9IGdudXRscwo+ICAgTElCQ09BUF9DT05GX09QVFMgKz0gXApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
