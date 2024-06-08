Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E77C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 10:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8946941866;
	Sat,  8 Jun 2024 10:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulMZlxBFwttA; Sat,  8 Jun 2024 10:57:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 453BF41971
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 453BF41971;
	Sat,  8 Jun 2024 10:57:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2EBF01BF41F
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 10:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 281A040169
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 10:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0FJQXVSJ_mT for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 10:57:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 61D3B400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61D3B400FE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61D3B400FE
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 10:57:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE72220004;
 Sat,  8 Jun 2024 10:56:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFtkp-00Gna0-0e;
 Sat, 08 Jun 2024 12:56:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Martin =?utf-8?Q?B=C3=B6h?= via buildroot <buildroot@buildroot.org>
References: <20230223201733.222573-1-contact@martb.dev>
Date: Sat, 08 Jun 2024 12:56:59 +0200
In-Reply-To: <20230223201733.222573-1-contact@martb.dev> ("Martin
 =?utf-8?Q?B=C3=B6h?= via
 buildroot"'s message of "Thu, 23 Feb 2023 21:17:33 +0100")
Message-ID: <877cez8zyc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/gr-osmosdr: add missing
 host-python-six dependency to python support
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Martin =?utf-8?Q?B=C3=B6h?= <contact@martb.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIk1hcnRpbiIgPT0gTWFydGluIELDtmggdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1
aWxkcm9vdC5vcmc+IHdyaXRlczoKCiA+IE9zbW9zZHIgZmFpbGVkIHRvIGJ1aWxkIGRvY3Mgd2hl
biBweXRob24gc3VwcG9ydCBpcyBlbmFibGVkLgogPiBbIDQxJV0gQ29weWluZyBvc21vc2RyIGRv
Y3N0cmluZyB0ZW1wbGF0ZXMgYXMgcHliaW5kIGhlYWRlcnMgLi4uCiA+IFRyYWNlYmFjayAobW9z
dCByZWNlbnQgY2FsbCBsYXN0KToKID4gICBGaWxlICIvaG9tZS9tYXJ0Yi9TY2hyZWlidGlzY2gv
RGlzY29TQVQvc2F0b3Mvb3V0cHV0L2J1aWxkL2dyLW9zbW9zZHItMC4yLjQvZG9jcy9kb3h5Z2Vu
L3VwZGF0ZV9weWRvYy5weSIsIGxpbmUgMjIsIGluIDxtb2R1bGU+CiA+ICAgICBmcm9tIGRveHl4
bWwgaW1wb3J0IERveHlJbmRleCwgRG94eUNsYXNzLCBEb3h5RnJpZW5kLCBEb3h5RnVuY3Rpb24s
IERveHlGaWxlCiA+ICAgRmlsZSAiL2hvbWUvbWFydGIvU2NocmVpYnRpc2NoL0Rpc2NvU0FUL3Nh
dG9zL291dHB1dC9idWlsZC9nci1vc21vc2RyLTAuMi40L2RvY3MvZG94eWdlbi9kb3h5eG1sL19f
aW5pdF9fLnB5IiwgbGluZSA2OSwgaW4gPG1vZHVsZT4KID4gICAgIGZyb20gLmRveHlpbmRleCBp
bXBvcnQgRG94eUluZGV4LCBEb3h5RnVuY3Rpb24sIERveHlQYXJhbSwgRG94eUNsYXNzLCBEb3h5
RmlsZSwgRG94eU5hbWVzcGFjZSwgRG94eUdyb3VwLCBEb3h5RnJpZW5kLCBEb3h5T3RoZXIKID4g
ICBGaWxlICIvaG9tZS9tYXJ0Yi9TY2hyZWlidGlzY2gvRGlzY29TQVQvc2F0b3Mvb3V0cHV0L2J1
aWxkL2dyLW9zbW9zZHItMC4yLjQvZG9jcy9kb3h5Z2VuL2RveHl4bWwvZG94eWluZGV4LnB5Iiwg
bGluZSAzMSwgaW4gPG1vZHVsZT4KID4gICAgIGZyb20gLmdlbmVyYXRlZCBpbXBvcnQgaW5kZXgK
ID4gICBGaWxlICIvaG9tZS9tYXJ0Yi9TY2hyZWlidGlzY2gvRGlzY29TQVQvc2F0b3Mvb3V0cHV0
L2J1aWxkL2dyLW9zbW9zZHItMC4yLjQvZG9jcy9kb3h5Z2VuL2RveHl4bWwvZ2VuZXJhdGVkL2lu
ZGV4LnB5IiwgbGluZSAxMywgaW4gPG1vZHVsZT4KID4gICAgIGZyb20gLiBpbXBvcnQgY29tcG91
bmQKID4gICBGaWxlICIvaG9tZS9tYXJ0Yi9TY2hyZWlidGlzY2gvRGlzY29TQVQvc2F0b3Mvb3V0
cHV0L2J1aWxkL2dyLW9zbW9zZHItMC4yLjQvZG9jcy9kb3h5Z2VuL2RveHl4bWwvZ2VuZXJhdGVk
L2NvbXBvdW5kLnB5IiwgbGluZSAxNSwgaW4gPG1vZHVsZT4KID4gICAgIGZyb20gLiBpbXBvcnQg
Y29tcG91bmRzdXBlciBhcyBzdXBlcm1vZAogPiAgIEZpbGUgIi9ob21lL21hcnRiL1NjaHJlaWJ0
aXNjaC9EaXNjb1NBVC9zYXRvcy9vdXRwdXQvYnVpbGQvZ3Itb3Ntb3Nkci0wLjIuNC9kb2NzL2Rv
eHlnZW4vZG94eXhtbC9nZW5lcmF0ZWQvY29tcG91bmRzdXBlci5weSIsIGxpbmUgMTUsIGluIDxt
b2R1bGU+CiA+ICAgICBpbXBvcnQgc2l4CiA+IE1vZHVsZU5vdEZvdW5kRXJyb3I6IE5vIG1vZHVs
ZSBuYW1lZCAnc2l4JwogPiBtYWtlWzJdOiAqKiogW3B5dGhvbi9iaW5kaW5ncy9DTWFrZUZpbGVz
L29zbW9zZHJfZG9jc3RyaW5ncy5kaXIvYnVpbGQubWFrZTo3MzogcHl0aG9uL2JpbmRpbmdzL2Rv
Y3N0cmluZ19zdGF0dXNdIEZlaGxlciAxCiA+IG1ha2VbMV06ICoqKiBbQ01ha2VGaWxlcy9NYWtl
ZmlsZTI6MzMyOiBweXRob24vYmluZGluZ3MvQ01ha2VGaWxlcy9vc21vc2RyX2RvY3N0cmluZ3Mu
ZGlyL2FsbF0gRmVobGVyIDIKCiA+IFNpZ25lZC1vZmYtYnk6IE1hcnRpbiBCw7ZoIDxjb250YWN0
QG1hcnRiLmRldj4KCkNvbW1pdHRlZCB0byAyMDI0LjAyLngsIHRoYW5rcy4KCi0tIApCeWUsIFBl
dGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
