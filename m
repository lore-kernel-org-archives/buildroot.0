Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E610C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD9776F730;
	Wed, 16 Apr 2025 20:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gPp2Uj7Oecw; Wed, 16 Apr 2025 20:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E6896F5C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E6896F5C8;
	Wed, 16 Apr 2025 20:58:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15FF1920
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 074646F52D
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3K9OcFHkmbuO for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:58:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A8F660EAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A8F660EAC
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A8F660EAC
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:58:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2D6EC1C1032; Wed, 16 Apr 2025 22:58:45 +0200 (CEST)
Message-ID: <6f7b7e35-4f44-4525-ac12-fd5b963972c1@rnout.be>
Date: Wed, 16 Apr 2025 22:58:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250317214602.3050196-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20250317214602.3050196-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837125; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tEzpT6rMvhuy0VAaX7yahSTcN8VSOeH4KpVw9Rbnr8g=;
 b=irTkAwfHB5CZL32s0vSx4l90ZGbEOliuiEzgGR+zCivFeF0IreG91/ncXqQPhK/Xrd1Js/
 6QgvypO6fl+hHcB/8rXFpyB4jZ7XEm0sVS/RTArz6dYOi8lvDq4gTcysNPujmFLW2srQKs
 JFBE+jkSLtwy8iGiXLQEMAzahZbNYnBWmbAuW/334uTlgvJnV0MRlEs2ELE924hiEUJLf6
 fNqSq1QBjZcjdDLqtppje/vkShEDt9IVF4dECFJzgHrCtjRV6rJCiwmtluzbAxwrWdWQx/
 Oeu7v7DX17j1JELwDjYzXSaJUEBGoC7zXTI2aArWkVfvvh3eCud39E6NwE+4kQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.11.14
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

Ck9uIDE3LzAzLzIwMjUgMjI6NDYsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+IFNpZ25lZC1vZmYt
Ynk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKIMKgQXBwbGll
ZCB0byAyMDI1LjAyLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0KPiAg
IHBhY2thZ2UvcHl0aG9uLWFpb2h0dHAvcHl0aG9uLWFpb2h0dHAuaGFzaCB8IDQgKystLQo+ICAg
cGFja2FnZS9weXRob24tYWlvaHR0cC9weXRob24tYWlvaHR0cC5tayAgIHwgNCArKy0tCj4gICAy
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL3B5dGhvbi1haW9odHRwL3B5dGhvbi1haW9odHRwLmhhc2ggYi9wYWNr
YWdlL3B5dGhvbi1haW9odHRwL3B5dGhvbi1haW9odHRwLmhhc2gKPiBpbmRleCAwYWEyMmU5ZmEz
Li5hYzEyY2FmZWVhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWFpb2h0dHAvcHl0aG9u
LWFpb2h0dHAuaGFzaAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWFpb2h0dHAvcHl0aG9uLWFpb2h0
dHAuaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAgIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8v
cHlwaS5vcmcvcHlwaS9haW9odHRwL2pzb24KPiAtbWQ1ICAxN2YwNGI2MDA2ODEyMmU5OThhNjBh
MzAxMDY3OTUwMSAgYWlvaHR0cC0zLjExLjExLnRhci5nego+IC1zaGEyNTYgIGJiNDljN2YxZTZl
YmYzODIxYTQyZDgxZDQ5NGY1MzgxMDc2MTBjM2E3MDU5ODdmNTMwNjg1NDZiMGU5MDMwM2UgIGFp
b2h0dHAtMy4xMS4xMS50YXIuZ3oKPiArbWQ1ICA3ODM1ZjI4ZTQxYWRmNmYwOTQ2NzUzM2U4ZGUw
YzE5OSAgYWlvaHR0cC0zLjExLjE0LnRhci5nego+ICtzaGEyNTYgIGQ2ZWRjNTM4Yzc0ODBmYTBh
M2IyYmRkNzA1ZjgwMTAwNjJkNzQ3MDAxOThkYTU1ZDE2NDk4ZTFiNDk1NDliOWMgIGFpb2h0dHAt
My4xMS4xNC50YXIuZ3oKPiAgICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4g
ICBzaGEyNTYgIDlmODBkMGRiN2Q3NTVhOTQxZGI0NTcyMTcyYzI3MGVjYmQ4ZjA4MmJhMjE1ZGRk
MDk1OTg1OTQyZWQ5NGE5ZWIgIExJQ0VOU0UudHh0Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0
aG9uLWFpb2h0dHAvcHl0aG9uLWFpb2h0dHAubWsgYi9wYWNrYWdlL3B5dGhvbi1haW9odHRwL3B5
dGhvbi1haW9odHRwLm1rCj4gaW5kZXggMTllNjI3NDVlMC4uZDNlN2QxMmViNiAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL3B5dGhvbi1haW9odHRwL3B5dGhvbi1haW9odHRwLm1rCj4gKysrIGIvcGFj
a2FnZS9weXRob24tYWlvaHR0cC9weXRob24tYWlvaHR0cC5tawo+IEBAIC00LDkgKzQsOSBAQAo+
ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgIAo+IC1QWVRIT05fQUlPSFRUUF9W
RVJTSU9OID0gMy4xMS4xMQo+ICtQWVRIT05fQUlPSFRUUF9WRVJTSU9OID0gMy4xMS4xNAo+ICAg
UFlUSE9OX0FJT0hUVFBfU09VUkNFID0gYWlvaHR0cC0kKFBZVEhPTl9BSU9IVFRQX1ZFUlNJT04p
LnRhci5nego+IC1QWVRIT05fQUlPSFRUUF9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0
ZWQub3JnL3BhY2thZ2VzL2ZlL2VkL2YyNmRiMzlkMjljZDNjYjJmNWEzMzc0MzA0YzcxM2ZlNWFi
NWEwZTRjOGVlMjVhMGM0NWNjNmFkZjg0NAo+ICtQWVRIT05fQUlPSFRUUF9TSVRFID0gaHR0cHM6
Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzZjLzk2LzkxZTkzYWU1ZmQwNGQ0Mjhj
MTAxY2RiYWJjZTZjODIwZDI4NGQ2MWQyNjE0ZDAwNTE4ZjRmYTUyZWEyNAo+ICAgUFlUSE9OX0FJ
T0hUVFBfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiAgIFBZVEhPTl9BSU9IVFRQX0xJQ0VOU0Ug
PSBBcGFjaGUtMi4wCj4gICBQWVRIT05fQUlPSFRUUF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50
eHQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
