Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13DCC64EC4
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 09:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B8588129B;
	Wed,  8 Mar 2023 09:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B8588129B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mK-gj4h4CCKL; Wed,  8 Mar 2023 09:54:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 983508126A;
	Wed,  8 Mar 2023 09:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 983508126A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8984A1BF47F
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 09:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6397981263
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 09:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6397981263
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ntdTZsNHUBn3 for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 09:53:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE38E81258
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE38E81258
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 09:53:55 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso744085wms.5
 for <buildroot@buildroot.org>; Wed, 08 Mar 2023 01:53:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678269234;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AriCedLKrlVC16G1Onyj9MMPSixuyqKe2ZYhELZjhCU=;
 b=IkMwzlkyvx7tE2oEsnqOZUWMFHJHA9hWO22LUwMpNVNLUX0/nP2zGasYle0Ac/bmYG
 cNpwICF46gHK0iw0ZdXi7IKylin5laIJnI285CvRqZeI11vxbf5/OfRaRcNf8euJTGuj
 NPadR15Vt6ucIW7+2Mv7tbneXQ1KTs9ZhytWqbT8r6UoY3LrHpdLV0Ebo309MPQXEu8Z
 mh2XKsuTfhxlz74dLque6MTtA6o0XAoI/ubScBtau6p+6sCdDpQg2vrlg0AZbexMOwdF
 76wPy730C6K4sGXpkLsvF92RgIEKY0msUCMJUWlSnOPpoemnflMaTYvpxuwyGmym0hVL
 atZQ==
X-Gm-Message-State: AO0yUKVjP5l2DoX8lFKWU76kZ6wAP4691MSODUquOKRZXYI6t5T5pEGH
 Y1LoIB4nyK+1I90LHJp9H63inwoRbkDPL5UH6x8=
X-Google-Smtp-Source: AK7set8d1d0QoJWGPo/i4COk/2zHLPrwYXpCx6UmYz6cDY0MvCUPYPcMOHzGQDSnnFxCsX5SOUul7g==
X-Received: by 2002:a05:600c:3591:b0:3eb:3998:8c05 with SMTP id
 p17-20020a05600c359100b003eb39988c05mr12655208wmq.6.1678269233718; 
 Wed, 08 Mar 2023 01:53:53 -0800 (PST)
Received: from [10.5.2.139]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c359000b003e209b45f6bsm21214085wmq.29.2023.03.08.01.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 01:53:53 -0800 (PST)
Message-ID: <cf6ffb4e-da3d-5f13-0be5-d71c7a9dbfed@smile.fr>
Date: Wed, 8 Mar 2023 10:53:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
References: <20230308085354.127183-1-sebastian.weyer@smile.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230308085354.127183-1-sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678269234;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AriCedLKrlVC16G1Onyj9MMPSixuyqKe2ZYhELZjhCU=;
 b=e10Uax1KJMfz/pl2ZRu3V2kFGbHV740srSN+DECc8KKOEcgJFfs6kzVFUihWCITBSB
 4Kd+2U/0DIn7ucX6DLTXGKY0qTO6vR0LBqRegRif/OEx69sOyg+4cPj6EuGBGI6mmslU
 Gb3eXFj0RorB4WLHJMEdcrHyzMQFPgY07SBhqZcseQ/bwcKfVhTKgZusvsN0Hxqc5oTH
 9j20K40ZaDpHvkGSNgRjv+Z9vMuX/WIGdEk7c5s3HOPLHmy3LggBvNQjOib2Hs1jrfJB
 Ls3gY80JRMsuj4KNXILLt6V1Iv+EFU4ELKz/baCp3mlYlnNKQxOuvVeJxQkshXuwT3e7
 4IYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=e10Uax1K
Subject: Re: [Buildroot] [PATCH v5 1/3] package/nushell: new package
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

TGUgMDgvMDMvMjAyMyDDoCAwOTo1MywgU2ViYXN0aWFuIFdleWVyIGEgw6ljcml0wqA6Cj4gTnVz
aGVsbCBpcyBhIHNoZWxsIC0gd3JpdHRlbiBpbiBSdXN0IC0gdGhhdCBtYWtlcyB1c2Ugb2YgdGhl
IG51c2hlbGwKPiBsYW5ndWFnZSB0byBpbnRlcmFjdCB3aXRoIHRoZSBvcGVyYXRpbmcgc3lzdGVt
Cj4gCj4gU2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIFdleWVyIDxzZWJhc3RpYW4ud2V5ZXJAc21p
bGUuZnI+Cj4gLS0tCj4gVGhpcyBuZXcgdmVyc2lvbiBhZGRzIG5jdXJzZXMtdGFyZ2V0LXByb2dz
IGFzIGEgZGVwZW5kZW5jeSB3aGljaCBpcyBhCj4gaGlkZGVuIGRlcGVuZGVuY3kgb2YgbnVzaGVs
bC4gV2l0aCB0aGlzIG9wdGlvbiBlbmFibGVkLCBudXNoZWxsIGlzIGFsc28KPiB1c2FibGUgd2l0
aG91dCBzcGVjaWZpY2FsbHkgcmVwbGFjaW5nIGdldHR5IGJ5IGFnZXR0eS4KCkZvciB0aGUgbmV4
dCB0aW1lLCBwbGVhc2Uga2VlcCB0aGUgaGlzdG9yeSBvZiBjaGFuZ2VzIGJldHdlZW4gZWFjaCBu
ZXcgdmVyc2lvbi4KCj4gCj4gU2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIFdleWVyIDxzZWJhc3Rp
YW4ud2V5ZXJAc21pbGUuZnI+Cj4gLS0tCj4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAg
fCAgMyArKysKPiAgcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICB8ICAxICsKPiAgcGFja2Fn
ZS9udXNoZWxsL0NvbmZpZy5pbiAgICB8IDEyICsrKysrKysrKysrKwo+ICBwYWNrYWdlL251c2hl
bGwvbnVzaGVsbC5oYXNoIHwgIDIgKysKPiAgcGFja2FnZS9udXNoZWxsL251c2hlbGwubWsgICB8
IDIwICsrKysrKysrKysrKysrKysrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9u
cygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9udXNoZWxsL0NvbmZpZy5pbgo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9udXNoZWxsL251c2hlbGwuaGFzaAo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9udXNoZWxsL251c2hlbGwubWsKPiAKPiBkaWZmIC0tZ2l0IGEv
REVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRleCA2MjU2NTc2ZTAyLi40NTc3ZjIwYjIyIDEw
MDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTI1NTAsNiAr
MjU1MCw5IEBAIEY6CXN1cHBvcnQvbWlzYy90b29sY2hhaW5maWxlLmNtYWtlLmluCj4gIE46CVNh
bSBWb3NzIDxzYW0udm9zc0BnbWFpbC5jb20+Cj4gIEY6CXBhY2thZ2UvcmlwZ3JlcC8KPiAgCj4g
K046ICBTZWJhc3RpYW4gV2V5ZXIgPHNlYmFzdGlhbi53ZXllckBzbWlsZS5mcj4KClNtYWxsIGlu
ZGVudGF0aW9uIGlzc3VlLgoKPiArRjoJcGFja2FnZS9udXNoZWxsLwo+ICsKPiAgTjoJU8OpYmFz
dGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgo+ICBGOglw
YWNrYWdlL21tYy11dGlscy8KPiAgRjoJcGFja2FnZS9weXRob24tZmxhc2stanNvbnJwYy8KPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4
IDNhY2UyNWM2NjUuLjdmY2E0NmFmYjUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4K
PiArKysgYi9wYWNrYWdlL0NvbmZpZy5pbgo+IEBAIC0yNTc3LDYgKzI1NzcsNyBAQCBjb21tZW50
ICJTaGVsbHMiCj4gIAlzb3VyY2UgInBhY2thZ2UvYmFzaC9Db25maWcuaW4iCj4gIAlzb3VyY2Ug
InBhY2thZ2UvZGFzaC9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvbWtzaC9Db25maWcu
aW4iCj4gKwlzb3VyY2UgInBhY2thZ2UvbnVzaGVsbC9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBh
Y2thZ2UvenNoL0NvbmZpZy5pbiIKPiAgY29tbWVudCAiVXRpbGl0aWVzIgo+ICAJc291cmNlICJw
YWNrYWdlL2FwZy9Db25maWcuaW4iCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbnVzaGVsbC9Db25m
aWcuaW4gYi9wYWNrYWdlL251c2hlbGwvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwMDAwLi5lZGIwMWQyZjcyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Bh
Y2thZ2UvbnVzaGVsbC9Db25maWcuaW4KPiBAQCAtMCwwICsxLDEyIEBACj4gK2NvbmZpZyBCUjJf
UEFDS0FHRV9OVVNIRUxMCj4gKwlib29sICJudXNoZWxsIgo+ICsJZGVwZW5kcyBvbiBCUjJfUEFD
S0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTCj4gKwlzZWxlY3QgQlIyX1BBQ0tB
R0VfSE9TVF9SVVNUQwo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX09QRU5TU0wKPiArCXNlbGVjdCBC
UjJfUEFDS0FHRV9IT1NUX1BLR0NPTkYKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9OQ1VSU0VTCj4g
KwlzZWxlY3QgQlIyX1BBQ0tBR0VfTkNVUlNFU19UQVJHRVRfUFJPR1MKPiArCWhlbHAKPiArCSAg
QSBuZXcgdHlwZSBvZiBzaGVsbC4KPiArCj4gKwkgIGh0dHBzOi8vZ2l0aHViLmNvbS9udXNoZWxs
L251c2hlbGwKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9udXNoZWxsL251c2hlbGwuaGFzaCBiL3Bh
Y2thZ2UvbnVzaGVsbC9udXNoZWxsLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAuLmE3N2U3MTFhNWQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9u
dXNoZWxsL251c2hlbGwuaGFzaAo+IEBAIC0wLDAgKzEsMiBAQAo+ICsjIExvY2FsbHkgZ2VuZXJh
dGVkCj4gK3NoYTI1NiAgMzUyZTgwNzY5OGQ1Zjk1ZTliZmRkOWRkNTUxMmFjYWIzY2JlZjMxNTM3
OTI5OWEzMmU1ZjMyMmE3NmViNzE4YSAgbnVzaGVsbC0wLjc2LjAudGFyLmd6CgpNaXNzaW5nIGhh
c2ggb2YgdGhlIExJQ0VOU0UgZmlsZS4KCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbnVzaGVsbC9u
dXNoZWxsLm1rIGIvcGFja2FnZS9udXNoZWxsL251c2hlbGwubWsKPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjgzNmY0MTRkMGEKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvcGFja2FnZS9udXNoZWxsL251c2hlbGwubWsKPiBAQCAtMCwwICsxLDIwIEBACj4gKyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBudXNoZWxsCj4gKyMKPiArIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPiArCj4gK05VU0hFTExfVkVSU0lPTiA9IDAuNzYuMAo+ICtOVVNIRUxMX1NJ
VEUgPSAkKGNhbGwgZ2l0aHViLG51c2hlbGwsbnVzaGVsbCwkKE5VU0hFTExfVkVSU0lPTikpCj4g
K05VU0hFTExfTElDRU5TRSA9IE1JVAo+ICtOVVNIRUxMX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNF
Cj4gK05VU0hFTExfREVQRU5ERU5DSUVTID0gb3BlbnNzbCBob3N0LXBrZ2NvbmYgbmN1cnNlcwoK
UGxlYXNlIGRvbid0IG1peCBob3N0IGFuZCB0YXJnZXQgcGFja2FnZSBpbiB0aGlzIGxpc3QuCgo+
ICsKPiArIyBBZGQgL2Jpbi9udSB0byAvZXRjL3NoZWxscyBhcyBpbiBwYWNrYWdlL2Jhc2gvYmFz
aC5tawoKbnUgaXMgaW5zdGFsbGVkIGludG8gL3Vzci9iaW4vIG5vdCAvYmluLgoKTWF5YmUgeW91
IGhhZCBCUjJfUk9PVEZTX01FUkdFRF9VU1I9eSA/CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4g
K2RlZmluZSBOVVNIRUxMX0FERF9OVV9UT19TSEVMTFMKPiArCWdyZXAgLXFzRSAnXi9iaW4vbnUk
JCcgJChUQVJHRVRfRElSKS9ldGMvc2hlbGxzIFwKPiArCQl8fCBlY2hvICIvYmluL251IiA+PiAk
KFRBUkdFVF9ESVIpL2V0Yy9zaGVsbHMKPiArZW5kZWYKPiArTlVTSEVMTF9UQVJHRVRfRklOQUxJ
WkVfSE9PS1MgKz0gTlVTSEVMTF9BRERfTlVfVE9fU0hFTExTCj4gKwo+ICskKGV2YWwgJChjYXJn
by1wYWNrYWdlKSkKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
