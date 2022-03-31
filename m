Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4645CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 06:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBF1741DBB;
	Thu, 31 Mar 2022 06:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gf_WSOp6fnCy; Thu, 31 Mar 2022 06:27:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9438A4196A;
	Thu, 31 Mar 2022 06:27:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46B6A1BF321
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33F6A40BB8
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pMM5d98fhkgy for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 06:27:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9442403EA
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 06:27:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A1F9120003;
 Thu, 31 Mar 2022 06:27:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nZoGv-000YQn-GD; Thu, 31 Mar 2022 08:27:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent =?utf-8?Q?Stehl=C3=A9?= via buildroot <buildroot@buildroot.org>
References: <20220321145322.23881-1-vincent.stehle@laposte.net>
Date: Thu, 31 Mar 2022 08:27:05 +0200
In-Reply-To: <20220321145322.23881-1-vincent.stehle@laposte.net> ("Vincent
 =?utf-8?Q?Stehl=C3=A9?= via buildroot"'s message of "Mon, 21 Mar 2022
 15:53:22 +0100")
Message-ID: <87tube63ie.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/busybox: fix udhcpc options in
 minimal config
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
Cc: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlZpbmNlbnQiID09IFZpbmNlbnQgU3RlaGzDqSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gVGhlIGJ1c3lib3gtbWluaW1hbC5jb25maWcs
IHdoaWNoIGlzIHVzZWQgYnkgc3lzdGVtcyB3aXRob3V0IGFuIE1NVSwgc3BlY2lmaWVzCiA+IHRo
ZSAiLWIiIGNvbW1hbmQgbGluZSBvcHRpb24gZm9yIHVkaGNwYy4gSG93ZXZlciwgdGhpcyBvcHRp
b24gaXMgbm90IHN1cHBvcnRlZAogPiBieSBCdXN5Qm94IHVkaGNwYyBhbnltb3JlIHNpbmNlIHZl
cnNpb24gMS4yNy4wIHdoZW4gYnVpbGRpbmcgZm9yIHN5c3RlbXMKID4gd2l0aG91dCBhbiBNTVUu
CgogPiBSZW1vdmUgdGhlICItYiIgb3B0aW9uIGZyb20gYnVzeWJveC1taW5pbWFsLmNvbmZpZyB0
byByZXBhaXIgbmV0d29yawogPiBpbml0aWFsaXphdGlvbiBvbiBzeXN0ZW1zIHdpdGhvdXQgYW4g
TU1VLgoKID4gVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIG5ldHdvcmsgaW5pdGlhbGl6YXRpb24g
ZmFpbHVyZToKCiA+ICAgdWRoY3BjOiBpbnZhbGlkIG9wdGlvbiAtLSBiCiA+ICAgRkFJTAoKID4g
U2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5l
dD4KID4gLS0tCgpDb21taXR0ZWQgdG8gMjAyMi4wMi54LCB0aGFua3MuCgotLSAKQnllLCBQZXRl
ciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
