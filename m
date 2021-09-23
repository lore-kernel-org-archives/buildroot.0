Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7F3C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 19:55:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05A0B61107
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 19:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05A0B61107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9605B400B5;
	Thu, 23 Sep 2021 19:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TkoTxrAPVvbS; Thu, 23 Sep 2021 19:55:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90E55400BE;
	Thu, 23 Sep 2021 19:55:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98CFA1BF2B8
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 19:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8815E406EB
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 19:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KbCHMaU23kpB for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 19:55:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97D1C406E2
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 19:55:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id D3C97240009;
 Thu, 23 Sep 2021 19:55:18 +0000 (UTC)
Date: Thu, 23 Sep 2021 21:55:17 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210923215517.1c2bd3f8@windsurf>
In-Reply-To: <ad51da8c-2b94-3969-b26c-2d8b168d198b@mind.be>
References: <20210908081630.3404221-1-kory.maincent@bootlin.com>
 <ecec6557-9d20-134b-497c-e6c7e55deee6@mind.be>
 <20210919150904.04051568@windsurf>
 <f8756bf0-c955-f301-299e-f5d8c0aabe04@mind.be>
 <20210920140127.1de86c50@windsurf>
 <ad51da8c-2b94-3969-b26c-2d8b168d198b@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-a-toolchain: bump to
 version 10.3-2021.07
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVsbG8gQXJub3V0LAoKT24gTW9uLCAyMCBTZXAgMjAyMSAyMDo1MjoyOSArMDIwMApBcm5vdXQg
VmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IHdyb3RlOgoKPiA+IEkgdGhpbmsgdGhlcmUn
cyBtb3JlIHRoYW4gdGhhdCwgdGhlcmUgaXMgYSBjX25hbm8gbGlicmFyeSBpbnRlZ3JhdGVkIGlu
Cj4gPiB0aGlzIHRvb2xjaGFpbi4gSSdtIG5vdCBzdXJlIHdoYXQgaXQgaXMsIGJ1dCB0aGUgQ29y
dGV4LU00IGNvZGUgd2UncmUKPiA+IGJ1aWxkaW5nIGxpbmtzIGFnYWluc3QgdGhhdCBsaWJyYXJ5
IChJIGhhdmVuJ3QgaW52ZXN0aWdhdGVkIGZ1cnRoZXIgZm9yCj4gPiBub3cpLiAgCj4gCj4gICBP
YnZpb3VzbHksIEkgY2FuJ3QgY29tbWVudCBvbiBzb21lIG15c3RlcmlvdXMgb3V0LW9mLXRyZWUg
cGFja2FnZSB5b3UgaGF2ZS4uLgoKSXQncyBub3QgdGhhdCBteXN0ZXJpb3VzIGluIGZhY3QsIHdl
IGFyZSBidWlsZGluZyB0aGUgZXhhbXBsZXMgcHJvdmlkZWQKYnkgU1QgZm9yIHRoZSBDb3J0ZXgt
TTQgaW5jbHVkZWQgaW4gdGhlaXIgU1RNMzJNUDE1Ny4gSSB3b3VsZCBpZGVhbGx5Cmxpa2UgdGhp
cyBwYWNrYWdlIHRvIGJlIHN1Ym1pdHRlZCB0byB1cHN0cmVhbSBCdWlsZHJvb3QsIGJ1dCBpdCBo
YXMKc29tZSBub3Qgc28gbmljZSBhc3BlY3RzOiB0aGVzZSBleGFtcGxlcyBhcmUgaW1wbGVtZW50
ZWQgdXNpbmcgc29tZQpmYW5jeSBJREUsIHdoaWNoIHNhdmVzIHNvbWUgInByb2plY3QgZmlsZXMi
LCBhbmQgeW91IGNhbiBvbmx5IGJ1aWxkIHRoZQpleGFtcGxlcyB1c2luZyB0aGUgSURFLiBUaGUg
WW9jdG8gcGFja2FnaW5nLCB3aGljaCB3ZSBoYXZlIHJlcGxpY2F0ZWQKaW4gb3VyIEJ1aWxkcm9v
dCBwYWNrYWdpbmcsIGNvbnNpc3RzIGluIGEgTWFrZWZpbGUgKyBzb21lIHNjcmlwdGluZwp0aGF0
IHBhcnNlcyB0aG9zZSAicHJvamVjdCBmaWxlcyIgdG8gZ2VuZXJhdGUgdGhlIGZpbmFsIE1ha2Vm
aWxlcyB0bwpidWlsZCB0aG9zZSBleGFtcGxlcyB3aXRob3V0IHRoZSBkYW1uIElERS4KClllYWgs
IG5vdCBncmVhdCA6LS8KCj4gICBJZiB0aGF0IHBhY2thZ2UgKHdoaWNoIEkgZ3Vlc3Mgd2lsbCBl
dmVudHVhbGx5IGJlIHVwc3RyZWFtZWQpIGxpbmtzIHdpdGggCj4gYW55dGhpbmcgdGhhdCBpcyBw
YXJ0IG9mIHRoZSB0b29sY2hhaW4sIHRoYXQncyBzdGlsbCBmaW5lIGFzIGxvbmcgYXMgdGhlcmUn
cyBubyAKPiBvdGhlciBwYWNrYWdlIChpLmUuIEFURikgbGlua3Mgd2l0aCBpdCAoYW5kIGV4cGVj
dHMgYSBkaWZmZXJlbnQgdGFyZ2V0IAo+IGFyY2hpdGVjdHVyZSkuCgpBcyB5b3UgY2FuIHNlZSBm
cm9tIGFib3ZlLCBpdCB3b24ndCBsaW5rIHdpdGggYW55IG90aGVyIHRoaW5nOiBpdCdzCmJhcmUt
bWV0YWwgY29kZSBmb3IgYSBDb3J0ZXgtTTQgbWljcm8tY29udHJvbGxlci4KCj4gICBIb3dldmVy
LCBpZiB0aGUgaW50ZW50aW9uIGlzIHRvIHVzZSB0aGUgdG9vbGNoYWluIGZvciBhIENvcnRleC1N
IGFuZCB5b3UgbmVlZCAKPiBhbnkgb2YgaXRzIGxpYnJhcmllcywgaXQncyBwcm9iYWJseSBhIGxv
dCBjbGVhbmVyIHRvIHNpbXBseSBoYXZlIGEgc2VwYXJhdGUgCj4gYXJtLWdudS1hLXRvb2xjaGFp
biBhbmQgYXJtLWdudS1ybS10b29sY2hhaW4uIEl0J3MgZGVmaW5pdGVseSBhIGJpdCB3ZWlyZCB0
byAKPiBoYXZlIGEgcGFja2FnZSAiYXJtLWdudS1hLXRvb2xjaGFpbiIgdGhhdCBhY3R1YWxseSB1
c2VzIHRoZSAtcm0gb25lLi4uCgpZZXMsIEkgYWdyZWUgdGhhdCB3ZSBzaG91bGQgcHJvYmFibHkg
YWRkIGEgYXJtLWdudS1ybS10b29sY2hhaW4gcGFja2FnZQpzaWRlLWJ5LXNpZGUgd2l0aCB0aGUg
YXJtLWdudS1hLXRvb2xjaGFpbi4gS8O2cnk6IHNvbWV0aGluZyBmb3IgeW91IHRvCmxvb2sgYXQs
IHBlcmhhcHM/IDotKQoKQmVzdCByZWdhcmRzLAoKVGhvbWFzIFBldGF6em9uaQotLSAKVGhvbWFz
IFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
