Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C02C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B457D6065D;
	Wed, 16 Apr 2025 20:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zkRXTxdInnUn; Wed, 16 Apr 2025 20:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1079D606B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1079D606B8;
	Wed, 16 Apr 2025 20:58:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB243159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B013B617A6
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xE3JaRP0SVbT for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:58:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D5F6E60D76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5F6E60D76
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5F6E60D76
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:58:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BCEA41C1026; Wed, 16 Apr 2025 22:58:25 +0200 (CEST)
Message-ID: <cb4e140f-106a-4539-a076-6b9b056bdbbf@rnout.be>
Date: Wed, 16 Apr 2025 22:58:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250217120002.1887681-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20250217120002.1887681-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837106; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=YIPlR2XPDCb7pyeVqA6l/iO/J9xYWuiI0k3snxfoLUE=;
 b=kATTPeRuraQoSpiVTxKdj2Iq5T+VP++NaXT+OyGi5gCJ/6RydWE/tlMr75/wYQJ92AOy1G
 ghdxz9SKWoCgy0yCO3NZVtuqjNXmfKCmbT1RjtzlU2wx212Si3JSeFFL0NAt3n1XsiATSS
 AhSpXdPlQNm1eTemz7qsLLJbZ9pcVP3VVhMIHwjxxoUwLV6BUscYsWf1h4Cdk3Ex7fDr9d
 /hBTwqOzhRGZczm1V1D32FulWHYDzIBeioCHp0kLLuODFT3V5mymMpVh0RzIDM4ZLu0dg0
 L+p3oi9Vvo6RtaMZ6nGsn8fwF9TkWQB4TyaXsskxhauG/YQSngrcMI3p3sFR7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.11.12
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

Ck9uIDE3LzAyLzIwMjUgMTM6MDAsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+IFNpZ25lZC1vZmYt
Ynk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKIMKgQXBwbGll
ZCB0byAyMDI1LjAyLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0KPiAg
IHBhY2thZ2UvcHl0aG9uLWFpb2h0dHAvcHl0aG9uLWFpb2h0dHAuaGFzaCB8IDQgKystLQo+ICAg
cGFja2FnZS9weXRob24tYWlvaHR0cC9weXRob24tYWlvaHR0cC5tayAgIHwgNCArKy0tCj4gICAy
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL3B5dGhvbi1haW9odHRwL3B5dGhvbi1haW9odHRwLmhhc2ggYi9wYWNr
YWdlL3B5dGhvbi1haW9odHRwL3B5dGhvbi1haW9odHRwLmhhc2gKPiBpbmRleCAwYWEyMmU5ZmEz
Li5hOTllMjFkMTRjIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWFpb2h0dHAvcHl0aG9u
LWFpb2h0dHAuaGFzaAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWFpb2h0dHAvcHl0aG9uLWFpb2h0
dHAuaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAgIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8v
cHlwaS5vcmcvcHlwaS9haW9odHRwL2pzb24KPiAtbWQ1ICAxN2YwNGI2MDA2ODEyMmU5OThhNjBh
MzAxMDY3OTUwMSAgYWlvaHR0cC0zLjExLjExLnRhci5nego+IC1zaGEyNTYgIGJiNDljN2YxZTZl
YmYzODIxYTQyZDgxZDQ5NGY1MzgxMDc2MTBjM2E3MDU5ODdmNTMwNjg1NDZiMGU5MDMwM2UgIGFp
b2h0dHAtMy4xMS4xMS50YXIuZ3oKPiArbWQ1ICBlZmU3ODQ2N2RmYjBiNTU5Y2I0NzI1NTU0YjFm
YjUzYSAgYWlvaHR0cC0zLjExLjEyLnRhci5nego+ICtzaGEyNTYgIDc2MDNjYTI2ZDc1YjFiODYx
NjBjZTFiYmUyNzg3YTBiNzA2ZTU5MmFmNWIyNTA0ZTEyY2FhODhhMjE3NzY3YjAgIGFpb2h0dHAt
My4xMS4xMi50YXIuZ3oKPiAgICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4g
ICBzaGEyNTYgIDlmODBkMGRiN2Q3NTVhOTQxZGI0NTcyMTcyYzI3MGVjYmQ4ZjA4MmJhMjE1ZGRk
MDk1OTg1OTQyZWQ5NGE5ZWIgIExJQ0VOU0UudHh0Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0
aG9uLWFpb2h0dHAvcHl0aG9uLWFpb2h0dHAubWsgYi9wYWNrYWdlL3B5dGhvbi1haW9odHRwL3B5
dGhvbi1haW9odHRwLm1rCj4gaW5kZXggMTllNjI3NDVlMC4uNWU0MzYzMjFiOSAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL3B5dGhvbi1haW9odHRwL3B5dGhvbi1haW9odHRwLm1rCj4gKysrIGIvcGFj
a2FnZS9weXRob24tYWlvaHR0cC9weXRob24tYWlvaHR0cC5tawo+IEBAIC00LDkgKzQsOSBAQAo+
ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgIAo+IC1QWVRIT05fQUlPSFRUUF9W
RVJTSU9OID0gMy4xMS4xMQo+ICtQWVRIT05fQUlPSFRUUF9WRVJTSU9OID0gMy4xMS4xMgo+ICAg
UFlUSE9OX0FJT0hUVFBfU09VUkNFID0gYWlvaHR0cC0kKFBZVEhPTl9BSU9IVFRQX1ZFUlNJT04p
LnRhci5nego+IC1QWVRIT05fQUlPSFRUUF9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0
ZWQub3JnL3BhY2thZ2VzL2ZlL2VkL2YyNmRiMzlkMjljZDNjYjJmNWEzMzc0MzA0YzcxM2ZlNWFi
NWEwZTRjOGVlMjVhMGM0NWNjNmFkZjg0NAo+ICtQWVRIT05fQUlPSFRUUF9TSVRFID0gaHR0cHM6
Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzM3LzRiLzk1MmQ0OWM3MzA4NGZiNzkw
Y2I1YzZlYWQ1MDg0OGM4ZTk2YjQ5ODBhZDgwNmNmNGQyYWQzNDFlYWEwMwo+ICAgUFlUSE9OX0FJ
T0hUVFBfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiAgIFBZVEhPTl9BSU9IVFRQX0xJQ0VOU0Ug
PSBBcGFjaGUtMi4wCj4gICBQWVRIT05fQUlPSFRUUF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50
eHQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
