Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F033C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 18:47:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B0CF6103D
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 18:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B0CF6103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBDF0400F5;
	Fri, 22 Oct 2021 18:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rNENZUzcFu02; Fri, 22 Oct 2021 18:47:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E27FD401C1;
	Fri, 22 Oct 2021 18:46:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7615A1BF29D
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 18:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65C4940886
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 18:46:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BNUtJfdm7ScR for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 18:46:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CE1C4087A
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 18:46:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E8FDC240005;
 Fri, 22 Oct 2021 18:46:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mdzZ8-0003Lt-Ay; Fri, 22 Oct 2021 20:46:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211016213626.3264701-1-david@lechnology.com>
 <20211017081523.GE2400@scaer>
Date: Fri, 22 Oct 2021 20:46:54 +0200
In-Reply-To: <20211017081523.GE2400@scaer> (Yann E. MORIN's message of "Sun,
 17 Oct 2021 10:15:23 +0200")
Message-ID: <87wnm4523l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/lego_ev3: update to U-Boot 2021.07
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
Cc: David Lechner <david@lechnology.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IERhdmlkLCBBbGwsCiA+IE9uIDIwMjEtMTAtMTYgMTY6MzYgLTA1MDAsIERhdmlk
IExlY2huZXIgc3Bha2UgdGh1c2x5OgogPj4gQnVpbGRyb290IENJIGhhcyBiZWVuIGZhaWxpbmcg
ZHVlIHRvIDQwNCBlcnJvciBvbiBvbGRlciBVLUJvb3QuCgogPiBUaGUgcmVhbCBwcm9ibGVtIGlz
IHRoYXQgdGhlIGNlcnRpZmljYXRlIHByZXNlbnRlZCBieSB0aGUgaHR0cHMgc2VydmVyCiA+IGF0
IGZ0cC5kZW54LmRlLCBjYW4ndCBiZSB2YWxpZGF0ZWQ6CgogPiAgICAgd2dldCAtLXBhc3NpdmUt
ZnRwIC1uZCAtdCAzIC1PCiA+ICcvYnVpbGRzL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290L291dHB1
dC9idWlsZC8udS1ib290LTIwMTguMTEudGFyLmJ6Mi5yeWNKRDIvb3V0cHV0JwogPiAnaHR0cHM6
Ly9mdHAuZGVueC5kZS9wdWIvdS1ib290L3UtYm9vdC0yMDE4LjExLnRhci5iejInCiA+ICAgICAt
LTIwMjEtMTAtMTQgMTM6MDc6MjItLSBodHRwczovL2Z0cC5kZW54LmRlL3B1Yi91LWJvb3QvdS1i
b290LTIwMTguMTEudGFyLmJ6MgogPiAgICAgUmVzb2x2aW5nIGZ0cC5kZW54LmRlIChmdHAuZGVu
eC5kZSkuLi4gODUuMjE0LjQ5LjMsIDJhMDE6MjM4OjQzZjQ6NDYwMDpiYzY0OjRmNDQ6MzgxZjox
MTYzCiA+ICAgICBDb25uZWN0aW5nIHRvIGZ0cC5kZW54LmRlIChmdHAuZGVueC5kZSl8ODUuMjE0
LjQ5LjN8OjQ0My4uLiBjb25uZWN0ZWQuCiA+ICAgICBFUlJPUjogVGhlIGNlcnRpZmljYXRlIG9m
IOKAmGZ0cC5kZW54LmRl4oCZIGlzIG5vdCB0cnVzdGVkLgogPiAgICAgRVJST1I6IFRoZSBjZXJ0
aWZpY2F0ZSBvZiDigJhmdHAuZGVueC5kZeKAmSBoYXMgZXhwaXJlZC4KCiA+IFRoYXQncyBwcm9i
YWJseSBiZWNhdXNlIHdlIGFyZSBzdGlsbCB1c2luZyBhbiBvbGQgZGlzdHJpYnV0aW9uIGFzIHRo
ZQogPiBiYXNlIGltYWdlIHRvIGRvIHRoZSBydW4gaW4gdGhlIENJLgoKWWVzLCBpdCBpcyBiZWNh
dXNlIHdnZXQgaXMgbGlua2VkIGFnYWluc3QgZ251dGxzIG9uIERlYmlhbiwgYW5kIG9sZGVyCmdu
dXRscyB2ZXJzaW9ucyBoYXZlIGlzc3VlcyB3aXRoIHRoZSBuZXcgYWx0ZXJuYXRpdmUgY2VydCBj
aGFpbiB1c2VkIGJ5CmxldHNlbmNyeXB0IHdoZW4gdGhleSBtb3ZlZCB0byB0aGUgbmV3IENBIGNl
cnRpZmljYXRlLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
