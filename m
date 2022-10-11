Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46E1C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 11:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 414E3816F5;
	Tue, 11 Oct 2022 11:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 414E3816F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xY-vyJ6kIuPW; Tue, 11 Oct 2022 11:27:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B78981521;
	Tue, 11 Oct 2022 11:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B78981521
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F14521BF296
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 11:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21D3360E90
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 11:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21D3360E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pJKloMpTjVD9 for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 11:27:10 +0000 (UTC)
X-Greylist: delayed 00:08:08 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62EB4605D8
Received: from forward500j.mail.yandex.net (forward500j.mail.yandex.net
 [IPv6:2a02:6b8:0:801:2::110])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62EB4605D8
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 11:27:10 +0000 (UTC)
Received: from myt6-870ea81e6a0f.qloud-c.yandex.net
 (myt6-870ea81e6a0f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:2229:0:640:870e:a81e])
 by forward500j.mail.yandex.net (Yandex) with ESMTP id 6E5816CB68CE;
 Tue, 11 Oct 2022 14:11:12 +0300 (MSK)
Received: by myt6-870ea81e6a0f.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id yGssLufW24-BBhWe8dN; Tue, 11 Oct 2022 14:11:11 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
Message-ID: <14ff4a72-41f4-256c-aaa9-b1948391ba6d@yuriev.ru>
Date: Tue, 11 Oct 2022 14:11:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US, ru-RU
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20221011084540.jebe33uW@myt6-3efb34da3dd5.qloud-c.yandex.net>
From: Leonid Yuriev <leo@yuriev.ru>
In-Reply-To: <20221011084540.jebe33uW@myt6-3efb34da3dd5.qloud-c.yandex.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; t=1665486672; 
 bh=bM7Fbtut4lzy4+yG2qWeUA+PkD+zvBVeOy4gFOyk6EQ=;
 h=In-Reply-To:From:Date:References:To:Subject:Message-ID;
 b=D8lDWf5HfaA9ezHhmmCd9TPA0iHq4m0udRcrhxFWj/o4EXmk8sZEQGHKcXJLUaYX6
 aa4b1IgaYq/71Pn0NEiwox2FD2UT7lB0zONQPOCP56mUGXJClm5jgrD2pAGQTtinoP
 NFlHJXw48Wodx4WJ1858Xosc4I+bdKl7dpMsdrwk=
X-Mailman-Original-Authentication-Results: myt6-870ea81e6a0f.qloud-c.yandex.net; dkim=pass header.i=@yuriev.ru
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-10-10
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

SGksCgpQbGVhc2UgZml4IHRoZSBjb25maWd1cmF0aW9uIGVycm9yIG9mIHRvb2xjaGFpbiBmb3Ig
bWljcm9ibGF6ZSBhcmNoLgoKSSBhbHJlYWR5IHdyb3RlIGFib3V0IHRoaXMgcHJvYmxlbSBhdCB0
aGUgYmVnaW5uaW5nIG9mIHRoZSBzdW1tZXIsIGFuZCAKdGhlbiBjaGFuZ2VkIHRoZSBkaWFnbm9z
dGljIG1lc3NhZ2UgdG8gbWFrZSB0aGUgZXJyb3IgbW9yZSBvYnZpb3VzLgoKQmFzaWNhbGx5LCB0
aGUgZmFpbGVkIGFzc2VydGlvbiAoc2VlIGJlbG93KSBjaGVja3MgdGhhdCB0aGUgd2lkdGggb2Yg
Cmxfc3RhcnQgZW5kIGxfbGVuIGZpZWxkcyBvZiB0aGUgc3RydWN0IGZsb2NrIGFyZSBlbm91Z2gg
dG8gaG9sZCB2YWx1ZXMgCm9mIG9mZl90IHR5cGUuClNvLCB0aGUgbGliYyBpbiB0aGUgdG9vbGNo
YWluIGlzIG1pc2NvbmZpZ3VyZWQgb3IvYW5kIGhhcyB3cm9uZyBsYXlvdXQgCm9mIGhlYWRlcnMs
IGV0Yy4KCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAKL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9p
bnN0YW5jZS0xL291dHB1dC0xL2J1aWxkL2xpYm1kYngtMC4xMS4xMS9tZGJ4LmM6MTgxOgovaG9t
ZS9idWlsZHJvb3QvYXV0b2J1aWxkL2luc3RhbmNlLTEvb3V0cHV0LTEvYnVpbGQvbGlibWRieC0w
LjExLjExL21kYnguYzogCkluIGZ1bmN0aW9uICdsY2tfb3AnOgovaG9tZS9idWlsZHJvb3QvYXV0
b2J1aWxkL2luc3RhbmNlLTEvb3V0cHV0LTEvYnVpbGQvbGlibWRieC0wLjExLjExL21kYnguYzo4
MTg6Mzg6IAplcnJvcjogc3RhdGljIGFzc2VydGlvbiBmYWlsZWQ6ICJTdXBwb3J0IGZvciBsYXJn
ZS82NC1iaXQtc2l6ZWQgZmlsZXMgaXMgCm1pc2NvbmZpZ3VyZWQgZm9yIHRoZSB0YXJnZXQgc3lz
dGVtIGFuZC9vciB0b29sY2hhaW4uIFBsZWFzZSBmaXggaXQgb3IgCmF0IGxlYXN0IGRpc2FibGUg
aXQgY29tcGxldGVseS4iCiDCoCA4MTggfCAjZGVmaW5lIFNUQVRJQ19BU1NFUlRfTVNHKGV4cHIs
IG1zZykgc3RhdGljX2Fzc2VydChleHByLCBtc2cpCiDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBefn5+fn5+fn5+fn5+Ci9ob21lL2J1aWxkcm9vdC9hdXRvYnVpbGQvaW5zdGFuY2UtMS9v
dXRwdXQtMS9idWlsZC9saWJtZGJ4LTAuMTEuMTEvbWRieC5jOjMwNDgyOjU6IApub3RlOiBpbiBl
eHBhbnNpb24gb2YgbWFjcm8gJ1NUQVRJQ19BU1NFUlRfTVNHJwozMDQ4MiB8wqDCoMKgwqAgU1RB
VElDX0FTU0VSVF9NU0coc2l6ZW9mKG9mZl90KSA8PSBzaXplb2YobG9ja19vcC5sX3N0YXJ0KSAm
JgogwqDCoMKgwqDCoCB8wqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+fn4KClJlZ2FyZHMuCkxlb25p
ZC4KCjExLjEwLjIwMjIgMDg6NDUsIFRob21hcyBQZXRhenpvbmkg0L/QuNGI0LXRgjoKPiBIZWxs
bywKPgo+IEF1dG9idWlsZGVyIGZhaWx1cmVzCj4gPT09PT09PT09PT09PT09PT09PT0KPgo+IEJl
bG93IGlzIGEgbGlzdCBvZiBidWlsZCBmYWlsdXJlcyByZXBvcnRlZCBieSB0aGUgQnVpbGRyb290
IGF1dG9idWlsZGVycwo+IGluIHJlbGF0aW9uIHRvIHBhY2thZ2VzIG9yIENQVSBhcmNoaXRlY3R1
cmVzIHlvdSBhcmUgaW4gY2hhcmdlIG9mLgo+IFBsZWFzZSBoZWxwIHVzIGltcHJvdmluZyB0aGUg
cXVhbGl0eSBvZiBCdWlsZHJvb3QgYnkgaW52ZXN0aWdhdGluZyB0aG9zZQo+IGJ1aWxkIGZhaWx1
cmVzIGFuZCBzZW5kaW5nIHBhdGNoZXMgdG8gZml4IHRoZW0uCj4KPiBSZXN1bHRzIGZvciB0aGUg
J21hc3RlcicgYnJhbmNoCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Cj4gQnVp
bGQgZmFpbHVyZXMgcmVsYXRlZCB0byB5b3VyIHBhY2thZ2VzOgo+Cj4gICAgICBhcmNoICAgICB8
ICAgICAgICAgICAgIHJlYXNvbiAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdXJsCj4gLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIG1pY3JvYmxhemUgIHwgICAg
ICAgIGxpYm1kYngtMC4xMS4xMSAgICAgICAgIHwgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qu
bmV0L3Jlc3VsdHMvNzI1OWViN2VmOWVhZTU3MDJlYjE3ZWMyMjhmNDMxMmM1MzQ5ODFhNwo+Cj4K
PiBUaGFua3MgZm9yIHlvdXIgY29udHJpYnV0aW9uIHRvIEJ1aWxkcm9vdCEKPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
