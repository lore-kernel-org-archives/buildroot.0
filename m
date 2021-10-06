Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7821C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:32:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B56C610EA
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B56C610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DFDF4044D;
	Wed,  6 Oct 2021 14:32:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MBRwfcuq1WMF; Wed,  6 Oct 2021 14:32:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A67240143;
	Wed,  6 Oct 2021 14:32:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADABA1BF36B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7B7983FA0
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:32:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bOYdB6W-kQyk for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 14:32:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 669F083F2B
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 14:32:17 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 45394E000C;
 Wed,  6 Oct 2021 14:32:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mY7xu-00076R-Jv; Wed, 06 Oct 2021 16:32:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Antoine Tenart <atenart@kernel.org>
References: <20210923092136.141553-1-atenart@kernel.org>
Date: Wed, 06 Oct 2021 16:32:14 +0200
In-Reply-To: <20210923092136.141553-1-atenart@kernel.org> (Antoine Tenart's
 message of "Thu, 23 Sep 2021 11:21:36 +0200")
Message-ID: <87czoi6x75.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/refpolicy: make sure xmllint is used
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
Cc: =?utf-8?Q?Jos=C3=A9?= Pekkarinen <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFudG9pbmUiID09IEFudG9pbmUgVGVuYXJ0IDxhdGVuYXJ0QGtlcm5lbC5vcmc+IHdy
aXRlczoKCiA+IFdoZW4gcGFyc2luZyBhbmQgYWRkaW5nIG1vZHVsZXMgdGhlIHJlZnBvbGljeSBi
dWlsZCBzeXN0ZW0gY2hlY2tzIHRoZWlyCiA+IHZhbGlkaXR5IHVzaW5nIHhtbGxpbnQuIEJ5IGRl
ZmF1bHQgdGhlIGhvc3Qgc3lzdGVtIHZlcnNpb24gaXMgdXNlZCBhbmQKID4gaWYgbm90IGZvdW5k
IGFuIGVycm9yIGlzIGRpc3BsYXllZCBidXQgdGhlIGJ1aWxkIGlzIG5vdCBzdG9wcGVkLiBUaGlz
CiA+IGxlYWRzIHRvIGludGVyZXN0aW5nIGlzc3VlcyB3aGVyZSBtb2R1bGVzIGFyZSBub3QgYWRk
ZWQgY29ycmVjdGx5IHRvCiA+IG1vZHVsZXMuY29uZlsxXSAob3RoZXIgcG9zc2libGUgaXNzdWVz
IGFyZSBsaWtlbHkpLgoKID4gRml4IHRoaXMgYnkgYWRkaW5nIGEgZGVwZW5kZW5jeSBvbiBob3N0
LWxpYnhtbDIgYW5kIGV4cGxpY2l0bHkgdXNlIHRoZQogPiB4bWxsaW50IGJpbmFyeSBidWlsdCBi
eSBCdWlsZHJvb3QuCgogPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIw
MjEwODMwMTE0NTMxLjIyODUxNzgtMS1qb3NlLnBla2thcmluZW5AdW5pa2llLmNvbS8KCiA+IFRl
c3RlZC1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+CiA+
IFNpZ25lZC1vZmYtYnk6IEFudG9pbmUgVGVuYXJ0IDxhdGVuYXJ0QGtlcm5lbC5vcmc+CgpDb21t
aXR0ZWQgdG8gMjAyMS4wMi54LCAyMDIxLjA1LnggYW5kIDIwMjEuMDgueCwgdGhhbmtzLgoKLS0g
CkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
