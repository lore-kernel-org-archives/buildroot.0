Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AABC433F5
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 20:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECBB0402A5;
	Tue, 23 Nov 2021 20:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KFI9NMysUlNf; Tue, 23 Nov 2021 20:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 680164029B;
	Tue, 23 Nov 2021 20:44:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E41D91BF3A8
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 20:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3C8F80E7D
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 20:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f5jqbSjK8b-l for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 20:44:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4672180E4C
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 20:44:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (4)
Received: from zm (pub-198.183.29.194.multiplay.pl [194.29.183.198])
 by server220076.nazwa.pl (Postfix) with ESMTP id 5FAF81C3B20;
 Tue, 23 Nov 2021 21:44:45 +0100 (CET)
References: <20211123160833.29036-1-b.bilas@grinn-global.com>
User-agent: mu4e 1.6.10; emacs 27.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Tue, 23 Nov 2021 21:42:59 +0100
In-reply-to: <20211123160833.29036-1-b.bilas@grinn-global.com>
Message-ID: <87ee76mwjn.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/chiliboard: bump to u-boot 2020.10
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkJhcnRvc3ogQmlsYXMgPGIuYmlsYXNAZ3Jpbm4tZ2xvYmFsLmNvbT4gd3JpdGVzOgoKPiBGaXhl
czoKPiAgL3Vzci9iaW4vbGQ6IHNjcmlwdHMvZHRjL2R0Yy1wYXJzZXIudGFiLm86KC5ic3MrMHgx
MCk6IG11bHRpcGxlIGRlZmluaXRpb24gb2YgYHl5bGxvYyc7Cj4gCXNjcmlwdHMvZHRjL2R0Yy1s
ZXhlci5sZXgubzooLmJzcysweDApOiBmaXJzdCBkZWZpbmVkIGhlcmUKPgo+IFNpZ25lZC1vZmYt
Ynk6IEJhcnRvc3ogQmlsYXMgPGIuYmlsYXNAZ3Jpbm4tZ2xvYmFsLmNvbT4KPiAtLS0KPiAgMjAy
MC4xMCB2ZXJzaW9uIGlzIHRoZSBsYXRlc3Qgb25lIHRoYXQgYm9vdHMgY29ycmVjdGx5LAo+ICB0
aGUgbmV3ZXIgb25lcyBhcmUgYmVpbmcgc3R1Y2sgZHVyaW5nIGNsb2NrcyBpbml0aWFsaXphdGlv
bi4KPgoKVGhlcmUgaXMgYWxyZWFkeSBhIGZpeCBwdWxsZWQgaW50byBtYXN0ZXIgYnJhbmNoIG9m
IHUtYm9vdCwgc28gdXBjb21pbmcKdS1ib290IHJlbGVhc2Ugc2hvdWxkIGJlIHdvcmtpbmcgZmlu
ZS4KCj4KPiAgY29uZmlncy9ncmlubl9jaGlsaWJvYXJkX2RlZmNvbmZpZyB8IDIgKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvY29uZmlncy9ncmlubl9jaGlsaWJvYXJkX2RlZmNvbmZpZyBiL2NvbmZpZ3MvZ3Jpbm5fY2hp
bGlib2FyZF9kZWZjb25maWcKPiBpbmRleCBlNzJhODJjZWU4Li44MGYzMDc3Yjc2IDEwMDY0NAo+
IC0tLSBhL2NvbmZpZ3MvZ3Jpbm5fY2hpbGlib2FyZF9kZWZjb25maWcKPiArKysgYi9jb25maWdz
L2dyaW5uX2NoaWxpYm9hcmRfZGVmY29uZmlnCj4gQEAgLTE2LDcgKzE2LDcgQEAgQlIyX1RBUkdF
VF9ST09URlNfRVhUMl80PXkKPiAgQlIyX1RBUkdFVF9VQk9PVD15Cj4gIEJSMl9UQVJHRVRfVUJP
T1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQo+ICBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJT
SU9OPXkKPiAtQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyMC4wMSIK
PiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyMC4xMCIKPiAgQlIy
X1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9ImNoaWxpYm9hcmQiCj4gIEJSMl9UQVJHRVRf
VUJPT1RfRk9STUFUX0lNRz15Cj4gIEJSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0NVU1RPTT15CgpS
ZXZpZXdlZC1ieTogTWFyY2luIE5pZXN0cm9qIDxtLm5pZXN0cm9qQGdyaW5uLWdsb2JhbC5jb20+
CgotLQpNYXJjaW4gTmllc3Ryw7NqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
