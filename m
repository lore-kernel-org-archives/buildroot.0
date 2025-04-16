Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762B8C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25E2D61126;
	Wed, 16 Apr 2025 21:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Yj87h5aXMep; Wed, 16 Apr 2025 21:25:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 887CB6F804
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 887CB6F804;
	Wed, 16 Apr 2025 21:25:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 630D4159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 258BB60EAC
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMTZwD59cGUS for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:24:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D48CF60765
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D48CF60765
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D48CF60765
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:24:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E7DE91C0083; Wed, 16 Apr 2025 23:24:55 +0200 (CEST)
Message-ID: <bfec3a5e-3540-41f8-81af-228f4d27bfaf@rnout.be>
Date: Wed, 16 Apr 2025 23:24:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250401215435.60567-1-christian@aperture.us>
Content-Language: en-GB
In-Reply-To: <20250401215435.60567-1-christian@aperture.us>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+cu9B111OVKdAI5GiaCGetMTeTj+n7UG7/DcEhM9Ys0=;
 b=GkcplhkcbR3XYZzmTa8AA9psWYl+uO5gY/gEUWwUY0EtDE4kVVnO2Xyg5D5aP9fA69ukoD
 yNTYq2812bTHit2RkdwMjjW5PIXM2fyODe6BT3p7MMMsozkB+gaPibUxrPaJ+qaryAD0Jg
 PYQCrHnDk5cG6R7bc0J9CrPh0V5aDt+urWlq0po2cvwM2cDD7nGIv0oaDeUJ5sqBReF8Xx
 QqUA5iCSwwfmbwNV8YLtDAYrVALyJLv+nJi7agKJgaZn+9J/7yz+GzYtwZdwVaTn+DdKhF
 sMyBDk9djQLEYGxv5QP26qtHG2p0uuIwo3Nn572eQCS5F6j9wtFmM6YawlmjvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump to version
 1.23.8
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

Ck9uIDAxLzA0LzIwMjUgMjM6NTQsIENocmlzdGlhbiBTdGV3YXJ0IHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4gZ28xLjIzLjggKHJlbGVhc2VkIDIwMjUtMDQtMDEpIGluY2x1ZGVzIHNlY3VyaXR5IGZp
eGVzIHRvIHRoZSBuZXQvaHR0cCBwYWNrYWdlLAo+IGFzIHdlbGwgYXMgYnVnIGZpeGVzIHRvIHRo
ZSBydW50aW1lIGFuZCB0aGUgZ28gY29tbWFuZC4KPgo+IGh0dHBzOi8vZ28uZGV2L2RvYy9kZXZl
bC9yZWxlYXNlI2dvMS4yMy44Cj4gaHR0cHM6Ly9naXRodWIuY29tL2dvbGFuZy9nby9pc3N1ZXM/
cT1taWxlc3RvbmUlM0FHbzEuMjMuOCtsYWJlbCUzQUNoZXJyeVBpY2tBcHByb3ZlZAo+Cj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4KCiDC
oEFwcGxpZWQgdG8gMjAyNS4wMi54LCB0aGFua3MuCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCj4g
LS0tCj4gICBwYWNrYWdlL2dvL2dvLmhhc2ggfCAxNCArKysrKysrLS0tLS0tLQo+ICAgcGFja2Fn
ZS9nby9nby5tayAgIHwgIDIgKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ28vZ28uaGFzaCBiL3Bh
Y2thZ2UvZ28vZ28uaGFzaAo+IGluZGV4IDhiOTU0MTY0MmQuLjQ4YmE2YjdmZDkgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9nby9nby5oYXNoCj4gKysrIGIvcGFja2FnZS9nby9nby5oYXNoCj4gQEAg
LTEsOSArMSw5IEBACj4gICAjIHNoYTI1NiBjaGVja3N1bSBmcm9tIGh0dHBzOi8vZ28uZGV2L2Rs
Lwo+IC1zaGEyNTYgIDdjZmFiZDQ2YjczZWI0YzI2YjE5ZDY5NTE1ZGQwNDNkNzE4M2E2NTU5YWNj
Y2Q1Y2ZkYjI1ZWI2YjI2NmE0NTggIGdvMS4yMy43LnNyYy50YXIuZ3oKPiAtc2hhMjU2ICA5MTE1
ZjdkNzUxZWZlNWIxN2I2M2E3NjMwZDI0Y2QwYTI0Nzk5NzY0NjVlZWNiMjc3YjVkZWVjOGFhMGY0
MTQzICBnbzEuMjMuNy5saW51eC0zODYudGFyLmd6Cj4gLXNoYTI1NiAgNDc0MTUyNWU2OTg0MWYy
ZTIyZjk5OTJhZjI1ZGYwYzExMTJiMDc1MDFmNjFmNzQxYzEyYzYzODlmY2IxMTlmMyAgZ28xLjIz
LjcubGludXgtYW1kNjQudGFyLmd6Cj4gLXNoYTI1NiAgNTk3YWNiZDA1MDUyNTBkNGQ5OGM0Yzgz
YWRmMjAxNTYyYThjODEyY2JjZDdiMzQxNjg5YTA3MDg3YTg3YTU0MSAgZ28xLjIzLjcubGludXgt
YXJtNjQudGFyLmd6Cj4gLXNoYTI1NiAgYzllOWVjZDZhOGNmMTQyOWYxYzY1ZDgxMTE1YzQ1MDI1
ODI1OGFjNjU4MzNkOTVhODJkNWY0ZTVhZDdkMmQ3YSAgZ28xLjIzLjcubGludXgtYXJtdjZsLnRh
ci5nego+IC1zaGEyNTYgIDNmZmMzMTBiZmQxMWZkMGJjYzcxM2E3NjRhMGY3MjUyYzRkNTJkMDNm
MTJhYmViZmFlYmFhYWU3N2UwMjcwMjggIGdvMS4yMy43LmxpbnV4LXBwYzY0bGUudGFyLmd6Cj4g
LXNoYTI1NiAgYWYxZDRjNWQwMWUzMmMyY2Y2ZTNjYzAwZTQ0Y2IyNDBlMWE2Y2VmNTM5YjI4YTY0
Mzg5YjJiOWNhMjg0YWM2YyAgZ28xLjIzLjcubGludXgtczM5MHgudGFyLmd6Cj4gK3NoYTI1NiAg
MGNhMWYxZTM3ZWEyNTVlM2NlMjgzYWYzZjRlNjI4NTAyZmI0NDQ1ODdkYTk4N2E1YmI5NmQ2YzZm
MTU5MzBkNCAgZ28xLjIzLjguc3JjLnRhci5nego+ICtzaGEyNTYgIDcxNGI5ZDAwNDA2M2JmYTI3
Njg2ZjlmZjBlNTY0OGJiMTkwYjNhNWJjMWU4NmIwYWExNmMxMzRkOGQ4YzMxNWYgIGdvMS4yMy44
LmxpbnV4LTM4Ni50YXIuZ3oKPiArc2hhMjU2ICA0NWI4NzM4MTE3MmE1OGQ2MmM5NzdmMjdjNDY4
M2M4NjgxZWYzNjU4MGFiZWNkMTRmZDEyNGQyNGNhMzA2ZDNmICBnbzEuMjMuOC5saW51eC1hbWQ2
NC50YXIuZ3oKPiArc2hhMjU2ICA5ZDZkOTM4NDIyNzI0YTk1NDgzMmQ2ZjgwNmQzOTdjZjg1Y2Nm
ZGU4YzU4MWMyMDE2NzNlNTBlNjM0ZmRjOTkyICBnbzEuMjMuOC5saW51eC1hcm02NC50YXIuZ3oK
PiArc2hhMjU2ICBkMTRlMGJlYTlmYjI1MzQ0YTA0NjBmMzk1ODgwZDU1ODliYmNkNDEzZmZkNTU1
NWJlNDhlNDZjMGRlMDg0NDM3ICBnbzEuMjMuOC5saW51eC1hcm12NmwudGFyLmd6Cj4gK3NoYTI1
NiAgMGNhZGFiNDY5ZTYxMmIxNTlmNWY2OGIxYTMwZDc1YWE3YjdlMWVkNTI5Mjc0NjAwNWE2YTNj
OGZmMDRlNmYzNSAgZ28xLjIzLjgubGludXgtcHBjNjRsZS50YXIuZ3oKPiArc2hhMjU2ICBjYmU5
NTRlZTUzNGViMDJhYTc4MjYzOTcxNmQ4YzI1NzA2ZGQxNzE0NDVmN2M4MzM2YmQyZmMwYjhmNmZl
MzhlICBnbzEuMjMuOC5saW51eC1zMzkweC50YXIuZ3oKPiAgIHNoYTI1NiAgMmQzNjU5N2Y3MTE3
YzM4YjAwNjgzNWFlN2Y1Mzc0ODcyMDdkOGVjNDA3YWE5ZDk5ODA3OTRiMjAzMGNiYzA2NyAgTElD
RU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dvL2dvLm1rIGIvcGFja2FnZS9nby9nby5tawo+
IGluZGV4IGRhMzgwNDgzZWYuLmQ2MThhN2EyNjIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9nby9n
by5tawo+ICsrKyBiL3BhY2thZ2UvZ28vZ28ubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgICMKPiAg
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtR09fVkVSU0lPTiA9IDEuMjMuNwo+ICtH
T19WRVJTSU9OID0gMS4yMy44Cj4gICAKPiAgIEhPU1RfR09fR09QQVRIID0gJChIT1NUX0RJUikv
c2hhcmUvZ28tcGF0aAo+ICAgSE9TVF9HT19IT1NUX0NBQ0hFID0gJChIT1NUX0RJUikvc2hhcmUv
aG9zdC1nby1jYWNoZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
