Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DBAC4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 13:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D74AB41606;
	Tue, 20 Dec 2022 13:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D74AB41606
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oznKpP8ah8HU; Tue, 20 Dec 2022 13:14:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C10FA4160A;
	Tue, 20 Dec 2022 13:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C10FA4160A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 91C531BF3AE
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 13:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A67040204
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 13:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A67040204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fBpolo90ouo for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 13:14:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC9EC400C0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC9EC400C0
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 13:14:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:cf59:3d28:f63b:149b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9BAC15FFA3;
 Tue, 20 Dec 2022 14:14:00 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Dec 2022 14:14:00 +0100
Date: Tue, 20 Dec 2022 14:14:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221220131400.GG2909@scaer>
References: <20221219225820.429460-1-fontaine.fabrice@gmail.com>
 <20221220084752.GF2909@scaer>
 <CAPi7W83Fmd2ijRsCwpSfNf2YgRbE=yCDHTKgpKwxmg3Je3kkMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W83Fmd2ijRsCwpSfNf2YgRbE=yCDHTKgpKwxmg3Je3kkMQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1671542043;
 bh=jcHJf1/ezyhhJFzwShW34Ky5giwKL2zG5F2nvZItVUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c1HiBv/7T1AQInpsXmCi8yTYFcnMqt3ZnTXNv0Y/HPcDjRrwMT3Dv5X3pipKJF/DO
 5EsAzJ3YK2uq+6Ad1XARunbS35DV/1QYIFEin8ZVMR0SXyChirSn5y6uaBbkz9RtY6
 DAdvvt9/7cq6OhIwJGwvzGtK1EKLU2mLb0F3VT+DxdGzq9esCAnN6MdLflCX2NtcPp
 nVv+8Y6lsVAEHiy9HthqLEfMNO1/4ZC4KEDqjVhbklT5aBfDAwR66IKHQwI0cJqkLA
 ZlQs9xaT/YlqIiW6MXFQNJF+RBhA9SLUbXT16cDOeN6wGRvNdi0vEzcmONNyyM6T64
 gKwRw8BabKxXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c1HiBv/7
Subject: Re: [Buildroot] [PATCH 1/1] package/lightning; fix build
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
Cc: Paul Cercueil <paul@crapouillou.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RkFicmljZSwgQWxsLAoKT24gMjAyMi0xMi0yMCAwOTo1MiArMDEwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gTGXCoG1hci4gMjAgZMOpYy4gMjAyMiDDoMKgMDk6NDcsIFlhbm4g
RS4gTU9SSU4gPCBbMV15YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXTCoDoKPiAgIE9u
IDIwMjItMTItMTkgMjM6NTggKzAxMDAsIEZhYnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+
ICAgPiBGaXggdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHJhaXNlZCBzaW5jZSBidW1wIHRv
IHZlcnNpb24gMi4yLjAgaW4KPiAgID4gY29tbWl0IGFmNmY3YWE3NmRiNWFlZDFlYWRhMGIyN2Jk
MDM3NTYxMGEyZmM3MjggYW5kClstLVNOSVAtLV0KPiAgID4gKyAjaWYgQklOVVRJTFNfMl8zOAo+
ICAgPiArLXN0YXRpYyBpbnQgZnByaW50Zl9zdHlsZWQodm9pZCAqLCBlbnVtIGRpc2Fzc2VtYmxl
cl9zdHlsZSwgY29uc3QgY2hhciogZm10LCAuLi4pCj4gICA+ICsrc3RhdGljIGludCBmcHJpbnRm
X3N0eWxlZCh2b2lkICogc3RyZWFtLCBlbnVtIGRpc2Fzc2VtYmxlcl9zdHlsZSBzdHlsZSwgY29u
c3QgY2hhciogZm10LCAuLi4pCj4gICBTaG91bGQgaXQgYmUgbWFya2VkIHdpdGjCoCBfX2F0dHJp
YnV0ZV9fKCh1bnVzZWQpKcKgIG9yIHNvbWUgc3VjaD8KPiBJbmRlZWQsIEknbGwgc2VuZCBhIHYy
LgoKQW5kIGV2ZW4gYmV0ZXIgeWV0OiBjaGFuZ2UgdGhlIGNvZGUgdG8gYWN0dWFsbHkgdXNlIHRo
ZSBzdHJlYW06CgogICAgLSAgciA9IHZwcmludGYoZm10LCBhcmdzKTsKICAgICsgIHIgPSB2ZnBy
aW50ZihzdHJlYW0sIGZtdCwgYXJncyk7CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVk
ZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAz
NzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAg
ICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFgg
IEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1h
LWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3ku
ICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
