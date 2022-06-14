Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5590EC43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 20:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9DCD4187D;
	Tue, 14 Jun 2022 20:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EQVj3JcygGZs; Tue, 14 Jun 2022 20:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9937E4184E;
	Tue, 14 Jun 2022 20:21:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EF7C1BF5B3
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 20:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D51940AA0
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 20:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id shqX1Nu29agL for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 20:21:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BFAB40A9B
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 20:21:41 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u8so12667931wrm.13
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 13:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=EWwzuxE+SWzhWIib1hzvXUGWCXmJcHPQELO98IpE5Cw=;
 b=VZpIQqKp/EMatZgmM1PVZOB7c762tJo9t9e86iQPHJh9m1p15Jt/abayf55aKx5RhK
 D8fUh2I7wUxc+PgxIMZJU4bJhsOiKU1q0HznVk+LbEED73qT9uIKnHW8ymYDdSigpnqj
 2fbtgjRgGFrz/5omU9zBJptimwXtJ2xi3bczS6zfQAy+EZYMhvkKIXlAyQvKckPBPR+f
 DN6FzdxxQBqOjBmeNi9w6h4tG9IS0CvNTpzS1j8U5t2i3p9iU6BcHPUbqZ/x7tXVC+eW
 eZkWifE+TAmSbC1gGuRp9amJ5bj6QQ/zjzEhCg+KJfVbBbVuCKj6TBMqE8Enx9WOOsFu
 fIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EWwzuxE+SWzhWIib1hzvXUGWCXmJcHPQELO98IpE5Cw=;
 b=YYn3jQGDmOLwpIMZDulUIM2BkablJpIlP9RaDsD62VppH/1ui7T5/zDwDxCo0ofv8K
 /vAxd+xabYvujHP0H/hLEvSJCJAGxMHrpM26o1xLEgbVkgGVAHOgc+82DP/JyVTCJ4+m
 YdwpckmsS2mVW42XnWHuCWczbGCn5WeXrE4qAS+aYqSZiqjdAk1m7sGZ69MJf/Qb825L
 nqum3pnNmOIx9r8Ur8JTCqXgA27YgfJlQXgwMr6pf6YwhN9ZdOcloO89iinwLDuZ3cFd
 jjoRurmwNDBhDS5Gphm1U1Ah4Al8vA58p/ZAc7pfF3nPkDvRvTTyhT3HnAvGzDXhjHHr
 3RuA==
X-Gm-Message-State: AJIora8v17vB4O0VtabTP8dEXR6iE/+eW1t7TJtgd4FEqJl4nKiUXvaS
 Q4WXwXkmZZ/wZU5XcQwGahQ=
X-Google-Smtp-Source: AGRyM1uUmirvqqO7lztPaBkL13DSL4elNHwya3EWvs8aICYIF/Jf5uQBaJcubbxcDO2UYl19RlgaSg==
X-Received: by 2002:a5d:6daa:0:b0:216:ffb6:df1f with SMTP id
 u10-20020a5d6daa000000b00216ffb6df1fmr6560281wrs.659.1655238100142; 
 Tue, 14 Jun 2022 13:21:40 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a5d618d000000b002167efdd549sm718521wru.38.2022.06.14.13.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 13:21:39 -0700 (PDT)
Message-ID: <2fbf3a91-4155-055d-7c5c-e1a56b68c6d1@gmail.com>
Date: Tue, 14 Jun 2022 22:21:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20220611170118.1055111-1-romain.naour@gmail.com>
 <e5057a67-610d-993f-6d67-6a4ec4ebae68@mind.be>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <e5057a67-610d-993f-6d67-6a4ec4ebae68@mind.be>
Subject: Re: [Buildroot] [PATCH] package/minetest{-game}: bump to version
 5.5.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXJub3V0LAoKTGUgMTQvMDYvMjAyMiDDoCAyMDo0NywgQXJub3V0IFZhbmRlY2FwcGVsbGUgYSDD
qWNyaXTCoDoKPiAKPiAKPiBPbiAxMS8wNi8yMDIyIDE5OjAxLCBSb21haW4gTmFvdXIgd3JvdGU6
Cj4+IFJlbGVhc2UgYW5ub3VuY2VtZW50Ogo+PiA1LjUuMDogaHR0cHM6Ly9mb3J1bS5taW5ldGVz
dC5uZXQvdmlld3RvcGljLnBocD9mPTE4JnQ9Mjc3NTQKPj4gNS4xLjE6IGh0dHBzOi8vZm9ydW0u
bWluZXRlc3QubmV0L3ZpZXd0b3BpYy5waHA/cD00MTAzNDQjcDQxMDM0NAo+Pgo+PiBCYWNrIGlu
IDIwMjEsIHRoZSBtaW5ldGVzdCBwcm9qZWN0IGZvcmtlZCB0aGUgaXJybGljaHQgbGlicmFyeSBk
dWUgdG8KPj4gbGFjayBvZiB1cHN0cmVhbSByZWxlYXNlIFsxXS4gQnV0IHRoZSBpcnJsaWNodCB1
cHN0cmVhbSBwcm9qZWN0IGlzIG5vdAo+PiByZWFsbHkgaGFsdGVkIHNpbmNlIGEgc3RhYmxlIDEu
OC41IHZlcnNpb24gaGFzIGJlZW4gcmVsZWFzZWQgWzJdIGFuZAo+PiB0aGVyZSBpcyBzdGlsbCBz
dm4gYWN0aXZpdHkuCj4+Cj4+IEJ1dCB0aGUgTWludGVzdCBmb3JrIChjYWxsZWQgaXJybGljaHRN
dCkgaXMgYXR0cmFjdGl2ZSBzaW5jZToKPj4gwqDCoCAtIEl0IHVzZSBhIENNYWtlIGJ1aWxkIHN5
c3RlbSBpbnN0ZWFkIG9mIGhhbmQgd3JpdHRlbiBtYWtlZmlsZXMgWzNdCj4+IMKgwqAgLSBCdW5k
bGVkIGxpYnJhcmllcyBoYXMgYmVlbiByZW1vdmVkIFs0XSBbNV0KPj4gwqDCoCAtIEl0IGFsbG93
cyB0byByZW1vdmUgdGhlIE5FT04gc3VwcG9ydCB3b3JrYXJvdW5kIGZvciBidW5kbGVkIGxpYnBu
Zwo+PiDCoMKgIC0gSXQgdXNlIGdpdCBhcyBWQ1MKPj4gwqDCoCAtIEltcHJvdmUgdGhlIGxpY2Vu
c2luZyBpbmZvcm1hdGlvbgo+Pgo+PiBUaGlzIGlycmxpY2h0bXQgaXMgcmVxdWlyZWQgc2luY2Ug
bWludGVzdCA1LjUuMCB2ZXJzaW9uIGJ1dCBjb250YWlucwo+PiBzZXZlcmFsIGNoYW5nZXMgc3Bl
Y2lmaWMgdG8gTWluZXRlc3QsIHNvIGFkZCBpcnJsaWNodG10IGFzIGFkZGl0aW9uYWwKPj4gc291
cmNlcyB1c2luZyBFWFRSQV9ET1dOTE9BRFMuCj4+Cj4+IG1pbmV0ZXN0Ogo+PiAtIEFkZCB6c3Rk
IGRlcGVuZGVuY3kgZm9yIE1hcEJsb2NrIGNvbXByZXNzaW9uIFs2XQo+PiAtIEZyZWV0eXBlIGlz
IG5vdyBhIGJ1aWxkIHJlcXVpcmVtZW50IGZvciBtaW50ZXN0IGNsaWVudCBbN10KPj4gLSBnY2Mg
Pj0gNS54IGlzIG5vdyByZXF1aXJlZCBbOF0KPj4gLSByZW1vdmUgdXBzdHJlYW0gcGF0Y2ggWzld
Cj4+Cj4+IG1pbmV0ZXN0LWdhbWU6Cj4+IC0gQWRkIG5ldyBsaWNlbnNlIGZpbGVzOgo+PiDCoMKg
wqDCoCBtb2RzL2tleXMvbGljZW5zZS50eHQKPj4gwqDCoMKgwqAgbW9kcy9tdGdfY3JhZnRndWlk
ZS9saWNlbnNlLnR4dAo+PiDCoMKgwqDCoCBtb2RzL3dlYXRoZXIvbGljZW5zZS50eHQKPj4KPj4g
WzFdIGh0dHBzOi8vZm9ydW0ubWluZXRlc3QubmV0L3ZpZXd0b3BpYy5waHA/cD0zOTM1NjUKPj4g
WzJdIGh0dHBzOi8vaXJybGljaHQuc291cmNlZm9yZ2UuaW8vZm9ydW0vdmlld3RvcGljLnBocD9m
PTImdD01Mjc3NQo+PiBbM10KPj4gaHR0cHM6Ly9naXRodWIuY29tL21pbmV0ZXN0L2lycmxpY2h0
L2NvbW1pdC82Y2U5OGRjZTc3ODljOTZkZGVkMDBmYWJmZTQwOTM1NmY5NTRlZGZlCj4+Cj4+IFs0
XQo+PiBodHRwczovL2dpdGh1Yi5jb20vbWluZXRlc3QvaXJybGljaHQvY29tbWl0LzY3ZjE0MDI0
MTBhNWI5MGYxMWMyYTJiZDY5YmE1ZDczZWI2ZTk0M2EKPj4KPj4gWzVdCj4+IGh0dHBzOi8vZ2l0
aHViLmNvbS9taW5ldGVzdC9pcnJsaWNodC9jb21taXQvMjY0ZjhiNzJjMWRjZTdjMjA5YWM4ZGFh
ZjA0ODRhYTNhZjc3NDBiNwo+Pgo+PiBbNl0KPj4gaHR0cHM6Ly9naXRodWIuY29tL21pbmV0ZXN0
L21pbmV0ZXN0L2NvbW1pdC9kMTYyNGE1NTIxNTFiY2IxNTJiN2FiZjYzZGY2NTAxYjYzNDU4ZDc4
Cj4+Cj4+IFs3XQo+PiBodHRwczovL2dpdGh1Yi5jb20vbWluZXRlc3QvbWluZXRlc3QvY29tbWl0
Lzc2ZGJkMGQyZDA0NzEyZGNhZDRmN2M2YWZlY2I5N2ZhOGQ2NjJkNmQKPj4KPj4gWzhdCj4+IGh0
dHBzOi8vZ2l0aHViLmNvbS9taW5ldGVzdC9taW5ldGVzdC9jb21taXQvYTkwYjJhNGQ0ZjM4ZTky
YjQwMTZkOWFjODZlMDAxMzk4YmU3MjllNwo+Pgo+PiBbOV0KPj4gaHR0cHM6Ly9naXRodWIuY29t
L21pbmV0ZXN0L21pbmV0ZXN0L2NvbW1pdC83YzI4MjZjYmMwZjM2MDI3ZDRhOTc4MWY0MzMxNTBk
MWM1ZDBkMDNmCj4+Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5h
b3VyQGdtYWlsLmNvbT4KPiAKPiDCoEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCj4gCj4gW3Nu
aXBdCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21pbmV0ZXN0L21pbmV0ZXN0Lmhhc2ggYi9wYWNr
YWdlL21pbmV0ZXN0L21pbmV0ZXN0Lmhhc2gKPj4gaW5kZXggN2ViNTdjYjJhOS4uZTc4Zjg2NTk2
OSAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9taW5ldGVzdC9taW5ldGVzdC5oYXNoCj4+ICsrKyBi
L3BhY2thZ2UvbWluZXRlc3QvbWluZXRlc3QuaGFzaAo+PiBAQCAtMSw0ICsxLDYgQEAKPj4gwqAg
IyBMb2NhbGx5IGNhbGN1bGF0ZWQKPj4gLXNoYTI1NsKgIGRlOWU0NDEwNTgzYzg0NWMxMDRiNGJl
MjVmOWQwYjg3NDNkODU3M2MxMjAxNDliODkxMGFlMjUxOWY5YWIxNGXCoAo+PiBtaW5ldGVzdC01
LjQuMS50YXIuZ3oKPj4gK3NoYTI1NsKgIGRjMGFlNTE4OGVmMzUxZGI4NWMzOGIyN2YzOGY4NTQ5
YjEzM2VkODJhYTQ2ZGFlYTZkZWVlMTQ4YWEzNDU0ZjTCoAo+PiBtaW5ldGVzdC01LjUuMS50YXIu
Z3oKPj4gK3NoYTI1NsKgIDZkMzhkZDdmM2UzYzhkNzY4ZTFmNTc3NmI5OGRkNTM1OWIxODRjMmU2
NzQwZGRmNzMzZjRkYzg2MTUxOTFiZWbCoAo+PiBpcnJsaWNodC0xLjkuMG10NS50YXIuZ3oKPj4g
wqAgLXNoYTI1NsKgIDViYzRiYjRmZjM2OWQ1MDM5YmNmZmY1YTgzYTM3ODMzNTI0MGNhODZjNTgy
OTllN2RlMjUwOTcxNTNjNzAxMzLCoAo+PiBMSUNFTlNFLnR4dAo+PiArc2hhMjU2wqAgZDFkOGE2
M2Y3ZjcwZDg5YTNhODk5ZjNiOWZiNWNhMWVhN2RiYmQ0ZWI0NDliZTJhN2IyZmY4NjFiMWYwOTE5
MsKgCj4+IExJQ0VOU0UudHh0Cj4gCj4gwqBJIGhhdmVuJ3QgZG91YmxlLWNoZWNrZWQgd2h5IHRo
ZSBsaWNlbnNlIGhhc2ggY2hhbmdlZCwgYW5kIGl0J3Mgbm90IGNsZWFybHkKPiBleHBsYWluZWQg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBidXQgSSB0cnVzdCB5b3UgdmVyaWZpZWQgaXQuCgpTb3Jy
eSwgdGhlIGhhc2ggY2hhbmdlZCBkdWUgdG8gSXJybGljaHRNdCAoSXJybGljaHQgTWluZXRlc3Qg
Zm9yaykgYW5kIG5ldwppbWFnZXMgdW5kZXIgQ0MtQlkgNC4wLgoKVXN1YWxseSB0aGVyZSBhcmUg
bW9yZSBsaWNlbnNpbmcgY2hhbmdlcyBvbiBtaW5ldGVzdC1nYW1lLgoKQmVzdCByZWdhcmRzLApS
b21haW4KCgo+IAo+IMKgUmVnYXJkcywKPiDCoEFybm91dAo+IApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
