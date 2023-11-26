Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C1BC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 17:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D91860BB7;
	Sun, 26 Nov 2023 17:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D91860BB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A-WK7_ZElajf; Sun, 26 Nov 2023 17:23:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47A1260B6A;
	Sun, 26 Nov 2023 17:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47A1260B6A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 309761BF28A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 17:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02BAB812BB
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 17:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02BAB812BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hgr4YhqvRSgN for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 17:23:05 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03AFF81227
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 17:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03AFF81227
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 016B0780331;
 Sun, 26 Nov 2023 18:22:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 18:22:58 +0100
Date: Sun, 26 Nov 2023 18:22:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <20231126172258.GB3177259@scaer>
References: <20231122010408.2410999-1-gael.portay@rtone.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122010408.2410999-1-gael.portay@rtone.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701019383;
 bh=SfJcq2RZ0V4wYRFzv9rIzusEc+YUOg+mItHCLOhUEl4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dp9gPqzW0vXow19+dlmAW/TT9c24Gk7QZV1VMoiZLwEw9dbL7YTK6qrwI2kRLIV2t
 nR1ppJhTQFxhJm5viJnuflwvKM6C9AuBHWceH/3dnLqTZ82R2C8EIqims3xX7tBdFO
 PhdWlpxLo0lsz3mjCDQKZomvik/aSIVppTvLTOJ0BPtrJFA9C0NOstxYIZlb8XFo4d
 OEbxD3hLVVf7BPxWh7TMP2E1LuZYxN/sAlwOEI2xxfCcYFb2k8EaVzIglbGOny84lM
 4VbGo3l9A1vbbEK5JgZjSo1Jdk5KsSP5k/BHX37pE8Fqk6HkSt3EK/bXZtKKQt/Jhp
 mf/8mpXLB5mmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Dp9gPqzW
Subject: Re: [Buildroot] [PATCH 1/1] board/raspberrypi/readme.txt: fix typos
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2HDq2wsIEFsbCwKCk9uIDIwMjMtMTEtMjIgMDI6MDQgKzAxMDAsIEdhw6tsIFBPUlRBWSBzcGFr
ZSB0aHVzbHk6Cj4gU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheUBydG9u
ZS5mcj4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklO
LgoKPiAtLS0KPiAgYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dCB8IDYgKysrLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQgYi9ib2FyZC9yYXNwYmVycnlwaS9y
ZWFkbWUudHh0Cj4gaW5kZXggYzgxZmQ4MDFhZS4uMjFhMTM2ZWI4MyAxMDA2NDQKPiAtLS0gYS9i
b2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0Cj4gKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvcmVh
ZG1lLnR4dAo+IEBAIC0xNyw4ICsxNyw4IEBAIEhvdyB0byBidWlsZCBpdAo+ICBDb25maWd1cmUg
QnVpbGRyb290Cj4gIC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAKPiAtVGhlcmUgYXJlIHR3byBSYXNw
YmVycnlQaSBkZWZjb25maWcgZmlsZXMgaW4gQnVpbGRyb290LCBvbmUgZm9yIGVhY2gKPiAtbWFq
b3IgdmFyaWFudCwgd2hpY2ggeW91IHNob3VsZCBiYXNlIHlvdXIgd29yayBvbjoKPiArVGhlcmUg
YXJlIHNldmVyYWwgUmFzcGJlcnJ5IFBpIGRlZmNvbmZpZyBmaWxlcyBpbiBCdWlsZHJvb3QsIG9u
ZSBmb3IKPiArZWFjaCBtYWpvciB2YXJpYW50LCB3aGljaCB5b3Ugc2hvdWxkIGJhc2UgeW91ciB3
b3JrIG9uOgo+IAo+ICBGb3IgbW9kZWxzIEEsIEIsIEErIG9yIEIrOgo+IAo+IEBAIC0xMzMsNyAr
MTMzLDcgQEAgSG93IHRvIHdyaXRlIHRvIENNNCBlTU1DIG1lbW9yeQo+ICA9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09Cj4gCj4gIEZvciBDTTQgbW9kdWxlcyB3aXRob3V0IGVNTUMgbWVt
b3J5IHNlZSBhYm92ZSBmb3IgYm9vdGluZyBmcm9tIFNEIGNhcmQsCj4gLWZvciBDTTQgbW9kdWVs
cyB3aXRoIGVNTUMgbWVtb3J5IHByb2NlZWQgYXMgZm9sbG93aW5nOgo+ICtmb3IgQ000IG1vZHVs
ZXMgd2l0aCBlTU1DIG1lbW9yeSBwcm9jZWVkIGFzIGZvbGxvd2luZzoKPiAKPiAgLSBmaXQganVt
cGVyIG9uIElPIEJvYXJkIGhlYWRlciBKMiB0byBkaXNhYmxlIGVNTUMgYm9vdAo+ICAtIGNvbm5l
Y3QgSU8gQm9hcmQgbWljcm8gVVNCIHBvcnQgKEoxMSBVU0Igc2xhdmUpIHRvIHlvdXIgaG9zdCBs
aW51eCBzeXN0ZW0KPiAtLQo+IDIuNDIuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBN
T1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNv
bnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8g
Q0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0t
LS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8g
IHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlM
ICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
