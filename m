Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D40EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 13:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B72281FCA;
	Wed, 12 Jul 2023 13:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B72281FCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nDJzNQnli5JT; Wed, 12 Jul 2023 13:06:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A68182315;
	Wed, 12 Jul 2023 13:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A68182315
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58CA11BF3CB
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 13:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F78582331
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 13:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F78582331
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7WhE4YTTp260 for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 13:06:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57BC781FCA
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57BC781FCA
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 13:06:03 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fbc0609cd6so70245575e9.1
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 06:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689167161; x=1691759161;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DY25pJBJbMcYF2hXTeMxYnEmcDvXDl9xVDeh9m1DKkM=;
 b=k0V7EtIfNaJe/nF9AxJaIiqdeh0L/fV/5P921zsM7ppUnxZmLsJJ5dTQjGsNHCu7fx
 Ln71nx4nkTzzWe5xaAB3uqxScgYAZ89rfe2JZbr1MfbfvkM2DN4tq1nJnnMnceFQhOXr
 YEdyNUK+AwgXtZ5/jtWvl4wWtqB+xLHxjA1wc0SmKisdBM2fXxjppDkWTyj8bP9L8soR
 i4s6MCC8bXoXw7AbZHeLxGI1bN+Ol3sk4txGAuRjKnPKgqTayciDIsuc6Bo6FL05Vj5y
 XDVnG6YtCeE80xsvzDIBQ6DXplI+vq4IFNKm0PeMUbkOTtCun1qqNAoBVuXixBMNYhJN
 eqog==
X-Gm-Message-State: ABy/qLbgZPPaVPk4urwrwxYSg7uq7arToUhw2uiWfcuANSR7Bq9REFiZ
 Xl7T1f+NV0aqQVQUQp3XwE3DOw==
X-Google-Smtp-Source: APBJJlFeVItnYqwvlsshLolMC3VwcgcUhq/5g1zI3ty0hp7A2ANbThsvEUE7ABSGAZ+b8PLSzbyIYA==
X-Received: by 2002:a7b:c8c9:0:b0:3fc:8a0:3eaa with SMTP id
 f9-20020a7bc8c9000000b003fc08a03eaamr11391535wml.34.1689167161437; 
 Wed, 12 Jul 2023 06:06:01 -0700 (PDT)
Received: from [10.5.2.165]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a7bcb0d000000b003fbc9b9699dsm5027579wmj.45.2023.07.12.06.06.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 06:06:01 -0700 (PDT)
Message-ID: <daee4294-ddf2-c548-07b6-4f86c2149fc3@smile.fr>
Date: Wed, 12 Jul 2023 15:06:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: fr, en-US
To: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
 <20230615134315.494330-10-sebastian.weyer@smile.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230615134315.494330-10-sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1689167161; x=1691759161;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DY25pJBJbMcYF2hXTeMxYnEmcDvXDl9xVDeh9m1DKkM=;
 b=ebBA9wm4JwJlIKu/f0QMnuB7HmfjcK/TUO+JhBjLf039d/F9DzheMczV5QDhzIhsKz
 SXag4ZBorWVOGPxiwCps6s8immv8pRvIP6z8h/HDjfBprh8uAx781nUZcxBianZG0jXa
 4SH6bl/WhSknpWLEqThUGLG495cCWiNgnW/a8MUxrIEvHXpu49IZUV6NRjfObYTmmm++
 GOXzMACkoeMBGR77P9AmN7Siom8/jpW5u0Hs3JH3O81aHDRYCU7fGiLJ9XbWXnNJni+y
 IIUo/BrN1q9y/BxYPMId2Pm2r701DwznANp+B1EXu0+jnnA/uJPEhmtbmm+KghCZD7Vz
 jREg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=ebBA9wm4
Subject: Re: [Buildroot] [PATCH v4 09/10] package/llvm-project: bump to
 version 15.0.3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Lang Daniel <d.lang@abatec.at>,
 Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd.kuhls@t-online.de>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAxNS8wNi8yMDIzIMOgIDE1OjQzLCBTZWJhc3RpYW4gV2V5ZXIgYSDDqWNyaXTC
oDoKPiBGcm9tOiBMYW5nIERhbmllbCA8ZC5sYW5nQGFiYXRlYy5hdD4KPiAKPiAtIEFkZCBuZXcg
YnVpbGQgZGVwZW5kZW5jaWVzIHRvIGxsZCBhbmQgbGx2bQo+IC0gQWRkIGhvc3QtZ2NjIGFuZCBn
Y2MgPj0gNy54IGRlcGVuZGVuY3kgc2luY2UgY2xhbmcgZG9lc24ndCBidWlsZCB3aXRoIGdjYyA2
LjMKPiAKPiAgIFsgMjglXSBCdWlsZGluZyBDWFggb2JqZWN0IHV0aWxzL1RhYmxlR2VuL0NNYWtl
RmlsZXMvb2JqLmNsYW5nLXRibGdlbi5kaXIvVGFibGVHZW4uY3BwLm8KPiAgIG91dHB1dC9idWls
ZC9ob3N0LWNsYW5nLTE1LjAuMy91dGlscy9UYWJsZUdlbi9SSVNDVlZFbWl0dGVyLmNwcDogSW4g
aW5zdGFudGlhdGlvbiBvZiDigJh7YW5vbnltb3VzfTo6U2VtYVNpZ25hdHVyZVRhYmxlOjppbml0
KGxsdm06OkFycmF5UmVmPHthbm9ueW1vdXN9OjpTZW1hUmVjb3JkPik6OjxsYW1iZGEoYXV0bzoy
Jik+IFt3aXRoIGF1dG86MiA9IGNvbnN0IGxsdm06OlNtYWxsVmVjdG9yPGNsYW5nOjpSSVNDVjo6
UHJvdG90eXBlRGVzY3JpcHRvcj5d4oCZOgo+ICAgL3Vzci9pbmNsdWRlL2MrKy82L2JpdHMvc3Rs
X2FsZ28uaDozNzY5OjU6ICAgcmVxdWlyZWQgZnJvbSDigJhfRnVuY3Qgc3RkOjpmb3JfZWFjaChf
SUl0ZXIsIF9JSXRlciwgX0Z1bmN0KSBbd2l0aCBfSUl0ZXIgPSBzdGQ6Ol9SYl90cmVlX2NvbnN0
X2l0ZXJhdG9yPGxsdm06OlNtYWxsVmVjdG9yPGNsYW5nOjpSSVNDVjo6UHJvdG90eXBlRGVzY3Jp
cHRvcj4gPjsgX0Z1bmN0ID0ge2Fub255bW91c306OlNlbWFTaWduYXR1cmVUYWJsZTo6aW5pdChs
bHZtOjpBcnJheVJlZjx7YW5vbnltb3VzfTo6U2VtYVJlY29yZD4pOjo8bGFtYmRhKGF1dG86MiYp
Pl3igJkKPiAgIG91dHB1dC9ob3N0L2luY2x1ZGUvbGx2bS9BRFQvU1RMRXh0cmFzLmg6MTYxMToy
MzogICByZXF1aXJlZCBmcm9tIOKAmFVuYXJ5RnVuY3Rpb24gbGx2bTo6Zm9yX2VhY2goUiYmLCBV
bmFyeUZ1bmN0aW9uKSBbd2l0aCBSID0gc3RkOjpzZXQ8bGx2bTo6U21hbGxWZWN0b3I8Y2xhbmc6
OlJJU0NWOjpQcm90b3R5cGVEZXNjcmlwdG9yPiwge2Fub255bW91c306OlNlbWFTaWduYXR1cmVU
YWJsZTo6aW5pdChsbHZtOjpBcnJheVJlZjx7YW5vbnltb3VzfTo6U2VtYVJlY29yZD4pOjpDb21w
YXJlPiY7IFVuYXJ5RnVuY3Rpb24gPSB7YW5vbnltb3VzfTo6U2VtYVNpZ25hdHVyZVRhYmxlOjpp
bml0KGxsdm06OkFycmF5UmVmPHthbm9ueW1vdXN9OjpTZW1hUmVjb3JkPik6OjxsYW1iZGEoYXV0
bzoyJik+XeKAmQo+ICAgb3V0cHV0L2J1aWxkL2hvc3QtY2xhbmctMTUuMC4zL3V0aWxzL1RhYmxl
R2VuL1JJU0NWVkVtaXR0ZXIuY3BwOjI0OTo2NDogICByZXF1aXJlZCBmcm9tIGhlcmUKPiAgIG91
dHB1dC9idWlsZC9ob3N0LWNsYW5nLTE1LjAuMy91dGlscy9UYWJsZUdlbi9SSVNDVlZFbWl0dGVy
LmNwcDoyNDk6NTA6IGVycm9yOiBjYW5ub3QgY2FsbCBtZW1iZXIgZnVuY3Rpb24g4oCYdm9pZCB7
YW5vbnltb3VzfTo6U2VtYVNpZ25hdHVyZVRhYmxlOjppbnNlcnQobGx2bTo6QXJyYXlSZWY8Y2xh
bmc6OlJJU0NWOjpQcm90b3R5cGVEZXNjcmlwdG9yPinigJkgd2l0aG91dCBvYmplY3QKPiAgICAg
bGx2bTo6Zm9yX2VhY2goU2lnbmF0dXJlcywgW3RoaXNdKGF1dG8gJlNpZykgeyBpbnNlcnQoU2ln
KTsgfSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+Cj4gICB1dGlscy9UYWJsZUdlbi9DTWFrZUZpbGVzL29iai5jbGFuZy10Ymxn
ZW4uZGlyL2J1aWxkLm1ha2U6MzEzOiByZWNpcGUgZm9yIHRhcmdldCAndXRpbHMvVGFibGVHZW4v
Q01ha2VGaWxlcy9vYmouY2xhbmctdGJsZ2VuLmRpci9SSVNDVlZFbWl0dGVyLmNwcC5vJyBmYWls
ZWQKPiAgIG1ha2VbNF06ICoqKiBbdXRpbHMvVGFibGVHZW4vQ01ha2VGaWxlcy9vYmouY2xhbmct
dGJsZ2VuLmRpci9SSVNDVlZFbWl0dGVyLmNwcC5vXSBFcnJvciAxCj4gCj4gICBJbmRlZWQgTExW
TV9URU1QT1JBUklMWV9BTExPV19PTERfVE9PTENIQUlOIGlzIE9GRiwgdGhlIENoZWNrQ29tcGls
ZXJWZXJzaW9uLmNtYWtlCj4gICB0cmlnZ2VyIGFuIGVycm9yIGlmIGdjYyA8IDcueC4gSW5kZGVk
IHNpbmNlIGxsdm0gMTUgdGhpcyBvcHRpb24gY2hlY2sgZm9yIEMrKzE3IFsxXQo+IAo+ICAgVGhl
IGxhc3QgZ2NjIDcueCB2ZXJzaW9uICg3LjUpIGhhcyBiZWVuIHJlbGVhc2VkIGluIDIwMTkuCj4g
ICBGaXhpbmcgbGx2bS9jbGFuZyBpc3N1ZXMgZm9yIG9sZCBjb21waWxlciBtYXliZSBpdCdzIG5v
dCB3b3J0aCBpdC4KPiAKPiAtIFJlbW92ZSBMTFZNX1RFTVBPUkFSSUxZX0FMTE9XX09MRF9UT09M
Q0hBSU4gc2luY2UKPiAgIGdjYyA+PSA3IGlzIG1lbmRhdG9yeS4KPiAKPiAgIFdoZW4gdXBkYXRp
bmcgTExWTSwgd2UgYWxzbyBuZWVkIHRvIHVwZGF0ZSB0aGUgdmVyc2lvbiBvZgo+ICAgU1BJUlZf
TExWTV9UUkFOU0xBVE9SIGJlY2F1c2UgaXRzIENNYWtlTGlzdHMudHh0IHZlcmlmaWVzIHRoZSBM
TFZNCj4gICBiYXNlIHZlcnNpb24gWzJdLgo+IAo+ICAgVGhlIHBhdGNoCj4gICBwYWNrYWdlL2xs
dm0vMDAwMi1BZGQtbWlzc2luZy1jc3RkaW50LWhlYWRlci10by1TaWduYWxzLmgucGF0Y2ggaGFz
Cj4gICBiZWVuIGluY2x1ZGVkIGluIHRhZyBsbHZtb3JnLTE1LjAuMCBvZiBsbHZtLXByb2plY3Qu
Cj4gCj4gICBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2NvbW1pdC80
YzcyZGViNjEzZDlkODgzODc4NWI0MzFmYWNiM2ViNDgwZmIyZjUxCj4gICBbMl0gaHR0cHM6Ly9n
aXRodWIuY29tL0tocm9ub3NHcm91cC9TUElSVi1MTFZNLVRyYW5zbGF0b3IvYmxvYi81YmUwOGI4
YmI5MWZjNmNhNjI4NTc3OTJjMTc3YmM3NDc5ZTVlM2RiL0NNYWtlTGlzdHMudHh0I0xMODJDNi1M
ODJDNgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBMYW5nIDxkLmxhbmdAYWJhdGVjLmF0Pgo+
IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+IFNp
Z25lZC1vZmYtYnk6IFNlYmFzdGlhbiBXZXllciA8c2ViYXN0aWFuLndleWVyQHNtaWxlLmZyPgo+
IC0tLQo+IHY0OiAtIHVwZGF0ZSBzcGlydi1sbHZtLXRyYW5zbGF0b3IgdmVyc2lvbiBhcyB3ZWxs
Cj4gICAgIC0gcmVtb3ZlIHBhY2thZ2UvbGx2bS8wMDAyLUFkZC1taXNzaW5nLWNzdGRpbnQtaGVh
ZGVyLXRvLVNpZ25hbHMuaC5wYXRjaAo+IAo+IHYzOiAtIGFkZCBsaWJjbGMgYnVtcAo+ICAgICAt
IGxsdm0sIGNsYW5nLCBsbGQsIG1lc2EzZCAobGx2bSk6IGFkZCBnY2MgPj0gNy54IGRlcGVuZGVu
Y3kKPiAKPiBDaGFuZ2VzIHYxIC0+IHYyOgo+IC0gQnVtcCB0byAxNS4wLjMgaW5zdGVhZCBvZiAx
NS4wLjEKPiAtIGxsdm06IHVzZSBDTUFLRV9IT1NUX0NfQ09NUElMRVIgaW5zdGVhZCBvZiBIT1NU
Q0MKPiAtLS0KCkkgbm90aWNlZCBhIG5ldyBydW50aW1lIGlzc3VlIFsxXSB3aXRoIHRoZSBDbGFu
Z0NvbXBpbGVyUlQgdGVzdDoKCiMgZnV6el9tZQo9PTc0PT1FUlJPUjogQWRkcmVzc1Nhbml0aXpl
ciBmYWlsZWQgdG8gYWxsb2NhdGUgMHgwICgwKSBieXRlcyBvZgpTZXRBbHRlcm5hdGVTaWduYWxT
dGFjayAoZXJyb3IgY29kZTogMjIpCgpUaGUgaXNzdWUgaXMgZHVlIHRvIHRoZSByZWNlbnQgQVJN
IGFhcmNoNjQgdG9vbGNoYWluIGJ1bXAgdGhhdCBwcm92aWRlIGEgZ2xpYmMKPj0gMi4zNC4KClNl
ZSBidWcgcmVwb3J0cyBbMl0gWzNdLgoKVGhlIGlzc3VlIGhhcyBiZWVuIGZpeGVkIGluIGxsdm0g
MTMuMC4wIFs0XSBhbmQgaXQncyBmaXhlZCBpbiBCdWlsZHJvb3QgYXMgc29vbgphcyB0aGUgbGx2
bS9jbGFuZyB2ZXJzaW9uIGJ1bXAgdG8gMTUuMC54IHBhdGNoIHNlcmllcyBpcyBhcHBsaWVkIFs1
XS4KClsxXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2Jz
LzQ2MjEwNDYyOTkKWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9pc3N1
ZXMvNTU3ODUKWzNdIGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lk
PTEwMDExNApbNF0KaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2NvbW1pdC84
MjE1MDYwNmZiMTFkMjg4MTNhZTZkYTExMDFmNWJkYTYzODE2NWZlCls1XSBodHRwOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8/c2VyaWVzPTM1OTg5MAoKQmVz
dCByZWdhcmRzLApSb21haW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
