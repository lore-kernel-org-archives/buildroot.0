Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF963C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 16:54:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 249D161163
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 16:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 249D161163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5C7B40350;
	Tue,  5 Oct 2021 16:54:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y7Podg7DnCJY; Tue,  5 Oct 2021 16:54:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 165554028B;
	Tue,  5 Oct 2021 16:54:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BAB61BF2F2
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 16:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BB4E40839
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 16:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ATsB1xCVwn9s for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 16:54:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B94B40835
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 16:54:50 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 68206FF812;
 Tue,  5 Oct 2021 16:54:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXniJ-0007S3-Bg; Tue, 05 Oct 2021 18:54:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Jos=C3=A9?= Pekkarinen <jose.pekkarinen@unikie.com>
References: <20210915130620.3162787-1-jose.pekkarinen@unikie.com>
 <87zgrnd1xu.fsf@dell.be.48ers.dk>
 <CAJPV9MqO8ZLq9TUH7Oj_-JrxZpXjQeDZ3a+-sNg-nXFNbwwV7A@mail.gmail.com>
Date: Tue, 05 Oct 2021 18:54:47 +0200
In-Reply-To: <CAJPV9MqO8ZLq9TUH7Oj_-JrxZpXjQeDZ3a+-sNg-nXFNbwwV7A@mail.gmail.com>
 (=?utf-8?Q?=22Jos=C3=A9?= Pekkarinen"'s message of "Tue, 5 Oct 2021
 19:28:31 +0300")
Message-ID: <87o883beeg.fsf@dell.be.48ers.dk>
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
LmNvbT4gd3JpdGVzOgoKSGksCgogPj4gQW55IHNwZWNpYWwgcmVhc29uIGZvciB0aGUgcmVkaXJl
Y3Q/IGlwdGFibGVzLXNhdmUgLyByZXN0b3IgYWNjZXB0cyBhCiA+PiBmaWxlbmFtZSBhcmd1bWVu
dC4KID4+IAoKID4gTm90IGZyb20gbXkgc2lkZSwgSSBqdXN0IGRpZG4ndCBub3RpY2UuIEkgY2Fu
CgogPiBjaGFuZ2UgaXQgZm9yIHlvdSBpZiB5b3Ugd2FudC4KClllcywgcGxlYXNlLgoKCiA+PiA+
ICsgICAgICAgICAgICBlY2hvICJVc2FnZTogJDAge3N0YXJ0fHN0b3B8cmVzdGFydHxyZWxvYWR9
IgogPj4gCiA+PiBOSVQ6IFRoaXMgZG9lc24ndCBkb2N1bWVudCB0aGUgc2F2ZSBhcmd1bWVudC4K
ID4+IAoKID4gVmVyeSB0cnVlLCBwbGVhc2UgbGV0IG1lIGtub3cgYW5kIEknbSBoYXBweSB0byBz
ZW5kIGEgdjMKCiA+IHRvbW9ycm93IHdpdGggdGhvc2Ugc3R1ZmYuCgpFaGgsIHRoaXMgd2FzIGFs
cmVhZHkgdjMgYW5kIGl0IHdhcyBhcHBsaWVkLCBzbyB5b3Ugd2lsbCBuZWVkIHRvIHNlbmQgYQpm
b2xsb3d1cCBwYXRjaCBjaGFuZ2luZyB0aGUgc2NyaXB0IGluc3RlYWQuCgpUaGFua3MuCgotLSAK
QnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
