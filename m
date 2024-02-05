Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E32C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98DAF41820;
	Mon,  5 Feb 2024 15:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98DAF41820
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mMA5sbSd2RAN; Mon,  5 Feb 2024 15:34:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAE0141809;
	Mon,  5 Feb 2024 15:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAE0141809
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B3561BF2F6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60FC540377
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60FC540377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PmaV81SO4bGm for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:34:47 +0000 (UTC)
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91AFC40320
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91AFC40320
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id X0zbrmaKpD7V9X0zbrn9Po; Mon, 05 Feb 2024 16:34:44 +0100
Message-ID: <53ee955f-0870-456f-8c46-67fafb8bfff8@benettiengineering.com>
Date: Mon, 5 Feb 2024 16:34:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20231123134052.239690-1-dario.binacchi@amarulasolutions.com>
 <63d87792-b361-4915-b3bb-4bbb192a880d@benettiengineering.com>
In-Reply-To: <63d87792-b361-4915-b3bb-4bbb192a880d@benettiengineering.com>
X-CMAE-Envelope: MS4xfKiueF2d3/fz83t6jhhXqrzAFrR/rmnXt7AObCbre+XBFeDAHMZJkKCzeMxesRAFS/0cffxytnG/QHg2SmiYmnvbTEkOySmuTOGg+8pA8hdirv3idC4g
 hUi8L4nje9IvpMElX8wozwzPYjp3HjqbcU9fsB59grJiEUGKR19fAsGZs4qVYAZEcwJNhHL4LNHAOD9v8vUNGvhlq5AfZcwMsJVmWelgPR+1HhB+bBUJ6S0M
 XMXj7M1rBAvcf4KO7Roxry1h7kvd2Kh4djJ1YwUjEQL1+RKlPXws4tHAhBk7SGYLXQEkqSDZjxteQN5xpO2McyhlB00ixHKrFUT5Yx7XVEc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707147284; bh=DufgWSYep+6LVzclI58Kibyh/ZnaLkGODuWuar1PJDg=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=QqCvC4RTb4/kwUZqjP1M0yFpKnWN6Sv9gWrk9V8VQEj9gGaRamLdTz9pe63i/9EIs
 LuHJhx+eEy81COj8gSCIWdVV2eN5HqbwHTcvIgwlPAaoAoQrC14cD1WaUg5fOonbMo
 zQLtUsHyYsQoLbsHhzes2jUcme0QsueJmS8ccJ3LeTBanPwUWXEJkrHzYHyqKtU2uP
 6wsesa+jCIY3yVCHkCM0s2iWdf82jSdvau/3KL78DX/44wMw/fGFg0gnAu5eo8rVl5
 P02jZIH3kTOMx7UbY2tG+XOzoh5RCUPkxxN8jnkdgg4EGNRG3F4q2XmcWtPlrnmnw4
 3TiNcRHV4Jpgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=QqCvC4RT
Subject: Re: [Buildroot] [PATCH 1/2] configs/ti_am62x_sk_defconfig:
 explicitly set the kernel version
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGFyaW8sCgpJJ3ZlIGFsc28gdHJpZWQgdG8gYnVpbGQgdGhpcyBkZWZjb25maWcgYW5kIGl0IGZh
aWxzIHdoaWxlIGJ1aWxkaW5nCnRpLWszLXI1LWxvYWRlcgp3aXRoOgpgYGAKICAgQ09QWSAgICBz
cGwvdS1ib290LXNwbC5iaW4KLi90b29scy9rM19nZW5feDUwOV9jZXJ0LnNoIC1jIDE2IC1iIHNw
bC91LWJvb3Qtc3BsLmJpbiBcCgkJCS1vIHRpYm9vdDMuYmluIC1sIDB4NDNjMDAwMDAgLXIgMSAt
ayAiIgogIFNXUlYgPSAxCkNvdWxkIG5vdCBvcGVuIGZpbGUgb3IgdXJpIGZvciBsb2FkaW5nIHBy
aXZhdGUga2V5IGZyb20gZWNrZXkucGVtOiBObyAKc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQpjYXQ6
IGNlcnRpZmljYXRlLmJpbjogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQpybTogY2Fubm90IHJl
bW92ZSAnY2VydGlmaWNhdGUuYmluJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQpybTogY2Fu
bm90IHJlbW92ZSAnZWNrZXkucGVtJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQptYWtlWzNd
OiAqKiogW2FyY2gvYXJtL21hY2gtazMvL2NvbmZpZy5tazo1NTogdGlib290My5iaW5dIEVycm9y
IDEKbWFrZVszXTogKioqIERlbGV0aW5nIGZpbGUgJ3RpYm9vdDMuYmluJwpgYGAKCkNhbiB5b3Ug
cGxlYXNlIHRha2UgYSBsb29rIGludG8gaXQ/CgpUaGFuayB5b3UKQmVzdCByZWdhcmRzCi0tIApH
aXVsaW8gQmVuZXR0aQpDRU8mQ1RPQEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCgpPbiAwNS8wMi8y
NCAxNjoxMywgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4gSGkgRGFyaW8sCj4gCj4gT24gMjMvMTEv
MjMgMTQ6NDAsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+PiBDb21taXQgNGI4ZmRkYjA2MGZiICgi
Y29uZmlncy90aV9hbTYyeF9zazogbmV3IGRlZmNvbmZpZykgZm9yZ290IHRvCj4+IHNwZWNpZnkg
dGhlIExpbnV4IGtlcm5lbCB2ZXJzaW9uLCBzbyBkbyB0aGF0IG5vdy4KPj4KPj4gV2hlbiB0aGUg
ZGVmY29uZmlnIHdhcyBhZGRlZCwgdGhlIGRlZmF1bHQgdmVyc2lvbiB3YXMgNi40LngsIHNvIHVz
ZQo+PiB2ZXJzaW9uIDYuNC4xNi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkg
PGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiA+IC0tLQo+PiDCoCBjb25maWdz
L3RpX2FtNjJ4X3NrX2RlZmNvbmZpZyB8IDMgKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29u
ZmlnIAo+PiBiL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4+IGluZGV4IGI5OGE2OGZm
MTUzZi4uNjYxMGU2ZmNmODkwIDEwMDY0NAo+PiAtLS0gYS9jb25maWdzL3RpX2FtNjJ4X3NrX2Rl
ZmNvbmZpZwo+PiArKysgYi9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZwo+PiBAQCAtMSw3
ICsxLDEwIEBACj4+IMKgIEJSMl9hYXJjaDY0PXkKPj4gK0JSMl9LRVJORUxfSEVBREVSU182XzQ9
eQo+IAo+IGhlcmUgXl5eIHlvdSBuZWVkIHRvIHNwZWNpZnkgQlIyX1BBQ0tBR0VfSE9TVF9MSU5V
WF9IRUFERVJTX0NVU1RPTV82XzQKPiBhbmQgbm90IHRoZSBsaW5lIGFib3ZlLAo+IAo+PiDCoCBC
UjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2gi
Cj4+IMKgIEJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgYm9hcmQvdGkvYW02Mngtc2sv
Z2VuaW1hZ2UuY2ZnIgo+PiDCoCBCUjJfTElOVVhfS0VSTkVMPXkKPj4gK0JSMl9MSU5VWF9LRVJO
RUxfQ1VTVE9NX1ZFUlNJT049eQo+PiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9W
QUxVRT0iNi40LjE2Igo+PiDCoCBCUjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09O
RklHPXkKPj4gwqAgQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4+IMKgIEJSMl9MSU5V
WF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJ0aS9rMy1hbTYyNS1zayIKPiAKPiBDYW4geW91IHBs
ZWFzZSBjb3JyZWN0IGFuZCBzZW5kIFYyPwo+IAo+IFRoYW5rIHlvdSEKPiAKPiBCZXN0IHJlZ2Fy
ZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
