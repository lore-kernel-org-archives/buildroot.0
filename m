Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EF4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 21:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B965060B9B;
	Sun, 29 May 2022 21:06:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HvSomr0Te3uq; Sun, 29 May 2022 21:06:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB0FF605B7;
	Sun, 29 May 2022 21:06:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECFD51BF336
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA78B81A29
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lplv_aC-tfsN for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 21:06:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D344819BC
 for <buildroot@buildroot.org>; Sun, 29 May 2022 21:06:45 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 o29-20020a05600c511d00b00397697f172dso5259877wms.0
 for <buildroot@buildroot.org>; Sun, 29 May 2022 14:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=q73i3hMuBxUxrFbYLWVi6ViGfZVt6krCqFXCEB5vvlY=;
 b=fH7Q/W8+SA/gzJE1HTxHCGxDT848/SPkKeHleMjakqtG7ubO6r0kx1xOBZI7SQk0Ik
 sotXyo2m3hTGBIfLYDzTAM2M1sXTglAEeXlIkbscLIiAFr/7nCkjMDYkvX89zoPZNvn6
 BEhnYj9gvlbaq966ApDmUEaYr+MSIHLWrIHsZIdBV5jGpXQZTXRWj8MD/JsUD0uOjKUk
 gpXTtIJfod4XFJBLK1rfNMblE4O07V1m/3khRsjMtXJp5OezIYRMJ2jFnxRlcRTQLS8P
 reBNfZ6qmCG3T340H9fjMhHbKdNJFRIkf3kr/vukaANN0lpVcAjdBswHNqf11qUgH33Y
 Wu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q73i3hMuBxUxrFbYLWVi6ViGfZVt6krCqFXCEB5vvlY=;
 b=LqKvPPl45HNmE4qwbTX7ZoIFEvULltz79xFwjib+L1VdlFgJNAo11KH5eqzyQapj3v
 ZnBA2bZWnZ7Q6LAsotodqpehDe7qVm8kaU75aaY6TkPCJFtRqjl7Q/rgR7pe0renkSNP
 2dLZNNEEHsv7zNRSgeGKEYOQsByoAErhsS1CMfk9N6wqYV8yRrnZ56kA+rD4Xdg4JITY
 sd8G298ZLQZe/YSFmOTK1Pj0NHmSUNBl2VQDhbNnCsBohnVZ4adZs7ozuYzI3iTVBLp3
 k/PMvmVT/SeR5NXiaMmr8vHfSA3s9hhGWRgy8GbM2IipUIxlQmTqmj3dRs0HRpej9Nlj
 Pm0w==
X-Gm-Message-State: AOAM533Hzn1a69Cgm6voytnUDlPgBOHMnbX3D2SB2+Q2CPXJZsfrT9uq
 moaqCeTV9A9dC/9BUXiKytQ=
X-Google-Smtp-Source: ABdhPJxJbVLoPm87ELd0DmcDOrAiuFiatjpVHN4gxNIGssZZQrkFs91AE0mKTKSXQLZR64EA7nNRwQ==
X-Received: by 2002:a7b:c7cf:0:b0:397:5a50:85c7 with SMTP id
 z15-20020a7bc7cf000000b003975a5085c7mr15954062wmk.168.1653858403954; 
 Sun, 29 May 2022 14:06:43 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c415400b003958af7d0c8sm8728899wmm.45.2022.05.29.14.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 May 2022 14:06:43 -0700 (PDT)
Message-ID: <67d75594-e3cf-3a5f-a103-08b1e62b0283@gmail.com>
Date: Sun, 29 May 2022 23:06:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220523211416.1500310-1-fontaine.fabrice@gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220523211416.1500310-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: fix musl and uclibc-ng
 build
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

SGVsbG8gRmFicmljZSwKCkxlIDIzLzA1LzIwMjIgw6AgMjM6MTQsIEZhYnJpY2UgRm9udGFpbmUg
YSDDqWNyaXTCoDoKPiBGaXggdGhlIGZvbGxvd2luZyBtdXNsIGFuZCB1Y2xpYmMtbmcgYnVpbGQg
ZmFpbHVyZSByYWlzZWQgc2luY2UgYnVtcCB0bwo+IHZlcnNpb24gNy4wLjAgaW4gY29tbWl0IDNm
YTc5YzAzOGVjNzUyMjgwMTVlYTAwMjJkZTgwYzVlN2EyMDAzZjggYW5kCj4gaHR0cHM6Ly9naXQu
cWVtdS5vcmcvP3A9cWVtdS5naXQ7YT1jb21taXQ7aD0yNDRmZDA4MzIzMDg4ZGI3MzU5MGZmMjMx
N2RmZTg2ZjgxMGI1MWQ3Ogo+IAo+IC4uL2xpbnV4LXVzZXIvc3lzY2FsbC5jOiBJbiBmdW5jdGlv
biAndGFyZ2V0X3RvX2hvc3RfcmVzb3VyY2UnOgo+IC4uL2xpbnV4LXVzZXIvc3lzY2FsbC5jOjEw
NTc6MTY6IGVycm9yOiAnUkxJTUlUX1JUVElNRScgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRo
aXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4gJ1JMSU1JVF9OT0ZJTEUnPwo+ICAxMDU3IHwgICAg
ICAgICByZXR1cm4gUkxJTUlUX1JUVElNRTsKPiAgICAgICB8ICAgICAgICAgICAgICAgIF5+fn5+
fn5+fn5+fn4KPiAgICAgICB8ICAgICAgICAgICAgICAgIFJMSU1JVF9OT0ZJTEUKPiAKPiBGaXhl
czoKPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8yMmQzYjU4NGI3
MDQ2MTNkMDMwZTFlYTllNmI3MDliNzEzZTRjYzI2Cj4gCj4gU2lnbmVkLW9mZi1ieTogRmFicmlj
ZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgoKTm90ZTogVGhlIGxhdGVzdCByZWxl
YXNlIG9mIHVDbGliYy1uZyBjb250YWlucyBSTElNSVRfUlRUSU1FOgoKaHR0cHM6Ly9jZ2l0LnVj
bGliYy1uZy5vcmcvY2dpL2NnaXQvdWNsaWJjLW5nLmdpdC9jb21taXQvP2lkPWNhNGI4MTgyMTg2
YjI0NmY5MjVhZGE1ZWIyMmJmNDlhMDQyNDkzNTgKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAt
LS0KPiAgLi4ubGwuYy1maXgtYnVpbGQtd2l0aG91dC1STElNSVRfUlRUSU1FLnBhdGNoIHwgNDgg
KysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9xZW11LzAwMDMtbGludXgtdXNlci1zeXNjYWxs
LmMtZml4LWJ1aWxkLXdpdGhvdXQtUkxJTUlUX1JUVElNRS5wYXRjaAo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3FlbXUvMDAwMy1saW51eC11c2VyLXN5c2NhbGwuYy1maXgtYnVpbGQtd2l0aG91
dC1STElNSVRfUlRUSU1FLnBhdGNoIGIvcGFja2FnZS9xZW11LzAwMDMtbGludXgtdXNlci1zeXNj
YWxsLmMtZml4LWJ1aWxkLXdpdGhvdXQtUkxJTUlUX1JUVElNRS5wYXRjaAo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNzI5YzJlOWJlOAo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9wYWNrYWdlL3FlbXUvMDAwMy1saW51eC11c2VyLXN5c2NhbGwuYy1maXgtYnVpbGQt
d2l0aG91dC1STElNSVRfUlRUSU1FLnBhdGNoCj4gQEAgLTAsMCArMSw0OCBAQAo+ICtGcm9tIDg0
ODYzZTAwN2Q0ZWYwODU4ZTc0YTEyNTBlMjQ3Mjk1NDkyNGM2MTcgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCj4gK0Zyb206IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwu
Y29tPgo+ICtEYXRlOiBTYXQsIDE0IE1heSAyMDIyIDE2OjEwOjE2ICswMjAwCj4gK1N1YmplY3Q6
IFtQQVRDSF0gbGludXgtdXNlci9zeXNjYWxsLmM6IGZpeCBidWlsZCB3aXRob3V0IFJMSU1JVF9S
VFRJTUUKPiArCj4gK1JMSU1JVF9SVFRJTUUgaXMgbm90IHByb3ZpZGVkIGJ5IHVjbGliYy1uZyBv
ciBieSBtdXNsIHByaW9yIHRvIHZlcnNpb24KPiArMS4yLjAgYW5kCj4gK2h0dHBzOi8vZ2l0aHVi
LmNvbS9ibWlub3IvbXVzbC9jb21taXQvMjUwN2U3ZjUzMTJlNzk2MjBmNjMzNzkzNWQwYTZjOTA0
NWNjYmEwOQo+ICtyZXN1bHRpbmcgaW4gdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHNpbmNl
Cj4gK2h0dHBzOi8vZ2l0LnFlbXUub3JnLz9wPXFlbXUuZ2l0O2E9Y29tbWl0O2g9MjQ0ZmQwODMy
MzA4OGRiNzM1OTBmZjIzMTdkZmU4NmY4MTBiNTFkNzoKPiArCj4gKy4uL2xpbnV4LXVzZXIvc3lz
Y2FsbC5jOiBJbiBmdW5jdGlvbiAndGFyZ2V0X3RvX2hvc3RfcmVzb3VyY2UnOgo+ICsuLi9saW51
eC11c2VyL3N5c2NhbGwuYzoxMDU3OjE2OiBlcnJvcjogJ1JMSU1JVF9SVFRJTUUnIHVuZGVjbGFy
ZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuICdSTElNSVRfTk9G
SUxFJz8KPiArIDEwNTcgfCAgICAgICAgIHJldHVybiBSTElNSVRfUlRUSU1FOwo+ICsgICAgICB8
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn4KPiArICAgICAgfCAgICAgICAgICAgICAgICBS
TElNSVRfTk9GSUxFCj4gKwo+ICtGaXhlczoKPiArIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJv
b3Qub3JnL3Jlc3VsdHMvMjJkM2I1ODRiNzA0NjEzZDAzMGUxZWE5ZTZiNzA5YjcxM2U0Y2MyNgo+
ICsKPiArU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBn
bWFpbC5jb20+Cj4gK1tVcHN0cmVhbSBzdGF0dXM6Cj4gK2h0dHBzOi8vcGF0Y2h3b3JrLm96bGFi
cy5vcmcvcHJvamVjdC9xZW11LWRldmVsL3BhdGNoLzIwMjIwNTIzMTA1MjM5LjE0OTkxNjItMS1m
b250YWluZS5mYWJyaWNlQGdtYWlsLmNvbV0KPiArLS0tCj4gK0NoYW5nZXMgdjEgLT4gdjIgKGFm
dGVyIHJldmlldyBvZiBMYXVyZW50IFZpdmllcik6Cj4gKyAtIFVzZSBhbiBpZmRlZiBibG9jayBp
bnN0ZWFkIG9mIGRlZmluaW5nIFJMSU1JVF9SVFRJTUUKPiArCj4gKyBsaW51eC11c2VyL3N5c2Nh
bGwuYyB8IDIgKysKPiArIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiArCj4gK2Rp
ZmYgLS1naXQgYS9saW51eC11c2VyL3N5c2NhbGwuYyBiL2xpbnV4LXVzZXIvc3lzY2FsbC5jCj4g
K2luZGV4IGRkMGQ5MmJhNGUuLjQ4OGZhY2IzNTYgMTAwNjQ0Cj4gKy0tLSBhL2xpbnV4LXVzZXIv
c3lzY2FsbC5jCj4gKysrKyBiL2xpbnV4LXVzZXIvc3lzY2FsbC5jCj4gK0BAIC0xMDUzLDggKzEw
NTMsMTAgQEAgc3RhdGljIGlubGluZSBpbnQgdGFyZ2V0X3RvX2hvc3RfcmVzb3VyY2UoaW50IGNv
ZGUpCj4gKyAgICAgICAgIHJldHVybiBSTElNSVRfUlNTOwo+ICsgICAgIGNhc2UgVEFSR0VUX1JM
SU1JVF9SVFBSSU86Cj4gKyAgICAgICAgIHJldHVybiBSTElNSVRfUlRQUklPOwo+ICsrI2lmZGVm
IFJMSU1JVF9SVFRJTUUKPiArICAgICBjYXNlIFRBUkdFVF9STElNSVRfUlRUSU1FOgo+ICsgICAg
ICAgICByZXR1cm4gUkxJTUlUX1JUVElNRTsKPiArKyNlbmRpZgo+ICsgICAgIGNhc2UgVEFSR0VU
X1JMSU1JVF9TSUdQRU5ESU5HOgo+ICsgICAgICAgICByZXR1cm4gUkxJTUlUX1NJR1BFTkRJTkc7
Cj4gKyAgICAgY2FzZSBUQVJHRVRfUkxJTUlUX1NUQUNLOgo+ICstLSAKPiArMi4zNS4xCj4gKwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
