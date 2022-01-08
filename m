Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15884C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEF8960A7F;
	Sat,  8 Jan 2022 22:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TPbSwHCL-8_t; Sat,  8 Jan 2022 22:03:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 330006077D;
	Sat,  8 Jan 2022 22:03:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4B031BF283
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1BC2405D6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uRh8MNJxXuUa for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:03:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD0394049C
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:03:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id ED95940004;
 Sat,  8 Jan 2022 22:03:53 +0000 (UTC)
Date: Sat, 8 Jan 2022 23:03:52 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220108230352.17e5d57e@windsurf>
In-Reply-To: <04eb7314-3beb-c40f-483d-aa142f63a0c6@smile.fr>
References: <20200830100058.4180798-1-fontaine.fabrice@gmail.com>
 <20200830100058.4180798-2-fontaine.fabrice@gmail.com>
 <04eb7314-3beb-c40f-483d-aa142f63a0c6@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 2/2] package/libcap: drop host-libcap
 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCA4IEphbiAyMDIyIDIxOjQ0OjQ5ICswMTAwClJvbWFpbiBOYW91ciA8cm9tYWluLm5h
b3VyQHNtaWxlLmZyPiB3cm90ZToKCj4gSGVsbG8gRmFicmljZSwKPiAKPiBMZSAzMC8wOC8yMDIw
IMOgIDEyOjAwLCBGYWJyaWNlIEZvbnRhaW5lIGEgw6ljcml0wqA6Cj4gPiBob3N0LWxpYmNhcCB3
YXMgYWRkZWQgYXMgYSBkZXBlbmRlbmN5IG9mIGxpYmNhcCBpbiBjb21taXQKPiA+IGVmYWU2MDVj
ODhkZWIxNWQ5YzUwZmQ2N2JkZDgwZjQ2YTc4YjA2YzEgd2l0aG91dCBhbnkgZXhwbGFuYXRpb24g
aW4gdGhlCj4gPiBjb21taXQgbWVzc2FnZS4gRHJvcCB0aGlzIGRlcGVuZGVuY3kgdGhhdCBkb2Vz
IHNlZW0gdG8gYmUgbmVlZGVkLiAgCj4gCj4gSSBkb250IHNlZSB3aHkgaG9zdC1saWJjYXAgd291
bGQgYmUgbmVlZGVkIHRvIGJ1aWxkIGxpYmNhcCBmb3IgdGhlIHRhcmdldC4KPiAKPiBsaWJjYXAg
aW4gWW9jdG8gZG9lc24ndCBhZGQgbGliY2FwLW5hdGl2ZSBpbiBkZXBlbmRlbmN5Ogo+IAo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9vcGVuZW1iZWRkZWQvb3BlbmVtYmVkZGVkLWNvcmUvYmxvYi9tYXN0
ZXIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwL2xpYmNhcF8yLjYyLmJiCj4gCj4gVGhpcyBw
YXRjaCBuZWVkcyB0byBiZSByZWJhc2VkIG9uIG1hc3RlciBzaW5jZSBob3N0LWdwZXJmIGhhcyBi
ZWVuIGFkZGVkIHJlbmNlbnRseS4KClNlZSBodHRwczovL2dpdC5idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC9jb21taXQvP2lkPTA2NTFiMjJkNjM4ZmFlY2IzNjg4ZjFmZDRlMDc2MGMzMWJmYmE4OTMK
ClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczov
L2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
