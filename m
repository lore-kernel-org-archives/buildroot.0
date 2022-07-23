Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74103C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 262AE41669;
	Sat, 23 Jul 2022 17:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 262AE41669
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wuWhnrWPOs7Q; Sat, 23 Jul 2022 17:49:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB3764049F;
	Sat, 23 Jul 2022 17:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB3764049F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E7791BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3843560B59
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3843560B59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id czutZ7EidIn0 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:49:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03ABB60C09
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03ABB60C09
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:49:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AD2E960007;
 Sat, 23 Jul 2022 17:49:37 +0000 (UTC)
Date: Sat, 23 Jul 2022 19:49:36 +0200
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen via buildroot <buildroot@buildroot.org>
Message-ID: <20220723194936.503071be@windsurf>
In-Reply-To: <20220621064952.1633761-1-jose.pekkarinen@unikie.com>
References: <20220621064952.1633761-1-jose.pekkarinen@unikie.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658598577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S8dz+F2e8cR8O8Bhb4sF2ikUg4ZQxnofbcCmJvn/5Ik=;
 b=QKfRn0XURDqgBawm4W6BN2Oh3jmo+KiVYlNzwkPbFFeQ7eHnxlTnZ/ozfb4FstxYD6yArx
 Gk4Uaa+AafBo3I41+IVKc6/N3BCHovJ5aMPQBRkEAu1noHNCdnafZigGMyzMsNhzOv064F
 h4jP/SUJ1OFNMlSmz6s5wQxKUt+m7MdtfCHNA2lBTakvJ2jYqCVWZJVtt/nEY2iiSFg8D4
 AQ+B/9c6DFAiBscmHmxqpINLdJ/iXtI8LRAuN7m2RYA5/TH03jGjp77xqNAEEzKbsokx+y
 If425Q8ucKEzr2P0cylDG/rXufG7B87/vZvpcRloLewyPuqUxg64kCM4kqT0Sg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QKfRn0XU
Subject: Re: [Buildroot] [PATCH] package/python-alembic: bump to version
 1.8.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyMSBKdW4gMjAyMiAwOTo0OTo1MiArMDMwMApKb3PDqSBQZWtrYXJpbmVuIHZpYSBi
dWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gU2lnbmVkLW9mZi1i
eTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Cj4gLS0tCj4g
IHBhY2thZ2UvcHl0aG9uLWFsZW1iaWMvcHl0aG9uLWFsZW1iaWMuaGFzaCB8IDQgKystLQo+ICBw
YWNrYWdlL3B5dGhvbi1hbGVtYmljL3B5dGhvbi1hbGVtYmljLm1rICAgfCA0ICsrLS0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpBcHBsaWVkIHRv
IG1hc3RlciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3Rs
aW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4u
Y29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
