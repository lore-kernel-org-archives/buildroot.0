Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DD7C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 07:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2361A408AE;
	Tue, 13 Jun 2023 07:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2361A408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jw_N8lg-K8RU; Tue, 13 Jun 2023 07:04:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13734408A2;
	Tue, 13 Jun 2023 07:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13734408A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BF781BF341
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 07:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4519582265
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 07:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4519582265
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jj_eti2j-A8u for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 07:04:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D76A8225A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D76A8225A
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 07:04:54 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 088231C000D;
 Tue, 13 Jun 2023 07:04:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q8y5E-003ybH-8K; Tue, 13 Jun 2023 09:04:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20230422090625.25006-1-ps.report@gmx.net>
 <20230422090625.25006-3-ps.report@gmx.net>
Date: Tue, 13 Jun 2023 09:04:52 +0200
In-Reply-To: <20230422090625.25006-3-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 22 Apr 2023 11:06:25 +0200")
Message-ID: <87bkhjyh9n.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 3/3] package/qemu: add patches to fix
 host libc-2.37 compile
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

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+IHdyaXRl
czoKCiA+IC0gYWRkIHR3byB1cHN0cmVhbSBwYXRjaGVzIHRvIGZpeCBob3N0IGxpYmMtMi4zNyBj
b21waWxlCiA+ICAgKHNlZSBbMV0sIFsyXSBmb3IgZGV0YWlscykKCiA+IEZpeGVzOgoKID4gICBJ
biBmaWxlIGluY2x1ZGVkIGZyb20gL3Vzci9pbmNsdWRlL2xpbnV4L2J0cmZzLmg6MjksCiA+ICAg
ICAgICAgICAgICAgICAgICBmcm9tIC4uL2xpbnV4LXVzZXIvc3lzY2FsbC5jOjE2MzoKID4gICAv
dXNyL2luY2x1ZGUvbGludXgvZnMuaDo1MDo4OiBlcnJvcjogcmVkZWZpbml0aW9uIG9mIOKAmHN0
cnVjdCBmaWxlX2Nsb25lX3Jhbmdl4oCZCiA+ICAgICAgNTAgfCBzdHJ1Y3QgZmlsZV9jbG9uZV9y
YW5nZSB7CiA+ICAgICAgICAgfCAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgogPiAgIC4uL2xpbnV4
LXVzZXIvc3lzY2FsbC5jOjEyOTo4OiBub3RlOiBvcmlnaW5hbGx5IGRlZmluZWQgaGVyZQogPiAg
ICAgMTI5IHwgc3RydWN0IGZpbGVfY2xvbmVfcmFuZ2UgewogPiAgICAgICAgIHwgICAgICAgIF5+
fn5+fn5+fn5+fn5+fn4KCiA+IFsxXSBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9v
cGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE3NzMyMgogPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvcWVtdS1kZXZlbC8yMDIzMDExMDE3NDkwMS4yNTgwMjk3LTEtYmVycmFuZ2VAcmVkaGF0
LmNvbS8KCiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5l
dD4KCkNvbW1pdHRlZCB0byAyMDIzLjAyLngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNn
YWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
