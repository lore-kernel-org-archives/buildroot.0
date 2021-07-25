Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD36CC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 14:00:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D4BA60E73
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 14:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D4BA60E73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1244F4013E;
	Sun, 25 Jul 2021 14:00:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6MoVvJQ9LA6Y; Sun, 25 Jul 2021 14:00:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F13240136;
	Sun, 25 Jul 2021 14:00:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF1C81BF3C1
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 14:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBA5A830A7
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 14:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KeNpZ7HtW6n8 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 14:00:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D20E83033
 for <buildroot@busybox.net>; Sun, 25 Jul 2021 14:00:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id E2FF9240007;
 Sun, 25 Jul 2021 14:00:05 +0000 (UTC)
Date: Sun, 25 Jul 2021 16:00:04 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= via buildroot <buildroot@busybox.net>
Message-ID: <20210725160004.5b0b5023@windsurf>
In-Reply-To: <20210528140218.9878-1-vincent.stehle@laposte.net>
References: <20210528140218.9878-1-vincent.stehle@laposte.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/fwts: bump to version 21.05.00
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
Cc: buildroot@buildroot.org,
 Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

T24gRnJpLCAyOCBNYXkgMjAyMSAxNjowMjoxNyArMDIwMApWaW5jZW50IFN0ZWhsw6kgdmlhIGJ1
aWxkcm9vdCA8YnVpbGRyb290QGJ1c3lib3gubmV0PiB3cm90ZToKCj4gLSBVcGRhdGUgcGF0Y2gK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9z
dGUubmV0Pgo+IENjOiBFcmljbyBOdW5lcyA8bnVuZXMuZXJpY29AZ21haWwuY29tPgo+IC0tLQo+
ICAuLi4vZnd0cy8wMDAxLWJ1aWxkLWRvLW5vdC11c2UtV2Vycm9yLnBhdGNoICAgfCAzMyArKysr
KysrKysrKy0tLS0tLS0tCj4gIHBhY2thZ2UvZnd0cy9md3RzLmhhc2ggICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICstCj4gIHBhY2thZ2UvZnd0cy9md3RzLm1rICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMTYg
ZGVsZXRpb25zKC0pCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9t
YXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3li
b3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
