Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0855FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 17:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EDCF410B0;
	Tue, 18 Jan 2022 17:46:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BuTLJjRNqwXP; Tue, 18 Jan 2022 17:46:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF619410AE;
	Tue, 18 Jan 2022 17:46:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6B391BF59D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 17:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A04B98246F
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 17:46:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PRfmPQMwT0_s for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 17:45:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A0F282425
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 17:45:59 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id x22so73778263lfd.10
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 09:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=V/DrTxuukUyPJ81GSI2Rbdq3HesvChOt9UW35XTMp7M=;
 b=ZmOBKb6z3DRa/Nv/bE3+vavu22fqVGBXqOro8Yu5cniUTPEO/0aKl8rvaOOTzGjWXa
 Jf5bM5sgegI7d26IqEu3aZb6dQ9cqGMOJEzHPmrujbi4dE8dKqhBY35sz7XRxR/JMM46
 Gccq11SVc7nSpCIRAW9EcEPyzTHKjuaIYQE2egvTxvzZi2tvnJh7fFKc4qpbbYI+h+Fo
 g5LGQPsA+2j2bMBuLbOJJ1b52Hz3DSD6TYBn0AZNccruelnEIyn6T2JHTzCUggBE1LpO
 C0kwT/OhZLpiGCC1m+twf1tU/syLjbkAox76dRS2+mWVxQjYn06xrfTFXFkAmnEumKbC
 pzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V/DrTxuukUyPJ81GSI2Rbdq3HesvChOt9UW35XTMp7M=;
 b=L9qe/7lQ/w8kYK6hoV4gF52aHAYU+3jOBP2h+d8E2pTWQ9rLukuEADx0NwcD24D+FK
 zHvlVxOZTG7LEc+ahqmpYcR74zvyXnFlg6+rUAWzi+qXBcN9PVfS0xnm0fYHBwxJakIQ
 e3k9RW9zuQm1NG6gGTwqEcErMv/G7cAG6DnvLvTsrNjHMhEVDkrIaB9tcKctJyJJzfIK
 zMJGUmVcyFsYbcuGgYH2Go65bnuOaFeG4JFg3UzMgsYTgb0/OLlb219zWsP2vCrLBtHk
 5Rgww5aKY2uYQjVp370UB3tVe5sIKNSjRTG2Z/XcUJqKbCPA+Q1WRPNw04qxTOPVA5qZ
 Dyeg==
X-Gm-Message-State: AOAM5316YSj1Ff861rdOOOxxM4jFJ1XktH0j20XPk2W9dy1q00OESRuO
 EbN8QxfnbsOIyVTGSvBVn/kKQ7RVDZo=
X-Google-Smtp-Source: ABdhPJzOLQCq0NEsSPjXROk9PmiB2kAnqQJ/ohzrl2qeSLu71RPoMTSNjWlUzBPYhrSjKDhOTCqvRg==
X-Received: by 2002:a05:6512:16a6:: with SMTP id
 bu38mr22321768lfb.454.1642527957367; 
 Tue, 18 Jan 2022 09:45:57 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.204])
 by smtp.gmail.com with ESMTPSA id bp19sm1759351lfb.279.2022.01.18.09.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 09:45:56 -0800 (PST)
Message-ID: <834ad33f-d02f-4663-8e99-4bc939cbb9f6@gmail.com>
Date: Tue, 18 Jan 2022 20:45:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: ru-RU
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <70BDD76B-E7F2-44C0-A90B-0FABCFD8755D@benettiengineering.com>
 <20220118063531.2039729-1-giulio.benetti@benettiengineering.com>
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <20220118063531.2039729-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH v2] package/xr819-xradio: add patch to build
 with Linux >= 5.13
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

SGkgQWxsLCBHaXVsaW8uCkkgY2hlY2tlZCB0aGUgcGF0Y2gsIGV2ZXJ5dGhpbmcgd29ya3MuCgox
OC4wMS4yMDIyIDA5OjM1LCBHaXVsaW8gQmVuZXR0aSDQv9C40YjQtdGCOgo+IEFzIGV4cGxhaW5l
ZCBpbiB0aGUgbG9jYWwgcGF0Y2ggaXRzZWxmIG9mX2dldF9tYWNfYWRkcmVzcygpIGhhcyBjaGFu
Z2VkLCBzbwo+IHdlIG5lZWQgdG8gY2hlY2sgYWdhaW5zdCBMaW51eCB2ZXJzaW9uIGFuZCB1c2Ug
aXQgc2xpZ2h0bHkgZGlmZmVyZW50bHkuCj4KPiBQYXRjaCBpcyBwZW5kaW5nIHVwc3RyZWFtOgo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9maWZ0ZWVuaGV4L3hyYWRpby9wdWxsLzE1Cj4gSSd2ZSByZWFs
aXplZCBvbmx5IGxhdGVyIHRoZXJlIHdhcyBhbHJlYWR5IGFuIG9wZW5lZCBQUiBmb3IgdGhpcywg
YW55d2F5Cj4gSU1ITyBJIHRoaW5rIG15IHBhdGNoIGlzIHdyaXR0ZW4gYSBsaXR0bGUgYmV0dGVy
LCBzbyBwbGVhc2UgYWNjZXB0IGl0Lgo+IEFuZCBtb3N0IG9mIGFsbCBTZXJnZXkgYWxyZWFkeSB0
ZXN0ZWQgaXQgYW5kIGl0IHdvcmtzOgo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBl
cm1haWwvYnVpbGRyb290LzIwMjItSmFudWFyeS82MzQwODQuaHRtbAo+Cj4gU2lnbmVkLW9mZi1i
eTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+
Cj4gLS0tCj4gVjEtPlYyOgo+ICogdXBkYXRlIGxvY2FsIHBhdGNoIHRvIGJ1aWxkIGNvcnJlY3Rs
eSBhbHNvIHdpdGggTGludXggPj0gNS4xMi4xIDwgNS4xMy4wCj4gLS0tCj4gICAuLi5maXgtYnVp
bGRpbmctd2l0aC1MaW51eC12ZXJzaW9uLTUuMTMucGF0Y2ggfCA2OCArKysrKysrKysrKysrKysr
KysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UveHI4MTkteHJhZGlvLzAwMDEtbWFpbi5jLWZpeC1idWlsZGluZy13aXRo
LUxpbnV4LXZlcnNpb24tNS4xMy5wYXRjaAo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UveHI4MTkt
eHJhZGlvLzAwMDEtbWFpbi5jLWZpeC1idWlsZGluZy13aXRoLUxpbnV4LXZlcnNpb24tNS4xMy5w
YXRjaCBiL3BhY2thZ2UveHI4MTkteHJhZGlvLzAwMDEtbWFpbi5jLWZpeC1idWlsZGluZy13aXRo
LUxpbnV4LXZlcnNpb24tNS4xMy5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXgg
MDAwMDAwMDAwMC4uM2I5NzQyMDEyZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3hy
ODE5LXhyYWRpby8wMDAxLW1haW4uYy1maXgtYnVpbGRpbmctd2l0aC1MaW51eC12ZXJzaW9uLTUu
MTMucGF0Y2gKPiBAQCAtMCwwICsxLDY4IEBACj4gK0Zyb20gNDg3Mzc0NmZhOWQ0MmE4ZWRiYzFl
MTkyODk5ZTAwYzI5ZWQzZDMyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogR2l1
bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4gK0Rh
dGU6IE1vbiwgMTcgSmFuIDIwMjIgMTI6MjY6MDAgKzAxMDAKPiArU3ViamVjdDogW1BBVENIXSBt
YWluLmM6IGZpeCBidWlsZGluZyB3aXRoIExpbnV4IHZlcnNpb24gPj0gNS4xMwo+ICsKPiArb2Zf
Z2V0X21hY19hZGRyZXNzKCkgb24gTGludXggdmVyc2lvbiA+PSA1LjEzIHJlcXVpcmVzIG1hYyBw
b2ludGVyIGFzCj4gK3NlY29uZCBhcmd1bWVudCBhbmQgcmV0dXJuIGFuIGludC4gU28gbGV0J3Mg
ZGVhbCB3aXRoIGl0IGJ5IGNoZWNraW5nIGxpbnV4Cj4gK3ZlcnNpb24gdG8gbWFrZSBpdCBjb21w
YXRpYmxlIHdpdGggYm90aCBMaW51eCB2ZXJzaW9uID49IDUuMTMgYW5kIG5vdC4KPiArCj4gK1Np
Z25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5l
ZXJpbmcuY29tPgo+ICstLS0KPiArIG1haW4uYyB8IDE3ICsrKysrKysrKysrKysrKysrCj4gKyAx
IGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQo+ICsKPiArZGlmZiAtLWdpdCBhL21haW4u
YyBiL21haW4uYwo+ICtpbmRleCBiNjBlMThkLi4wNmNiMWY2IDEwMDY0NAo+ICstLS0gYS9tYWlu
LmMKPiArKysrIGIvbWFpbi5jCj4gK0BAIC0xMyw2ICsxMyw3IEBACj4gKyAjaW5jbHVkZSA8bmV0
L2NmZzgwMjExLmg+Cj4gKyAjaW5jbHVkZSA8bGludXgvb2ZfbmV0Lmg+Cj4gKyAjaW5jbHVkZSA8
bGludXgvbW1jL3NkaW9fZnVuYy5oPgo+ICsrI2luY2x1ZGUgPGxpbnV4L3ZlcnNpb24uaD4KPiAr
Cj4gKyAjaW5jbHVkZSAieHJhZGlvLmgiCj4gKyAjaW5jbHVkZSAiZndpby5oIgo+ICtAQCAtNDk5
LDggKzUwMCwxMiBAQCBpbnQgeHJhZGlvX2NvcmVfaW5pdChzdHJ1Y3Qgc2Rpb19mdW5jKiBmdW5j
KQo+ICsgCWludCBpZl9pZDsKPiArIAlzdHJ1Y3QgaWVlZTgwMjExX2h3ICpkZXY7Cj4gKyAJc3Ry
dWN0IHhyYWRpb19jb21tb24gKmh3X3ByaXY7Cj4gKysjaWYgTElOVVhfVkVSU0lPTl9DT0RFID49
IEtFUk5FTF9WRVJTSU9OKDUsIDEzLCAwKQo+ICsrCXVuc2lnbmVkIGNoYXIgYWRkcltFVEhfQUxF
Tl07Cj4gKysjZWxzZQo+ICsgCXVuc2lnbmVkIGNoYXIgcmFuZG9tYWRkcltFVEhfQUxFTl07Cj4g
KyAJY29uc3QgdW5zaWduZWQgY2hhciAqYWRkciA9IE5VTEw7Cj4gKysjZW5kaWYKPiArCj4gKyAJ
Ly9pbml0IHhyYWRpb19jb21tb24KPiArIAlkZXYgPSB4cmFkaW9faW5pdF9jb21tb24oc2l6ZW9m
KHN0cnVjdCB4cmFkaW9fY29tbW9uKSk7Cj4gK0BAIC01MTMsNiArNTE4LDE2IEBAIGludCB4cmFk
aW9fY29yZV9pbml0KHN0cnVjdCBzZGlvX2Z1bmMqIGZ1bmMpCj4gKyAJaHdfcHJpdi0+c2Rpb19m
dW5jID0gZnVuYzsKPiArIAlzZGlvX3NldF9kcnZkYXRhKGZ1bmMsIGh3X3ByaXYpOwo+ICsKPiAr
KyNpZiBMSU5VWF9WRVJTSU9OX0NPREUgPj0gS0VSTkVMX1ZFUlNJT04oNSwgMTMsIDApCj4gKysJ
Ly8gZmlsbCBpbiBtYWMgYWRkcmVzc2VzCj4gKysJaWYgKGh3X3ByaXYtPnBkZXYtPm9mX25vZGUp
IHsKPiArKwkJZXJyID0gb2ZfZ2V0X21hY19hZGRyZXNzKGh3X3ByaXYtPnBkZXYtPm9mX25vZGUs
IGFkZHIpOwo+ICsrCX0KPiArKwlpZiAoZXJyIDwgMCkgewo+ICsrCQlkZXZfd2Fybihod19wcml2
LT5wZGV2LCAibm8gbWFjIGFkZHJlc3MgcHJvdmlkZWQsIHVzaW5nIHJhbmRvbVxuIik7Cj4gKysJ
CWV0aF9yYW5kb21fYWRkcihhZGRyKTsKPiArKwl9Cj4gKysjZWxzZQo+ICsgCS8vIGZpbGwgaW4g
bWFjIGFkZHJlc3Nlcwo+ICsgCWlmIChod19wcml2LT5wZGV2LT5vZl9ub2RlKSB7Cj4gKyAJCWFk
ZHIgPSBvZl9nZXRfbWFjX2FkZHJlc3MoaHdfcHJpdi0+cGRldi0+b2Zfbm9kZSk7Cj4gK0BAIC01
MjIsNiArNTM3LDggQEAgaW50IHhyYWRpb19jb3JlX2luaXQoc3RydWN0IHNkaW9fZnVuYyogZnVu
YykKPiArIAkJZXRoX3JhbmRvbV9hZGRyKHJhbmRvbWFkZHIpOwo+ICsgCQlhZGRyID0gcmFuZG9t
YWRkcjsKPiArIAl9Cj4gKysjZW5kaWYKPiArKwo+ICsgCW1lbWNweShod19wcml2LT5hZGRyZXNz
ZXNbMF0uYWRkciwgYWRkciwgRVRIX0FMRU4pOwo+ICsgCW1lbWNweShod19wcml2LT5hZGRyZXNz
ZXNbMV0uYWRkciwgYWRkciwgRVRIX0FMRU4pOwo+ICsgCWh3X3ByaXYtPmFkZHJlc3Nlc1sxXS5h
ZGRyWzVdICs9IDB4MDE7Cj4gKy0tCj4gKzIuMjUuMQo+ICsKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
