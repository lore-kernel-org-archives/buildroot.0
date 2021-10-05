Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3579AC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 13:41:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F32A615E6
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 13:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F32A615E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FF2A83D47;
	Tue,  5 Oct 2021 13:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zCA-U05t_haP; Tue,  5 Oct 2021 13:41:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC9DE83D30;
	Tue,  5 Oct 2021 13:41:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 864271BF2A5
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 13:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8337383D30
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 13:41:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MnUmw2IQcTsZ for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 13:41:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 972FB83D2F
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 13:41:05 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 780C96000A;
 Tue,  5 Oct 2021 13:41:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXkgn-0006h8-7l; Tue, 05 Oct 2021 15:41:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Jos=C3=A9?= Pekkarinen <jose.pekkarinen@unikie.com>
References: <20210915130620.3162787-1-jose.pekkarinen@unikie.com>
Date: Tue, 05 Oct 2021 15:41:01 +0200
In-Reply-To: <20210915130620.3162787-1-jose.pekkarinen@unikie.com>
 (=?utf-8?Q?=22Jos=C3=A9?=
 Pekkarinen"'s message of "Wed, 15 Sep 2021 16:06:20 +0300")
Message-ID: <87zgrnd1xu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] package/iptables: add init script
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

Pj4+Pj4gIkpvc8OpIiA9PSBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2ll
LmNvbT4gd3JpdGVzOgoKID4gVGhpcyBwYXRjaCB3aWxsIGFkZCBhbiBpbml0IHNjcmlwdCB0aGF0
IGFsbG93cwogPiB0byBzZXQgYSBydWxlc2V0IGluIC9ldGMvaXB0YWJsZXMuY29uZiB0byBiZSBs
b2FkZWQKID4gb24gYm9vdCwgb3IgZmx1c2hlZCBvbiBzdG9wLCBhcyB3ZWxsIGFzIGEgc2F2aW5n
CiA+IGNvbW1hbmQgdG8gZ2VuZXJhdGUgYSBuZXcgZmlsZS4KCiA+IFNpZ25lZC1vZmYtYnk6IEpv
c8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPgogPiAtLS0KID4gW3Yx
IC0+IHYyXSBzL3RvdWNoICQoREVTVERJUikvdG91Y2ggJChUQVJHRVRfRElSKS8KID4gW3YyIC0+
IHYzXSBFeGVjdXRlIGJlZm9yZSBuZXR3b3JraW5nIHNjcmlwdCwgaGFuZGxlIHJvIHJvb3RmcwoK
ID4gIHBhY2thZ2UvaXB0YWJsZXMvUzM1aXB0YWJsZXMgfCA2MiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKID4gIHBhY2thZ2UvaXB0YWJsZXMvaXB0YWJsZXMubWsgfCAgNiAr
KysrCiA+ICAyIGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2lwdGFibGVzL1MzNWlwdGFibGVzCgogPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9pcHRhYmxlcy9TMzVpcHRhYmxlcyBiL3BhY2thZ2UvaXB0YWJsZXMvUzM1aXB0YWJsZXMK
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKID4gaW5kZXggMDAwMDAwMDAwMC4uNjAyMzI5NzIzNgog
PiAtLS0gL2Rldi9udWxsCiA+ICsrKyBiL3BhY2thZ2UvaXB0YWJsZXMvUzM1aXB0YWJsZXMKID4g
QEAgLTAsMCArMSw2MiBAQAogPiArIyEvYmluL3NoCiA+ICsKID4gK0RBRU1PTj0iaXB0YWJsZXMi
CiA+ICsKID4gK0lQVEFCTEVTX0FSR1M9IiIKID4gKwogPiArc3RhcnQoKSB7CiA+ICsJcHJpbnRm
ICdTdGFydGluZyAlczogJyAiJERBRU1PTiIKID4gKwlpcHRhYmxlcy1yZXN0b3JlIDwgL2V0Yy9p
cHRhYmxlcy5jb25mCgpBbnkgc3BlY2lhbCByZWFzb24gZm9yIHRoZSByZWRpcmVjdD8gaXB0YWJs
ZXMtc2F2ZSAvIHJlc3RvciBhY2NlcHRzIGEKZmlsZW5hbWUgYXJndW1lbnQuCgogPiArY2FzZSAi
JDEiIGluCiA+ICsJc3RhcnR8c3RvcHxyZXN0YXJ0fHNhdmUpCiA+ICsJCSIkMSI7OwogPiArCXJl
bG9hZCkKID4gKwkJIyBSZXN0YXJ0LCBzaW5jZSB0aGVyZSBpcyBubyB0cnVlICJyZWxvYWQiIGZl
YXR1cmUuCiA+ICsJCXJlc3RhcnQ7OwogPiArCSopCiA+ICsJCWVjaG8gIlVzYWdlOiAkMCB7c3Rh
cnR8c3RvcHxyZXN0YXJ0fHJlbG9hZH0iCgpOSVQ6IFRoaXMgZG9lc24ndCBkb2N1bWVudCB0aGUg
c2F2ZSBhcmd1bWVudC4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
