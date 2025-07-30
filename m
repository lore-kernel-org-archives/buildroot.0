Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F442C87FCB
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 16:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE917411CE;
	Wed, 30 Jul 2025 16:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DaVuJ5nhy5gp; Wed, 30 Jul 2025 16:54:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E427041090
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E427041090;
	Wed, 30 Jul 2025 16:54:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA4EF13D
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 16:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 885A76118E
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 16:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDIoLWjYUMv8 for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 16:54:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B66D613D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B66D613D4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B66D613D4
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 16:54:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4271444F2;
 Wed, 30 Jul 2025 16:53:59 +0000 (UTC)
Date: Wed, 30 Jul 2025 18:53:58 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Message-ID: <20250730185358.61d2f04c@windsurf>
In-Reply-To: <20250730-openscap-v1-1-46e4a32e26da@bootlin.com>
References: <20250730-openscap-v1-0-46e4a32e26da@bootlin.com>
 <20250730-openscap-v1-1-46e4a32e26da@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeettdfhheejgeffveetueetteehkeekveduueelgeefvdekvdeuteduuddukeegveenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtr
 dhorhhgpdhrtghpthhtohepsggrrhhutghhsehtkhhoshdrtghordhilhdprhgtphhtthhopehnihgtohhlrghsrdgtrghrrhhivghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomhdprhgtphhtthhopehtihhmrdhhrghmmhgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753894440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kFcqSWOPLTAOpSdDDf6GWgt3iwOdACwT1B5nYdWDnzk=;
 b=WmuG9Iv0ChF0GojfCAk/abqoUhkPwrO76S0Zt1iq2xCyebackwiBMsmMrg8VP7EuseEP0G
 TkfdcZ3+UNpJtraUODYnYgVUCQSGhtkuErylrAfepVVXkK10dJQJpEFc6IGrJaq5KUAD74
 Ikx+SpWqo26kne4qztFHobJWa+i1TFT1G2wMFv7nG5lmsLMZ75OSQRJlhEPWZIpFN5vZdp
 xCsNkyZCWb8JkwuBePGp87KNWq+XQwewXVPe3lDpkiE5mla0E/fbvaGpeOl0LnOrtRz4gV
 PjStD8k8Dbej7q+HBgQ6ydjE/GzGpXee2ZtwqHvKOB0EXwtUMw9XbRnJLxEa9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WmuG9Iv0
Subject: Re: [Buildroot] [PATCH 1/4] package/libxmlsec1: Add libxmlsec1 used
 by openSCAP
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: tim.hammer@nav-timing.safrangroup.com,
 nicolas.carrier@nav-timing.safrangroup.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleGlzLAoKVGhhbmtzIGZvciB5b3VyIHBhdGNoISBTZWUgc29tZSByZXZpZXcgYmVs
b3cuCgpPbiBXZWQsIDMwIEp1bCAyMDI1IDE0OjQ3OjEzICswMjAwCkFsZXhpcyBMb3Rob3LDqSA8
YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBJbnRyb2R1Y2UgdGhlIGxpYnht
bHNlYzEgbGlicmFyeSBwYWNrYWdlLiBsaWJ4bWxzZWMgaW1wbGVtZW50cyBYTUwKPiBzZWN1cml0
eSBzdGFuZGFyZHMuCj4gCj4gVGhlIGxpYnJhcnkgaGFzIG9ubHkgYSBmZXcgbWFuZGF0b3J5IGRl
cGVuZGVuY2llcyhsaWJ4bWwyIGFuZCBsaWJ4c2x0Cj4gYW5kIGEgY3J5cHRvIGxpYnJhcnkpLiAg
SXQgbmVlZHMgb25lIG9mIHRoZSBmb2xsb3dpbmcgY3J5cHRvZ3JhcGhpYwo+IGxpYnJhcmllczog
T3BlblNTTCwgTlNTLCBvciBHY3J5cHQvR05VVExTLiBEZWZhdWx0IHRvIG9wZW5zc2wgZm9yIG5v
dyB0bwo+IGtlZXAgdGhlIHBhY2thZ2Ugc2ltcGxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhp
cyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+CgpCeSBjb252ZW50aW9uLCB0
aGUgdGl0bGUgb2YgdGhlIHBhdGNoIHNob3VsZCBiZToKCglwYWNrYWdlL2xpYnhtbHNlYzE6IG5l
dyBwYWNrYWdlCgo+IC0tLQo+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgIHwg
IDEgKwo+ICBwYWNrYWdlL2xpYnhtbHNlYzEvQ29uZmlnLmluICAgICAgIHwgMTMgKysrKysrKysr
KysrKwo+ICBwYWNrYWdlL2xpYnhtbHNlYzEvbGlieG1sc2VjMS5oYXNoIHwgIDQgKysrKwo+ICBw
YWNrYWdlL2xpYnhtbHNlYzEvbGlieG1sc2VjMS5tayAgIHwgMjggKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKykKCllvdSBuZWVk
IHRvIGFkZCBhbiBlbnRyeSB0byB0aGUgREVWRUxPUEVSUyBmaWxlIGZvciB0aGlzIHBhY2thZ2Uu
CgoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEuaGFzaCBiL3Bh
Y2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjE1NmUxMzEw
YTM2MDk0NjVkNzkxNGIyYzllODMwZTUxNTdiODhmOTkKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIv
cGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEuaGFzaAo+IEBAIC0wLDAgKzEsNCBAQAo+ICsj
IExvY2FsbHkgY29tcHV0ZWQKPiArc2hhMjU2ICBkODJlOTNiNjliOGFhMjA1YTYxNmI2MjkxN2Ey
NjkzMjJiZjYzYTNlYWFmYjM3NzUwMTRlNjE3NTJiMjAxM2VhICB4bWxzZWMxLTEuMy43LnRhci5n
ego+ICsjIExvY2FsbHkgY29tcAoKIkxvY2FsbHkgY29tcCIgYW5kIHRoZW4geW91ciBrZXlib2Fy
ZCB3YXMgYmxvPyA6LSkKCk5vdCBuZWVkIHRvIHJlcGVhdCB0aGlzIGNvbW1lbnQsIGlmIGl0J3Mg
YXBwbGljYWJsZSBmb3IgYm90aCBsaW5lcy4KCj4gK3NoYTI1NiAgZDVlOTM4ODUzNDI1NjM2MGM2
YTAwOWQ0ZjE5YWIyYjhkNmVjMGFhN2ZmMzJhNTFlMjJkODk5ZWQ3YmViNWM0OCAgQ29weXJpZ2h0
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLm1rIGIvcGFja2Fn
ZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLmIwNTQ2NWRkMTBmZmZj
ZjQ5MGRiNDBkMTJiN2E2NmFjMzNkYTdkNDcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2Fn
ZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEubWsKPiBAQCAtMCwwICsxLDI4IEBACj4gKyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBsaWJ4bWxzZWMxCj4gKyMKPiArIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPiArCj4gK0xJQlhNTFNFQzFfVkVSU0lPTiA9IDEuMy43Cj4gK0xJQlhNTFNF
QzFfU09VUkNFID0geG1sc2VjMS0kKExJQlhNTFNFQzFfVkVSU0lPTikudGFyLmd6Cj4gK0xJQlhN
TFNFQzFfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9sc2gxMjMveG1sc2VjL3JlbGVhc2VzL2Rv
d25sb2FkLyQoTElCWE1MU0VDMV9WRVJTSU9OKQo+ICtMSUJYTUxTRUMxX0xJQ0VOU0UgPSBNSVQK
Ck9LLCBsaWNlbnNlIHZlcmlmaWVkLgoKPiArTElCWE1MU0VDMV9MSUNFTlNFX0ZJTEVTID0gQ29w
eXJpZ2h0Cj4gK0xJQlhNTFNFQzFfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gK0xJQlhNTFNFQzFf
REVQRU5ERU5DSUVTID0gbGlieG1sMiBsaWJ4c2x0IG9wZW5zc2wKPiArSE9TVF9MSUJYTUxTRUMx
X0RFUEVOREVOQ0lFUyA9IGhvc3QtbGlieG1sMiBob3N0LWxpYnhzbHQgaG9zdC1vcGVuc3NsCj4g
Kwo+ICtMSUJYTUxTRUMxX0NPTkZfT1BUUyA9CS0tZGlzYWJsZS1zdGF0aWMgXAo+ICsJCQktLWVu
YWJsZS1jcnlwdG8tZGw9bm8gXAo+ICsJCQktLXdpdGgtb3BlbnNzbCBcCj4gKwkJCS0td2l0aC1n
bnV0bHM9bm8gXAo+ICsJCQktLXdpdGgtZ2NyeXB0PW5vIFwKPiArCQkJLS13aXRoLW5zcz1ubwoK
VGhpcyBzaG91bGQgYmUgYSBiaXQgbW9yZSBuaWNlbHkgZm9ybWF0dGVkLCBhbmQgdXNlIC0tZGlz
YWJsZS8tLXdpdGhvdXQKaW5zdGVhZCBvZiAtLWVuYWJsZS0uLj1ubyBhbmQgLS13aXRoLS4uLj1u
by4gQWxzbywgeW91IHNob3VsZG4ndCBwYXNzCi0tZGlzYWJsZS1zdGF0aWMgdW5sZXNzIHlvdSBo
YXZlIGEgdmVyeSBnb29kIHJlYXNvbiB0by4gSW5kZWVkLApCdWlsZHJvb3QgaXMgcGFzc2luZyAt
LXtlbmFibGUsZGlzYWJsZX0te3NoYXJlZCxzdGF0aWN9IGF1dG9tYXRpY2FsbHkKYmFzZWQgb24g
dGhlIEJSMl9TSEFSRURfTElCUy9CUjJfU1RBVElDX0xJQlMgc2V0dGluZ3MuCgpTbzoKCkxJQlhN
TFNFQzFfQ09ORl9PUFRTID0gXAoJLS1kaXNhYmxlLWNyeXB0by1kbCBcCgktLXdpdGgtb3BlbnNz
bCBcCgktLXdpdGhvdXQtZ251dGxzIFwKCS0td2l0aG91dC1nY3J5cHQgXAoJLS13aXRob3V0LW5z
cwoKPiArCj4gK0xJQlhNTFNFQzFfQVVUT1JFQ09ORiA9IFlFUwoKUGVyaGFwcyBwdXQgdGhpcyAi
ZWFybGllciIsIGFzIGl0J3MgdmFsaWQgZm9yIGJvdGggdGhlIHRhcmdldCBhbmQgaG9zdAp2YXJp
YW50cy4KCj4gK0hPU1RfTElCWE1MU0VDMV9DT05GX09QVFMgPSAkKExJQlhNTFNFQzFfQ09ORl9P
UFRTKQoKSSdtIG5vdCBzdXJlIEkgbGlrZSByZS11c2luZyBsaWtlIHRoaXMgdGFyZ2V0IG9wdGlv
bnMgZm9yIHRoZSBob3N0CnZhcmlhbnQuIEkgdGhpbmsgSSdkIHByZWZlciB0aGVtIHRvIGJlIGR1
cGxpY2F0ZWQuCgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVy
IGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBh
bmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
