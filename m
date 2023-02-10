Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DF0C636CD
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 14:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B98C24199A;
	Fri, 10 Feb 2023 14:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B98C24199A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UuIzhi5QTLFq; Fri, 10 Feb 2023 14:12:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2B8541991;
	Fri, 10 Feb 2023 14:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2B8541991
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 802DB1BF2C9
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 14:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58D3641991
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 14:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58D3641991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tb6jAccgNjKX for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 14:12:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEEDB41990
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEEDB41990
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:12:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4156C1C0006;
 Fri, 10 Feb 2023 14:12:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pQU8Z-00HaL1-Dr; Fri, 10 Feb 2023 15:12:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20230208181933.3925279-1-peter@korsgaard.com>
 <20230208181933.3925279-2-peter@korsgaard.com>
 <e4c3b574-0e81-41ce-8e75-2f0837b9b83f@smile.fr>
Date: Fri, 10 Feb 2023 15:12:27 +0100
In-Reply-To: <e4c3b574-0e81-41ce-8e75-2f0837b9b83f@smile.fr> (Romain Naour's
 message of "Wed, 8 Feb 2023 22:08:08 +0100")
Message-ID: <87y1p5ehis.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/5] package/aubio: drop
 AUBIO_REMOVE_OLD_WAF hook
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdy
aXRlczoKCiA+IExlIDA4LzAyLzIwMjMgw6AgMTk6MTksIFBldGVyIEtvcnNnYWFyZCBhIMOpY3Jp
dMKgOgogPj4gQXMgdGhhdCBpcyBub3cgaGFuZGxlZCBieSB0aGUgd2FmLXBhY2thZ2UgaW5mcmFz
dHJ1Y3R1cmUuCiA+PiAKID4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJA
a29yc2dhYXJkLmNvbT4KCiA+IFJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBzbWlsZS5mcj4KCgogPj4gLS0tCiA+PiBwYWNrYWdlL2F1YmlvL2F1YmlvLm1rIHwgNiAtLS0t
LS0KID4+IDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQogPj4gCiA+PiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9hdWJpby9hdWJpby5tayBiL3BhY2thZ2UvYXViaW8vYXViaW8ubWsKID4+IGlu
ZGV4IGM5OTVmZGZhYzcuLjY0MTc0YTExM2QgMTAwNjQ0CiA+PiAtLS0gYS9wYWNrYWdlL2F1Ymlv
L2F1YmlvLm1rCiA+PiArKysgYi9wYWNrYWdlL2F1YmlvL2F1YmlvLm1rCiA+PiBAQCAtMjEsMTIg
KzIxLDYgQEAgQVVCSU9fQ09ORl9PUFRTID0gXAogPj4gIyBodHRwczovL2dpdGh1Yi5jb20vamFj
a2F1ZGlvL2phY2syL2lzc3Vlcy84OTgKID4+IEFVQklPX05FRURTX0VYVEVSTkFMX1dBRiA9IFlF
UwogPj4gCiA+PiAtIyBUaGUgb2xkIHdhZiBzY3JpcHQgYnVuZGxlZCBpbiBhdWJpbyAwLjQuOSBu
ZWVkIHRvIGJlIHJlbW92ZWQgZmlyc3QuCiA+PiAtZGVmaW5lIEFVQklPX1JFTU9WRV9PTERfV0FG
CiA+PiAtCSQoUk0pIC1mciAkKEBEKS93YWYgJChARCkvd2FmbGliCiA+PiAtZW5kZWYKID4+IC1B
VUJJT19QT1NUX0VYVFJBQ1RfSE9PS1MgPSBBVUJJT19SRU1PVkVfT0xEX1dBRgoKID4gTm90ZTog
dGhlIHBrZy13YWcgdXNlIGEgUFJFX0NPTkZJR1VSRV9IT09LUyBpbnN0ZWFkIG9mIFBPU1RfRVhU
UkFDVF9IT09LUy4KCkNvcnJlY3QuIEkgZG9uJ3QgdGhpbmsgdGhhdCBoYXMgYW55IGZ1bmN0aW9u
YWwgY2hhbmdlLCBidXQgSSBkaWQgY2hhbmdlCnRoZSB3YWYtcGFja2FnZSBsb2dpYyB0byB1c2Ug
YSBwb3N0LXBhdGNoIGhvb2sgYXMgc3VnZ2VzdGVkIGJ5IFlhbm4uCgotLSAKQnllLCBQZXRlciBL
b3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
