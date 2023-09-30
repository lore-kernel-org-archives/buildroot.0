Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C07EE748EA
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 21:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD6DE610C6;
	Sat, 30 Sep 2023 21:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD6DE610C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWin9gsb5nc9; Sat, 30 Sep 2023 21:10:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D73B1610BA;
	Sat, 30 Sep 2023 21:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D73B1610BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA5FF1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 21:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3EBF82C04
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 21:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3EBF82C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QNdyvCBMDOyL for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 21:10:45 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8790782393
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 21:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8790782393
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3226cc3e324so14012108f8f.3
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696108243; x=1696713043;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e4oCovDmaTM7UKTPLwjJdIuQBSxc+YL1eG1c0CI8SWQ=;
 b=pfuOHfZVjy6tllBnlgD4UpjENPFVp2kZ+V5lztWPgoADIZtFxp2l9HQBeQJ64txK6J
 S9DaZccQmeSsnEWEsMf2CI2oMLrVDb5h1Zsn88faDSPRns6bdxmFJkVLCI2kO6q3pitc
 J3du5gR0oEaVSZJ9Du16FG0AW9rsq1zg3/TGuredMotxNFNsPf4kahszxk/K/DMQJ0ba
 YNGx/RZeCyHXClw75gJs3WzikVhauzrFDG5vQiglVJD/z3iaQhBTUQp/zmrfWQ4JIL4E
 xzv9ml6T+b2s2fVW+UvLReZBw2jpJum7IkkNqpt/D5FHRrPUhcqOyLtVkTItxcu4bDDa
 JxsQ==
X-Gm-Message-State: AOJu0YyxCXx+5OrfwSs8+bYwR4ZMZwCs497zzD9s9UR7pE6mQ5UTDl2H
 9s2FqcIZ3LDimFP9jk2/7wmW3vV64js0kLljpOY=
X-Google-Smtp-Source: AGHT+IEfBuAwHxx6Eo0xc+MemFNck9Khc9uaVoFi57A0UbdXHacTc+87V1bRP0S9+Vp+dqHJscOCaQ==
X-Received: by 2002:a5d:4b11:0:b0:320:a19:7f87 with SMTP id
 v17-20020a5d4b11000000b003200a197f87mr6955839wrq.18.1696108243563; 
 Sat, 30 Sep 2023 14:10:43 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6?
 (2a01cb0404ad0b000ca75da681015ca6.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6])
 by smtp.gmail.com with ESMTPSA id
 u21-20020adfa195000000b00323293bd023sm15505032wru.6.2023.09.30.14.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 14:10:43 -0700 (PDT)
Message-ID: <cc70c465-cb25-42df-b0de-9ce3ea1b6dab@smile.fr>
Date: Sat, 30 Sep 2023 23:10:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: fr
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>
References: <20230209004823.3698203-1-giulio.benetti@benettiengineering.com>
 <4acd3e35f6bce28f5f2e6cca8e57789c@free.fr>
 <46cf956e-29d9-c0ce-5963-f3fc3543a476@benettiengineering.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <46cf956e-29d9-c0ce-5963-f3fc3543a476@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696108243; x=1696713043;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e4oCovDmaTM7UKTPLwjJdIuQBSxc+YL1eG1c0CI8SWQ=;
 b=S/Jxfj/5Oe4Ab4faAdRkxdTsm2bbT9sID9hVn2KNapxEUUsfcnXvDWOqrAN2J7xTqD
 il5uSYKWAt5nUnGqH2EzRjbBaV6IRe7spYY2tNiYZWCpiFYuxmQ6ed8AIHSJny/c3BWv
 tcAXB6/w46Ac1QkMj4CFygeYYIXlC7fQCDnNU6llgsm1Iuz4xyBNChugo3Hhx0DHIYvA
 oEJiIRCzFaEWOFO2M+1QU0MBetgNOW7DciQ5QGnUPVmsJ1sPls+DMqnVdM47Bd+7A5MR
 9OmPcYiC+qsAhgxjcYe0d9lnlWiQNOuhaZGvXFlx5PBRdO6yQSo1s/bzMGn+W+0Jk8oz
 jJuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=S/Jxfj/5
Subject: Re: [Buildroot] [PATCH] arch: move global and rename variable
 BR2_PACKAGE_Z3_ARCH_SUPPORTS
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

SGkgR2l1bGlvLAoKTGUgMDkvMDIvMjAyMyDDoCAyMTo1NCwgR2l1bGlvIEJlbmV0dGkgYSDDqWNy
aXTCoDoKPiBIaSBKdWxpZW4sCj4gCj4gT24gMDkvMDIvMjMgMjA6MzYsIEp1bGllbiBPbGl2YWlu
IHdyb3RlOgo+Pgo+PiDCoMKgIEhpIEdpdWxpbywKPj4KPj4gT24gMDkvMDIvMjAyMyAwMTo0OCwg
R2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+PiBQYWNrYWdlIHF1aWNranMgZmFpbHMgdG8gYnVpbGQg
b24gYXJjaGl0ZWN0dXJlcyB0aGF0IGRvbid0IHN1cHBvcnQgZnVsbAo+Pj4gZmxvYXQgcm91bmRp
bmcuIFRvIHN1cHBvcnQgYWxsIGtpbmQgb2YgZmxvYXQgcm91bmRpbmcgRkVfRE9XTldBUkQsCj4+
PiBGRV9UT05FQVJFU1QsIEZFX1RPV0FSRFpFUk8sIEZFX1VQV0FSRCBtdXN0IGJlIGRlZmluZWQg
aW4gZmVudi5oLgo+Pj4gU2luY2UgcGFja2FnZSB6MyBsb2NhbGx5IGltcGxlbWVudHMgdGhpcyBj
aGVjayBsZXQncyBtYWtlIGl0IGdsb2JhbCwKPj4+IHJlbmFtZSBpdCB0byBiZSBnZW5lcmljIGFu
ZCB1c2UgaXQgZm9yIGJvdGggcGFja2FnZSBxdWlja2pzIGFuZCB6My4KPj4+Cj4+PiBGaXhlczoK
Pj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzBiNi8wYjY3MzgxZTM2
NDNjMTM0YzkyY2JjZDFjNWRjMjU4ZmQ3NjBjZDdlLwo+Pj4gaHR0cDovL2F1dG9idWlsZC5idWls
ZHJvb3QubmV0L3Jlc3VsdHMvY2YyL2NmMjQ5YTgyYzgzZDNjODUwMzIwNWY0YzNjNTg1OWRkOWQ1
MmFmZGYvCj4+PiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy85YjMvOWIz
N2M2YzU1YTViNDY4NjU3YWYyNmVmOWI1N2Q0ZmUyNGQ4ZmRlMi8KPj4+IGh0dHA6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzRmMS80ZjEzY2Y3ZDM1MzI2MGM2Yjg5MzRkYmRjZjI2
N2JlYTg4NGIzNTZiLwo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVs
aW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+Pgo+PiBUbyBjb21tZW50IGEgYml0
IG9uIHRoYXQsIHRoZSBjb21wbGV0ZSBjb25kaXRpb24gaXMgYSBiaXQgbW9yZSB0cmlja3k6Cj4+
IC0gdGhlIENQVSBhcmNoIEZQVSBIVyBtdXN0IGhhdmUgYWxsIDQgcm91bmRpbmcgbW9kZXMsCj4+
IC0gdGhlIGxpYmMgbXVzdCBleHBvc2UgYSBmZW52LmggaGVhZGVyLAo+PiAtIHRoZSBsaWJjIG11
c3QgYWxzbyBleHBvc2UgYWxsIDQgcm91ZGluZyBtb2Rlcy4KPiAKPiB0aGFuayB5b3UgZm9yIHRo
ZSBtb3JlIHByZWNpc2UgZXhwbGFuYXRpb24sIGV2ZXJ5dGhpbmcgaXMgbW9yZSBjbGVhciBub3cK
PiAKPj4gZ2xpYmMgZ2VuZXJhbGx5IGV4cG9zZXMgYWxsIHRoZSBIVyBzdXBwb3J0ZWQgcm91bmRp
bmcgbW9kZXMuwqAgSQo+PiBpbml0aWFsbHkgZXhjbHVkZWQgdWNsaWJjLW5nLCBiZWNhdXNlIGlu
IGl0cyBCdWlsZHJvb3QgZGVmYXVsdAo+PiBjb25maWd1cmF0aW9uLCBmZW52LmggaXMgbm90IGVu
YWJsZWQgWzFdLiBJIGJlbGlldmUgaXQncyBwb3NzaWJsZSB0bwo+PiBoYXZlIHNvbWUgdWNsaWJj
LW5nIGNvbmZpZ3VyYXRpb24gdGhhdCBhcmUgZW5hYmxlIGFuZCBleHBvc2luZyB0aG9zZQo+PiBy
b3VuZGluZyBtb2Rlcy4gU2VlIFsyXS4KPj4KPj4gU28gdGhpcyBwcm9wb3NhbCBpcyBjb3JyZWN0
IGJ1dCBwb3NzaWJseSBkaXNjYXJkIHRoZSBjYXNlIGluIHdoaWNoIGxpYmMgaXMKPj4gdWNsaWJj
LW5nIGFuZCBpdHMgKGN1c3RvbSkgY29uZmlndXJhdGlvbiBleHBvc2VzIGFsbCBGRSByb3VuZGlu
ZyBtb2Rlcy4KPiAKPiBNYXliZSB3ZSBjYW4gZW5hYmxlIFVDTElCQ19IQVNfRkVOViBvbiB1Y2xp
YmMtbmcgYnkgZGVmYXVsdCwgc28gYWxsCj4gYXJjaGl0ZWN0dXJlcyB0aGF0IFVDTElCQ19IQVNf
RkxPQVQgdGhleSBoYXZlIGl0LiBPdGhlcndpc2UgdGhhdCBVQ0xJQkNfSEFTX0ZFTlYKPiBnZXRz
IGRpc2NhcmRlZCBpZiBJJ20gY29ycmVjdC4KPiAKPj4gSSBhbSBub3Qgc3VyZSBpZiBpdCdzIHJl
YWxseSBhbiBpc3N1ZSwgYXMgcGFja2FnZXMgd2l0aCBzdWNoCj4+IHJlcXVpcmVtZW50cyBhcmUg
bW9zdGx5IHRlc3RlZCB3aXRoIGdsaWJjIGFueXdheS4uLgo+IAo+IFNhbWUgaGVyZSBmb3IgdGhl
IGFyY2hpdGVjdHVyZS4KPiAKPiBTbyB3ZSdkIG5lZWQgYSB2YWxpZCBjb25kaXRpb24gdGhhdCBp
cyB0cnVlIGZvciB0aGUgMyBwb2ludHMgeW91J3ZlCj4gbGlzdGVkIGFib3ZlIGV4YWN0bHkgaW4g
dGhlIG9yZGVyIHlvdSd2ZSBsaXN0ZWQgdGhlbSBpZiBJJ20gY29ycmVjdC4KPiAKPiBNYXliZSB3
ZSBjYW4gZG8gYW4gaW50ZXJtZWRpYXRlIHN0ZXAgd2l0aCB0aGlzIHBhdGNoIGFuZCBsYXRlciBk
ZWFsIHdpdGgKPiB0aGlzIG1hdHJpeCB2YWxpZGl0eSBjaGVjawoKQXMgZGlzY3Vzc2VkIG9uIElS
QywgSSBtYXJrZWQgdGhpcyBwYXRjaCBhcyBjaGFuZ2VzIHJlcXVlc3RlZC4KCkJlc3QgcmVnYXJk
cywKUm9tYWluCgoKPiAKPiBCZXN0IHJlZ2FyZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
