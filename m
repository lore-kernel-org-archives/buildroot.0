Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53682CD80CD
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 13:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8BD7417EC;
	Tue, 10 Oct 2023 13:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8BD7417EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qcgG95JDonOt; Tue, 10 Oct 2023 13:18:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCA4F418EA;
	Tue, 10 Oct 2023 13:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCA4F418EA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 189CB1BF3DF
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 13:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1E8A418B5
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 13:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1E8A418B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TiAjxckEixPM for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 13:18:48 +0000 (UTC)
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29779417EC
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 13:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29779417EC
Received: from [192.168.50.220] ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id qCdIqbHzxNaf2qCdIqrpSh; Tue, 10 Oct 2023 15:18:45 +0200
Message-ID: <94908e37-932a-4626-8fcb-c39d3293fe38@benettiengineering.com>
Date: Tue, 10 Oct 2023 15:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Sch=C3=A4ffner=2C_Florian?= <florian.schaeffner@physiomed.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <4fa235baaa88440e806f3c5f8f8bcb58@physiomed.de>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <4fa235baaa88440e806f3c5f8f8bcb58@physiomed.de>
X-CMAE-Envelope: MS4xfCNEme4BwAJBckH/8LY7nRFjfXH7/25LE3ZFmucNhI1a4GPWuJzXhDZlWtyUIVay0gs7d7d9PkHdxQjryKCXZahLyI1QsnLtrcZ4DVjgdMkdU6//w2c4
 vbkdGnqDlAhojH1HSkgPE98EV6bnUi0hftp+N2YOyM2nZYbJVcMU055GxMlsnq5ziuN3KYiJsogGQfqIBKEmj8uMgKc3sbDhuT+l09qPSPW/r95ySWRq3e7r
 xywk194U2p0qzGYO3dFEpAA1eOzGXfkLWDNBOFwZS6U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1696943925; bh=M/Dm/VdhZZcz4MxP5X85vm7TXDL/NZif2w3hDOJ4h+A=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=kV7QbYcTkDDgszXvddQ6R5O/dCc/rR35WYwnsbKrPvsc6pawn9RYQK11FpMq+QYUW
 jyPuPva6wTBGliU4dMv7VNMTfBvd/j9VkF1bXo+dFiHChzpwPSXBKVULXotNGfS5P7
 u1xGQqMSgGOB1pRaplNlmsSXUifCYGtpyEL46JghsZpU4Wtg2D3qxwiaSN5k5Dpix2
 b9p3phifoiXx3iMce9BZSxTxfKiqUTkvU6gi497cBWhcD2+UhNMVfOD4XtH6zNYM8F
 /WRqfL84U/6HHJ2mk8Fxj/HtlU26qqHMDI9fMW/X9dz9JqZm50K27YPDLLNNhsHFbx
 +Lcg1l3nVkhpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=kV7QbYcT
Subject: Re: [Buildroot] Future buildroot with QtQuick/QML Support
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmxvcmlhbiwKCk9uIDEwLzEwLzIzIDE0OjU5LCBTY2jDpGZmbmVyLCBGbG9yaWFuIHdy
b3RlOgo+IEhlbGxvLAo+IAo+IG91ciBhcHBsaWNhdGlvbiBpcyBidWlsdCBpbiB0aGUgZGV2ZWxv
cG1lbnQgZW52aXJvbm1lbnQgd2l0aCBRdCA2IGFuZCAKPiBRdFF1aWNrL1FNTC4gTm93IGkgdHJp
ZWQsIGJ1dCB3YXNu4oCZdCBhYmxlIHRvIHNldHVwIGEgd29ya2luZyBidWlsZHJvb3QgCj4gZm9y
IG91ciBhcHBsaWNhdGlvbiB0byBydW4gb24gYSBlbWJlZGRlZCBkZXZpY2UuCj4gCj4gSSBmb3Vu
ZCB0aGUgY29udmVyc2F0aW9uIGFib3V0IHF0NiBhbmQgUU1MIFN1cHBvcnQgb24gdGhlIGJ1aWxk
cm9vdCAKPiBtYWlsaW5nIGxpc3QgYW5kIHRoYXQgaXQgc2VlbXMgdG8gYmUgbm90IHBvc3NpYmxl
IHRvIHNldHVwIGEgYnVpbGRyb290IAo+IGZvciBvdXIgbmVlZHMgd2l0aCBRdDYgYW5kIFFNTCBz
dXBwb3J0Lgo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC9mMjJjZTA2ZC1k
OWNmLWM1NjEtNzQ1NS0xOWRjZTcyNGMxNThAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbS8KPiAKPiBJ
ZiBJIHVuZGVyc3Rvb2QgdGhlIGFuc3dlciBmcm9tIEdpdWxpbyBCZW5ldHRpIGNvcnJlY3RseSwg
dGhlcmUgaXMgCj4gY3VycmVudGx5IG5vIGNoYW5jZSB0byBtYWtlIHRoaXMgY29uZmlndXJhdGlv
biB3b3JrIGZvciBvdXIgZW1iZWRkZWQgCj4gYm9hcmQgd2l0aCBidWlsZHJvb3Q/Cj4gCj4gQ2Fu
IHlvdSBwbGVhc2UgdGVsbCBtZSBpZiB0aGVyZSB3aWxsIGJlIHN1cHBvcnQgZm9yIHRoaXMgaW4g
dGhlIG5leHQgCj4gbWFqb3IgYnVpbGRyb290IHZlcnNpb24/IE9yIGlzIGl0IG5vdCBwbGFubmVk
IG9yIGZvcmVzZWVhYmxlIHdoZW4gYSBRTUwgCj4gc3VwcG9ydCBpcyBwb3NzaWJsZSB3aXRoIGJ1
aWxkcm9vdD8KCmFzIEkgY2FuIHNlZSBmcm9tIEJ1aWxkcm9vdCBwYXRjaG9yayBhdCB0aGUgbW9t
ZW50IHRoZXJlIGlzIG5vIHBlbmRpbmcKcGF0Y2hlcyB0byBhZGQgZmVhdHVyZXMsIGJ1dCB0aGlz
IGRvZXNuJ3QgbWVhbiBpdCB3b24ndCBiZSBhZGRlZC4KCldoaWNoIG1vZHVsZXMgd291bGQgeW91
IGJlIGludGVyZXN0ZWQgaW4gbW9zdCBvZiBhbGw/CgpCZXN0IHJlZ2FyZHMKLS0gCkdpdWxpbyBC
ZW5ldHRpCkNFTyZDVE9AQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
