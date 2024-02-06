Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46545C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 08:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAE364154A;
	Tue,  6 Feb 2024 08:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAE364154A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgvXlpb5RZsE; Tue,  6 Feb 2024 08:49:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D6AC40A00;
	Tue,  6 Feb 2024 08:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D6AC40A00
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E30F01BF2BC
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBCE440A00
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBCE440A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hDHeSWc3_FlY for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 08:49:33 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 846E44098E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 08:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 846E44098E
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33b466bc363so253697f8f.3
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 00:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707209371; x=1707814171;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p2KNiuk/cSq2xyYKKSziT4evt1w1hfUstTxaiHV+7oo=;
 b=QVRRwc3+D0aW17w3xBnUVrSu2cGy2BpyqzZ/EbgB1xBB5XZbD/vZflwWmRO0Zou5eo
 YDdg0/wMJo92Pr8MQ4PjBUHf1XWgv3xI+LM+ekSwjBpwKOjQNIPeX02/Ox4IcbpT9dif
 L6haeKWrDe0esAOIKKQPFV8LjZWWGTYAyj32Uj6sJ/g7MIdrWelmdCBwxm7P4TtPlUiW
 0iiJfJVLdCe2epZQ77CLseWUglwD/7WIyxT/RgeLzl++ehLJUkjLZy+QJBtc/o4hKyFZ
 cYYL7NDViJGsMgWwnYqEYDWkS6qN1hItJLqXqVckSsxYEV3QUmFPSGtB3vaG8Ajt93Qa
 Gv9Q==
X-Gm-Message-State: AOJu0Yy1Ul2vzorXgXCtbJYjHb8AdG6llMnh3cawBihp5bWqQ9zReKsB
 qf8RykdDTadX7bJ5McjD/2WZT5ia35g2GfTvAes00kCcHfaIDobx0oum0gTWcPA=
X-Google-Smtp-Source: AGHT+IHQHf3zS9Uhmyt0L1Vy0MW5J156/8Iu1biD6eAv06Zv7OlyIIiDKP6uth2Wf7RZ+SV+Y7VvBw==
X-Received: by 2002:a5d:5f8d:0:b0:33b:28c0:7c98 with SMTP id
 dr13-20020a5d5f8d000000b0033b28c07c98mr780338wrb.61.1707209371564; 
 Tue, 06 Feb 2024 00:49:31 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWsoA0hQDLRVGj8YJcd01z7vnBjeTKvSMdwARu9+GCG7X9b9Ytd2/fCTl3QHmy2UmlolEr1kfk89bgbY/Wb6zKAww==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d4bcc000000b0033905a60689sm1523568wrt.45.2024.02.06.00.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 00:49:31 -0800 (PST)
Message-ID: <c48e9859-c68f-46ca-8d76-4af73535f488@mind.be>
Date: Tue, 6 Feb 2024 09:49:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20240111052225.2922249-1-james.hilliard1@gmail.com>
 <687fa6af-4d6f-4890-bd3a-c420ede9cdfd@mind.be>
 <CADvTj4ptOXX-KXLrdykFUZnQBo1YCmgd1niQ10rRv5PBXGbV+g@mail.gmail.com>
In-Reply-To: <CADvTj4ptOXX-KXLrdykFUZnQBo1YCmgd1niQ10rRv5PBXGbV+g@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707209371; x=1707814171; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p2KNiuk/cSq2xyYKKSziT4evt1w1hfUstTxaiHV+7oo=;
 b=Bnh5FSK5YMQrbc0dmz8aKmJRyAqi+ehl5BM7o1Doak3TL/Esj09pEzC+nztRLyY41/
 BPa29DRFEt+HD+p1+1rlzxxqUiArcd0Meh+K3fkltdR8dnfwGveixMWN6pIMb4F8SSYb
 jP/ZVIe3MrEqO5ByrJ5GRXreFuQuF0CAIZuub0LfoWzD5Nk4Umf9432ZamvAxgOWrVkH
 Vq4F6lUzpaYoPhao+SJtx4Nc/V6HFds4Mh+BiITTBgTNHcN7j6eU5/LUVeDYZTT6ms3W
 sAnulIchwBlbylSbPqfInvBcJVF+ayxtRQENZt27nHMAGtUi2ybgHzWac+oUMIdeuocX
 Rj9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Bnh5FSK5
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rtoml: bump to version
 0.10.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNS8wMi8yMDI0IDE4OjIxLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBPbiBNb24sIEZl
YiA1LCAyMDI0IGF0IDQ6MjnigK9BTSBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQu
YmU+IHdyb3RlOgo+Pgo+Pgo+Pgo+PiBPbiAxMS8wMS8yMDI0IDA2OjIyLCBKYW1lcyBIaWxsaWFy
ZCB3cm90ZToKPj4+IE1pZ3JhdGUgZnJvbSBzZXR1cHRvb2xzLXJ1c3QgdG8gbWF0dXJpbiBpbmZy
YXN0cnVjdHVyZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gICAgcGFja2FnZS9weXRob24tcnRvbWwv
cHl0aG9uLXJ0b21sLmhhc2ggfCAyICstCj4+PiAgICBwYWNrYWdlL3B5dGhvbi1ydG9tbC9weXRo
b24tcnRvbWwubWsgICB8IDYgKysrLS0tCj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRo
b24tcnRvbWwvcHl0aG9uLXJ0b21sLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1ydG9tbC9weXRob24t
cnRvbWwuaGFzaAo+Pj4gaW5kZXggMDRkMjJlZDFhNC4uNTlmMTdkOWQ2MiAxMDA2NDQKPj4+IC0t
LSBhL3BhY2thZ2UvcHl0aG9uLXJ0b21sL3B5dGhvbi1ydG9tbC5oYXNoCj4+PiArKysgYi9wYWNr
YWdlL3B5dGhvbi1ydG9tbC9weXRob24tcnRvbWwuaGFzaAo+Pj4gQEAgLTEsNCArMSw0IEBACj4+
PiAgICAjIExvY2FsbHkgY2FsY3VsYXRlZCBhZnRlciB2ZW5kb3JpbmcKPj4+IC1zaGEyNTYgIDgy
MWE0MzBhYjY1ODdiZGFhZjdjYjk1MDQ0ZThlMGQ5OWM3N2M2YWVkMGFkY2U1YTM3MDA0NWIyNzBm
N2VlMjAgIHJ0b21sLTAuOC4wLnRhci5nego+Pj4gK3NoYTI1NiAgOTg3ZDNkOWU5ZDU2NzYxYjE3
YzNlNGUxNzI5MzdjYmNjNzkzYmYyNGIwZWJiMjczMDY0N2E5YTJjZjg2Yzc4OSAgcnRvbWwtMC4x
MC4wLnRhci5nego+Pgo+PiAgICBTYW1lIHByb2JsZW06Cj4+Cj4+IEVSUk9SOiB3aGlsZSBjaGVj
a2luZyBoYXNoZXMgZnJvbSBwYWNrYWdlL3B5dGhvbi1ydG9tbC8vcHl0aG9uLXJ0b21sLmhhc2gK
Pj4gRVJST1I6IHJ0b21sLTAuMTAuMC50YXIuZ3ogaGFzIHdyb25nIHNoYTI1NiBoYXNoOgo+PiBF
UlJPUjogZXhwZWN0ZWQ6IDk4N2QzZDllOWQ1Njc2MWIxN2MzZTRlMTcyOTM3Y2JjYzc5M2JmMjRi
MGViYjI3MzA2NDdhOWEyY2Y4NmM3ODkKPj4gRVJST1I6IGdvdCAgICAgOiA2MjRjYzFmZjJiM2Zk
ZWE0MmFlZWUzYTRkMTUzN2QzNzQzMWVjMDAxODcwZGZlZTFlMDRhMTJiZDMwNzZhMmQzCj4gCj4g
SG1tLCBJJ20gdW5hYmxlIHRvIHJlcHJvZHVjZSB0aGlzIGlzc3VlLgoKICBJIHN1cHBvc2UgdGhh
dCBpZiB5b3UgYWxyZWFkeSBoYXZlIHRoZSB2ZW5kb3JlZCBkZXBlbmRlbmNpZXMgaW4geW91ciBj
YXJnbyAKY2FjaGUgKEJSMl9ETF9ESVIvYnItY2FyZ28taG9tZSkgeW91IGhhdmUgdGhlIHNhbWUg
dGltZXN0YW1wcyBvbiB0aGVtLgoKICBCdXQgaWYgdGhvc2UgYXJlIHRoZSBvbmVzIHRoYXQgY2F1
c2UgdGhlIGlzc3VlLCBZYW5uJ3Mgc2VyaWVzIGlzIG5vdCBnb2luZyB0byAKaGVscCwgYmVjYXVz
ZSBpdCBvbmx5IGFmZmVjdHMgdGhlIHJlcG9zaXRvcmllcyB3ZSBwdWxsIGZyb20gZ2l0IG91cnNl
bHZlcywgbm90IAp0aGUgb25lcyB0aGF0IGFyZSBkb25lIGJ5IGNhcmdvLi4uCgogIFBlcmhhcHMg
d2Ugc2hvdWxkIGRvIGEgZGlmZm9zY29wZSB0byBiZSBzdXJlIHdoZXJlIHRoZSBkaWZmZXJlbmNl
IGlzIGV4YWN0bHkuIApDb3VsZCB5b3UgdGFrZSBteSBjb3B5IGZyb20KICBodHRwczovL2Z0cC5l
c3NlbnNpdW0uY29tL293bmNsb3VkL2luZGV4LnBocC9zL1dXMmp0cDVvelc2MXJNVgphbmQgZG8g
dGhlIGRpZmZvc2NvcGU/CgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+Pj4gICAgIyBMb2NhbGx5IGNv
bXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPj4+ICAgIHNoYTI1NiAgY2Q1ZmZkZTgwZTZkMzI4NmEy
ZTJlNWYwMmZiMmNiMDdiODIzOTMxY2EzNjhlN2M3MzVhNmM1ZjVhZWJlNzEwMyAgTElDRU5TRQo+
Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXJ0b21sL3B5dGhvbi1ydG9tbC5tayBiL3Bh
Y2thZ2UvcHl0aG9uLXJ0b21sL3B5dGhvbi1ydG9tbC5tawo+Pj4gaW5kZXggODE5ZGNmMzI4OC4u
MTZmOWRlYTU3MyAxMDA2NDQKPj4+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXJ0b21sL3B5dGhvbi1y
dG9tbC5tawo+Pj4gKysrIGIvcGFja2FnZS9weXRob24tcnRvbWwvcHl0aG9uLXJ0b21sLm1rCj4+
PiBAQCAtNCwxMCArNCwxMCBAQAo+Pj4gICAgIwo+Pj4gICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPj4+Cj4+PiAtUFlUSE9OX1JUT01MX1ZFUlNJT04gPSAwLjguMAo+Pj4gK1BZVEhPTl9SVE9N
TF9WRVJTSU9OID0gMC4xMC4wCj4+PiAgICBQWVRIT05fUlRPTUxfU09VUkNFID0gcnRvbWwtJChQ
WVRIT05fUlRPTUxfVkVSU0lPTikudGFyLmd6Cj4+PiAtUFlUSE9OX1JUT01MX1NJVEUgPSBodHRw
czovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMzMvYTYvYjQyZDhlMGUyOGJlYzlm
ZDdmZGJhZmIyZDc2ZGIzZjg1NzhmMTUxYTY2OWViYTU2NGQ0MjI3NTZkOTA5Cj4+PiAtUFlUSE9O
X1JUT01MX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzLXJ1c3QKPj4+ICtQWVRIT05fUlRPTUxfU0lU
RSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9jYS9iMi8wZTc3YTAw
ZTc1ZWQ1ODJlYzFjNGMzYTllMWVlZWQ4ODZhMTVjMTk1YmNjZTg3YjdkYWYxMTcxYzQxMTUKPj4+
ICtQWVRIT05fUlRPTUxfU0VUVVBfVFlQRSA9IG1hdHVyaW4KPj4+ICAgIFBZVEhPTl9SVE9NTF9M
SUNFTlNFID0gTUlUCj4+PiAgICBQWVRIT05fUlRPTUxfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UK
Pj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
