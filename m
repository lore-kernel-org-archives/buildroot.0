Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F55DC43217
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 10:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7BF5410B4;
	Tue, 22 Feb 2022 10:47:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfoAWvmPOqPf; Tue, 22 Feb 2022 10:47:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CD31409A4;
	Tue, 22 Feb 2022 10:47:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 860741BF280
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7433A81A5C
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OFWbipT0qtay for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 10:47:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B2F281A58
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 10:47:00 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id p9so32265923wra.12
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 02:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=o35Z9u6kgQd5uLv19mb3A8F0+id7i1kWUhxcssSJuds=;
 b=l0/tl1j1F//RsdXaPtT7FRK8IbccjV4uRquZRXdwxUvwjnsYs4X7H7tVWklcK9QtJJ
 JbN6hFkGAOWc4DQvLDTBAwDs7aG/CD260nmH1WTe8aOFv1rnMuu5RcIhp6M/T9azY8JW
 DfiLbVcQAYTWvdilj8jER7E78Bc7Oje6FmOAzsxPTnW3M9ebhVS8CD2/8ZUo6W0RgGXJ
 9MiIm5dZeBm6Xev8MyGHr0xx8JeP8MVLb1CgVSW7l8RpL2FK9GnmLjMGIhpV2bVxS3U6
 JVzPXWqMUuiSasJ/0+PjHr8wI+cjpuGaKaNskvSx2yAVbpC0Ul2BZRROOkVSHOo8N5/f
 JezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o35Z9u6kgQd5uLv19mb3A8F0+id7i1kWUhxcssSJuds=;
 b=zxCKhucxTNkpB1htimIt4lLp+J1/qbsvP0uxJP1FSN6a262lgw5bQU3CNy6JY7+kOC
 2iCjdsXqfR2qykoS4+B3XAFnZJYv4qsMr7M0zj+t9suLgzvvPqKX9JNbpR0R+EX3r6Qk
 Sje1W/5fWQksd2GK3C1ltfjnFWUjyWoJ4qiJr2AU58Be5jQw/tTVG4BdpQVqPsOuBDqC
 OG5DlgOtMjLhiipNmqw6uQLphYRyW5ETRTTq9Fpyo2Mf0C3InY3f3+4WYNaMvR77Eevb
 n4s6rS1dVZupfOtLI+objWBSRTqGluvYD/2OTyO2/PfTr2MkbpVDNDkSjXqZClnXGhnm
 X2XA==
X-Gm-Message-State: AOAM531DZ0hQsu3bDng+EhrohM8TK9LfmhQD2VpLbxllmDfJIceuAYcn
 i1pz/PCWTe4q2DG+ryRtagg=
X-Google-Smtp-Source: ABdhPJwUP9Dky9SEBsywDF9ufwrd60ncDItB7RyEGG/p35jxIAvYji2ywE9uwWrM1DwA5FKCJrbsjA==
X-Received: by 2002:adf:e9c1:0:b0:1ea:9c18:b79b with SMTP id
 l1-20020adfe9c1000000b001ea9c18b79bmr827054wrn.492.1645526818211; 
 Tue, 22 Feb 2022 02:46:58 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c19c900b0037c050d73dcsm2182777wmq.46.2022.02.22.02.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 02:46:57 -0800 (PST)
Message-ID: <aaff664e-513e-c4cb-7138-189ef32aa52b@gmail.com>
Date: Tue, 22 Feb 2022 11:46:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220221230815.2203955-1-fontaine.fabrice@gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220221230815.2203955-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/python-treq: bump to version
 22.2.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZSwKCkxlIDIyLzAyLzIwMjIgw6AgMDA6MDgsIEZhYnJpY2UgRm9udGFpbmUg
YSDDqWNyaXTCoDoKPiAtIGh5cGVybGluayBpcyBhIGRlcGVuZGVuY3kgc2luY2UgdmVyc2lvbiAy
MC40LjAgYW5kCj4gICBodHRwczovL2dpdGh1Yi5jb20vdHdpc3RlZC90cmVxL2NvbW1pdC81NDc1
ZGVmOTZmM2VjOTMwNzVmZjk1NzA5ZmVjNGFjZDE1NGU2ZmVkCj4gLSBzaXggaXMgbm90IGEgZGVw
ZW5kZW5jeSBzaW5jZSB2ZXJzaW9uIDIxLjUuMCBhbmQKPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS90
d2lzdGVkL3RyZXEvY29tbWl0LzIyYmRiMzk5YTAzYjBlZWJhYTkzMDIzYjgwZDM0OGY1ODRmNTY3
ZDUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNl
QGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFp
bC5jb20+CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gLS0tCj4gIHBhY2thZ2UvcHl0aG9uLXRy
ZXEvQ29uZmlnLmluICAgICAgICB8IDIgKy0KPiAgcGFja2FnZS9weXRob24tdHJlcS9weXRob24t
dHJlcS5oYXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvcHl0aG9uLXRyZXEvcHl0aG9uLXRyZXEubWsg
ICB8IDQgKystLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tdHJlcS9Db25maWcuaW4gYi9w
YWNrYWdlL3B5dGhvbi10cmVxL0NvbmZpZy5pbgo+IGluZGV4IDdjMDJhMzU2MzguLjVkNzZhNWNk
ZDYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tdHJlcS9Db25maWcuaW4KPiArKysgYi9w
YWNrYWdlL3B5dGhvbi10cmVxL0NvbmZpZy5pbgo+IEBAIC0zLDkgKzMsOSBAQCBjb25maWcgQlIy
X1BBQ0tBR0VfUFlUSE9OX1RSRVEKPiAgCSMgdHdpc3RlZCBUTFMgLT4gcHl0aG9uLXtweW9wZW5z
c2wsc2VydmljZS1pZGVudGl0eX0KPiAgCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9SVVNU
Q19UQVJHRVRfQVJDSF9TVVBQT1JUUwo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9BVFRS
UyAjIHJ1bnRpbWUKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fSFlQRVJMSU5LICMgcnVu
dGltZQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9JTkNSRU1FTlRBTCAjIHJ1bnRpbWUK
PiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fUkVRVUVTVFMgIyBydW50aW1lCj4gLQlzZWxl
Y3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1NJWCAjIHJ1bnRpbWUKPiAgCXNlbGVjdCBCUjJfUEFDS0FH
RV9QWVRIT05fVFdJU1RFRCAjIHJ1bnRpbWUKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05f
VFdJU1RFRF9UTFMgIyBydW50aW1lCj4gIAloZWxwCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0
aG9uLXRyZXEvcHl0aG9uLXRyZXEuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXRyZXEvcHl0aG9uLXRy
ZXEuaGFzaAo+IGluZGV4IDI4ODI3OWNiZDguLmFlY2Y3MWFhZDggMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9weXRob24tdHJlcS9weXRob24tdHJlcS5oYXNoCj4gKysrIGIvcGFja2FnZS9weXRob24t
dHJlcS9weXRob24tdHJlcS5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4gICMgbWQ1LCBzaGEyNTYg
ZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvdHJlcS9qc29uCj4gLW1kNSAgYjc1ZjZjODlmZDQ4
MTk4OWE5Y2ZkZWM4ZDYxYTZkODQgIHRyZXEtMjAuMy4wLnRhci5nego+IC1zaGEyNTYgIGE3MmQ3
NTg3ZDZmODFjN2EzMjYyMGIwMDE3NTgyNWI0MzM0YmFmYmRlNzNkMzcwOThkMTM5YWM3YjExZGNh
OTggIHRyZXEtMjAuMy4wLnRhci5nego+ICttZDUgIDQzODkyMDg2ZDU1NmU3NTk2MzkyMTM0ZjFl
MTBiZGVmICB0cmVxLTIyLjIuMC50YXIuZ3oKPiArc2hhMjU2ICBkZjc1N2UzZjE0MWZjNzgyZWRl
MDc2YTYwNDUyMTE5NGZmY2I0MGZhMjY0NWNmNDhlNWEzNzA2MDMwN2Y1MmVjICB0cmVxLTIyLjIu
MC50YXIuZ3oKPiAgIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiAgc2hhMjU2
ICA3Y2MxYjY1ZTE5MzdiMWNjMDcwNTJiYjg2NGVjOTZkOGU1ZmQ0MTM0MDBjMDg0MmU1Yjg5YTgy
MDFhNjAwMjkzICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXRyZXEvcHl0
aG9uLXRyZXEubWsgYi9wYWNrYWdlL3B5dGhvbi10cmVxL3B5dGhvbi10cmVxLm1rCj4gaW5kZXgg
MzIwZjU3YjZmMi4uNTdkYzUwZWU3NCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi10cmVx
L3B5dGhvbi10cmVxLm1rCj4gKysrIGIvcGFja2FnZS9weXRob24tdHJlcS9weXRob24tdHJlcS5t
awo+IEBAIC00LDkgKzQsOSBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+
IC1QWVRIT05fVFJFUV9WRVJTSU9OID0gMjAuMy4wCj4gK1BZVEhPTl9UUkVRX1ZFUlNJT04gPSAy
Mi4yLjAKCkkgd291bGQgc3VnZ2VzdCB0byBhZGQgYSBjb21tZW50IGFib3V0IHRoZSByZXF1aXJl
bWVudCB0byBrZWVwIHRoZSB2ZXJzaW9uIGluCnN5bmMgd2l0aCBweXRob24tdHdpc3RlZCB2ZXJz
aW9uLiBBZGQgdGhlIHNhbWUgY29tbWVudCBvbiBweXRob24tdHdpc3RlZC5tawoKQmVzdCByZWdh
cmRzLApSb21haW4KCgo+ICBQWVRIT05fVFJFUV9TT1VSQ0UgPSB0cmVxLSQoUFlUSE9OX1RSRVFf
VkVSU0lPTikudGFyLmd6Cj4gLVBZVEhPTl9UUkVRX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhv
bmhvc3RlZC5vcmcvcGFja2FnZXMvOTgvMDkvMjUwNjRkNzIyNGVmZGU5ZmQ1MWU4ODY1MzUzZDUx
NmM1MzMwNmU0NzZlYWIyN2FiMjFmYjI1OGNmN2Q0Cj4gK1BZVEhPTl9UUkVRX1NJVEUgPSBodHRw
czovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvY2QvYzgvYjY4YWIxN2Q5OTQxMzNi
YWY2ZWRiY2I1NTUxYmE4MWUxNDk0YmRjNmQ1ZTIxYTlkNGYzYmM0MzE1MTQwCj4gIFBZVEhPTl9U
UkVRX0xJQ0VOU0UgPSBNSVQKPiAgUFlUSE9OX1RSRVFfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UK
PiAgUFlUSE9OX1RSRVFfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
