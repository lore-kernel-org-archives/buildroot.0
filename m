Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96EBC4320A
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:59:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5834B61104
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5834B61104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A2F740532;
	Thu,  5 Aug 2021 19:59:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gEZSDZDj8UCI; Thu,  5 Aug 2021 19:59:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24DB240529;
	Thu,  5 Aug 2021 19:59:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF7191BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD9DF83B63
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:51:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1iWrUezw9Hyu for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:51:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D198183B83
 for <buildroot@busybox.net>; Thu,  5 Aug 2021 19:51:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 57EF8FF806;
 Thu,  5 Aug 2021 19:51:30 +0000 (UTC)
Date: Thu, 5 Aug 2021 21:51:29 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?SsOpcsOpbXk=?= ROSEN <jeremy.rosen@smile.fr>
Message-ID: <20210805215129.02980925@windsurf>
In-Reply-To: <CAFvCimX4eYVpcRqAFinCcU65qn3F8a-vE0O+1D1uzw0nPQMNMA@mail.gmail.com>
References: <20191122093930.7933-1-p.debruijn@unilogic.nl>
 <20191125221009.4c31d0d6@windsurf>
 <CAFvCimXVERj+Gd1y-NyVvcSKYsP0iDWrSG9UORE8j56ZK5Arog@mail.gmail.com>
 <CAFvCimX4eYVpcRqAFinCcU65qn3F8a-vE0O+1D1uzw0nPQMNMA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/php: select SYSTEMD_TMPFILES for
 PHP_SAPI_FPM
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net, Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gSsOpcsOpbXksCgpPbiBXZWQsIDQgRGVjIDIwMTkgMDk6NTM6NTMgKzAxMDAKSsOpcsOp
bXkgUk9TRU4gPGplcmVteS5yb3NlbkBzbWlsZS5mcj4gd3JvdGU6Cgo+IE9rLCBmb3IgdGhlIHNw
ZWNpYWwgY2FzZSBvZiBQSFAsIHRoaXMgaGFzIGJlZW4gZml4ZWQgdXBzdHJlYW0gd2l0aAo+IAo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvcHVsbC8xNDIwNwo+IAo+IFRoZSBv
ZmZpY2lhbCB3b3JkIGZyb20gdXBzdHJlYW0gaXMgInllcyB0bXBmaWxlcyBpcyBvcHRpb25hbCBi
dXQgaXQgc2hvdWxkCj4gYWx3YXlzIGJlIGhlcmUgZXhjZXB0IGZvciByZWFsbHkgdGlueSBlbWJl
ZGRlZCBzeXN0ZW1zIgo+IAo+IFNvIHdlIGFyZSBnb29kICh0bXBmaWxlJ3MgZGVmYXVsdCBpcyBh
Y3RpdmF0ZWQpCj4gCj4gSWRlYWxseSwgd2Ugc2hvdWxkIGJhY2twb3J0IHRoYXQgUFIgdW50aWwg
dXBzdHJlYW0gYWRkcyBpdCB0bwo+IHN5c3RlbWQtc3RhYmxlLgoKSXQncyBiZWVuIGEgd2hpbGUg
YWdvLCBidXQgaWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSB3aGF0IHlvdSBzYWlkLApiZWNhdXNl
IFBSMTQyMDcgaGFzIGJlZW4gbWVyZ2VkIHVwc3RyZWFtLCB3ZSBubyBsb25nZXIgbmVlZCBhYnNv
bHV0ZWx5Cm5lZWQgdG1wZmlsZXMgc3VwcG9ydCBpbiBzeXN0ZW1kIGZvciBQSFAncyBGUE0gaW50
ZXJmYWNlIHRvIHdvcmsuIFdlJ3JlCm5vdyB1c2luZyBhIG11Y2ggbmV3ZXIgc3lzdGVtZCB2ZXJz
aW9uIGluIEJ1aWxkcm9vdCwgd2hpY2ggbXVzdCBoYXZlClBSMTQyMDcgYXBwbGllZC4KClNvIEkn
dmUgbWFya2VkIHRoaXMgcGF0Y2ggYXMgUmVqZWN0ZWQuIFBhc2NhbCwgaWYgeW91IGRpc2FncmVl
IGFuZApzdGlsbCBzZWUgYSBwcm9ibGVtLCBkbyBub3QgaGVzaXRhdGUgdG8gcmVzdWJtaXQgdGhl
IHBhdGNoLgoKVGhhbmtzIGEgbG90LAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1v
d25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5l
dApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
