Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AA8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 18:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B82940200;
	Mon, 17 Jan 2022 18:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zE4kodYopx9l; Mon, 17 Jan 2022 18:37:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97E88401F8;
	Mon, 17 Jan 2022 18:37:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09CF51BF2F3
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 18:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC2BD60BBC
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 18:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vq5wl5mBguD9 for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 18:37:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E1FE600C4
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 18:37:26 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9WsenBHDeBBmw9Wsenv9hH; Mon, 17 Jan 2022 19:37:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642444644; bh=p1W+VIT6F57oFlCkDMos9JGl8ZMiXZxxneDb9K22MYg=;
 h=Subject:From:To:Date:MIME-Version:Content-Type;
 b=M4fI6nsN3l/2x+zedmn2gwhXtJPLQca+3XXrmehrvmQXu3+MC12LxurtDbbsLClSD
 R2anHrZn0ENSUFOsD/o43MdtV9XDwmtdhxGhpVfhiPFTMMCHrpDeq+k4Evserg9xlr
 bgX1NMkbwnoYzQqeGMx6SmQmOt8R2pK5MLkWbQTHqIiaR16AX4G8qPuigyN8JJzLaL
 UDANfhGeydTb5TKtGLCC+05jMEWB9XaMESCEvLNY1sRfeiy3fH3k/N4kxNcJYb7nQm
 FmOKxOzwy0kuEG8MMcErp3oDlQ0fLuPyIUNafzWyZ7OKMJ865RWak38w232LuCzrF8
 MDfKCB/4LHhKQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
References: <759da9ea-e1b8-353c-9745-1f9d91038f08@benettiengineering.com>
 <70C0CBB8-3896-423C-B7B7-135E02A6AF12@benettiengineering.com>
Message-ID: <0a38b60e-a2b2-e4b4-5780-97680f2563c0@benettiengineering.com>
Date: Mon, 17 Jan 2022 19:37:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <70C0CBB8-3896-423C-B7B7-135E02A6AF12@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfB0OJOfa/0cI0DZLh0uMrh8F4ElPyPXTe/6UkLCcS78c6FLS5GCLfBBYhkP6zxvoB6oQk+NjAfq+mA6M81rN/3w0qF6Y33ieIya/T4JYd7OkKqn4C1pa
 FRYn0yATZyK7lKczhTdqPk9Yhj8hROgVi9V9vu3h9jpLKbA38nugwpXai/fMGWNBs+KEPitJOKpR5igsO5DWErktG0l2uLA0TSafOd90+ocS2PPsSDs9QTvY
 dnx9Q2xsaWZoTQjhSf9ENj/NtdabJ+S5c7kueHotjwc=
Subject: Re: [Buildroot] [PATCH] board/orangepi/orangepi-zero:extlinux,
 refactoring
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yZ290dGVuIGFnYWluIHRvIENjIE1MLgoKU29ycnkhCgotLSAKR2l1bGlvIEJlbmV0dGkKQmVu
ZXR0aSBFbmdpbmVlcmluZyBzYXMKCk9uIDE3LzAxLzIyIDE1OjE2LCBHaXVsaW8gQmVuZXR0aSB3
cm90ZToKPiAKPj4gSWwgZ2lvcm5vIDE3IGdlbiAyMDIyLCBhbGxlIG9yZSAxMjozOCwgR2l1bGlv
IEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IGhhIHNjcml0
dG86Cj4+Cj4+IO+7v0hpIFNlcmdleSwKPj4KPj4+IE9uIDE2LzAxLzIyIDE5OjE5LCBTZXJnZXkg
S3V6bWlub3Ygd3JvdGU6Cj4+PiAxNi4wMS4yMDIyIDE4OjI5LCBHaXVsaW8gQmVuZXR0aToKPj4+
PiBIaSBTZXJnZXksIFBldGVyLCBBbGwsCj4+Pj4KPj4+PiArIyBBcmNoaXRlY3R1cmUKPj4+PiBC
UjJfYXJtPXkKPj4+PiBCUjJfY29ydGV4X2E3PXkKPj4+PiBCUjJfQVJNX0ZQVV9WRlBWND15Cj4+
Pj4g4oCmSGVyZSBeXl4geW91IGNhbiBlbmFibGUgVkZQK05FT04uIEl04oCZcyB3b3JraW5nIG9u
IGFsbCBPbGltZXggYm9hcmRzIHdpdGggc3VueGkgQTcgYW5kIGNhbiBzcGVlZCB0aGluZ3MgdXAu
Cj4+Pj4KPj4+IEhpLCBHaXVsaW8uIEkgd2lsbCB0ZXN0LCB0aGFua3MuCj4+Pj4+ICsjIFdpcmVs
ZXNzIGRyaXZlciBhbmQgZmlybXdhcmUKPj4+Pj4gKyMgWzE2LjAxLjIwMjJdIERvZXNuJ3QgY29t
cGlsZSB3aXRoIG5ld2VyIGtlcm5lbHMgPiA1LjEyLngKPj4+Pj4gQlIyX1BBQ0tBR0VfWFI4MTlf
WFJBRElPPXkKPj4+Pj4gQlIyX1BBQ0tBR0VfQVJNQklBTl9GSVJNV0FSRT15Cj4+Pj4+IEJSMl9Q
QUNLQUdFX0FSTUJJQU5fRklSTVdBUkVfWFI4MTk9eQo+Pj4+IENhbiB5b3UgcG9pbnQgYSB0ZXN0
IGNhc2U/IFRoaXMgd2F5IEkgY291bGQgdHJ5IHRvIGZpeCBidWlsZGluZyBhbmQgeW91IGNvdWxk
IHRlc3QgaWYgaXQgd29ya3MuCj4+Pj4KPj4+PiBUaGFuayB5b3UKPj4+PiBCZXN0IHJlZ2FyZHMK
Pj4+PiDigJQtCj4+Pj4gR2l1bGlvIEJlbmV0dGkKPj4+PiBCZW5ldHRpIEVuZ2luZWVyaW5nIHNh
cwo+Pj4+Cj4+PiBUbyBjaGVjaywgc2V0IHRoZSBwYXJhbWV0ZXJzIGluIHRoZSBjdXJyZW50IHZl
cnNpb24gb2YgQnVpbGRyb290Cj4+PiBCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VT
VE9NXzVfMTU9eQo+Pj4gQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS4x
NS4xNSIKPj4+IGluIHRoZSBjb25maWdzL29yYW5nZXBpX3plcm9fZGVmY29uZmlnIGZpbGUKPj4+
IG1ha2Ugb3JhbmdlcGlfemVyb19kZWZjb25maWcKPj4+IG1ha2UKPj4KPj4gSSd2ZSBmaXhlZCB0
aGUgYnVpbGRpbmcgb2YgdGhpcyBeXl46Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9naXVsaW9iZW5l
dHRpL2J1aWxkcm9vdC9jb21taXQvNWU4YTQyMmIyMzFmMzk1ZDY2NzRhMjMxMGVmMGZmYmY2NGFi
MzhkYwo+Pgo+PiBDYW4geW91IHRlc3QgaWYgaXQgd29ya3MgcnVudGltZT8KPj4KPj4gVGhpcyB3
YXkgeW91ciBhY3R1YWwgcGF0Y2ggY2FuIGNoYW5nZSB1c2luZyBsYXRlc3QgTGludXgoNS4xNi4x
KS4KPj4KPj4gSSd2ZSBhbHJlYWR5IG9wZW5lZCBhIFBSIGZvciB0aGF0IHBhdGNoOgo+PiBodHRw
czovL2dpdGh1Yi5jb20vZmlmdGVlbmhleC94cmFkaW8vcHVsbC8xNQo+IAo+IEkgaGF2ZW7igJl0
IGNoZWNrZWQgdGhlcmUgd2FzIGFscmVhZHkgYSBwZW5kaW5nIFBSIGZvciB0aGlzOgo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9maWZ0ZWVuaGV4L3hyYWRpby9wdWxsLzE0Cj4gCj4gQW55d2F5IHRoZXkg
ZG8gdGhlIHNhbWUgdGhlIHRoaW5nIHdpdGggMiBkaWZmZXJlbnQgYXBwcm9hY2hlcy4KPiAKPiBC
ZXN0IHJlZ2FyZHMKPiBHaXVsaW8gQmVuZXR0aQo+IEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCj4g
Cj4+Cj4+IE9uY2UgbXkgcGF0Y2ggd2lsbCBiZSBtZXJnZWQgSSB3aWxsIGJ1bXAgeHJhZGlvIHZl
cnNpb24gdG8gbGF0ZXN0IGluIEJ1aWxkcm9vdC4KPj4KPj4gVGhhbmsgeW91Cj4+IEJlc3QgcmVn
YXJkcwo+PiAtLSAKPj4gR2l1bGlvIEJlbmV0dGkKPj4gQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
