Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4551C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 20:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E8A361318;
	Fri, 11 Mar 2022 20:47:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s8eOIOe58W4B; Fri, 11 Mar 2022 20:47:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5985860A87;
	Fri, 11 Mar 2022 20:47:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 667431C115D
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 20:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 610D3401B7
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 20:47:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mq-XfIitv0RB for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 20:47:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1473840179
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 20:47:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3ABC8100005;
 Fri, 11 Mar 2022 20:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647031659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=toIFVcDELrlfDH8FYd73mActz0ZR2H4IckFofXsyeDQ=;
 b=BjqlOyCh4EI8FsdtVaJvepnX8s/Xxb3gsVkA0mQUPSunc0MnmiDyZtTVF5STxB0K0xGxmM
 J1SbK3W7TNxGQz+6uHS7yfIm1fbDbWUmHsFdurs52Yv3cHHXm14aerJkem4nLtWrIodz4b
 YK9ydz0kVAmvzJO6GklI7rjp8sniSEhpLLN8G/FMKxOFrmUt58bXoOasr4fSEM1hw7vBVR
 7pR+jqcgxPu5rAXu2APXDYih0/UQ7NjSraXyiCJHRFOZj0zrsBnnK4i6E3djbXgMKboJgQ
 4TVdcOfdoQkZw+XkXrGg/9VG3hJU5VYUVywY9rOanvYeTk4AHKokhVyKMgEktg==
Date: Fri, 11 Mar 2022 21:47:38 +0100
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Message-ID: <20220311214738.5b2142e3@windsurf>
In-Reply-To: <20220311123636.13415-4-clement.leger@bootlin.com>
References: <20220311123636.13415-1-clement.leger@bootlin.com>
 <20220311123636.13415-4-clement.leger@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 3/7] boot/optee-os: bump to version 3.16.0
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2zDqW1lbnQsCgpPbiBGcmksIDExIE1hciAyMDIyIDEzOjM2OjMyICswMTAwCkNsw6lt
ZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4gd3JvdGU6Cgo+IEJ1bXAgT1At
VEVFIE9TIHBhY2thZ2UgdmVyc2lvbiB0byBPUC1URUUgcmVsZWFzZSAzLjE2LjAgYW5kIHNldAo+
IEJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NSWVBUT0dSQVBIWSBkZWZhdWx0IHRv
ICd5JyBzaW5jZQo+IHB5dGhvbi1jcnlwdG9ncmFwaHkgaXMgbm93IG5lZWRlZCB0byBidWlsZCBv
cHRlZS1vcy4KPiAKPiBBY2tlZC1ieTogRXRpZW5uZSBDYXJyaWVyZSA8ZXRpZW5uZS5jYXJyaWVy
ZUBsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5s
ZWdlckBib290bGluLmNvbT4KPiAtLS0KPiAgYm9vdC9vcHRlZS1vcy9Db25maWcuaW4gICAgIHwg
NSArKystLQo+ICBib290L29wdGVlLW9zL29wdGVlLW9zLmhhc2ggfCA0ICsrLS0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2Jvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluIGIvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4KPiBp
bmRleCBmODQyNmY5YWIyLi42ZmUyYWU5NWFjIDEwMDY0NAo+IC0tLSBhL2Jvb3Qvb3B0ZWUtb3Mv
Q29uZmlnLmluCj4gKysrIGIvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4KPiBAQCAtMTgsNyArMTgs
NyBAQCBjaG9pY2UKPiAgCSAgU2VsZWN0IHRoZSB2ZXJzaW9uIG9mIE9QLVRFRSBPUyB5b3Ugd2Fu
dCB0byB1c2UKPiAgCj4gIGNvbmZpZyBCUjJfVEFSR0VUX09QVEVFX09TX0xBVEVTVAo+IC0JYm9v
bCAiMy4xNS4wIgo+ICsJYm9vbCAiMy4xNi4wIgo+ICAJaGVscAo+ICAJICBVc2UgdGhlIGxhdGVz
dCByZWxlYXNlIHRhZyBmcm9tIHRoZSBPUC1URUUgT1Mgb2ZmaWNpYWwgR2l0Cj4gIAkgIHJlcG9z
aXRvcnkuCj4gQEAgLTUwLDYgKzUwLDcgQEAgZW5kaWYKPiAgCj4gIGNvbmZpZyBCUjJfVEFSR0VU
X09QVEVFX09TX05FRURTX1BZVEhPTl9DUllQVE9HUkFQSFkKPiAgCWJvb2wgIm9wdGVlLW9zIG5l
ZWRzIGhvc3QtcHl0aG9uLWNyeXB0b2dyYXBoeSB0byBidWlsZCIKPiArCWRlZmF1bHQgeQoKUmF0
aGVyIHRoYW4gYSAiZGVmYXVsdCB5IiwgSSB3b3VsZCBpbnN0ZWFkIG1ha2UKQlIyX1RBUkdFVF9P
UFRFRV9PU19MQVRFU1Qgc2VsZWN0CkJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NS
WVBUT0dSQVBIWSwgc28gdGhhdCBpZiB0aGUgbGF0ZXN0CnZlcnNpb24gb2YgT1AtVEVFIGlzIHVz
ZWQsCkJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NSWVBUT0dSQVBIWSBpcyBmb3Jj
ZWZ1bGx5IHNlbGVjdGVkLgoKSG93ZXZlciwgeW91IHdpbGwgaGF2ZSB0byBwcm9wYWdhdGUgdGhl
CkJSMl9QQUNLQUdFX0hPU1RfUlVTVENfQVJDSF9TVVBQT1JUUyB0byB0aGUgT1AtVEVFIHBhY2th
Z2UuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3Rs
aW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0
cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
