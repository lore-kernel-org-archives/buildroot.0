Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCCCCD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72D244024A;
	Tue,  3 Sep 2024 20:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MomTEdDIncru; Tue,  3 Sep 2024 20:38:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 305644026A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 305644026A;
	Tue,  3 Sep 2024 20:38:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13B7B1BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00D074026A
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAt_NoDiritg for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:38:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0690F4024A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0690F4024A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0690F4024A
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:38:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07A441C0002;
 Tue,  3 Sep 2024 20:38:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1slaIB-00634w-1F;
 Tue, 03 Sep 2024 22:38:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Jos=C3=A9?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
References: <20240807120619.66304f2e@windsurf>
 <20240808160606.60188-3-salvador.joseluis@gmail.com>
Date: Tue, 03 Sep 2024 22:38:23 +0200
In-Reply-To: <20240808160606.60188-3-salvador.joseluis@gmail.com>
 (=?utf-8?Q?=22Jos=C3=A9?= Luis
 Salvador Rufo"'s message of "Thu, 8 Aug 2024 18:06:07 +0200")
Message-ID: <87plpkjww0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 1/2] package/zfs: replace wip patch by
 upstream patch
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkpvc8OpIiA9PSBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2Vs
dWlzQGdtYWlsLmNvbT4gd3JpdGVzOgoKID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2
YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+CiA+IC0tLQogPiBDaGFuZ2Vz
IHYyIC0+IHYzOgogPiAgICAgLSBBZGRlZCBTaWduZWQtb2ZmLWJ5IChzdWdnZXN0ZWQgYnkgVGhv
bWFzIFBldGF6em9uaSkKID4gQ2hhbmdlcyB2MSAtPiB2MjoKID4gICAgIC0gUmVtb3ZlZCBaRlNf
QVVUT1JFQ09ORiAoc3VnZ2VzdGVkIGJ5IEJhcnVjaCBTaWFjaCkKCiA+IC4uLmxsLWZpeC1mb3It
U0VFS19EQVRBLVNFRUtfSE9MRS10ZXN0cy5wYXRjaCB8ICA3MCArKysrKysrKwogPiAgLi4ucy1p
Z25vcmUtaWYtU0VFS19EQVRBLWlzLW5vdC1kZWZpbmVkLnBhdGNoIHwgMTYyIC0tLS0tLS0tLS0t
LS0tLS0tLQogPiAgcGFja2FnZS96ZnMvemZzLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAzIC0KID4gIDMgZmlsZXMgY2hhbmdlZCwgNzAgaW5zZXJ0aW9ucygrKSwgMTY1IGRlbGV0
aW9ucygtKQogPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvemZzLzAwMDEtWlRTLXNtYWxs
LWZpeC1mb3ItU0VFS19EQVRBLVNFRUtfSE9MRS10ZXN0cy5wYXRjaAogPiAgZGVsZXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvemZzLzAwMDEtdGVzdHMtY3BfZmlsZXMtaWdub3JlLWlmLVNFRUtfREFU
QS1pcy1ub3QtZGVmaW5lZC5wYXRjaAoKQ29tbWl0dGVkIHRvIDIwMjQuMDIueCBhbmQgMjAyNC4w
NS54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
