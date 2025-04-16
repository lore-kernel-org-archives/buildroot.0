Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775ACC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 320FE607C5;
	Wed, 16 Apr 2025 21:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mL1x1J5AVwLU; Wed, 16 Apr 2025 21:35:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC583607E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC583607E3;
	Wed, 16 Apr 2025 21:35:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BB166B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D0C7607C5
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vEYKfCYkIsLm for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:35:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40129607E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40129607E3
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40129607E3
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:35:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 54FA71C0083; Wed, 16 Apr 2025 23:35:25 +0200 (CEST)
Message-ID: <3ee8ae8d-a83c-47fc-8fac-1310d3748f03@rnout.be>
Date: Wed, 16 Apr 2025 23:35:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20250411174847.3489092-1-thomas.perale@mind.be>
Content-Language: en-GB
In-Reply-To: <20250411174847.3489092-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744839325; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8kQ98++9OH9taZTtK53Aux90f0Gc5hp5Qv5117dBlzc=;
 b=StkerVJTmSieQ9IgHm6rbLe/846jsFcGtC64XlEjXNNeZh5nYyJWhnyx3wW2aZSDz9OY6h
 XLzm6am29WNo+OqadaY17/Hw5fuvVJdGvA8SOTFqHULwwqQshqFhHxP9tqoiFY7aNQZfvj
 bBNnz0immjM46NH7rsAZ52jwA2aIk9fJjbhAfbTXK4l7Z7d08rqNRAcEFPVkXKpzZmE04S
 jYL4hkUVEvpytj8gIo2wb1Zon6TvD3EP9c9/T7XW5aE3ZM/azVyk/nTN8lux3w0K+CJXDB
 VVN2Iw2YjPTVd5Nzw3StLBoPRb4NRvRYLd29lTBcLO0JgDddkAZdL2bVPD5HZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: security bump to
 version 3.7.9
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

Ck9uIDExLzA0LzIwMjUgMTk6NDgsIFRob21hcyBQZXJhbGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBGaXhlcyB0aGUgZm9sbG93aW5nIHNlY3VyaXR5IGlzc3VlczoKPgo+IC0gQ1ZFLTIwMjQtNTc5
NzA6IGxpYmFyY2hpdmUgdGhyb3VnaCAzLjcuNyBoYXMgYSBoZWFwLWJhc2VkIGJ1ZmZlcgo+ICAg
ICAgb3Zlci1yZWFkIGluIGhlYWRlcl9nbnVfbG9uZ2xpbmsgaW4gYXJjaGl2ZV9yZWFkX3N1cHBv
cnRfZm9ybWF0X3Rhci5jCj4gICAgICB2aWEgYSBUQVIgYXJjaGl2ZSBiZWNhdXNlIGl0IG1pc2hh
bmRsZXMgdHJ1bmNhdGlvbiBpbiB0aGUgbWlkZGxlIG9mIGEKPiAgICAgIEdOVSBsb25nIGxpbmtu
YW1lLgo+Cj4gRm9yIG1vcmUgaW5mb3JtYXRpb24sIHNlZToKPiAgICAtIGh0dHBzOi8vbnZkLm5p
c3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0yMDI0LTU3OTcwCj4gICAgLSBodHRwczovL2dpdGh1Yi5j
b20vbGliYXJjaGl2ZS9saWJhcmNoaXZlL2NvbW1pdC84MjkxMjEwMzIxNDUwNjMxNmJkOTk5MGQ3
M2YzM2Q3NDNkNTVmNTcwCj4KPiAtIENWRS0yMDI1LTE2MzI6IFRoaXMgYWZmZWN0cyB0aGUgZnVu
Y3Rpb24gbGlzdCBvZiB0aGUgZmlsZSBic2R1bnppcC5jLgo+ICAgICAgVGhlIG1hbmlwdWxhdGlv
biBsZWFkcyB0byBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2UuIEl0IGlzIHBvc3NpYmxlCj4gICAg
ICB0byBsYXVuY2ggdGhlIGF0dGFjayBvbiB0aGUgbG9jYWwgaG9zdC4KPgo+IEZvciBtb3JlIGlu
Zm9ybWF0aW9uLCBzZWU6Cj4gICAgLSBodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9D
VkUtMjAyNS0xNjMyCj4gICAgLSBodHRwczovL2dpdGh1Yi5jb20vbGliYXJjaGl2ZS9saWJhcmNo
aXZlL2NvbW1pdC9jOWJjOTM0ZTdlOTFkMzAyZTBmZWNhNmU3MTNjY2MzOGQ2ZDAxNTMyCj4KPiAt
IENWRS0yMDI1LTI1NzI0OiBsaXN0X2l0ZW1fdmVyYm9zZSBpbiB0YXIvdXRpbC5jIGluIGxpYmFy
Y2hpdmUgdGhyb3VnaCAzLjcuNwo+ICAgICAgZG9lcyBub3QgY2hlY2sgYW4gc3RyZnRpbWUgcmV0
dXJuIHZhbHVlLCB3aGljaCBjYW4gbGVhZCB0byBhIGRlbmlhbCBvZgo+ICAgICAgc2VydmljZSBv
ciB1bnNwZWNpZmllZCBvdGhlciBpbXBhY3QgdmlhIGEgY3JhZnRlZCBUQVIgYXJjaGl2ZSB0aGF0
IGlzIHJlYWQKPiAgICAgIHdpdGggYSB2ZXJib3NlIHZhbHVlIG9mIDIuCj4gICAgICBGb3IgZXhh
bXBsZSwgdGhlIDEwMC1ieXRlIGJ1ZmZlciBtYXkgbm90IGJlIHN1ZmZpY2llbnQgZm9yIGEgY3Vz
dG9tIGxvY2FsZS4KPgo+IEZvciBtb3JlIGluZm9ybWF0aW9uLCBzZWU6Cj4gICAgLSBodHRwczov
L252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNS0yNTcyNAo+ICAgIC0gaHR0cHM6Ly9n
aXRodWIuY29tL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9jb21taXQvYzliYzkzNGU3ZTkxZDMwMmUw
ZmVjYTZlNzEzY2NjMzhkNmQwMTUzMgo+Cj4gVGhlIHBhdGNoIGFkZGVkIGluIFsxXSBhcmUgc3Rp
bGwgbmVlZGVkIGZvciB0aGlzIHZlcnNpb24gYnVtcC4KPgo+IEZvciBtb3JlIGRldGFpbHMgb24g
dGhlIHZlcnNpb24gYnVtcCwgc2VlIHRoZSByZWxlYXNlIG5vdGVzOgo+ICAgIC0gaHR0cHM6Ly9n
aXRodWIuY29tL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9yZWxlYXNlcy90YWcvdjMuNy44Cj4gICAg
LSBodHRwczovL2dpdGh1Yi5jb20vbGliYXJjaGl2ZS9saWJhcmNoaXZlL3JlbGVhc2VzL3RhZy92
My43LjkKPgo+IFsxXSA5YWM2M2EzMzYwIHBhY2thZ2UvbGliYXJjaGl2ZTogZml4IHVjbGliYyBi
dWlsZCB3aXRoIGxpYmljb252IChhZ2FpbikKPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJh
bGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4KCiDCoEFwcGxpZWQgdG/CoDIwMjUuMDIueCwgMjAy
NC4xMS54IGFuZCAyMDI0LjAyLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAt
LS0KPiAgIHBhY2thZ2UvbGliYXJjaGl2ZS9saWJhcmNoaXZlLmhhc2ggfCAyICstCj4gICBwYWNr
YWdlL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS5tayAgIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9saWJhcmNoaXZlL2xpYmFyY2hpdmUuaGFzaCBiL3BhY2thZ2UvbGliYXJjaGl2ZS9saWJhcmNo
aXZlLmhhc2gKPiBpbmRleCBjMGIwNGIwZjRiLi5kMTMyNjY0ZTE3IDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvbGliYXJjaGl2ZS9saWJhcmNoaXZlLmhhc2gKPiArKysgYi9wYWNrYWdlL2xpYmFyY2hp
dmUvbGliYXJjaGl2ZS5oYXNoCj4gQEAgLTEsNCArMSw0IEBACj4gICAjIEZyb20gaHR0cHM6Ly93
d3cubGliYXJjaGl2ZS5kZS9kb3dubG9hZHMvc2hhMjU2c3Vtcwo+IC1zaGEyNTYgIDg3OWFjZDgz
YzMzOTljN2NhYWVlNzNmZTVmNzQxOGUwNjA4N2FiMmFhZjQwYWYzZTk5YjllMjliZWIyOWZhZWUg
IGxpYmFyY2hpdmUtMy43LjcudGFyLnh6Cj4gK3NoYTI1NiAgZWQ4YjU3MzJlNGNkNmUzMGZhZTkw
OWZiOTQ1Y2FkOGZmOWNiN2JlNWM2Y2RhYTM5NDRlYzk2ZTRhMjAwYzA0YyAgbGliYXJjaGl2ZS0z
LjcuOS50YXIueHoKPiAgICMgTG9jYWxseSBjb21wdXRlZDoKPiAgIHNoYTI1NiAgYjJjZGY3NjMz
NDVkZTJkZTM0Y2ViZjU0Mzk0ZGYzYzYxYTEwNWMzYjcxMjg4NjAzYzI1MWYyZmE2MzgyMDBiYSAg
Q09QWUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS5tayBi
L3BhY2thZ2UvbGliYXJjaGl2ZS9saWJhcmNoaXZlLm1rCj4gaW5kZXggNzAxMjNlZTJiMS4uN2Zl
YzAxYTA0MCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS5tawo+
ICsrKyBiL3BhY2thZ2UvbGliYXJjaGl2ZS9saWJhcmNoaXZlLm1rCj4gQEAgLTQsNyArNCw3IEBA
Cj4gICAjCj4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAgCj4gLUxJQkFSQ0hJVkVfVkVS
U0lPTiA9IDMuNy43Cj4gK0xJQkFSQ0hJVkVfVkVSU0lPTiA9IDMuNy45Cj4gICBMSUJBUkNISVZF
X1NPVVJDRSA9IGxpYmFyY2hpdmUtJChMSUJBUkNISVZFX1ZFUlNJT04pLnRhci54ego+ICAgTElC
QVJDSElWRV9TSVRFID0gaHR0cHM6Ly93d3cubGliYXJjaGl2ZS5kZS9kb3dubG9hZHMKPiAgIExJ
QkFSQ0hJVkVfSU5TVEFMTF9TVEFHSU5HID0gWUVTCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
