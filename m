Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F72C6379F
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 01:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E16460E49;
	Fri, 24 Feb 2023 01:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E16460E49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WbYtNcytOxQf; Fri, 24 Feb 2023 01:04:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A1B260E33;
	Fri, 24 Feb 2023 01:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A1B260E33
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D91F1BF616
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 01:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC09C4172F
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 01:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC09C4172F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FJrHlpLXNkPG for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 01:04:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FE0C416CC
Received: from server1.martb.eu (server1.martb.eu [195.201.128.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FE0C416CC
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 01:04:49 +0000 (UTC)
Message-ID: <bed9170a-c0cb-fd53-9403-6e929b8961b1@martb.dev>
Date: Fri, 24 Feb 2023 02:04:45 +0100
MIME-Version: 1.0
References: <e1ff72dc-06fc-db71-dd1d-64d5d2cf96b3@familie-boeh.de>
Content-Language: en-US
To: =?UTF-8?Q?Martin_B=c3=b6h_via_buildroot?= <buildroot@buildroot.org>
In-Reply-To: <e1ff72dc-06fc-db71-dd1d-64d5d2cf96b3@familie-boeh.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=martb.dev; s=mail; t=1677200687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHHzYA105LKgiDQs21HquvlmCYmEcQKmxOWdiblckJI=;
 b=TfEOYGoA6jKQDdRMuIxTCKphd6E0r4xvstdmWuIM4OcnMJBxXrtj6JJeYTBoMVIAGejanj
 HkSwgaNlGp/lMBL77CHJDOWRLyymCDPaeya6x80jEjHPXvgM36C2UekREYs/nya8BNqUJu
 b+LwaBAWjJ38hJ9GJKbiILwVMadcIoo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=martb.dev header.i=@martb.dev
 header.a=rsa-sha256 header.s=mail header.b=TfEOYGoA
X-Mailman-Original-Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=martin@familie-boeh.de smtp.mailfrom=contact@martb.dev
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
From: =?utf-8?q?Martin_B=C3=B6h_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?Q?Martin_B=c3=b6h?= <contact@martb.dev>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGV5IFRob21hcywKCnRoYW5rcyBmb3IgdGFraW5nIGEgbG9vay4KU2FkbHkgdGhpcyBpcyBwYXJ0
IG9mIHRoZSBweWJpbmQxMSBidWlsZCBwcm9jZXNzIGFuZCB0aGVyZSBpcyBubyB3YXkgdG8gCmdl
dCByaWQgb2YgdGhlc2UgZG9jcywgdGhlIEVOQUJMRV9ET1hZR0VOIGRvZXMgbm90IGFmZmVjdCBp
dC4KSSBmb3VuZCBubyB2aWFibGUgc29sdXRpb24gdG8gZ2V0IHJpZCBvZiB0aGVtLiBTYW1lIHdp
dGggZ251cmFkaW8sIGl0IAphbHNvIGhhcyBhIGxvdCBvZiBkb2NzIHRoYXQgY2FudCBiZSBkaXNh
YmxlZC4KCktpbmQgcmVnYXJkcywKTWFydGluIELDtmgKCkFtIDIzLjAyLjIzIHVtIDIzOjEzIHNj
aHJpZWIgVGhvbWFzIFBldGF6em9uaToKPiBIZWxsbyBNYXJ0aW4sCj4KPiBPbiBUaHUsIDIzIEZl
YiAyMDIzIDIxOjE3OjMzICswMTAwCj4gTWFydGluIELDtmggdmlhIGJ1aWxkcm9vdCA8YnVpbGRy
b290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Cj4+IE9zbW9zZHIgZmFpbGVkIHRvIGJ1aWxkIGRv
Y3Mgd2hlbiBweXRob24gc3VwcG9ydCBpcyBlbmFibGVkLgo+PiBbIDQxJV0gQ29weWluZyBvc21v
c2RyIGRvY3N0cmluZyB0ZW1wbGF0ZXMgYXMgcHliaW5kIGhlYWRlcnMgLi4uCj4+IFRyYWNlYmFj
ayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKPj4gICAgRmlsZSAiL2hvbWUvbWFydGIvU2NocmVp
YnRpc2NoL0Rpc2NvU0FUL3NhdG9zL291dHB1dC9idWlsZC9nci1vc21vc2RyLTAuMi40L2RvY3Mv
ZG94eWdlbi91cGRhdGVfcHlkb2MucHkiLCBsaW5lIDIyLCBpbiA8bW9kdWxlPgo+PiAgICAgIGZy
b20gZG94eXhtbCBpbXBvcnQgRG94eUluZGV4LCBEb3h5Q2xhc3MsIERveHlGcmllbmQsIERveHlG
dW5jdGlvbiwgRG94eUZpbGUKPj4gICAgRmlsZSAiL2hvbWUvbWFydGIvU2NocmVpYnRpc2NoL0Rp
c2NvU0FUL3NhdG9zL291dHB1dC9idWlsZC9nci1vc21vc2RyLTAuMi40L2RvY3MvZG94eWdlbi9k
b3h5eG1sL19faW5pdF9fLnB5IiwgbGluZSA2OSwgaW4gPG1vZHVsZT4KPj4gICAgICBmcm9tIC5k
b3h5aW5kZXggaW1wb3J0IERveHlJbmRleCwgRG94eUZ1bmN0aW9uLCBEb3h5UGFyYW0sIERveHlD
bGFzcywgRG94eUZpbGUsIERveHlOYW1lc3BhY2UsIERveHlHcm91cCwgRG94eUZyaWVuZCwgRG94
eU90aGVyCj4+ICAgIEZpbGUgIi9ob21lL21hcnRiL1NjaHJlaWJ0aXNjaC9EaXNjb1NBVC9zYXRv
cy9vdXRwdXQvYnVpbGQvZ3Itb3Ntb3Nkci0wLjIuNC9kb2NzL2RveHlnZW4vZG94eXhtbC9kb3h5
aW5kZXgucHkiLCBsaW5lIDMxLCBpbiA8bW9kdWxlPgo+PiAgICAgIGZyb20gLmdlbmVyYXRlZCBp
bXBvcnQgaW5kZXgKPj4gICAgRmlsZSAiL2hvbWUvbWFydGIvU2NocmVpYnRpc2NoL0Rpc2NvU0FU
L3NhdG9zL291dHB1dC9idWlsZC9nci1vc21vc2RyLTAuMi40L2RvY3MvZG94eWdlbi9kb3h5eG1s
L2dlbmVyYXRlZC9pbmRleC5weSIsIGxpbmUgMTMsIGluIDxtb2R1bGU+Cj4+ICAgICAgZnJvbSAu
IGltcG9ydCBjb21wb3VuZAo+PiAgICBGaWxlICIvaG9tZS9tYXJ0Yi9TY2hyZWlidGlzY2gvRGlz
Y29TQVQvc2F0b3Mvb3V0cHV0L2J1aWxkL2dyLW9zbW9zZHItMC4yLjQvZG9jcy9kb3h5Z2VuL2Rv
eHl4bWwvZ2VuZXJhdGVkL2NvbXBvdW5kLnB5IiwgbGluZSAxNSwgaW4gPG1vZHVsZT4KPj4gICAg
ICBmcm9tIC4gaW1wb3J0IGNvbXBvdW5kc3VwZXIgYXMgc3VwZXJtb2QKPj4gICAgRmlsZSAiL2hv
bWUvbWFydGIvU2NocmVpYnRpc2NoL0Rpc2NvU0FUL3NhdG9zL291dHB1dC9idWlsZC9nci1vc21v
c2RyLTAuMi40L2RvY3MvZG94eWdlbi9kb3h5eG1sL2dlbmVyYXRlZC9jb21wb3VuZHN1cGVyLnB5
IiwgbGluZSAxNSwgaW4gPG1vZHVsZT4KPj4gICAgICBpbXBvcnQgc2l4Cj4+IE1vZHVsZU5vdEZv
dW5kRXJyb3I6IE5vIG1vZHVsZSBuYW1lZCAnc2l4Jwo+PiBtYWtlWzJdOiAqKiogW3B5dGhvbi9i
aW5kaW5ncy9DTWFrZUZpbGVzL29zbW9zZHJfZG9jc3RyaW5ncy5kaXIvYnVpbGQubWFrZTo3Mzog
cHl0aG9uL2JpbmRpbmdzL2RvY3N0cmluZ19zdGF0dXNdIEZlaGxlciAxCj4+IG1ha2VbMV06ICoq
KiBbQ01ha2VGaWxlcy9NYWtlZmlsZTI6MzMyOiBweXRob24vYmluZGluZ3MvQ01ha2VGaWxlcy9v
c21vc2RyX2RvY3N0cmluZ3MuZGlyL2FsbF0gRmVobGVyIDIKPj4KPj4gU2lnbmVkLW9mZi1ieTog
TWFydGluIELDtmggPGNvbnRhY3RAbWFydGIuZGV2Pgo+IElzIHRoZXJlIHBvdGVudGlhbGx5IGEg
d2F5IHRvIGRpc2FibGUgYnVpbGRpbmcgZG9jdW1lbnRhdGlvbiBpbnN0ZWFkPwo+IE9mIGNvdXJz
ZSwgYWRkaW5nIGhvc3QtcHl0aG9uLXNpeCBpbiB0aGUgZGVwZW5kZW5jaWVzIGlzIG5vdCBhIGh1
Z2UKPiBkZWFsLCBidXQgd2UgcmVhbGx5IGRvbid0IGNhcmUgYWJvdXQgYnVpbGRpbmcgZG9jdW1l
bnRhdGlvbiBpbiB0aGUKPiBjb250ZXh0IG9mIEJ1aWxkcm9vdC4KPgo+IEJlc3QgcmVnYXJkcywK
Pgo+IFRob21hcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
