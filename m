Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27957C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 09:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2B3D40158;
	Thu,  2 Nov 2023 09:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2B3D40158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 90mKbWdKkUZw; Thu,  2 Nov 2023 09:47:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1A634337C;
	Thu,  2 Nov 2023 09:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1A634337C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E0AC1BF591
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 09:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1D464337C
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 09:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1D464337C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64E_bo9ECPua for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 09:47:27 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17AF540158
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 09:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17AF540158
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F6B92000A;
 Thu,  2 Nov 2023 09:47:23 +0000 (UTC)
Date: Thu, 2 Nov 2023 10:47:22 +0100
To: =?UTF-8?B?Q2zDqW1lbnQ=?= Ramirez <ramirez.clement3@gmail.com>
Message-ID: <20231102104722.090eab1a@windsurf>
In-Reply-To: <CADRKr2pREAb+Yjb3kZPv4zj+mr0_pg9ZdB47eR0N+o2zZOsYtA@mail.gmail.com>
References: <20231010070558.9791-1-ramirez.clement3@gmail.com>
 <874jiydiiq.fsf@tarshish>
 <CADRKr2ov7vayiQPreXt1Z5mhy848UJxztJ+seMmGk1t36ikRiw@mail.gmail.com>
 <87v8bec0pm.fsf@tarshish>
 <CADRKr2oNM2btAby66VOSNCs2bJkheButc7R+5N7kB-Kc7YuWtg@mail.gmail.com>
 <20231101172935.4daa4d99@windsurf>
 <CADRKr2pREAb+Yjb3kZPv4zj+mr0_pg9ZdB47eR0N+o2zZOsYtA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698918444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XOqm9+PEYWfEhMUlgeDAfuRfMZ62r9bxPYw2CUfT/8M=;
 b=o+g+IfMo9gIGFnfeA3NSkpNZTnRa2byColubCqXk3azwXWmwzJ8uLt3CTww/ms5WrRfPME
 5Gp6adDQdbtU9eXBYE4Tik2g4ctReg5RYrD21xarrcBnuokDdKI2lOc1UvbV8Tne7aHqE8
 Hm6A99JYgV2JrREHu3FFzVrCqNmVlXnJQrVWFwi3ayd4VQ1Gwv2De3QL5EVU7Hdv2eMbI0
 baJJbsYMWzPKFIDKkVl5FyEqcFbHQBJpKjmM2gyOpK/3Du+PHdQStvOMTOTetUB4O9aJx0
 Chgmax4SohhJPs2lNPrBnH8T1s3Pau2ABoxKZt+49tPwfx5LOlrRRWFuLuvi1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o+g+IfMo
Subject: Re: [Buildroot] [PATCH] package/qemu: security bump version to 8.1.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2zDqW1lbnQsCgpPbiBUaHUsIDIgTm92IDIwMjMgMTA6Mzc6MzYgKzAxMDAKQ2zDqW1l
bnQgUmFtaXJleiA8cmFtaXJlei5jbGVtZW50M0BnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGF0IHdp
bGwgYmUgdmVyeSBuaWNlLCBhbmQgc2ltcGxlciB0aGFuIGdlbmVyYXRpbmcgYW4gWE1MIGVudHJ5
IGFzIGRlc2NyaWJlZAo+IG9uIHRoZSBDUEUgc3VibWlzc2lvbiB3ZWIgcGFnZSAoWzBdKS4KPiBJ
IHdpbGwgdHJ5IHRvIGVtYWlsIHRoZW0gdG9kYXkgYW5kIEkga2VlcCB5b3UgdXBkYXRlZCBpZiBJ
IGVuY291bnRlcmVkCj4gc29tZSBwcm9ibGVtcyB0byBkbyBpdC4KCkZvciByZWZlcmVuY2UsIGhl
cmUgaXMgYW4gZS1tYWlsIEkgc2VudCB0byB0aGVtLCBhbmQgZm9sbG93aW5nIHdoaWNoCnRoZXkg
ZGlkIGZpeCB0aGUgQ1ZFIGRhdGFiYXNlLgoKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CkZyb206IFRob21hcyBQZXRh
enpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+ClRvOiBudmRAbmlzdC5nb3YKQ2M6
ICJidWlsZHJvb3RAYnVpbGRyb290Lm9yZyIgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPgpTdWJq
ZWN0OiBDVkUtMjAyMS00MDM0IHZlcnNpb24gcmFuZ2UgZml4CkRhdGU6IFNhdCwgMiBTZXAgMjAy
MyAxOTozNDozNCArMDIwMApPcmdhbml6YXRpb246IEJvb3RsaW4KTWVzc2FnZS1JRDogPDIwMjMw
OTAyMTkzNDM0LjQ4NjVkYmQ0QHdpbmRzdXJmPgoKRGVhciBOVkQgbWFpbnRhaW5lcnMsCgpDVkUt
MjAyMS00MDM0IGlzIG1hcmtlZCBpbiB0aGUgTlZEIGRhdGFiYXNlIGFzIGFmZmVjdGluZyBhbGwg
dmVyc2lvbnMKb2YgdGhlIHBvbGtpdCBwcm9qZWN0IGR1ZSB0byB0aGUgZm9sbG93aW5nICJDb25m
aWd1cmF0aW9uIDEiOgoKICBjcGU6Mi4zOmE6cG9sa2l0X3Byb2plY3Q6cG9sa2l0Oio6KjoqOio6
KjoqOio6KgoKSG93ZXZlciwgYXMgaW5kaWNhdGVkIGluCmh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1
bG4vZGV0YWlsL0NWRS0yMDIxLTQwMzQsIHRoaXMgaXNzdWUgaGFzIGJlZW4KZml4ZWQgaW4gdGhl
IHVwc3RyZWFtIHBvbGtpdCBwcm9qZWN0IGFzIG9mIGNvbW1pdApodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvcG9sa2l0L3BvbGtpdC8tL2NvbW1pdC9hMmJmNWM5YzgzYjZhZTQ2Y2JkNWM3
NzlkMzA1NWJmZjgxZGVkNjgzLgoKSW4gdHVybiwgdGhpcyBjb21taXQgaXMgaW50ZWdyYXRlZCBp
biBwb2xraXQgc2luY2UgdmVyc2lvbiAxMjE6Cgpwb2xraXQkIGdpdCB0YWcgLS1jb250YWlucyBh
MmJmNWM5YzgzYjZhZTQ2Y2JkNWM3NzlkMzA1NWJmZjgxZGVkNjgzCjEyMQoxMjIKMTIzCgpTbywg
dGhlICJDb25maWd1cmF0aW9uIDEiIHNob3VsZCBiZSBmaXhlZCB0byBpbmRpY2F0ZSB0aGF0IG9u
bHkKdmVyc2lvbnMgPCAxMjEgYXJlIGFmZmVjdGVkLiBDb3VsZCB0aGlzIGJlIGFkZHJlc3NlZCBp
biB5b3VyIE5WRApkYXRhYmFzZT8KCkJlc3QgcmVnYXJkcywKClRob21hcyBQZXRhenpvbmkKPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09CgpCZXN0IHJlZ2FyZHMsCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNv
LW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
