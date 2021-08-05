Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B471C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:45:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D812F60F02
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D812F60F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B400583B7E;
	Thu,  5 Aug 2021 19:45:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4l_WpCqiQGV9; Thu,  5 Aug 2021 19:45:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AB2283B5A;
	Thu,  5 Aug 2021 19:45:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1B541BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AED7E60A80
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:44:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eiRrVXznB9cj for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:44:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AB2D60A75
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:44:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 65A4320007;
 Thu,  5 Aug 2021 19:44:35 +0000 (UTC)
Date: Thu, 5 Aug 2021 21:44:34 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@essensium.com>
Message-ID: <20210805214434.58c534ed@windsurf>
In-Reply-To: <20200207153106.5042-1-raphael.melotte@essensium.com>
References: <20200207153106.5042-1-raphael.melotte@essensium.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pbkdf2: new package.
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

T24gRnJpLCAgNyBGZWIgMjAyMCAxNjozMTowNSArMDEwMApSYXBoYcOrbCBNw6lsb3R0ZSA8cmFw
aGFlbC5tZWxvdHRlQGVzc2Vuc2l1bS5jb20+IHdyb3RlOgoKPiBQS0NTIzUgdjIuMCBQQktERjIg
TW9kdWxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1l
bG90dGVAZXNzZW5zaXVtLmNvbT4KPiAtLS0KPiAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAzICsrKwo+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL3B5dGhvbi1wYmtkZjIvQ29uZmlnLmluICAgICAg
ICAgIHwgIDYgKysrKysrCj4gIHBhY2thZ2UvcHl0aG9uLXBia2RmMi9weXRob24tcGJrZGYyLmhh
c2ggfCAgMyArKysKPiAgcGFja2FnZS9weXRob24tcGJrZGYyL3B5dGhvbi1wYmtkZjIubWsgICB8
IDEzICsrKysrKysrKysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1wYmtkZjIvQ29uZmlnLmluCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1wYmtkZjIvcHl0aG9uLXBia2RmMi5oYXNo
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1wYmtkZjIvcHl0aG9uLXBia2Rm
Mi5tawoKVGhhbmtzIGEgbG90IGZvciB0aGlzIGNvbnRyaWJ1dGlvbiwgYnV0IHVuZm9ydHVuYXRl
bHkgdGhpcyBweWRucyBtb2R1bGUKaGFzIG5vdCBiZWVuIHVwZGF0ZWQgb3Igc2VlbiBhIHJlbGVh
c2Ugc2luY2UgMjAxMS4gVGhpcyBtZWFucyBpdCBoYXMKYmFzaWNhbGx5IG5ldmVyIHNlZW4gYSBy
ZWxlYXNlIHNpbmNlIFB5dGhvbiAzLnggd2FzIGEgdGhpbmcsIHNvIGl0CmRvZXNuJ3QgbWFrZSBh
IGxvdCBvZiBzZW5zZSB0byBhZGQgc3VjaCBhbiB1bm1haW50YWluZWQgcGllY2Ugb2YKc29mdHdh
cmUgdG8gQnVpbGRyb290LiBTbyB1bmZvcnR1bmF0ZWx5LCB3ZSBhcmUgZ29pbmcgdG8gcmVqZWN0
IHRoaXMKcGF0Y2guCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gu
bmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
