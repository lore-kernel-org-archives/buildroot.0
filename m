Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDC0C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 12:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A1EC417D0;
	Wed,  3 Jan 2024 12:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A1EC417D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5wNM4D89v6aV; Wed,  3 Jan 2024 12:13:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A085A417A7;
	Wed,  3 Jan 2024 12:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A085A417A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F23561BF3F3
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 12:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB23C417A7
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 12:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB23C417A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVg-V06GqI-j for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 12:13:48 +0000 (UTC)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 202D5409C4
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 12:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 202D5409C4
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id A2AF7440A96;
 Wed,  3 Jan 2024 14:11:39 +0200 (IST)
References: <20231208174217.29735-1-louis.chauvet@bootlin.com>
 <87h6ju62xg.fsf@48ers.dk>
User-agent: mu4e 1.10.8; emacs 29.1
To: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Jan 2024 14:10:30 +0200
In-reply-to: <87h6ju62xg.fsf@48ers.dk>
Message-ID: <87le9662dl.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1704283899;
 bh=04BCqeKf57b1jcZZUPIYefDMX0/aB6V6wsISez13j54=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=IGm+c427DJiH8Qcb0vkIl+TWuIpEU9UHxz976V2cRXI/EnACWigDg7Sbjnkvo9WZG
 RyCiUXvd5lyEq4qTu+D0SRYrYF6CwtjZEY9pc/qpLWz7oHp/H58GnOctxhiaDjnFDG
 QCcXEchd+AWEt6GofL+NuPxPvZWGSH/xTIobtIRqwJlTD2yGzD32zXW2+7F8n1yqXc
 GyqB/9Zfuo35sGELvhp8Q/8nBbKgdyRomJofXJlkZaegKFlo/lwtLhG5Wy3GcGCa4V
 6nPs+TYjVYnqWkACrLhpHNTU8YTMD/L6dvvH3S6hNhEPVWBoQNS2NQwtVy2tptFaoK
 ZElX4QF4BEbdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=IGm+c427
Subject: Re: [Buildroot] [PATCH v2] boot/arm-trusted-firmware: fix the RPATH
 of fiptool
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: =?utf-8?Q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpPbiBXZWQsIEphbiAwMyAyMDI0LCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cj4+
Pj4+PiAiTG91aXMiID09IExvdWlzIENoYXV2ZXQgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1
aWxkcm9vdC5vcmc+IHdyaXRlczoKPgo+ICA+IFRoZSBhcm0tdHJ1c3RlZC1maXJtd2FyZSBwYWNr
YWdlIGJ1aWxkcyBhIGhvc3QgdG9vbCBjYWxsZWQgImZpcHRvb2wiLAo+ICA+IHdoaWNoIGlzIHVz
ZWQgZHVyaW5nIHRoZSBidWlsZCBwcm9jZXNzIG9mIGFybS10cnVzdGVkLWZpcm13YXJlCj4gID4g
aXRzZWxmLiBUaGlzIHRvb2wgbGlua3MgYWdhaW5zdCB0aGUgT3BlblNTTCBob3N0IGxpYnJhcnks
IGFuZAo+ICA+IHRoZXJlZm9yZSBuZWVkcyB0byBiZSBidWlsdCB3aXRoIHRoZSBjb3JyZWN0IFJQ
QVRIIHBvaW50aW5nIHRvCj4gID4gJEhPU1RfRElSL2xpYi4KPgo+ICA+IFRoaXMgaXMgd2h5IGNv
bW1pdCBhOTU3ZDlhOTBhZGU0MTk0ZGZmZTNlYjJmYzAxMzZiYzVkMDc3YzI4Cj4gID4gKCJib290
L2FybS10cnVzdGVkLWZpcm13YXJlOiBidWlsZCBmaXB0b29sIHNlcGFyYXRlbHkgd2l0aCBkZXBl
bmRlbmN5Cj4gID4gbyBuIGhvc3Qtb3BlbnNzbCIpIGFkZGVkIHRoZSBBUk1fVFJVU1RFRF9GSVJN
V0FSRV9CVUlMRF9GSVBUT09MCj4gID4gdmFyaWFibGUsIHdoaWNoIGJ1aWxkcyB0aGUgZmlwdG9v
bCB0b29sIGZpcnN0LCB3aXRoIHRoZSByaWdodAo+ICA+IHZhcmlhYmxlcyBzZXQsIGJlZm9yZSBp
bnZva2luZyB0aGUgZnVsbCBidWlsZCBvZiBURi1BLiBUaGlzIGVuc3VyZWQKPiAgPiB0aGF0IGZp
cHRvb2wgd2FzIGJ1aWx0IHdpdGggdGhlIGNvcnJlY3QgUlBBVEguCj4KPiAgPiBIb3dldmVyLCBt
b3JlIHJlY2VudCB2ZXJzaW9ucyBvZiBURi1BIGhhdmUgbW9kaWZpZWQgdGhlaXIgTWFrZWZpbGUK
PiAgPiBtYWNoaW5lcnksIGFuZCBmaXB0b29sIGlzIGJlaW5nIHJlYnVpbHQgZXZlbiBpZiBpdCB3
YXMgYnVpbHQKPiAgPiBiZWZvcmUuIFVuZm9ydHVuYXRlbHksIHRoaXMgcmVidWlsZCBpcyBubyBs
b25nZXIgZG9uZSB3aXRoIHRoZSByaWdodAo+ICA+IGZsYWdzLCBzbyB3ZSBlbmQgdXAgd2l0aCBh
IGZpcHRvb2wgYmluYXJ5IHRoYXQgbm8gbG9uZ2VyIGhhcyB0aGUgcmlnaHQKPiAgPiBSUEFUSCwg
YW5kIGZpcHRvb2wgZmFpbHMgdG8gZmluZCB0aGUgT3BlblNTTCBsaWJyYXJpZXMgZnJvbQo+ICA+
ICRIT1NUX0RJUi9saWIuCj4KPiAgPiBJbiBvcmRlciB0byBmaXggdGhpcywgd2UgdGFrZSBhIGRp
ZmZlcmVudCBhcHByb2FjaDogd2UgZG8gbm90IGJ1aWxkCj4gID4gZmlwdG9vbCBzZXBhcmF0ZWx5
IGZpcnN0LCBidXQgd2UgaW5qZWN0IHRoZSBuZWNlc3NhcnkgZmxhZ3MgdGhyb3VnaAo+ICA+IHRo
ZSBIT1NUQ0MgdmFyaWFibGUuIEluZGVlZCwgdGhlcmUncyBubyBIT1NUX0xERkxBR1Mgb3IgSE9T
VF9MRExJQlMKPiAgPiB2YXJpYWJsZSBvciBzaW1pbGFyIHRoYXQgd291bGQgYWxsb3cgdXMgdG8g
cGFzcyB0aGUgLVdsLC1ycGF0aCBmbGFnCj4gID4gdGhhdCBpcyBuZWVkZWQuIFNob2UtaG9ybmlu
ZyB0aGlzIGZsYWcgaW50byBIT1NUQ0MgZ2V0cyB0aGUgam9iIGRvbmUsCj4gID4gYW5kIGFjdHVh
bGx5IHNpbXBsaWZpZXMgb3VyIGFybS10cnVzdGVkLWZpcm13YXJlLm1rLgo+Cj4gID4gVGhpcyBw
YXRjaCBicmVhayB0aGUgY29tcGF0aWJpbGl0eSB3aXRoIHZlcnNpb24gcHJpb3IgdG8gMS40ICh1
cHN0cmVhbQo+ICA+IGNvbW1pdCA3MjYxMGM0MTAyOTkwICgiYnVpbGQ6IEludHJvZHVjZSBIT1NU
Q0MgZmxhZyIpKS4gdjEuNCBpcyB2ZXJ5IG9sZAo+ICA+IChKdWx5IDIwMTcpLCBub3QgdXNlZCBh
bnltb3JlIGluLXRyZWUgYW5kIHByb2JhYmx5IG5vdCB1c2VkIGFueW1vcmUKPiAgPiBvdXRzaWRl
IHRoZSB0cmVlLgo+Cj4gID4gU2lnbmVkLW9mZi1ieTogTG91aXMgQ2hhdXZldCA8bG91aXMuY2hh
dXZldEBib290bGluLmNvbT4KPiAgPiBDby1hdXRob3JlZC1ieTogVGhvbWFzIFBldGF6em9uaSA8
dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPiAgPiAtLS0KPiAgPiBQcmV2aW91cyB2ZXJz
aW9uOgo+ICA+ICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDIzMTIwNjE2
NDQzNy4yMjE5MS0xLWxvdWlzLmNoYXV2ZXRAYm9vdGxpbi5jb20vCj4KPiAgPiBDaGFuZ2VzIHYx
LT52MjoKPiAgPiAgICBVcGRhdGUgY29tbWl0IGxvZyBhYm91dCBjb21wYXRpYmlsdHkKPgo+IENv
bW1pdHRlZCB0byAyMDIzLjAyLnggYW5kIDIwMjMuMTEueCwgdGhhbmtzLgoKS8O2cnkgTWFpbmNl
bnQgcmVwb3J0ZWQgdGhhdCB0aGlzIGNvbW1pdCBicmVha3MgZmlwdG9vbCBidWlsZCBmb3Igc29t
ZQpwbGF0Zm9ybXMuCgogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMTIyNDE2MjI1
NC41ODliMzk1Y0BrbWFpbmNlbnQtWFBTLTEzLTczOTAvCgpiYXJ1Y2gKCi0tIAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH4uIC5+ICAgVGsgT3Bl
biBTeXN0ZW1zCj19LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tb29PLS1VLS1Pb28tLS0tLS0tLS0tLS17PQogICAtIGJhcnVjaEB0a29zLmNvLmlsIC0gdGVs
OiArOTcyLjUyLjM2OC40NjU2LCBodHRwOi8vd3d3LnRrb3MuY28uaWwgLQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
