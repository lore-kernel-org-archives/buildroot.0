Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44AAC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E53C820EC;
	Tue,  6 Feb 2024 17:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ukkXFv2R435W; Tue,  6 Feb 2024 17:27:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E74081428
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E74081428;
	Tue,  6 Feb 2024 17:27:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B03E1BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39621415BD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:27:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39621415BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RBxNTJ-K-s6K for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:27:03 +0000 (UTC)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8123A400E7
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8123A400E7
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-42c38c4e5adso4770361cf.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 09:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707240422; x=1707845222;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lBFPUN+slM+38gHYAQh42R9ifg1btUamAtscTAnkcdA=;
 b=TleUjkXLynFyvuYJPUtYmpDJWCIyrwSnUYaKWjz3iQv7vT7++CNkcKyI1yo8VI0ppW
 dz+RjnRxN9kiuTjunYldhGS1XYOljgrEPlWlkajyAppD/QWK2h8gHfSdN3Vo6kOo4Hac
 LzfkF1+P0gxjZ4/viX8iCW6wlN69vvcuPXrgDZFbycI+LdxqyY6zVeCT8YZGzA2cWJPM
 b9c5K2NtiAjC5y2YIXuLDB93KyC0E0SEYXLvgptMzZ4LMp3ppEXX9rEychIRnJ/Cdpjq
 i48BQaNtpyvZhsYuPvit7olaZuZF+UuaUd1s2kPrMbjJu89TluZ4kF/WgrPgSXeiD80/
 LJ3A==
X-Gm-Message-State: AOJu0YxJ9ykeJ8rOa7wJnF28toVP3MBhymulAFctaVRnwZDFOVtt+7xC
 lK+ZH3CXPXx/Scf/BdMdOAxViVUXzUiJLXuR0ynQQjvpx9JBWalP7nWA+MSM9oqyZe/z+ou877q
 +PRJTsBqbTaf2F0ONA70w6XpBSJU=
X-Google-Smtp-Source: AGHT+IHzlNNlqvVAE1wc9v/BjlealTXVMA5sykeebASPbOY/2O+XASIiI3qpklXGho7XN8N6LLrtoAFjwt0abyw0Lak=
X-Received: by 2002:ac8:5f0b:0:b0:42c:7da:9bee with SMTP id
 x11-20020ac85f0b000000b0042c07da9beemr3995598qta.22.1707240422193; Tue, 06
 Feb 2024 09:27:02 -0800 (PST)
MIME-Version: 1.0
References: <20240206161715.550268-1-james.hilliard1@gmail.com>
 <ZcJp3IN0suIBa9ds@landeda>
In-Reply-To: <ZcJp3IN0suIBa9ds@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 6 Feb 2024 10:26:50 -0700
Message-ID: <CADvTj4rWbAH9warEkSt8WUqe9bpc5HDc+NEJxH4fZBTqsW4PuQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707240422; x=1707845222; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lBFPUN+slM+38gHYAQh42R9ifg1btUamAtscTAnkcdA=;
 b=Z9O6hXtEZEtZN7EISYUZx2HkHzrRS8UyzHyqKkPCeysR3R3aKnHAdWYbI4FOCJQVJ4
 cSLc55kGKRRu2zQNj6hGaVshA/u+UNwk4wupuZ4e16HnoklwF+hd/j0bdb89tas3y5Tq
 Ak9SrlEJOWkMRNYvgbLKQvpRetSzNV/x516Q/sS4rJLdDICqAPIqekuZrIvkVNVCsmT4
 qqpwXHKVr2JiL+gdB8QULGpXExeTPTj4QBwjfeGLwkHXO9w5GpQtCr+QXiu7tELov1KV
 CSquwcFaTMMcWUbxbmEJ1/ZIZI48rzS5PHO6G7oqzC22Dcr6wSwUKE8PSKIkw/g0OdBq
 vSAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z9O6hXtE
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-ml-dtypes: bump to
 version 0.3.2
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
Cc: Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBGZWIgNiwgMjAyNCBhdCAxMDoxOOKAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEphbWVzLCBBbGwsCj4KPiBPbiAyMDI0LTAyLTA2
IDA5OjE3IC0wNzAwLCBKYW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiBNaWdyYXRlIGZy
b20gZGlzdHV0aWxzIHdoaWNoIGlzIGJlaW5nIGRlcHJlY2F0ZWQgdG8gc2V0dXB0b29scy4KPiA+
Cj4gPiBEcm9wIHB5dGhvbi1weWJpbmQgd2hpY2ggaXMgbm8gbG9uZ2VyIHJlcXVpcmVkOgo+ID4g
aHR0cHM6Ly9naXRodWIuY29tL2pheC1tbC9tbF9kdHlwZXMvYmxvYi92MC4zLjIvQ0hBTkdFTE9H
Lm1kIzAzMi0tLTIwMjQtMDEtMDMKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFy
ZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPgo+IEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFu
a3MuCj4KPiBDb3VsZCB5b3UgY2hlY2sgd2hldGhlciB0aGUgZm9sbG93aW5nIHBhdGNoZXMgYXJl
IHN0aWxsIHZhbGlkIGFuZAo+IHJlcXVpcmVkLCBwbGVhc2U6Cj4KPiAgICAgaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8zYWZjYzk4MjY4NWU4NzZh
YzliMmFlNTRmODYxNjQ2NDcwNDBhYjg1LjE3MDY0NDgwNTUuZ2l0Lnlhbm4ubW9yaW4uMTk5OEBm
cmVlLmZyLwo+ICAgICBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRy
b290L3BhdGNoLzIwMjQwMTEyMjIxOTEwLjE0Nzc4LTEtZm9udGFpbmUuZmFicmljZUBnbWFpbC5j
b20vCgpZZWFoLCBsb29rcyBsaWtlIHRoZXkgYXJlIHN0aWxsIG5lZWRlZCBkdWUgdG8gdGhlIG51
bXB5IGRlcGVuZGVuY3ksCmFsdGhvdWdoIHRoZSBweXRob24tcHliaW5kIGNvbW1lbnQgSSB0aGlu
ayBjYW4gYmUgZHJvcHBlZC4KCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+IC0t
LQo+ID4gQ2hhbmdlcyB2MSAtPiB2MjoKPiA+ICAgLSBkcm9wIHB5YmluZAo+ID4gLS0tCj4gPiAg
cGFja2FnZS9weXRob24tbWwtZHR5cGVzL0NvbmZpZy5pbiAgICAgICAgICAgICB8IDEgLQo+ID4g
IHBhY2thZ2UvcHl0aG9uLW1sLWR0eXBlcy9weXRob24tbWwtZHR5cGVzLmhhc2ggfCA0ICsrLS0K
PiA+ICBwYWNrYWdlL3B5dGhvbi1tbC1kdHlwZXMvcHl0aG9uLW1sLWR0eXBlcy5tayAgIHwgOSAr
KysrLS0tLS0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tbWwtZHR5cGVzL0NvbmZp
Zy5pbiBiL3BhY2thZ2UvcHl0aG9uLW1sLWR0eXBlcy9Db25maWcuaW4KPiA+IGluZGV4IDcyNTA2
ODk2ZGYuLjg3OTE1NjRiMTkgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1tbC1kdHlw
ZXMvQ29uZmlnLmluCj4gPiArKysgYi9wYWNrYWdlL3B5dGhvbi1tbC1kdHlwZXMvQ29uZmlnLmlu
Cj4gPiBAQCAtNSw3ICs1LDYgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9NTF9EVFlQRVMK
PiA+ICAgICAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfOSAjIHB5dGhv
bi1udW1weQo+ID4gICAgICAgZGVwZW5kcyBvbiBCUjJfSE9TVF9HQ0NfQVRfTEVBU1RfOSAjIGhv
c3QtcHl0aG9uLW51bXB5Cj4gPiAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX05VTVBZ
Cj4gPiAtICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1BZQklORAo+ID4gICAgICAgaGVs
cAo+ID4gICAgICAgICBtbF9kdHlwZXMgaXMgYSBzdGFuZC1hbG9uZSBpbXBsZW1lbnRhdGlvbiBv
ZiBzZXZlcmFsIE51bVB5Cj4gPiAgICAgICAgIGR0eXBlIGV4dGVuc2lvbnMgdXNlZCBpbiBtYWNo
aW5lIGxlYXJuaW5nIGxpYnJhcmllcy4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1t
bC1kdHlwZXMvcHl0aG9uLW1sLWR0eXBlcy5oYXNoIGIvcGFja2FnZS9weXRob24tbWwtZHR5cGVz
L3B5dGhvbi1tbC1kdHlwZXMuaGFzaAo+ID4gaW5kZXggYTQ0MDI2OGUzOS4uNTNiZmFjYjUyOCAx
MDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLW1sLWR0eXBlcy9weXRob24tbWwtZHR5cGVz
Lmhhc2gKPiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLW1sLWR0eXBlcy9weXRob24tbWwtZHR5cGVz
Lmhhc2gKPiA+IEBAIC0xLDUgKzEsNSBAQAo+ID4gICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczov
L3B5cGkub3JnL3B5cGkvbWxfZHR5cGVzL2pzb24KPiA+IC1tZDUgIDZhZGJiMDU1MzA4MTliZGI0
YTc4ZDIzNzJkMTg3ZmUyICBtbF9kdHlwZXMtMC4zLjEudGFyLmd6Cj4gPiAtc2hhMjU2ICA2MDc3
OGY5OTE5NGI0YzRmMzZiYTQyZGEyMDBiMzVlZjg1MWNlNGQ0YWY2OThhYWY3MGY1YjkxZmU3MGZj
NjExICBtbF9kdHlwZXMtMC4zLjEudGFyLmd6Cj4gPiArbWQ1ICA0MzhjMDRkYzBkOTQxZWMxYjNi
NzE2NjcyMjVjNzRjOCAgbWxfZHR5cGVzLTAuMy4yLnRhci5nego+ID4gK3NoYTI1NiAgNTMzMDU5
YmM1ZjE3NjRmYWMwNzFlZjU0NTk4ZGIzNThjMTY3YzUxYTcxOGY2OGY1YmI1NWUzZGVlNzlkMjk2
NyAgbWxfZHR5cGVzLTAuMy4yLnRhci5nego+ID4gICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYg
Y2hlY2tzdW1zCj4gPiAgc2hhMjU2ICBjZmM3NzQ5Yjk2ZjYzYmQzMWMzYzQyYjVjNDcxYmY3NTY4
MTQwNTNlODQ3YzEwZjNlYjAwMzQxN2JjNTIzZDMwICBMSUNFTlNFCj4gPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9weXRob24tbWwtZHR5cGVzL3B5dGhvbi1tbC1kdHlwZXMubWsgYi9wYWNrYWdlL3B5
dGhvbi1tbC1kdHlwZXMvcHl0aG9uLW1sLWR0eXBlcy5tawo+ID4gaW5kZXggOTJkMjNiZWNlNC4u
Njc2MTM3ZWNmMSAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLW1sLWR0eXBlcy9weXRo
b24tbWwtZHR5cGVzLm1rCj4gPiArKysgYi9wYWNrYWdlL3B5dGhvbi1tbC1kdHlwZXMvcHl0aG9u
LW1sLWR0eXBlcy5tawo+ID4gQEAgLTQsMTYgKzQsMTUgQEAKPiA+ICAjCj4gPiAgIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiA+Cj4gPiAtUFlUSE9OX01MX0RUWVBFU19WRVJTSU9OID0gMC4zLjEK
PiA+ICtQWVRIT05fTUxfRFRZUEVTX1ZFUlNJT04gPSAwLjMuMgo+ID4gIFBZVEhPTl9NTF9EVFlQ
RVNfU09VUkNFID0gbWxfZHR5cGVzLSQoUFlUSE9OX01MX0RUWVBFU19WRVJTSU9OKS50YXIuZ3oK
PiA+IC1QWVRIT05fTUxfRFRZUEVTX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5v
cmcvcGFja2FnZXMvMTYvNmUvOWE3YTUxZWUxY2EyNGI4ZTkyMTA5MTI4MjYwYzVhZWM4MzQwYzhm
ZTU1NzJlOWNlZWNkZGFlNTU5YWJlCj4gPiArUFlUSE9OX01MX0RUWVBFU19TSVRFID0gaHR0cHM6
Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzM5LzdkLzhkODVmY2JhODY4NzU4YjNh
NTQ2ZTY5MTRlNzI3YWJkOGYyOWVhNjkxODA3OWY4MTY5NzVjOWVlY2Q2Mwo+ID4gIFBZVEhPTl9N
TF9EVFlQRVNfTElDRU5TRSA9IEFwYWNoZS0yLjAKPiA+ICBQWVRIT05fTUxfRFRZUEVTX0xJQ0VO
U0VfRklMRVMgPSBMSUNFTlNFCj4gPiAtUFlUSE9OX01MX0RUWVBFU19TRVRVUF9UWVBFID0gZGlz
dHV0aWxzCj4gPiArUFlUSE9OX01MX0RUWVBFU19TRVRVUF9UWVBFID0gc2V0dXB0b29scwo+ID4K
PiA+ICBQWVRIT05fTUxfRFRZUEVTX0RFUEVOREVOQ0lFUyA9IFwKPiA+ICAgICAgIGhvc3QtcHl0
aG9uLW51bXB5IFwKPiA+IC0gICAgIHB5dGhvbi1udW1weSBcCj4gPiAtICAgICBweXRob24tcHli
aW5kCj4gPiArICAgICBweXRob24tbnVtcHkKPiA+Cj4gPiAgJChldmFsICQocHl0aG9uLXBhY2th
Z2UpKQo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4g
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBE
ZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMz
IDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBc
ZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8q
XF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
