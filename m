Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C413C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 05:47:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D087610E7
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 05:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D087610E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2D5B401C7;
	Tue, 19 Oct 2021 05:47:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5xSrCEA77Ty; Tue, 19 Oct 2021 05:47:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27D9640191;
	Tue, 19 Oct 2021 05:47:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21D841BF83E
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 05:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C50440180
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 05:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T4OW8FcQ6Vg4 for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 05:47:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 638704016F
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 05:47:37 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id EE86AC16307D;
 Tue, 19 Oct 2021 07:47:34 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 19 Oct 2021 05:47:34 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
In-Reply-To: <CA+eej5PtS6iCJ+W1b6W0mZXk-fQJcB1hhr20_D7cE=fja8NzTw@mail.gmail.com>
References: <mailman.16364.1634462006.241441.buildroot@buildroot.org>
 <1641d5624553f991bb7abf9808e6bf99@umbiko.net>
 <CA+eej5PtS6iCJ+W1b6W0mZXk-fQJcB1hhr20_D7cE=fja8NzTw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <3f8142a1afd59acc55e141f2d8a95e66@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] how can i implement my kernel module and debug it
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRXNhw69lCgo8YXBwZW5kZWQgQnVpbGRyb290IGxpc3Q+CgpPbiAyMDIxLTEwLTE4IDIzOjE5
LCBFc2HDr2UgTGVkb3V4IE5KT05HU1NJIEtPVUFNIHdyb3RlOgo+IG15IGtlcm5lbCBtb2R1bGUg
d29ya3MgdmVyeSB3ZWxsICwKPiAKPiBpbiBxZW11ICwgaSBoYXZlIHR5cGUgbHNtb2QgLCBidXQg
bm90aGluZyAsIGRvZXNuJ3QgaXQgbWVhbnMgdGhhdAo+IGxpbnV4IGtlcm5lbCBpbWFnZSBkb2Vz
bid0IGJ1aWxkID8/Cgo8Y3V0PgoKV2l0aCB0aGUgb3JpZ2luYWwgY29uZmlnIGZpbGVzLCB0aGUg
bW9kdWxlIHdpbGwgbm90IGJlIGJ1aWx0LiBPbmNlIGl0IApnZXRzIGJ1aWx0LCB0aGUgbWlzc2lu
ZyBtb2R1bGVzX2luc3RhbGwgbWF5IHByZXZlbnQgY29weWluZyBpdCBpbnRvIAovbGliL21vZHVs
ZXMgaW4gdGhlIHRhcmdldC4KClRvIHNlZSB3aGljaCBzdGVwcyB3ZXJlIGV4ZWN1dGVkIGJ5IEJ1
aWxkcm9vdCwgcnVuCgokIGdyZXAga2VybmVsLW1vZHVsZSBidWlsZC9idWlsZC10aW1lLmxvZwoK
VGhpcyBmaWxlIGNvbnRhaW5zIHRpbWVzdGFtcHMgb2YgYWxsIHRhc2tzIGV4ZWN1dGVkIGJ5IHRo
ZSBCdWlsZHJvb3QgCmVudmlyb25tZW50LgoKPiBpIGhhdmUgbWFrZSBzb21ldGhpbmcgbGlrZSB5
b3UgaGF2ZSBzYWlkICwgYnV0IHRoZSBwcm9ibGVtIHN0aWxsIG9jY3VyCgotLSBNYWtlIHN1cmUg
eW91ciBjb25maWd1cmF0aW9uIGlzIHZpc2libGUgdG8gQnVpbGRyb290LiBZb3UgbXVzdCBiZSAK
YWJsZSB0byBzZWxlY3QgaXQgaW4gdGhlIG1lbnUgZWRpdG9yIChtYWtlIG5jb25maWcpLgoKLS0g
QnVpbGQgeW91ciBtb2R1bGUgc2VwYXJhdGVseSBieSBjYWxsaW5nICdtYWtlIGtlcm5lbC1tb2R1
bGUtcmVidWlsZCcgCmFuZCBhbmFseXplIHRoZSBvdXRwdXQuIFlvdSBzaG91bGQgZ2V0IGhlYWRp
bmdzIGZvciB0aGUgc2VwYXJhdGUgYnVpbGQgCnN0ZXBzIChkb3dubG9hZGluZywgZXh0cmFjdGlu
ZywgcGF0Y2hpbmcsIGNvbmZpZ3VyaW5nLCBidWlsZGluZywgCmluc3RhbGxpbmcpLiBTb21lIHNl
Y3Rpb25zIG1heSBiZSBtaXNzaW5nIG9yIGVtcHR5LCBidXQgYXQgbGVhc3QgCididWlsZGluZy9p
bnN0YWxsaW5nJyBtdXN0IHNob3cgb3V0cHV0IGZyb20geW91ciBtb2R1bGUuIFlvdSBtaWdodCBh
bHNvIApydW4gYnVpbGQgc3RlcHMgc2VwYXJhdGVseSwgdW50aWwgeW91IGZpbmQgdGhlIG9uZSB0
aGF0IGZhaWxzOyBzZWUgWzRdCgotLSBWZXJpZnkgdGhhdCB0aGUgZGlyZWN0b3J5IGJ1aWxkL2tl
cm5lbC1tb2R1bGUgZXhpc3RzIGFuZCBjb250YWlucyB0aGUgCmV4cGVjdGVkIGZpbGVzLgoKLS0g
Q2hlY2sgdGFyZ2V0L2xpYi9tb2R1bGVzLyR7QlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lP
Tl9WQUxVRX0gdG8gCnNlZSBpZiB5b3VyIG1vZHVsZSBpcyBpbmNsdWRlZC4KCktpbmQgcmVnYXJk
cywKQW5kcmVhcwoKWzRdIGh0dHBzOi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFsL21h
bnVhbC5odG1sI3BrZy1idWlsZC1zdGVwcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
