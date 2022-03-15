Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5911FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08FBC40305;
	Tue, 15 Mar 2022 21:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XVy6BeNPXQdB; Tue, 15 Mar 2022 21:11:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32C32402C9;
	Tue, 15 Mar 2022 21:11:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0C791BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B06D4402C9
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IqEGzPKHtjUe for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:11:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0725402C4
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:11:12 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id c20so408613edr.8
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=FO3UUCxt0uBvtAFzb+tNiozUU4r00UDnNjqZGUQEJuk=;
 b=hNMz+DxDx50gd3jAH1iAj2N8xdpN9fttk/0TSsuR+1rkBEoUu5ptaq7DQIr2E1UQiD
 PIxGrLDxWweNAEjeEmJiGt28dhTmoXK4sfdq6KenuUxQZN3DzGF1bPeogcX//jVDLHyJ
 gYtGPPKRUqfYLHvohHFpi9KEhAJxpoh0GhjDsoXOPZO7gMrDBhGsg1qoHQJE31GQhkwU
 MyPKVtt5B5VPKvzA01dgDFMIIgKc12sJYPCB03LsIbSU28zYvdDrGmvX+Fh7YFytBJRM
 EgOQ2RHtrg48n7adVbI3XDoCEEOwPqaHgJRsbO80KLYU8L2VZiDzd7QpYcljBj3VH3wn
 vJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FO3UUCxt0uBvtAFzb+tNiozUU4r00UDnNjqZGUQEJuk=;
 b=4LZl2j2zJY2jVs1u8cJb3vzpfSQ4HX9KD0K/07doJ7MrPYSQdV5LAvYmnDMb7bLwQD
 vEguvQkmVjHAS6Kem7kDVP5awdfhZ6ZlC3nE3JIwKP9cPHt5tXJd6rqcY+a/Z2ARW+da
 5MvnZ/AQkhdoIP4REEVTvw6flTbVe3iGfkVMSZyIDDWAcmJp29E41Atz3LZc2p5CPVLR
 R/PdSsld+amYq+YG11tEzHn2NMaN8LgXgOUbzR8ZYBxIjIYy7ntztS/DTar6Xdq8uqWn
 tjO1LBhca1JkIXqraZ8UoRGq3kjyUa3iNpR5i5uYkIH7bO2Dvy7cvfu5r7Th4njOWeRN
 wpZg==
X-Gm-Message-State: AOAM531j9nDSTV9TzeNMjAjJPw3e8ZbX3tmHVjHG+5OfdQtc5pz9ysUe
 SkQb36DFcG1mqqOSU87GqilZuQ==
X-Google-Smtp-Source: ABdhPJzWzpu/1jP6gpqRhLQ+K6SQtlcVEaASi4KsG1fUL7/pLLDTh4ObC7DneTW8eBUx0hre3dl2GA==
X-Received: by 2002:a05:6402:2548:b0:416:4155:e12 with SMTP id
 l8-20020a056402254800b0041641550e12mr26987890edb.175.1647378670966; 
 Tue, 15 Mar 2022 14:11:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b26-20020aa7df9a000000b00416b3005c4bsm50855edy.46.2022.03.15.14.11.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:11:10 -0700 (PDT)
Message-ID: <80b6dcef-8b08-5ee0-9c82-b10758a5af54@mind.be>
Date: Tue, 15 Mar 2022 22:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: =?UTF-8?Q?Th=c3=a9o_Lebrun?= <theo.lebrun@bootlin.com>,
 buildroot@buildroot.org
References: <20220228161345.378966-1-theo.lebrun@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220228161345.378966-1-theo.lebrun@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wireplumber: bump version to
 0.4.8
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyOC8wMi8yMDIyIDE3OjEzLCBUaMOpbyBMZWJydW4gdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBDaGFuZ2Vsb2c6Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BpcGV3aXJlL3dp
cmVwbHVtYmVyLy0vYmxvYi9lMTRiYjcyZGNjODVlMjEzMGQwZWE5Njc2OGU1YWUzYjM3NWEwNDFl
L05FV1MucnN0Cj4gCj4gU2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBi
b290bGluLmNvbT4KCiAgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiAgUmVnYXJkcywKICBB
cm5vdXQKCj4gLS0tCj4gICBwYWNrYWdlL3dpcmVwbHVtYmVyL3dpcmVwbHVtYmVyLmhhc2ggfCAy
ICstCj4gICBwYWNrYWdlL3dpcmVwbHVtYmVyL3dpcmVwbHVtYmVyLm1rICAgfCAyICstCj4gICAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS93aXJlcGx1bWJlci93aXJlcGx1bWJlci5oYXNoIGIvcGFja2FnZS93
aXJlcGx1bWJlci93aXJlcGx1bWJlci5oYXNoCj4gaW5kZXggNTYxZmNjMmU1ZS4uMjA2ZDdkMTVh
ZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dpcmVwbHVtYmVyL3dpcmVwbHVtYmVyLmhhc2gKPiAr
KysgYi9wYWNrYWdlL3dpcmVwbHVtYmVyL3dpcmVwbHVtYmVyLmhhc2gKPiBAQCAtMSwzICsxLDMg
QEAKPiAgICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1NiAgNDFmMTc0ZWFhZTVhNjMwZTE5
NTAwMWZkZDU4MDkxOGZhNTE0M2E3MWVkY2ViMDUwYjMyMGY4NWE4ZTY1ZTUzYiAgd2lyZXBsdW1i
ZXItMC40LjIudGFyLmJ6Mgo+ICtzaGEyNTYgIDY0MjllOGE5NWUzNTVjZTIxYjRjNGYxYTVlYmM3
NjlmMDM3ZThkYmVlYzUxOTA1YWQ5MDljZTYwOWEzOGQwY2UgIHdpcmVwbHVtYmVyLTAuNC44LnRh
ci5iejIKPiAgIHNoYTI1NiAgZmYyZWI5YWY1YjA1ZDkyYWMzYTM4Y2ZmY2FkMjc1ODJlZjU1NWEz
MWZmMTc4MWUxYzFkNGUwODdmNzdjOWM4MSAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3dpcmVwbHVtYmVyL3dpcmVwbHVtYmVyLm1rIGIvcGFja2FnZS93aXJlcGx1bWJlci93aXJlcGx1
bWJlci5tawo+IGluZGV4IDJkYWI2MDQyZWEuLjNiZjdjZWNlNDUgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS93aXJlcGx1bWJlci93aXJlcGx1bWJlci5tawo+ICsrKyBiL3BhY2thZ2Uvd2lyZXBsdW1i
ZXIvd2lyZXBsdW1iZXIubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4gICAKPiAtV0lSRVBMVU1CRVJfVkVSU0lPTiA9IDAuNC4yCj4gK1dJUkVQ
TFVNQkVSX1ZFUlNJT04gPSAwLjQuOAo+ICAgV0lSRVBMVU1CRVJfU09VUkNFID0gd2lyZXBsdW1i
ZXItJChXSVJFUExVTUJFUl9WRVJTSU9OKS50YXIuYnoyCj4gICBXSVJFUExVTUJFUl9TSVRFID0g
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BpcGV3aXJlL3dpcmVwbHVtYmVyLy0vYXJj
aGl2ZS8kKFdJUkVQTFVNQkVSX1ZFUlNJT04pCj4gICBXSVJFUExVTUJFUl9MSUNFTlNFID0gTUlU
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
