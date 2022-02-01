Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148B3C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 20:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 847754019F;
	Tue,  1 Feb 2022 20:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 97vDOA6xopfL; Tue,  1 Feb 2022 20:25:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D2A3400D2;
	Tue,  1 Feb 2022 20:25:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5E241BF4E7
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 20:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1F06400D2
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 20:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R6heXJnV9JDl for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 20:25:20 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF155400CC
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 20:25:19 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id EzbTnFXsDo6PDEzbTnn51i; Tue, 01 Feb 2022 21:18:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643746696; bh=V2Qu59kp9317YLPKofO3YCSRCTUgXh1sILi83jb0+aA=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=T3EZZwpAyIEnlYnGq4Of80A4O1eq1VAPRBUFkFLn/ZMPsA6SjRJkMOhOPa8UphsH9
 Slrtk5Hz/CV13AGe90gzaJAzYRXRQihikg8RuU0yw3lMrdSxF7tshAxeqjBHeQxfu9
 XGjx84dJDSV0ld7iWA2Kguu4j1P8bNuu8NizjB84MyBc/APAPiFcjCY1cu05G6sMy5
 QA7k8gRWCyFng9JQjx2haPF2oWiRlGeJzmwmfDYv67Is5soF3zm2mj/hOFrbU3ijcW
 kyp5IsssxKa8Ap41MnYlm1qOkYDC9UFuHx9uCwuB6QR90wG8PQ9XuPVw4oXTwjHZPE
 Sq1TgmXb2tlzA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 1 Feb 2022 21:18:14 +0100
Message-Id: <93CEDCC7-8859-4CBD-B21F-C07DA101A204@benettiengineering.com>
References: <CAOf5uwk-4AHxxdbzuLYcEUx+NQQDJXfCtg-5_WmGzWPG0vVAsA@mail.gmail.com>
In-Reply-To: <CAOf5uwk-4AHxxdbzuLYcEUx+NQQDJXfCtg-5_WmGzWPG0vVAsA@mail.gmail.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfM/AKe6E4KZKPNgFhSfSo1kOjRIc00NtM64Vai8+3gDMdBv/At9SGp+Dtvy/26wa0EaG/HTqZFv3axXpwgT3Z0FUZRWvC+Tc5s6/wQKjaZBEIKiXE/Hz
 oTCsaSfgNVHwzQY+bQaM5txMbQvJMh/flinfmRuD0xexEAVkVS8vfRPb5/kTC7u4a9EUiQXJ0ah+bHmxDL2FMtZGEcyXM02tDfcm6WnJv5VUID1gjB4LFDpg
 g1vFjP2Tg3ma2l/yO4lT8VA+RmhHe1NOAwGbyT4WkgMyt9GY740JnnFEQBubhGEvKGPzrlaTDjz3a1tHjgONyPrEI8HEdumy/cDkWmwxushf8HhU7XiEWtDX
 4sgomHLlEUJDoHUmzhG+rK96fiHRZebdGEytkgQ7OVUOuqIUy6O6gxCuoP8iCYPee0WC+kex
Subject: Re: [Buildroot] [PATCH 3/6]
 configs/microchip_sama5d2_icp_mmc_defconfig: linux needs host openssl
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWljaGFlbCwKCj4gSWwgZ2lvcm5vIDEgZmViIDIwMjIsIGFsbGUgb3JlIDIxOjA0LCBNaWNo
YWVsIE5henphcmVubyBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+IGhh
IHNjcml0dG86Cj4gCj4g77u/SGkgR2l1bGlvCj4gCj4+IE9uIFR1ZSwgRmViIDEsIDIwMjIgYXQg
NzozNCBQTSBHaXVsaW8gQmVuZXR0aQo+PiA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVy
aW5nLmNvbT4gd3JvdGU6Cj4+IAo+PiBGaXhlczoKPj4gaHR0cHM6Ly9naXRsYWIuY29tL3ltb3Jp
bi9idWlsZHJvb3QvLS9qb2JzLzIwMzU4MjEwOTQKPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxp
byBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+PiAtLS0K
Pj4gY29uZmlncy9taWNyb2NoaXBfc2FtYTVkMl9pY3BfbW1jX2RlZmNvbmZpZyB8IDEgKwo+PiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4gCj4+IGRpZmYgLS1naXQgYS9jb25maWdz
L21pY3JvY2hpcF9zYW1hNWQyX2ljcF9tbWNfZGVmY29uZmlnIGIvY29uZmlncy9taWNyb2NoaXBf
c2FtYTVkMl9pY3BfbW1jX2RlZmNvbmZpZwo+PiBpbmRleCA0YmIzNjI1ZjgzLi4yN2VhNDk3MGYx
IDEwMDY0NAo+PiAtLS0gYS9jb25maWdzL21pY3JvY2hpcF9zYW1hNWQyX2ljcF9tbWNfZGVmY29u
ZmlnCj4+ICsrKyBiL2NvbmZpZ3MvbWljcm9jaGlwX3NhbWE1ZDJfaWNwX21tY19kZWZjb25maWcK
Pj4gQEAgLTEyLDYgKzEyLDcgQEAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVEFSQkFMTF9MT0NB
VElPTj0iJChjYWxsIGdpdGh1YixsaW51eDRtaWNyb2NoaXAsbGludXgsbGkKPj4gQlIyX0xJTlVY
X0tFUk5FTF9ERUZDT05GSUc9InNhbWE1Igo+PiBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JU
PXkKPj4gQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImF0OTEtc2FtYTVkMl9pY3Ai
Cj4+ICtCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15Cj4gCj4gSSBjYW4gc2Vl
IHRoYXQgbXkgc3VibWlzc2lvbiBoZWxwIG9uIHRob3NlIHBhdGNoZXMKCktlZXAgc3VibWl0dGlu
ZyEKQW5kIHRoYW5rIHlvdSBmb3IgdGhlIHJldmlldyA6LSkKSXQgd291bGQgYmUgZ3JlYXQgaWYg
eW91IHNlbmQgdGhlIFJldmlld2VkLWJ5IHRvIGFsbCBwYXRjaGVzIG9mIHRoaXMgcGF0Y2hzZXQu
CgpHaXVsaW8KCj4gCj4gUmV2aWV3ZWQtYnk6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFt
YXJ1bGFzb2x1dGlvbnMuY29tPgo+IAo+IE1pY2hhZWwKPiAKPj4gQlIyX1RBUkdFVF9ST09URlNf
RVhUMj15Cj4+IEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15Cj4+IEJSMl9UQVJHRVRfUk9PVEZT
X0VYVDJfU0laRT0iMTIwTSIKPj4gLS0KPj4gMi4yNS4xCj4+IAo+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAo+IAo+IAo+IC0tIAo+IE1pY2hhZWwgTmF6
emFyZW5vIFRyaW1hcmNoaQo+IENvLUZvdW5kZXIgJiBDaGllZiBFeGVjdXRpdmUgT2ZmaWNlcgo+
IE0uICszOSAzNDcgOTEzIDIxNzAKPiBtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IAo+IEFtYXJ1bGEgU29sdXRpb25zIEJW
Cj4gSm9vcCBHZWVzaW5rd2VnIDEyNSwgMTExNCBBQiwgQW1zdGVyZGFtLCBOTAo+IFQuICszMSAo
MCk4NSAxMTEgOTE3Mgo+IGluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KPiB3d3cuYW1hcnVsYXNv
bHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
