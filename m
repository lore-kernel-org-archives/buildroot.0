Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E91AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B353441586;
	Sun, 10 Apr 2022 15:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w229UNxHrGJa; Sun, 10 Apr 2022 15:35:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD403415A4;
	Sun, 10 Apr 2022 15:35:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB2121BF869
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA5AD840E3
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NxMkVpalMas5 for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:35:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77DA7840A7
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:35:34 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6C4D61C0003;
 Sun, 10 Apr 2022 15:35:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ndZb7-004HjL-8Q; Sun, 10 Apr 2022 17:35:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220404163320.337038-1-fontaine.fabrice@gmail.com>
Date: Sun, 10 Apr 2022 17:35:29 +0200
In-Reply-To: <20220404163320.337038-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 4 Apr 2022 18:33:20 +0200")
Message-ID: <878rsdq7cu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libcoap: fix build with libressl
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBGaXggdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHdpdGgg
bGlicmVzc2wgcmFpc2VkIHNpbmNlIGNvbW1pdAogPiA4YjE0ZjZiNDliOTYyZDRkOGY3MTM1ZDg1
YWZhMTU2NThlYThmOTRiOgoKID4gc3JjL2NvYXBfb3BlbnNzbC5jOjEwNzozOiBlcnJldXI6IG5v
bSBkZSB0eXBlIMKrwqBCSU9fQUREUsKgwrsgaW5jb25udQogPiAgIDEwNyB8ICAgQklPX0FERFIg
KmJpb19hZGRyOwogPiAgICAgICB8ICAgXn5+fn5+fn4KCiA+IEZpeGVzOgogPiAgLSBodHRwOi8v
YXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8zMDAyMmU0MzdmMzQ5NDU5OTk0ZGNjZmI2
MTI3NzNkNTI5ZDk3YTIwCgogPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KCkNvbW1pdHRlZCB0byAyMDIyLjAyLngsIHRoYW5rcy4K
Ci0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
