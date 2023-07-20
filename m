Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3513FC0015E
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D47F8611CD;
	Thu, 20 Jul 2023 21:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D47F8611CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZISS2Aqwpr3; Thu, 20 Jul 2023 21:28:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A19D60812;
	Thu, 20 Jul 2023 21:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A19D60812
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D43E21BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACB40404DD
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACB40404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KeUUbHLYKL5y for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:28:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EC724049D
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EC724049D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BCDB40004;
 Thu, 20 Jul 2023 21:28:29 +0000 (UTC)
Date: Thu, 20 Jul 2023 23:28:27 +0200
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Message-ID: <20230720232827.09c3094d@windsurf>
In-Reply-To: <20230719125309.723762-1-vincent.stehle@arm.com>
References: <20230719125309.723762-1-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689888509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ox4ojkJImz1+nlbjABQ0PqYA7/OrULkPV34uKlVMeaQ=;
 b=c7IzbmHQqJLXoO8AZF6mEoS7E+UHxy1s4i1mxYQbQ1+RPTvXJSdfhXfwzd1j8fWx7PdkHY
 d6YAinJgR5ISFFAJSi6P+EQWoAOJ2cSuIFvlykbbHa5GXlBcL4Azn1LeOrZaNAFWmZjSDk
 IMX+ovAJIDDrZWLncWfKiZQktmzTNKoA4y2YJRFOg940N5I141qNWYyhVqCXwaozvaImX7
 MfPcKXwez86KJfTc+kIbhwCiYZnVQal2yPe7Yjm6EXNdu4csKWaBOQUQx7yTrSrzJoSXRY
 jVazd7s/bm7rh78avAsL8e29tYonNNkhLITTnlLaNnjCoSZF580jDAuT3W9evg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c7IzbmHQ
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: add patch to fix
 fiptool link
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVmluY2VudCwKCk9uIFdlZCwgMTkgSnVsIDIwMjMgMTQ6NTM6MDkgKzAyMDAKVmluY2Vu
dCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPiB3cm90ZToKCj4gV2hlbiBidWlsZGlu
ZyBhIGZpcCBmaXJtd2FyZSAoQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9GSVA9eSks
IHRoZQo+IFRGLUEgYnVpbGQgcmVjaXBlIHN0YXJ0cyBieSBidWlsZGluZyB0aGUgaG9zdCBwcm9n
cmFtIGZpcHRvb2wgd2l0aCB0aGUKPiBwcm9wZXIgYnVpbGQgZW52aXJvbm1lbnQgdmFyaWFibGVz
LiBUaGVuIHRoZSBtYWluIFRGLUEgdGFyZ2V0IGZpcm13YXJlCj4gYnVpbGQgc3RlcCB0YWtlcyBw
bGFjZSwgd2l0aCB0aGUgZXhwZWN0YXRpb24gdGhhdCB0aGUgZmlwdG9vbCBwcm9ncmFtIHdpbGwK
PiBiZSB1c2VkIHVuZGVyIHRoZSBob29kIGlmIG5lY2Vzc2FyeS4KPiAKPiBJbiBURi1BLCB0aGUg
YnVpbGQgcmVjaXBlIGZvciB0aGUgaG9zdCBwcm9ncmFtIGZpcHRvb2wgaGFzIHN1YnRseSBjaGFu
Z2VkCj4gYWZ0ZXIgdjIuNywgaW4gY29tbWl0IGNmMmRkMTdkZGRhMiAoInJlZmFjdG9yKHNlY3Vy
aXR5KTogYWRkIE9wZW5TU0wgMS54Cj4gY29tcGF0aWJpbGl0eSIpLiBUaGlzIGNoYW5nZSBoYXMg
dGhlIGVmZmVjdCB0byBmb3JjZSByZS1saW5raW5nIGZpcHRvb2wKPiBlYWNoIHRpbWUuCj4gCj4g
SWYgd2UgdHJ5IHRvIGJ1aWxkIHdpdGggQnVpbGRyb290IGEgZmlwIGZpcm13YXJlIHdpdGggYSBU
Ri1BIHZlcnNpb24gYWZ0ZXIKPiB2Mi43IGNvbXByaXNpbmcgdGhlIGFmb3JlbWVudGlvbmVkIGNo
YW5nZSwgdGhlIGZpcHRvb2wgcHJvZ3JhbSBpcyBmb3JjaWJseQo+IHJlLWxpbmtlZCBkdXJpbmcg
dGhlIG1haW4gZmlybXdhcmUgYnVpbGQgc3RlcC4gVGhpcyBoYXBwZW5zIHdpdGhvdXQgdGhlCj4g
cHJvcGVyIGJ1aWxkIGVudmlyb25tZW50IHZhcmlhYmxlcyBhbmQgY29uc2VxdWVudGx5LCBpZiBv
cGVuc3NsIGlzIG5vdAo+IGluc3RhbGxlZCBvbiB0aGUgaG9zdCwgdGhlIGxpYmNyeXB0byBzaGFy
ZWQgbGlicmFyeSB3aWxsIG5vdCBiZSBmb3VuZCBieQo+IHRoZSBsaW5rZXIgYW5kIHRoZSBsaW5r
IHdpbGwgZmFpbCB3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3I6Cj4gCj4gICAvdXNyL2Jpbi9sZDog
Y2Fubm90IGZpbmQgLWxjcnlwdG86IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiAKPiBBIHBh
dGNoIGhhcyBiZWVuIGludGVncmF0ZWQgaW50byBURi1BIHRvIGF2b2lkIHJlLWxpbmtpbmcgZmlw
dG9vbCB3aGVuIG5vdAo+IG5lY2Vzc2FyeSwgd2hpY2ggc2hvdWxkIHNvbHZlIHRoZSBwcm9ibGVt
IHN0YXJ0aW5nIHdpdGggdmVyc2lvbiB2Mi4xMC4gQWRkCj4gdGhhdCBwYXRjaCBpbiBCdWlsZHJv
b3QgZm9yIHZlcnNpb25zIHYyLjggYW5kIHYyLjksIHRvIHJlcGFpciB0aGUgYnVpbGQgaW4KPiB0
aGUgY2FzZXMgZGVzY3JpYmVkIGFib3ZlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3Rl
aGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiBDYzogRGljayBPbHNzb24gPGhpQHNlbnpp
bGxhLmlvPgo+IENjOiBTZXJnZXkgTWF0eXVrZXZpY2ggPGdlb21hdHNpQGdtYWlsLmNvbT4KPiAt
LS0KPiAKPiAKPiBIaSwKPiAKPiBUaGlzIGNhbiBiZSB0ZXN0ZWQgd2l0aCBlLmcuIHRlc3RzLmJv
b3QudGVzdF9lZGsyIGluIGFuIGVudmlyb25tZW50IHdpdGggbm8KPiBvcGVuc3NsIChsaWJjcnlw
dG8pIGluc3RhbGxlZC4KCkluZGVlZCwgd2hpY2ggbWVhbnMgdGhpcyBjb21taXQgY2FuIGhhdmU6
CgpGaXhlczoKCiAgaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0v
am9icy80NjY0ODQ1NzY3CgpBcyB1c3VhbCwgb25lIGNvbmNlcm4gaXMgdGhhdCB5b3VyIGNvbW1p
dCBpcyBmaXhpbmcgdGhlIGlzc3VlIGZvcgpwZW9wbGUgdXNpbmcgdjIuOCBhbmQgdjIuOSBwcmVj
aXNlbHksIGJ1dCBhbnlvbmUgdXNpbmcgYSBjdXN0b20gdmVyc2lvbgpiYXNlZCBvbiAyLjggb3Ig
Mi45IHdpbGwgbm90IGJlbmVmaXQgZnJvbSB0aGlzIGZpeC4KCk9uZSBvcHRpb24gd291bGQgYmUg
dG8gcGFzcyB0aGUgcmVsZXZhbnQgZW52aXJvbm1lbnQgdmFyaWFibGVzIGFsc28gYXQKYnVpbGQg
dGltZSwgc28gdGhhdCB3aGVuIGZpcHRvb2wgaXMgcmVsaW5rZWQsIGl0IGdldHMgcmVsaW5rZWQK
Y29ycmVjdGx5LiBCdXQgaXQncyBxdWl0ZSBhbm5veWluZyB0byBrZWVwIHRoaXMgcHJldHR5IG11
Y2ggZm9yZXZlciBpbgpCdWlsZHJvb3QuIFNvIHBlcmhhcHMgeW91ciBzb2x1dGlvbiB3aXRoIGEg
cGF0Y2ggaXMgdGhlIG1vc3QKcmVhc29uYWJsZSwgYW5kIHBlb3BsZSBhZmZlY3RlZCBieSB0aGUg
aXNzdWUgd2lsbCBmaW5kIHRoZSBwYXRjaCBpbgpCdWlsZHJvb3QgYW5kIHVzZSBpdCBmb3IgdGhl
aXIgY3VzdG9tIHZlcnNpb24gYXMgd2VsbC4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwg
Y28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
