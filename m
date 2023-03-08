Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE4CC64EC4
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 10:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFC6A81EC0;
	Wed,  8 Mar 2023 10:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFC6A81EC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJ_XlwAQB1GR; Wed,  8 Mar 2023 10:10:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B2EC81EB9;
	Wed,  8 Mar 2023 10:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B2EC81EB9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 707761BF5B3
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 10:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A13681EB9
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 10:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A13681EB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yGGmf_wa8EJO for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 10:10:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC83A81EB8
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC83A81EB8
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 10:10:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso868861wmi.4
 for <buildroot@buildroot.org>; Wed, 08 Mar 2023 02:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678270230;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rEZ/0VFZY5MOIvxltvM0LJCD4hw0ATju/dUolm0vCHg=;
 b=1IrMTtGqmxOFBfc8GsZPYauKqoupiLnytfuSYbHjWQFEUa7nSNrVv8FEZvQW+yRIAe
 TeflVLbfyz3KXiKml0VuIP/EDgcEE5YnVkot7DHvYr9kJzjP8lBqVGj6p2yQ72vHFEBQ
 wZNlYisaBtFazJ9mV/LV0uXgxXIr9d0XWWTn4bryUbXPjksWGTwpqaNqu4VCMjggxT6Y
 IiKM9vn3jg/uBG/W3E2g/z0XZqQJwWMzCLVPLJe1y+KJJ1Zbq1xhn3Jg55zW3qm9PTQa
 q5N3lak0b3rhzHzppznNhlXuvXNLxZ3t0ukJB1q6K8FIiiu/P18BScKlhFghLopG4OfQ
 nppw==
X-Gm-Message-State: AO0yUKUWr9uWg+tjubCJIkf4XTj+4/IopKhp2ywGnp6H1ouFwqIppX6c
 8fW8MAoNc/i2rk9SD3w1LbWs8fj/Cct8OpoZPyU=
X-Google-Smtp-Source: AK7set+KkxxkXJOK8bIf7xT84JZ1K1WehK28GPdY9dGhdkG1X0nZiQWKZcvaBNPtUIJBlLmD92NYGQ==
X-Received: by 2002:a05:600c:198e:b0:3e2:1ef0:f585 with SMTP id
 t14-20020a05600c198e00b003e21ef0f585mr15210856wmq.2.1678270229875; 
 Wed, 08 Mar 2023 02:10:29 -0800 (PST)
Received: from [10.5.2.139]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 hu21-20020a05600ca29500b003eaee9e0d22sm15389453wmb.33.2023.03.08.02.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 02:10:29 -0800 (PST)
Message-ID: <fc23122a-da80-4c13-304e-f295be4d06de@smile.fr>
Date: Wed, 8 Mar 2023 11:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
References: <20230308085354.127183-1-sebastian.weyer@smile.fr>
 <20230308085354.127183-3-sebastian.weyer@smile.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230308085354.127183-3-sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678270230;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rEZ/0VFZY5MOIvxltvM0LJCD4hw0ATju/dUolm0vCHg=;
 b=CNKkMpqxOmAkPvad4VrQNanHdGlHXH/xgMnTtninzqHYnkZoOOFRGSkMD940/cQhlI
 NX9iNu8XPlONqtoXJdNHI7ZUB52mQ6lnKxXN/BIN/ETOBlRPxBug/AYkF2HgNaniPrLT
 PBWXFlCI0J3D0HAMm/BG9jiAps/lBY1Sf3/ZBZg8qUV1NxQf1S1f1J5MeLOXXyQz8IqK
 hwWffatnECME62DsAbLXtLHzEXhdz2RmYE4ss6hpzD6f+eE/0V/NEd8l1hq2b0gCWF5V
 8R8BEygbVem5mfpT6rKwkzmxmDaw9jiV7neOo+AfWwM6vLCOpK7iS6r9Ytl/IAiwp9hK
 salw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=CNKkMpqx
Subject: Re: [Buildroot] [PATCH v5 3/3]
 support/testing/tests/package/test_nu.py: New runtime test
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

TGUgMDgvMDMvMjAyMyDDoCAwOTo1MywgU2ViYXN0aWFuIFdleWVyIGEgw6ljcml0wqA6Cj4gTG9h
ZCBzYW1wbGUgc2NyaXB0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9udS5u
dSBvbnRvIHRoZQo+IHRhcmdldCBhbmQgdmVyaWZ5IHByb3BlciBleGVjdXRpb24gYnkgbnVzaGVs
bAo+IAo+IFNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBXZXllciA8c2ViYXN0aWFuLndleWVyQHNt
aWxlLmZyPgo+IC0tLQo+ICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMiArCj4gIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9udS5udSB8
ICA2ICsrCj4gIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbnUucHkgICB8IDY1
ICsrKysrKysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCA3MyBpbnNlcnRpb25z
KCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9z
YW1wbGVfbnUubnUKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfbnUucHkKPiAKPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BF
UlMKPiBpbmRleCA0NTc3ZjIwYjIyLi43MjZjZDczYWY3IDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BF
UlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTI1NTIsNiArMjU1Miw4IEBAIEY6CXBhY2thZ2Uv
cmlwZ3JlcC8KPiAgCj4gIE46ICBTZWJhc3RpYW4gV2V5ZXIgPHNlYmFzdGlhbi53ZXllckBzbWls
ZS5mcj4KPiAgRjoJcGFja2FnZS9udXNoZWxsLwo+ICtGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
cGFja2FnZS90ZXN0X251LnB5Cj4gK0Y6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Nh
bXBsZV9udS5udQo+ICAKPiAgTjoJU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenlt
YW5za2lAYXJtYWRldXMuY29tPgo+ICBGOglwYWNrYWdlL21tYy11dGlscy8KPiBkaWZmIC0tZ2l0
IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX251Lm51IGIvc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX251Lm51Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwMDAwLi44OTA0YjI5OTMzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3N1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9udS5udQo+IEBAIC0wLDAgKzEsNiBA
QAoKRG8gd2UgbmVlZCBhIHNoZWJhbmcgaGVyZSA/Cgo+ICsjIG15c2NyaXB0Lm51CgpSZW1vdmUg
dGhpcyBjb21tZW50LgoKPiArZGVmIGdyZWV0IFtuYW1lXSB7Cj4gKyAgWyJoZWxsbyIgJG5hbWVd
Cj4gK30KPiArCj4gK2dyZWV0ICJ3b3JsZCIKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF9udS5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3Rlc3RfbnUucHkKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmI3
Y2E1MjAzOGQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF9udS5weQo+IEBAIC0wLDAgKzEsNjUgQEAKPiAraW1wb3J0IG9zCj4gKwo+ICtp
bXBvcnQgaW5mcmEuYmFzZXRlc3QKPiArCj4gK2NsYXNzIFRlc3ROdUJhc2UoaW5mcmEuYmFzZXRl
c3QuQlJUZXN0KToKPiArICAgICMgaW5mcmEuYmFzZXRlc3QuQkFTSUNfVE9PTENIQUlOX0NPTkZJ
RyBjYW5ub3QgYmUgdXNlZCBhcyBpdCBkb2Vzbid0Cj4gKyAgICAjIHN1cHBvcnQgYSBob3N0IHJ1
c3RjIHdoaWNoIGlzIG5lY2Vzc2FyeSBmb3IgbnVzaGVsbAo+ICsgICAgY29uZmlnID0gXAo+ICsg
ICAgICAgICIiIgo+ICsgICAgICAgIEJSMl9hcm09eQo+ICsgICAgICAgIEJSMl9jb3J0ZXhfYTk9
eQo+ICsgICAgICAgIEJSMl9BUk1fRU5BQkxFX05FT049eQo+ICsgICAgICAgIEJSMl9BUk1fRU5B
QkxFX1ZGUD15Cj4gKyAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15Cj4gKyAgICAgICAg
QlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX1BPUlQ9InR0eUFNQTAiCj4gKyAgICAgICAgQlIyX1NZ
U1RFTV9ESENQPSJldGgwIgo+ICsgICAgICAgIEJSMl9QQUNLQUdFX05VU0hFTEw9eQo+ICsgICAg
ICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQo+ICsgICAgICAgICIiIgo+ICsKPiArICAgIGRl
ZiBsb2dpbihzZWxmKToKPiArICAgICAgICBpbWcgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRp
ciwgImltYWdlcyIsICJyb290ZnMuY3BpbyIpCj4gKyAgICAgICAgc2VsZi5lbXVsYXRvci5ib290
KGFyY2g9ImFybXY3IiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAga2VybmVsPSJidWls
dGluIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgb3B0aW9ucz1bIi1pbml0cmQiLGlt
Z10pCj4gKyAgICAgICAgc2VsZi5lbXVsYXRvci5sb2dpbigpCj4gKwo+ICsjIGxvYWQgYSBzY2lw
dCBvbiB0aGUgdGFyZ2V0IGFuZCBjaGVjayBpZiBpdCBpcyBleGVjdXRlZCBjb3JyZWN0bHkgYnkg
bnUKPiArY2xhc3MgVGVzdE51KFRlc3ROdUJhc2UpOgo+ICsgICAgY29uZmlnX3NhbXBsZV9zY3Jp
cHRzID0gXAo+ICsgICAgICAgICIiIgo+ICsgICAgICAgIEJSMl9ST09URlNfUE9TVF9CVUlMRF9T
Q1JJUFQ9Int9Igo+ICsgICAgICAgIEJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0ie30iCj4g
KyAgICAgICAgIiIiLmZvcm1hdChpbmZyYS5maWxlcGF0aCgidGVzdHMvcGFja2FnZS9jb3B5LXNh
bXBsZS1zY3JpcHQtdG8tdGFyZ2V0LnNoIiksCj4gKyAgICAgICAgICAgICAgICAgICAie3NhbXBs
ZV9zY3JpcHRzfSIpCj4gKwo+ICsgICAgI3NpbXBsZSBoZWxsbyB3b3JsZCBzY3JpcHQgZm91bmQg
aW4gdGhlIG51c2hlbGwgZG9jCj4gKyAgICBzYW1wbGVfc2NyaXB0cyA9IFsidGVzdHMvcGFja2Fn
ZS9zYW1wbGVfbnUubnUiXQo+ICsKPiArICAgIHRpbWVvdXQgPSAtMQoKLTEgc2VlbXMgdGhlIGRl
ZmF1bHQgdmFsdWUgZm9yIHRpbWVvdXQuCgo+ICsgICAgaW50ZXJwcmV0ZXIgPSAibnUiCj4gKwo+
ICsgICAgZGVmIF9faW5pdF9fKHNlbGYsIG5hbWVzKToKPiArICAgICAgICAiIiJBZGQgdGhlIHNj
cmlwdHMgdG8gdGhlIHRhcmdldCBpbiBidWlsZCB0aW1lLiIiIgo+ICsgICAgICAgIHN1cGVyKFRl
c3ROdUJhc2UsIHNlbGYpLl9faW5pdF9fKG5hbWVzKQo+ICsgICAgICAgIHNjcmlwdHMgPSBbaW5m
cmEuZmlsZXBhdGgocykgZm9yIHMgaW4gc2VsZi5zYW1wbGVfc2NyaXB0c10KPiArICAgICAgICBz
ZWxmLmNvbmZpZyArPSBzZWxmLmNvbmZpZ19zYW1wbGVfc2NyaXB0cy5mb3JtYXQoc2FtcGxlX3Nj
cmlwdHM9IiAiLmpvaW4oc2NyaXB0cykpCj4gKwo+ICsgICAgZGVmIGNoZWNrX3NhbXBsZV9zY3Jp
cHRzX2V4aXN0KHNlbGYpOgo+ICsgICAgICAgICIiIkNoZWNrIHRoZSBzY3JpcHRzIHdlcmUgcmVh
bGx5IGFkZGVkIHRvIHRoZSBpbWFnZS4iIiIKPiArICAgICAgICBzY3JpcHRzID0gW29zLnBhdGgu
YmFzZW5hbWUocykgZm9yIHMgaW4gc2VsZi5zYW1wbGVfc2NyaXB0c10KPiArICAgICAgICBjbWQg
PSAibWQ1c3VtICIgKyAiICIuam9pbihzY3JpcHRzKQo+ICsgICAgICAgIF8sIGV4aXRfY29kZSA9
IHNlbGYuZW11bGF0b3IucnVuKGNtZCkKPiArICAgICAgICBzZWxmLmFzc2VydEVxdWFsKGV4aXRf
Y29kZSwgMCkKPiArCj4gKyAgICBkZWYgcnVuX3NhbXBsZV9zY3JpcHRzKHNlbGYpOgo+ICsgICAg
ICAgICIiIlJ1biBlYWNoIHNjcmlwdCBwcmV2aW91c2x5IGFkZGVkIHRvIHRoZSBpbWFnZS4iIiIK
PiArICAgICAgICBmb3Igc2NyaXB0IGluIHNlbGYuc2FtcGxlX3NjcmlwdHM6Cj4gKyAgICAgICAg
ICAgIGNtZCA9IHNlbGYuaW50ZXJwcmV0ZXIgKyAiICIgKyBvcy5wYXRoLmJhc2VuYW1lKHNjcmlw
dCkKCk1heWJlIHdlIGNhbiBqdXN0IHVzZSAibnUgIiArIG9zLnBhdGguYmFzZW5hbWUoc2NyaXB0
KQoKSSBndWVzcyB5b3UgdXNlZCB0aGUgcHl0aG9uIGluZnJhIGV4YW1wbGUuCgo+ICsgICAgICAg
ICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCwgdGltZW91dD1zZWxmLnRpbWVvdXQpCj4gKwo+ICsg
ICAgZGVmIHRlc3RfcnVuKHNlbGYpOgo+ICsgICAgICAgIHNlbGYubG9naW4oKQo+ICsgICAgICAg
IHNlbGYuY2hlY2tfc2FtcGxlX3NjcmlwdHNfZXhpc3QoKQo+ICsgICAgICAgIHNlbGYucnVuX3Nh
bXBsZV9zY3JpcHRzKCkKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
