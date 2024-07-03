Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104EEC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81D2260EF5;
	Wed,  3 Jul 2024 15:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzxJz_iMpFlj; Wed,  3 Jul 2024 15:07:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F9ED60EDD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F9ED60EDD;
	Wed,  3 Jul 2024 15:07:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2DFA1BF2FC
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACAEA417ED
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXoDTZI5fsJP for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:07:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1AC2D417EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AC2D417EB
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AC2D417EB
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:07:52 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52caebc6137so5097053e87.0
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 08:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720019270; x=1720624070;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sv0Jh8Miydfcw+07jC0jA+REBGF+WKyemfoeUjIhQAY=;
 b=SBURT+RI+WEa29NmWqSVfz+OwJtmqyX5JLq5SHGBq00BZ06SR5jze226B6r8E5DraM
 GkjlwMakvuFQz0iVTgZqk1YdQqLELrLdVNq+UFOvVB8zXR33Z4luqkQ1MlhGh9fcPbSk
 a4mDc6C6pvc/lf6+RpM2orcNlgHaqEmJM0bEZ6PPJuTLwBUKEZhK+kjU8mL8XY7nqxV6
 g+AofuERc3TMDPi1JoZEUHG7ca4jfsam3at6a3hRC8ujKpXX3ESo0CkbE7om9NpEyAvC
 IMKjfKCaWAdmsvDEIZ8LsWYdsxzrczrzRfoikNdjoQu1ODDINHhqluPKb+szXG6UUhEh
 fSwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu9vYazZLWA3NTkMCp0mqPAHY2Xcihhh5Sx6xBSsEZc+uvAV7unMiZreLc5kr5V+B9DIjJkPwZpd7e3RQ1vEr1Uk0jfTpahQ==
X-Gm-Message-State: AOJu0Yx+FQysHFWMdn/fi9hkqoEvZLlSCTMdN4Fs0jCh3QkbZmgVA0v3
 COUzpp9pbDOg4bc6eI0Zs3kXP/0oskMr7pDxtJwfi6LL1OMQgV+sWMg+s0p29OoE+AENjOch/HF
 9
X-Google-Smtp-Source: AGHT+IFhY/sREW5pzZSW5Tz3+B5G7r896slNqkJMM3CD4MpwbOUMH2eQ83BVEPtOohNPqZEzVv9mmQ==
X-Received: by 2002:a05:6512:230d:b0:52c:ddb8:6cfd with SMTP id
 2adb3069b0e04-52e82687e0bmr8445982e87.40.1720019267847; 
 Wed, 03 Jul 2024 08:07:47 -0700 (PDT)
Received: from [10.5.0.35]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b097b82sm246542755e9.34.2024.07.03.08.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 08:07:47 -0700 (PDT)
Message-ID: <5d525491-484c-427e-932c-324ec2a0275f@smile.fr>
Date: Wed, 3 Jul 2024 17:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240703142308.2752594-1-dario.binacchi@amarulasolutions.com>
Content-Language: fr, en-US
In-Reply-To: <20240703142308.2752594-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720019270; x=1720624070; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sv0Jh8Miydfcw+07jC0jA+REBGF+WKyemfoeUjIhQAY=;
 b=gkEvALSFBZeHh2oCSadUGvL8xboUVCVVUGivrWV1ASlq88rmWFsnUlF9u0iOi63mZ1
 7+CyJlC49ALx2pPqKPIvSieyatrStsMFsL+iG9w2hF5Dl7CDgML/4MyTKd89IcJmtGQw
 Ec0DHqM4GuNP2JEb4Rk7oyn7BYUWc9Pelq5pc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=gkEvALSF
Subject: Re: [Buildroot] [PATCH 1/1] package/libssh2: update the patches to
 be applied with fuzz 0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAwMy8wNy8yMDI0IMOgIDE2OjIzLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IENvbW1pdCA4Zjg4YTY0NGVkN2Q2ICgic3VwcG9ydC9zY3JpcHRzL2FwcGx5LXBh
dGNoZXMuc2g6IHNldCB0aGUgbWF4aW11bQo+IGZ1enogZmFjdG9yIHRvIDAiKSByZWR1Y2VkIHRo
ZSBmdXp6IGZhY3Rvci4KPiAKPiBEdWUgdG8gdGhpcyBjaGFuZ2UsIGxpYnNzaDIgZmFpbHMgdG8g
YnVpbGQgd2l0aCBvdXRwdXQ6Cj4gCj4gICAgIEFwcGx5aW5nIDAwMDItc3JjLWFkZC1zdHJpY3Qt
S0VYLXRvLWZpeC1DVkUtMjAyMy00ODc5NS1UZXJyYXBpbi1BdHRhY2sucGF0Y2ggdXNpbmcgcGF0
Y2g6Cj4gICAgIHBhdGNoaW5nIGZpbGUgc3JjL2tleC5jCj4gICAgIEh1bmsgIzEgc3VjY2VlZGVk
IGF0IDMwMzcgKG9mZnNldCA1IGxpbmVzKS4KPiAgICAgSHVuayAjMiBzdWNjZWVkZWQgYXQgMzA2
MiAob2Zmc2V0IDUgbGluZXMpLgo+ICAgICBIdW5rICMzIHN1Y2NlZWRlZCBhdCAzMzE1IChvZmZz
ZXQgNSBsaW5lcykuCj4gICAgIEh1bmsgIzQgc3VjY2VlZGVkIGF0IDM0MDYgKG9mZnNldCA1IGxp
bmVzKS4KPiAgICAgSHVuayAjNSBzdWNjZWVkZWQgYXQgMzQ0MCAob2Zmc2V0IDUgbGluZXMpLgo+
ICAgICBIdW5rICM2IHN1Y2NlZWRlZCBhdCAzNDc2IChvZmZzZXQgNSBsaW5lcykuCj4gICAgIEh1
bmsgIzcgc3VjY2VlZGVkIGF0IDM0ODkgKG9mZnNldCA1IGxpbmVzKS4KPiAgICAgSHVuayAjOCBz
dWNjZWVkZWQgYXQgMzUyMyAob2Zmc2V0IDUgbGluZXMpLgo+ICAgICBIdW5rICM5IHN1Y2NlZWRl
ZCBhdCAzNTY5IChvZmZzZXQgNSBsaW5lcykuCj4gICAgIEh1bmsgIzEwIHN1Y2NlZWRlZCBhdCAz
NTkxIChvZmZzZXQgNSBsaW5lcykuCj4gICAgIEh1bmsgIzExIHN1Y2NlZWRlZCBhdCAzNjMzIChv
ZmZzZXQgNSBsaW5lcykuCj4gICAgIEh1bmsgIzEyIHN1Y2NlZWRlZCBhdCAzNjU0IChvZmZzZXQg
NSBsaW5lcykuCj4gICAgIEh1bmsgIzEzIHN1Y2NlZWRlZCBhdCAzNjg3IChvZmZzZXQgNSBsaW5l
cykuCj4gICAgIEh1bmsgIzE0IHN1Y2NlZWRlZCBhdCAzNzA5IChvZmZzZXQgNSBsaW5lcykuCj4g
ICAgIEh1bmsgIzE1IHN1Y2NlZWRlZCBhdCAzODkyIChvZmZzZXQgNSBsaW5lcykuCj4gICAgIEh1
bmsgIzE2IHN1Y2NlZWRlZCBhdCAzOTE4IChvZmZzZXQgNSBsaW5lcykuCj4gICAgIEh1bmsgIzE3
IHN1Y2NlZWRlZCBhdCAzOTY3IChvZmZzZXQgNSBsaW5lcykuCj4gICAgIHBhdGNoaW5nIGZpbGUg
c3JjL2xpYnNzaDJfcHJpdi5oCj4gICAgIEh1bmsgIzEgc3VjY2VlZGVkIGF0IDY5OSAob2Zmc2V0
IC0zNyBsaW5lcykuCj4gICAgIEh1bmsgIzIgc3VjY2VlZGVkIGF0IDg3MyAob2Zmc2V0IC0zOCBs
aW5lcykuCj4gICAgIEh1bmsgIzMgc3VjY2VlZGVkIGF0IDkxNCAob2Zmc2V0IC0zOCBsaW5lcyku
Cj4gICAgIEh1bmsgIzQgc3VjY2VlZGVkIGF0IDExNDkgKG9mZnNldCAtMzggbGluZXMpLgo+ICAg
ICBwYXRjaGluZyBmaWxlIHNyYy9wYWNrZXQuYwo+ICAgICBIdW5rICMxIHN1Y2NlZWRlZCBhdCA2
MDUgKG9mZnNldCAtMTkgbGluZXMpLgo+ICAgICBIdW5rICMyIHN1Y2NlZWRlZCBhdCA2NTYgKG9m
ZnNldCAtMTkgbGluZXMpLgo+ICAgICBIdW5rICMzIHN1Y2NlZWRlZCBhdCAxNDA0IChvZmZzZXQg
LTIzIGxpbmVzKS4KPiAgICAgSHVuayAjNCBzdWNjZWVkZWQgYXQgMTQ3NCAob2Zmc2V0IC0yMyBs
aW5lcykuCj4gICAgIHBhdGNoaW5nIGZpbGUgc3JjL3BhY2tldC5oCj4gICAgIEh1bmsgIzEgRkFJ
TEVEIGF0IDcyLgo+ICAgICAxIG91dCBvZiAxIGh1bmsgRkFJTEVEIC0tIHNhdmluZyByZWplY3Rz
IHRvIGZpbGUgc3JjL3BhY2tldC5oLnJlago+IAo+IFRoaXMgY29tbWl0IHJlZnJlc2hlcyB0aGUg
cGFja2FnZSBwYXRjaGVzIG9uIHRoZSBjdXJyZW50IHBhY2thZ2UgdmVyc2lvbi4KClRoZXJlIGFy
ZSBzdGlsbCBzb21lIEh1bmsgd2hpbGUgYXBwbHlpbmcgdGhpcyBwYXRjaCBldmVuIGlmIHBhdGNo
IGNvbW1hbmQKZG9lc24ndCBlcnJvciBvdXQuIFdoaWxlIGF0IGl0LCB5b3UgY2FuIGNvbXBsZXRl
IHRoZSByZXdvcmsgdG8gcmVtb3ZlIHRoZW0/CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4g
U2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgo+IC0tLQo+ICAuLi5kLXN0cmljdC1LRVgtdG8tZml4LUNWRS0yMDIzLTQ4Nzk1
LVRlcnJhcGluLUF0dGFjay5wYXRjaCB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGli
c3NoMi8wMDAyLXNyYy1hZGQtc3RyaWN0LUtFWC10by1maXgtQ1ZFLTIwMjMtNDg3OTUtVGVycmFw
aW4tQXR0YWNrLnBhdGNoIGIvcGFja2FnZS9saWJzc2gyLzAwMDItc3JjLWFkZC1zdHJpY3QtS0VY
LXRvLWZpeC1DVkUtMjAyMy00ODc5NS1UZXJyYXBpbi1BdHRhY2sucGF0Y2gKPiBpbmRleCAyY2Nl
ZGVlMTllOTMuLjJhYmVkODQzMjA1NCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYnNzaDIvMDAw
Mi1zcmMtYWRkLXN0cmljdC1LRVgtdG8tZml4LUNWRS0yMDIzLTQ4Nzk1LVRlcnJhcGluLUF0dGFj
ay5wYXRjaAo+ICsrKyBiL3BhY2thZ2UvbGlic3NoMi8wMDAyLXNyYy1hZGQtc3RyaWN0LUtFWC10
by1maXgtQ1ZFLTIwMjMtNDg3OTUtVGVycmFwaW4tQXR0YWNrLnBhdGNoCj4gQEAgLTE1LDYgKzE1
LDggQEAgQ2xvc2VzICMxMjkxCj4gIAo+ICBVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2xp
YnNzaDIvbGlic3NoMi9jb21taXQvZDM0ZDkyNThiODQyMGIxOWVjM2Y5N2I0Y2M1YmY3YWE3ZDk4
ZTM1YQo+ICBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNl
QGdtYWlsLmNvbT4KPiArW0RhcmlvOiBtYWtlIHRoZSBwYXRjaCB0byBiZSBhcHBsaWVkIHdpdGgg
ZnV6eiBmYWN0b3IgMF0KPiArU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJp
bmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ICAtLS0KPiAgIHNyYy9rZXguYyAgICAgICAg
ICB8IDYzICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gICBzcmMvbGlic3No
Ml9wcml2LmggfCAxOCArKysrKysrLS0tCj4gQEAgLTM4NywxNCArMzg5LDE0IEBAIGRpZmYgLS1n
aXQgYS9zcmMvcGFja2V0LmggYi9zcmMvcGFja2V0LmgKPiAgaW5kZXggMWQ5MGI4YWYxMi4uOTU1
MzUxZTVmNiAxMDA2NDQKPiAgLS0tIGEvc3JjL3BhY2tldC5oCj4gICsrKyBiL3NyYy9wYWNrZXQu
aAo+IC1AQCAtNzIsNiArNzIsNiBAQCBpbnQgX2xpYnNzaDJfcGFja2V0X2J1cm4oTElCU1NIMl9T
RVNTSU9OICogc2Vzc2lvbiwKPiArQEAgLTcxLDYgKzcxLDYgQEAgaW50IF9saWJzc2gyX3BhY2tl
dF9idXJuKExJQlNTSDJfU0VTU0lPTiAqIHNlc3Npb24sCj4gICBpbnQgX2xpYnNzaDJfcGFja2V0
X3dyaXRlKExJQlNTSDJfU0VTU0lPTiAqIHNlc3Npb24sIHVuc2lnbmVkIGNoYXIgKmRhdGEsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZGF0YV9sZW4pOwo+ICAg
aW50IF9saWJzc2gyX3BhY2tldF9hZGQoTElCU1NIMl9TRVNTSU9OICogc2Vzc2lvbiwgdW5zaWdu
ZWQgY2hhciAqZGF0YSwKPiAgLSAgICAgICAgICAgICAgICAgICAgICAgIHNpemVfdCBkYXRhbGVu
LCBpbnQgbWFjc3RhdGUpOwo+ICArICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IGRhdGFs
ZW4sIGludCBtYWNzdGF0ZSwgdWludDMyX3Qgc2VxKTsKPiAgIAo+IC0gI2VuZGlmIC8qIExJQlNT
SDJfUEFDS0VUX0ggKi8KPiArICNlbmRpZiAvKiBfX0xJQlNTSDJfUEFDS0VUX0ggKi8KPiAgZGlm
ZiAtLWdpdCBhL3NyYy9zZXNzaW9uLmMgYi9zcmMvc2Vzc2lvbi5jCj4gIGluZGV4IDM1ZTc5Mjlm
ZTcuLjlkODlhZGU4ZWMgMTAwNjQ0Cj4gIC0tLSBhL3NyYy9zZXNzaW9uLmMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
