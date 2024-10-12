Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13058CF2566
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 13:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A38B380EE2;
	Sat, 12 Oct 2024 13:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjpBKRsfFlNT; Sat, 12 Oct 2024 13:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF43D81029
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF43D81029;
	Sat, 12 Oct 2024 13:48:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DD8B1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 13:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F11E8810E8
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 13:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6MvzObELU0me for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 13:48:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF4E281029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF4E281029
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF4E281029
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 13:48:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A74E40005;
 Sat, 12 Oct 2024 13:47:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1szcTN-00DGxE-24;
 Sat, 12 Oct 2024 15:47:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240905221743.1162124-1-ju.o@free.fr>
Date: Sat, 12 Oct 2024 15:47:57 +0200
In-Reply-To: <20240905221743.1162124-1-ju.o@free.fr> (Julien Olivain's message
 of "Fri, 6 Sep 2024 00:17:43 +0200")
Message-ID: <87r08lfn5e.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH next 1/1] linux: add
 BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3
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
Cc: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkp1bGllbiIgPT0gSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4gd3JpdGVzOgoK
ID4gS2VybmVsIGNvbW1pdCBbMV0gaW50cm9kdWNlZCBNU00gR1BVIGRyaXZlciBoZWFkZXIgZ2Vu
ZXJhdGlvbiB3aXRoIGEKID4gUHl0aG9uIHNjcmlwdC4gVGhpcyBjb21taXQgd2FzIGZpcnN0IGlu
Y2x1ZGVkIGluIHY2LjEwLiBUaGlzIGRyaXZlciBpcwogPiBhbHNvIGVuYWJsZWQgYXMgYSBtb2R1
bGUgaW4gdGhlIGFybTY0IGFyY2hpdGVjdHVyZSBkZWZhdWx0CiA+IGNvbmZpZ3VyYXRpb24uIFNl
ZSBbMl0uIFRoaXMgaXMgYSBjb21tb24gc2l0dWF0aW9uLgoKID4gVGhpcyBtaXNzaW5nIGRlcGVu
ZGVuY3kgaXMgbm90IGRldGVjdGVkIGluIHRoZSBCdWlsZHJvb3QgQ0ksIGJlY2F1c2UKID4gdGhl
IHJlZmVyZW5jZSBkb2NrZXIgaW1hZ2UgY29udGFpbnMgYSBweXRob24zIGludGVycHJldGVyLiBT
ZWUgWzNdLgoKID4gRm9yIGluZm9ybWF0aW9uLCB0aGUgTGludXggbGF0ZXN0IGtlcm5lbCB2ZXJz
aW9uIHdhcyB1cGRhdGVkIGluCiA+IEJ1aWxkcm9vdCBjb21taXQgMmI2ZGJhMDBiICJsaW51eDog
YnVtcCBsYXRlc3QgdmVyc2lvbiB0byA2LjEwIi4KID4gU2VlIFs0XS4KCiA+IFRoZSBpc3N1ZSBj
YW4gYmUgb2JzZXJ2ZWQgYnkgcnVubmluZyB0aGUgZm9sbG93aW5nIGNvbW1hbmRzIG9uIGEgaG9z
dAogPiB3aXRob3V0IHRoZSBweXRob24zIGludGVycHJldGVyIGluc3RhbGxlZDoKCiA+ICAgICBj
YXQgPDxFT0YgPi5jb25maWcKID4gICAgIEJSMl9hYXJjaDY0PXkKID4gICAgIEJSMl9MSU5VWF9L
RVJORUw9eQogPiAgICAgQlIyX0xJTlVYX0tFUk5FTF9VU0VfQVJDSF9ERUZBVUxUX0NPTkZJRz15
CiA+ICAgICBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15CiA+ICAgICBCUjJf
VE9PTENIQUlOX0VYVEVSTkFMPXkKID4gICAgIEVPRgogPiAgICAgbWFrZSBvbGRkZWZjb25maWcK
ID4gICAgIG1ha2UgbGludXgKCiA+IFRoZSBLZXJuZWwgYnVpbGQgZmFpbHMgd2l0aCBvdXRwdXQ6
CgogPiAgICAgICBHRU5IRFIgIGRyaXZlcnMvZ3B1L2RybS9tc20vZ2VuZXJhdGVkL2EyeHgueG1s
LmgKID4gICAgIC9iaW4vc2g6IDE6IHB5dGhvbjM6IG5vdCBmb3VuZAogPiAgICAgbWFrZVs3XTog
KioqIFtkcml2ZXJzL2dwdS9kcm0vbXNtL01ha2VmaWxlOjE3NjogZHJpdmVycy9ncHUvZHJtL21z
bS9nZW5lcmF0ZWQvYTJ4eC54bWwuaF0gRXJyb3IgMTI3CgogPiBUaGlzIGNvbW1pdCBmaXhlcyB0
aGlzIGlzc3VlIGJ5IGludHJvZHVjaW5nIGEgbmV3CiA+IEJSMl9MSU5VWF9LRVJORUxfTkVFRFNf
SE9TVF9QWVRIT04zIGNvbmZpZ3VyYXRpb24gdGhhdCB3aWxsIG5lZWQgdG8gYmUKID4gc2VsZWN0
ZWQgaW4gcmVsZXZhbnQgc2l0dWF0aW9ucy4KCiA+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC8/aWQ9MGZk
ZGQwNDVmODhlMzRkNjE2MDc4NWEzYTVlNTA2ZDM3NDU2NjQ1NAogPiBbMl0gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC90cmVl
L2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWc/aD12Ni4xMC44I244NjgKID4gWzNdIGh0dHBz
Oi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyNC4wOC1yYzMv
c3VwcG9ydC9kb2NrZXIvRG9ja2VyZmlsZT9yZWZfdHlwZT10YWdzI0w0MAogPiBbNF0gaHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzJiNmRiYTAwYmUy
N2EwOWJjN2U4OGZhZjA4NzFmODJiZjk1NTg5Y2YKCiA+IFJlcG9ydGVkLWJ5OiBWaW5jZW50IFN0
ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CiA+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBP
bGl2YWluIDxqdS5vQGZyZWUuZnI+CgpDb21taXR0ZWQgdG8gMjAyNC4wOC54IHRvZ2V0aGVyIHdp
dGggdGhlIGZvbGxvd3VwIHBhdGNoIHRvIHVzZQpCUjJfUFlUSE9OM19IT1NUX0RFUEVOREVOQ1ks
IHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
