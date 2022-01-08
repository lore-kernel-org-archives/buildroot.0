Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B500C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 19:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DACA640232;
	Sat,  8 Jan 2022 19:13:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vD_AaEKBqwf; Sat,  8 Jan 2022 19:13:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAAEA401DF;
	Sat,  8 Jan 2022 19:13:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF2B61BF3C9
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C82C607C9
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q9UreAHDl5ib for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 19:13:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B28D360797
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 19:13:19 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 x18-20020a7bc212000000b00347cc83ec07so2516327wmi.4
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 11:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4ndVCuactKq7lhDwpyuGjFI5RpVNu0rPza8OZlBLrzE=;
 b=K7If8FQYP5DS1hpE14I11FMsqe1CL+xqGiAPYduAxl57UCo9Wf7Y8LMLAGU31zY52n
 VT924sigzj7afpvWxhIYQ33zkVKQi5Txa0WdtNHwRH+vTs0yUs5CQCqypXxtKXV0RRJ4
 eYQa4KezJpM54R9WSgOOYnMm7i4OUKjvPB+eFw06cXS3JBviBO2ldnPY3rquuApxgu12
 FhWQYO769FLDREjGqcQ3pKwFtCA5NyWn9haWL+lGZ1kb5YCIO2YceN1YEm06AO0kH9Q1
 c83nksq3p5SLthKn/rr3FDnYoPG6lq1EbV/coAn3UlwoVtyZFpGw2yN39AqO7wNyiGFd
 sHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4ndVCuactKq7lhDwpyuGjFI5RpVNu0rPza8OZlBLrzE=;
 b=1NeNU7SRZOxX1chpXHelawFZruhArcBA83TMw6lR3oUpf4W9F4MmvAuX9Z/NsgAEBr
 IqVgbxg6pl3eAEoBJpjx7uJI5KbjsSfuZwkYW7+KWYhFm9xyOFhWA6xmz8x8U9igwXxd
 XCvx9u03ex0Kgz+hslK0+vWNujTjhZPG/Kxgc/AcEKlYs9IrpGIV5bt6k8PEUHpmAD3b
 esSNhYq/eTVxMIrWoeJmc7MFFmx6gOZh820f2u5vF6LUI9gSOKSMBefcwjI0fAinYxbE
 N4YLAhEpxvjMeLFRYCJvjeaSoGKiza3UsvDWNJheqgiKKlhOM+lcdYrceqiDNFJyjUY/
 7kxw==
X-Gm-Message-State: AOAM532PIZgLnIDulhbZ+8FDh/G4wwIxqrfrszgM6e5NAJ4G2FooIzVy
 2zHug1NBGW+8UsvTIlrGs1WVaSmmohCqDQ==
X-Google-Smtp-Source: ABdhPJyLIZ++T4wC4m4YWKFErdNgbo252hZpu2KnDAz9p8w377i6td1u3eUbXWoSg2H7Gt+c3WSudA==
X-Received: by 2002:a1c:e913:: with SMTP id q19mr15653125wmc.87.1641669197993; 
 Sat, 08 Jan 2022 11:13:17 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id a2sm2636732wri.17.2022.01.08.11.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 11:13:17 -0800 (PST)
Message-ID: <bf38076f-5b44-0fbf-47f5-c7cffb0498b8@smile.fr>
Date: Sat, 8 Jan 2022 20:13:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Cyril Bur <cyrilbur@gmail.com>
References: <20210623145231.19243-1-cyrilbur@gmail.com>
 <382b2896-92a6-4a75-0093-bea2b6f91bf9@smile.fr>
 <CAN-ccAQ9p1GKWmLThvGxi2+r698j9LB47RK0R6piC5zR2OgRvQ@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CAN-ccAQ9p1GKWmLThvGxi2+r698j9LB47RK0R6piC5zR2OgRvQ@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] package/python-greenlet: enable as host
 package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ3lyaWwsCgpMZSAwOC8wMS8yMDIyIMOgIDIwOjAzLCBDeXJpbCBCdXIgYSDDqWNyaXTC
oDoKPiBIaSBSb21haW4sCj4gCj4gVGhhbmtzIGZvciB5b3VyIGludGVyZXN0Lgo+IAo+IE15IGVt
cGxveWVyIGhhcyBzb21lIGN1c3RvbSBwYWNrYWdlcyB3aGljaCBkbyBkZXBlbmQgb24gaG9zdCBw
eXRob24KPiBncmVlbmxldC4KPiAKPiBJJ20ga2VlbiB0byBhdm9pZCBhbnkgZm9ya3MgKGhvd2V2
ZXIgc21hbGwpIG9mIGJ1aWxkcm9vdCBpbnRlcm5hbGx5LCBpdAo+IGp1c3QgbWFrZXMgbGlmZSBl
YXNpZXIuCgpJIHVuZGVyc3RhbmQuCgpJdCBzZWVtcyB0aGVyZSBpcyBhbiBleGNlcHRpb24gaW4g
dGhlIHRyZWUgKGhvc3QtcHl0aG9uLWx4bWwpLCBidXQgeW91IGhhdmUgdG8KYWRkIGF0IGxlYXN0
IGEgQ29uZmlnLmluLmhvc3Q6CgpodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9j
b21taXQvP2lkPTRmMTQ3YWUwYTBmOTQwZGZjN2VjOTNhZjhlNzBiNjYyNTgyMWQ5MWQKCkFsc28g
YWRkIGEgY29tbWVudCB0byBleHBsYWluIHdoeSB3ZSBkb24ndCBoYXZlIGFueSBwYWNrYWdlIHVz
aW5nIGl0IGluIHRoZSB0cmVlLgoKSSBoYXZlIG1hcmtlZCB0aGlzIHBhdGNoIGFzICJDaGFuZ2Vz
IFJlcXVlc3RlZCIuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gQ3lyaWwKPiAKPiAKPiBP
biBTYXQsIDggSmFuIDIwMjIsIDE4OjQzIFJvbWFpbiBOYW91ciwgPHJvbWFpbi5uYW91ckBzbWls
ZS5mcj4gd3JvdGU6Cj4gCj4+IEhlbGxvLAo+Pgo+PiBMZSAyMy8wNi8yMDIxIMOgIDE2OjUyLCBD
eXJpbCBCdXIgYSDDqWNyaXQgOgo+Pgo+PiBXaHk/Cj4+Cj4+IFRoZXJlIGlzIG5vdCBwYWNrYWdl
IHVzaW5nIGhvc3QtcHl0aG9uLWdyZWVubGV0IGluIHRoZSB0cmVlLgo+Pgo+PiBCZXN0IHJlZ2Fy
ZHMsCj4+IFJvbWFpbgo+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ3lyaWwgQnVyIDxjeXJpbGJ1ckBn
bWFpbC5jb20+Cj4+PiAtLS0KPj4+ICBwYWNrYWdlL3B5dGhvbi1ncmVlbmxldC9weXRob24tZ3Jl
ZW5sZXQubWsgfCAxICsKPj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZ3JlZW5sZXQvcHl0aG9uLWdyZWVubGV0Lm1r
Cj4+IGIvcGFja2FnZS9weXRob24tZ3JlZW5sZXQvcHl0aG9uLWdyZWVubGV0Lm1rCj4+PiBpbmRl
eCAwMWQ1NzhhMTgzLi5lOTBkMWMwZjU2IDEwMDY0NAo+Pj4gLS0tIGEvcGFja2FnZS9weXRob24t
Z3JlZW5sZXQvcHl0aG9uLWdyZWVubGV0Lm1rCj4+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1ncmVl
bmxldC9weXRob24tZ3JlZW5sZXQubWsKPj4+IEBAIC0xMiwzICsxMiw0IEBAIFBZVEhPTl9HUkVF
TkxFVF9MSUNFTlNFID0gTUlULCBQU0YtMi4wCj4+PiAgUFlUSE9OX0dSRUVOTEVUX0xJQ0VOU0Vf
RklMRVMgPSBMSUNFTlNFIExJQ0VOU0UuUFNGCj4+Pgo+Pj4gICQoZXZhbCAkKHB5dGhvbi1wYWNr
YWdlKSkKPj4+ICskKGV2YWwgJChob3N0LXB5dGhvbi1wYWNrYWdlKSkKPj4+Cj4+Cj4+Cj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
