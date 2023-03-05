Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4232C6FA8E
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 22:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FF204016D;
	Sun,  5 Mar 2023 22:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FF204016D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y4CmQJmElZ02; Sun,  5 Mar 2023 22:14:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BF0940158;
	Sun,  5 Mar 2023 22:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BF0940158
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A0101BF30D
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 22:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4FC560BBA
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 22:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4FC560BBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pjP2Xr8rUuLL for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 22:14:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1908060AED
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1908060AED
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 22:14:26 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q16so7048660wrw.2
 for <buildroot@buildroot.org>; Sun, 05 Mar 2023 14:14:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8akPZfAhNywrcUCMZ1jzcDC1Y/dJ7lpkIsG+FYEL+1g=;
 b=vUGAwWzDRXEODlF4sfbeglqvZ7IL34lQolA9FRi5EcCiUR1fdLSjjK35i1tkWntgOV
 5CbHd94DJh0rbIvIFxaiCFNLV4UlChTNeNvWJCsB9t1+7lRCLz7EojIh87wPeQbX+nNW
 Z6Uu+rU1o5t6nq9pfQtkH1U5ZvjN9TXsgaV299h+RJq5VAo4Z8dVpfbuKh2ye3ZTHASg
 2JZBm5kgxagb6FtGXivAPs1bxD6iSeMnqgRCg6IO8M5Xy5aquQdaQG1Ss0Z3bGwOtVsc
 yrT1cj+2DyJvt18ynOjpvgTfaDUTLdw4reEgfR1DnOUNez6Y3ct87KONZ//YKBQdyZLO
 F0mg==
X-Gm-Message-State: AO0yUKXc/Zg1O6ENv5nsIkniUWOF9OmEIvnQ6Sv8xXoVIV6YH5CoAMy+
 zV1dnsVI3WTt2fV+RWKMBJdLIQ==
X-Google-Smtp-Source: AK7set/3P5/Se0IdKo2IuuiuWtFXKmE4TtZ3xQSC6JXFo4LYH8eLyS9vJ7w72mG5Tam2MCfe2Z/ITA==
X-Received: by 2002:a5d:4b44:0:b0:2c7:156c:affd with SMTP id
 w4-20020a5d4b44000000b002c7156caffdmr4277487wrs.9.1678054464838; 
 Sun, 05 Mar 2023 14:14:24 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 f2-20020adfdb42000000b002c54fb024b2sm8130903wrj.61.2023.03.05.14.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 14:14:24 -0800 (PST)
Message-ID: <bd00794b-bb55-a8cb-2dd7-de437d436f25@smile.fr>
Date: Sun, 5 Mar 2023 23:14:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
References: <20230303073909.1798364-1-sebastian.weyer@smile.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230303073909.1798364-1-sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8akPZfAhNywrcUCMZ1jzcDC1Y/dJ7lpkIsG+FYEL+1g=;
 b=mSc72qFigotncnMYOebRQoCUvkRaFLXEB6Sso/gaYjJkx96hiJCPzopVsunbg7vcPK
 3CdYSv3hFySXliYpDgibTDZQsYPGL20qe6pjQHefWl9Um1P5wyTj9spC/xChLS37dIp5
 RmpkCRDqkzKdYdJV/IIbGEp9uLfd7B76gsg+a3rfgzZLdSjhwTWJLYDdK08ggy2hs+hq
 2negN72fDDSedCcM51K0budLBQiMKWIJtyOu6AXos43UpOVqgq9lBtRopFRcIOx5eSR+
 zcxuXgxJLghcINv7k3LxQFGP4J9Vo2S2oxJRjFGNgvErFe1M3w6rHrmewjQwIdbAHb+p
 M2vQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=mSc72qFi
Subject: Re: [Buildroot] [PATCH v3 1/2] package/nushell: new package
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

SGVsbG8gU2ViYXN0aWFuLAoKTGUgMDMvMDMvMjAyMyDDoCAwODozOSwgU2ViYXN0aWFuIFdleWVy
IGEgw6ljcml0wqA6Cj4gTnVzaGVsbCBpcyBhIHNoZWxsIC0gd3JpdHRlbiBpbiBSdXN0IC0gdGhh
dCBtYWtlcyB1c2Ugb2YgdGhlIG51c2hlbGwKPiBsYW5ndWFnZSB0byBpbnRlcmFjdCB3aXRoIHRo
ZSBvcGVyYXRpbmcgc3lzdGVtCj4gCj4gU2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIFdleWVyIDxz
ZWJhc3RpYW4ud2V5ZXJAc21pbGUuZnI+Cj4gLS0tCj4gSWYgeW91IGNvbm5lY3QgdmlhIGEgc2Vy
aWFsIHBvcnQgYW5kIHVzZSBnZXR0eSAoZGVmYXVsdCBmb3IgYnVzeWJveCkKPiBudXNoZWxsIHdp
bGwgYmUgdW51c2FibGUuIE9uZSBuZWVkcyB0byBlaXRoZXIgY29ubmVjdCB2aWEgU1NIIG9yIHVz
ZQo+IGFnZXR0eSBpbnN0ZWFkLgoKQWN0dWFsbHkgbnVzaGVsbCBuZWVkcyB0cHV0IHRvb2wgZnJv
bSBuY3Vyc2VzIChCUjJfUEFDS0FHRV9OQ1VSU0VTX1RBUkdFVF9QUk9HUykKClNlZToKaHR0cHM6
Ly9naXRodWIuY29tL2Nyb3NzdGVybS1ycy9jcm9zc3Rlcm0vYmxvYi9tYXN0ZXIvc3JjL3Rlcm1p
bmFsL3N5cy91bml4LnJzI0wxNjcKCkl0IHdvdWxkIGJlIGdyZWF0IGlmIHlvdSBjYW4gYWRkIGEg
dGVzdCBmb3IgbnVzaGVsbCBpbiB0aGUgQnVpbGRyb290IHRlc3RzdWl0ZS4KCkJlc3QgcmVnYXJk
cywKUm9tYWluCgo+IAo+IE51c2hlbGwgaXMgbm90IFBPU0lYIGNvbXBsaWFudCBhbmQgdGhlcmVm
b3JlIHNob3VsZCBub3QgYmUgdXNlZCBhcyBsb2dpbgo+IHNoZWxsIHNpbmNlIHNvbWUgcHJvZ3Jh
bXMgbWlnaHQgYXNzdW1lIGEgUE9TSVgtY29tcGxpYW50IHNoZWxsIGFuZAo+IHRoZXJlZm9yZSBi
cmVhayB0aGUgc3lzdGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBXZXllciA8c2Vi
YXN0aWFuLndleWVyQHNtaWxlLmZyPgo+IC0tLQo+ICBERVZFTE9QRVJTICAgICAgICAgICAgICAg
ICAgIHwgIDMgKysrCj4gIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgfCAgMSArCj4gIHBh
Y2thZ2UvbnVzaGVsbC9Db25maWcuaW4gICAgfCAgOSArKysrKysrKysKPiAgcGFja2FnZS9udXNo
ZWxsL251c2hlbGwuaGFzaCB8ICAyICsrCj4gIHBhY2thZ2UvbnVzaGVsbC9udXNoZWxsLm1rICAg
fCAyMCArKysrKysrKysrKysrKysrKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlv
bnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbnVzaGVsbC9Db25maWcuaW4KPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbnVzaGVsbC9udXNoZWxsLmhhc2gKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvbnVzaGVsbC9udXNoZWxsLm1rCj4gCj4gZGlmZiAtLWdpdCBh
L0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggNjI1NjU3NmUwMi4uNDU3N2YyMGIyMiAx
MDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0yNTUwLDYg
KzI1NTAsOSBAQCBGOglzdXBwb3J0L21pc2MvdG9vbGNoYWluZmlsZS5jbWFrZS5pbgo+ICBOOglT
YW0gVm9zcyA8c2FtLnZvc3NAZ21haWwuY29tPgo+ICBGOglwYWNrYWdlL3JpcGdyZXAvCj4gIAo+
ICtOOiAgU2ViYXN0aWFuIFdleWVyIDxzZWJhc3RpYW4ud2V5ZXJAc21pbGUuZnI+Cj4gK0Y6CXBh
Y2thZ2UvbnVzaGVsbC8KPiArCj4gIE46CVPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4u
c3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KPiAgRjoJcGFja2FnZS9tbWMtdXRpbHMvCj4gIEY6CXBh
Y2thZ2UvcHl0aG9uLWZsYXNrLWpzb25ycGMvCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmln
LmluIGIvcGFja2FnZS9Db25maWcuaW4KPiBpbmRleCAzYWNlMjVjNjY1Li43ZmNhNDZhZmI1IDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4K
PiBAQCAtMjU3Nyw2ICsyNTc3LDcgQEAgY29tbWVudCAiU2hlbGxzIgo+ICAJc291cmNlICJwYWNr
YWdlL2Jhc2gvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL2Rhc2gvQ29uZmlnLmluIgo+
ICAJc291cmNlICJwYWNrYWdlL21rc2gvQ29uZmlnLmluIgo+ICsJc291cmNlICJwYWNrYWdlL251
c2hlbGwvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3pzaC9Db25maWcuaW4iCj4gIGNv
bW1lbnQgIlV0aWxpdGllcyIKPiAgCXNvdXJjZSAicGFja2FnZS9hcGcvQ29uZmlnLmluIgo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL251c2hlbGwvQ29uZmlnLmluIGIvcGFja2FnZS9udXNoZWxsL0Nv
bmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uZjY2NmY0
NGU0Nwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL251c2hlbGwvQ29uZmlnLmluCj4g
QEAgLTAsMCArMSw5IEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9OVVNIRUxMCj4gKwlib29sICJu
dXNoZWxsIgo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNI
X1NVUFBPUlRTCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQwo+ICsJc2VsZWN0IEJS
Ml9QQUNLQUdFX09QRU5TU0wKPiArCWhlbHAKPiArCSAgQSBuZXcgdHlwZSBvZiBzaGVsbC4KPiAr
Cj4gKwkgIGh0dHBzOi8vZ2l0aHViLmNvbS9udXNoZWxsL251c2hlbGwKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9udXNoZWxsL251c2hlbGwuaGFzaCBiL3BhY2thZ2UvbnVzaGVsbC9udXNoZWxsLmhh
c2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmE3N2U3MTFhNWQK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9udXNoZWxsL251c2hlbGwuaGFzaAo+IEBA
IC0wLDAgKzEsMiBAQAo+ICsjIExvY2FsbHkgZ2VuZXJhdGVkCj4gK3NoYTI1NiAgMzUyZTgwNzY5
OGQ1Zjk1ZTliZmRkOWRkNTUxMmFjYWIzY2JlZjMxNTM3OTI5OWEzMmU1ZjMyMmE3NmViNzE4YSAg
bnVzaGVsbC0wLjc2LjAudGFyLmd6Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbnVzaGVsbC9udXNo
ZWxsLm1rIGIvcGFja2FnZS9udXNoZWxsL251c2hlbGwubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAuLjdkZTAyY2ZjNmEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIv
cGFja2FnZS9udXNoZWxsL251c2hlbGwubWsKPiBAQCAtMCwwICsxLDIwIEBACj4gKyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBudXNoZWxsCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPiArCj4gK05VU0hFTExfVkVSU0lPTiA9IDAuNzYuMAo+ICtOVVNIRUxMX1NJVEUg
PSAkKGNhbGwgZ2l0aHViLG51c2hlbGwsbnVzaGVsbCwkKE5VU0hFTExfVkVSU0lPTikpCj4gK05V
U0hFTExfTElDRU5TRSA9IE1JVAo+ICtOVVNIRUxMX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4g
K05VU0hFTExfREVQRU5ERU5DSUVTID0gb3BlbnNzbCBob3N0LXBrZ2NvbmYKPiArCj4gKyMgQWRk
IC9iaW4vbnUgdG8gL2V0Yy9zaGVsbHMgYXMgaW4gcGFja2FnZS9iYXNoL2Jhc2gubWsKPiArZGVm
aW5lIE5VU0hFTExfQUREX05VX1RPX1NIRUxMUwo+ICsJZ3JlcCAtcXNFICdeL2Jpbi9udSQkJyAk
KFRBUkdFVF9ESVIpL2V0Yy9zaGVsbHMgXAo+ICsJCXx8IGVjaG8gIi9iaW4vbnUiID4+ICQoVEFS
R0VUX0RJUikvZXRjL3NoZWxscwo+ICtlbmRlZgo+ICtOVVNIRUxMX1RBUkdFVF9GSU5BTElaRV9I
T09LUyArPSBOVVNIRUxMX0FERF9OVV9UT19TSEVMTFMKPiArCj4gKyQoZXZhbCAkKGNhcmdvLXBh
Y2thZ2UpKQo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
