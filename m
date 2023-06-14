Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09DBEB64D7
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 01:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31B4A41563;
	Wed, 14 Jun 2023 01:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31B4A41563
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fyd0hWz2dpw8; Wed, 14 Jun 2023 01:57:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5D3640C5C;
	Wed, 14 Jun 2023 01:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5D3640C5C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 528421BF346
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 01:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22EB54093B
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 01:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22EB54093B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ssjTqbaGdDg for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 01:57:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FFDA40932
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FFDA40932
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 01:57:54 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5187a752745so1530004a12.2
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 18:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686707872; x=1689299872;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=am0RAdMJTtLHmm2WbIji3aO6qVtKtAhhLs4RgYqi5Z4=;
 b=cp5FCtu+uotxRkfqisqHwRIkICKxQBJWbEzFJYaDBIHUmuCybSkMvdB2PI26Bd6wYL
 FlbEJaC9JRyrnJ7wJT98ElnA4kSqtXvqTqZMoy1ITk8MS5V8wkj69qKXTl6QenKw3LL3
 B4GbhWYF3+j3mpsDCTq+moVR7s2kMGSTC01PWsh3v3xrPvYDAitUq8Z+seZzWdYCK/yg
 Pujjl0JWXhu3IHRcPNDFdvcWjJOscsIBGXrSB2WVWR+gyziMwiIQvjxRcrRgwTeiNH9z
 ScETr3xdxnJoNp4+qlgPxCbyj8Dq5g+SgOt7osaiUZ6mDQjiGdCN9nq5kkWgMXdD70Vx
 l6yw==
X-Gm-Message-State: AC+VfDwZgl0xVRsOobJ2LHAmKmq6ETBiYTgnY3GBQcl9dTV820+gPue1
 fbuUDVb0qSMbGpFdI8WzhMa/FVuAQFQ/VrWY6Bs=
X-Google-Smtp-Source: ACHHUZ7TUmEu6Z2SNkIspnC/C6KceAv1vWYP7RELgiEV8jDRrsPSCqeAHMnEwtZ7ySDsoPIZ82ukiQeuBDAgMOJguB4=
X-Received: by 2002:a17:907:9622:b0:97c:46c7:d5eb with SMTP id
 gb34-20020a170907962200b0097c46c7d5ebmr14673668ejc.10.1686707872059; Tue, 13
 Jun 2023 18:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230613105015.739870-1-laurent@vivier.eu>
 <20230613105015.739870-2-laurent@vivier.eu>
In-Reply-To: <20230613105015.739870-2-laurent@vivier.eu>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 14 Jun 2023 01:57:39 +0000
Message-ID: <CACPK8Xejkfdh11afgdBzkX=AA=SnXjVDCJRa3eB3kKcE52gQ5A@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1686707872; x=1689299872;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=am0RAdMJTtLHmm2WbIji3aO6qVtKtAhhLs4RgYqi5Z4=;
 b=SGIy81i/k35+7JR7dMEP1PVSOf9cWcNvF6dN8IORP6i5PNsnlzhXWp+4mWGOBr5KnY
 SHRUXeMuPbVU5wskAOdEm01rnC/FrvYBC/UEzFzhFdHk2WYxvpjPND5WOln/VKVo5wZH
 mYXXLhaglK0bKIWcvAMwv4BXrSQscF6vTUs9M=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.a=rsa-sha256 header.s=google header.b=SGIy81i/
Subject: Re: [Buildroot] [PATCH v14 1/4] petitboot: add pb-discover daemon
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAxMyBKdW4gMjAyMyBhdCAxMDo1MSwgTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2
aWVyLmV1PiB3cm90ZToKPgo+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgVml2aWVyIDxsYXVyZW50
QHZpdmllci5ldT4KPiBSZXZpZXdlZC1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9y
Zz4KPiAtLS0KPiAgcGFja2FnZS9wZXRpdGJvb3QvUzE1cGItZGlzY292ZXIgfCA1NCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBwYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3Qu
bWsgICB8ICA0ICsrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKykKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcGV0aXRib290L1MxNXBiLWRpc2NvdmVyCj4KPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9wZXRpdGJvb3QvUzE1cGItZGlzY292ZXIgYi9wYWNrYWdlL3BldGl0
Ym9vdC9TMTVwYi1kaXNjb3Zlcgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMDAwLi44MzMwNWVkOWVhOGEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9wZXRp
dGJvb3QvUzE1cGItZGlzY292ZXIKPiBAQCAtMCwwICsxLDU0IEBACj4gKyMhL2Jpbi9zaAoKRG9l
cyB0aGlzIG5lZWQgYSBsaWNlbmNlIHN0YXRlbWVudD8KClJldmlld2VkLWJ5OiBKb2VsIFN0YW5s
ZXkgPGpvZWxAam1zLmlkLmF1PgoKPiArCj4gK0RBRU1PTj0icGItZGlzY292ZXIiCj4gK1BJREZJ
TEU9Ii92YXIvcnVuLyREQUVNT04ucGlkIgo+ICtMT0dGSUxFPSIvdmFyL2xvZy8kREFFTU9OLmxv
ZyIKPiArCj4gK1BCX0RJU0NPVkVSX0FSR1M9Ii1sICRMT0dGSUxFIgo+ICsKPiAraWYgWyAiJChw
Yi1jb25maWcgZGVidWcpIiA9ICJlbmFibGVkIiBdIDsgdGhlbgo+ICsgICAgICAgUEJfRElTQ09W
RVJfQVJHUz0iJFBCX0RJU0NPVkVSX0FSR1MgLS12ZXJib3NlIgo+ICtmaQo+ICsKPiArc3RhcnQo
KSB7Cj4gKyAgICAgICBwcmludGYgJ1N0YXJ0aW5nICVzOiAnICIkREFFTU9OIgo+ICsgICAgICAg
IyBzaGVsbGNoZWNrIGRpc2FibGU9U0MyMDg2ICMgd2UgbmVlZCB0aGUgd29yZCBzcGxpdHRpbmcK
PiArICAgICAgIHN0YXJ0LXN0b3AtZGFlbW9uIC1TIC1xIC1iIC1wICIkUElERklMRSIgLXggIi91
c3Ivc2Jpbi8kREFFTU9OIiBcCj4gKyAgICAgICAgICAgICAgIC0tICRQQl9ESVNDT1ZFUl9BUkdT
Cj4gKyAgICAgICBzdGF0dXM9JD8KPiArICAgICAgIGlmIFsgIiRzdGF0dXMiIC1lcSAwIF07IHRo
ZW4KPiArICAgICAgICAgICAgICAgZWNobyAiT0siCj4gKyAgICAgICBlbHNlCj4gKyAgICAgICAg
ICAgICAgIGVjaG8gIkZBSUwiCj4gKyAgICAgICBmaQo+ICsgICAgICAgcmV0dXJuICIkc3RhdHVz
Igo+ICt9Cj4gKwo+ICtzdG9wKCkgewo+ICsgICAgICAgcHJpbnRmICdTdG9wcGluZyAlczogJyAi
JERBRU1PTiIKPiArICAgICAgIHN0YXJ0LXN0b3AtZGFlbW9uIC1LIC1xIC1wICIkUElERklMRSIK
PiArICAgICAgIHN0YXR1cz0kPwo+ICsgICAgICAgaWYgWyAiJHN0YXR1cyIgLWVxIDAgXTsgdGhl
bgo+ICsgICAgICAgICAgICAgICBlY2hvICJPSyIKPiArICAgICAgIGVsc2UKPiArICAgICAgICAg
ICAgICAgZWNobyAiRkFJTCIKPiArICAgICAgIGZpCj4gKyAgICAgICByZXR1cm4gIiRzdGF0dXMi
Cj4gK30KPiArCj4gK3Jlc3RhcnQoKSB7Cj4gKyAgICAgICBzdG9wCj4gKyAgICAgICBzbGVlcCAx
Cj4gKyAgICAgICBzdGFydAo+ICt9Cj4gKwo+ICtjYXNlICIkMSIgaW4KPiArICAgICAgIHN0YXJ0
fHN0b3B8cmVzdGFydCkKPiArICAgICAgICAgICAgICAgIiQxIjs7Cj4gKyAgICAgICByZWxvYWQp
Cj4gKyAgICAgICAgICAgICAgIHJlc3RhcnQ7Owo+ICsgICAgICAgKikKPiArICAgICAgICAgICAg
ICAgZWNobyAiVXNhZ2U6ICQwIHtzdGFydHxzdG9wfHJlc3RhcnR8cmVsb2FkfSIKPiArICAgICAg
ICAgICAgICAgZXhpdCAxCj4gKyAgICAgICAgICAgICAgIDs7Cj4gK2VzYWMKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rIGIvcGFja2FnZS9wZXRpdGJvb3QvcGV0
aXRib290Lm1rCj4gaW5kZXggYTc5OGU3Y2E2MTRmLi40ZDU2YjczOTM4ZTcgMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rCj4gKysrIGIvcGFja2FnZS9wZXRpdGJv
b3QvcGV0aXRib290Lm1rCj4gQEAgLTUzLDYgKzUzLDEwIEBAIGRlZmluZSBQRVRJVEJPT1RfUE9T
VF9JTlNUQUxMCj4gICAgICAgICAgICAgICAgICQoVEFSR0VUX0RJUikvZXRjL3BldGl0Ym9vdC9i
b290LmQvMDEtY3JlYXRlLWRlZmF1bHQtZHRiCj4gICAgICAgICAkKElOU1RBTEwpIC1EIC1tIDA3
NTUgJChARCkvdXRpbHMvaG9va3MvOTAtc29ydC1kdGIgXAo+ICAgICAgICAgICAgICAgICAkKFRB
UkdFVF9ESVIpL2V0Yy9wZXRpdGJvb3QvYm9vdC5kLzkwLXNvcnQtZHRiCj4gKyAgICAgICAkKElO
U1RBTEwpIC1tIDA3NTUgLUQgJChQRVRJVEJPT1RfUEtHRElSKS9TMTVwYi1kaXNjb3ZlciBcCj4g
KyAgICAgICAgICAgICAgICQoVEFSR0VUX0RJUikvZXRjL2luaXQuZC9TMTVwYi1kaXNjb3Zlcgo+
ICsgICAgICAgbG4gLXNmIC91c3Ivc2Jpbi9wYi11ZGhjcGMgXAo+ICsgICAgICAgICAgICAgICAk
KFRBUkdFVF9ESVIpL3Vzci9zaGFyZS91ZGhjcGMvZGVmYXVsdC5zY3JpcHQuZC8KPiAgZW5kZWYK
Pgo+ICBQRVRJVEJPT1RfUE9TVF9JTlNUQUxMX1RBUkdFVF9IT09LUyArPSBQRVRJVEJPT1RfUE9T
VF9JTlNUQUxMCj4gLS0KPiAyLjQwLjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
