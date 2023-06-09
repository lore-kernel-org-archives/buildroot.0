Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CFCC7EE2E
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 08:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A489241F49;
	Fri,  9 Jun 2023 08:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A489241F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ik7gDbaviZXI; Fri,  9 Jun 2023 08:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8733F41F53;
	Fri,  9 Jun 2023 08:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8733F41F53
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 372681BF387
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 08:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 101848418E
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 08:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 101848418E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SSv-Yp7PI402 for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 08:11:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F70884156
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F70884156
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 08:11:22 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DD7F24000B;
 Fri,  9 Jun 2023 08:11:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q7XDK-000bX7-Al; Fri, 09 Jun 2023 10:11:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
References: <20230425070923.1294644-1-raphael.melotte@mind.be>
Date: Fri, 09 Jun 2023 10:11:18 +0200
In-Reply-To: <20230425070923.1294644-1-raphael.melotte@mind.be>
 (=?utf-8?Q?=22Rapha=C3=ABl=09M=C3=A9lotte=22's?= message of "Tue, 25 Apr
 2023 09:09:22 +0200")
Message-ID: <87fs7112e1.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mupdf: fix building with zlib-ng
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJhcGhhw6tsIiA9PSBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1p
bmQuYmU+IHdyaXRlczoKCiA+IFRoZSBjdXJyZW50IG11cGRmIHZlcnNpb24gZmFpbHMgdG8gYnVp
bGQgd2hlbiB6bGliLW5nIGlzIHVzZWQgYXMgdGhlCiA+IHpsaWIgaW1wbGVtZW50YXRpb24uIEFk
ZCBhIHBhdGNoIHRvIGZpeCBpdC4KCiA+IFRoaXMgZml4ZXMgdGhlIGZvbGxvd2luZyBidWlsZCBm
YWlsdXJlIHJhaXNlZCBzaW5jZSB0aGUgYnVtcCB0bwogPiB2ZXJzaW9uIDEuMjEuMCBvZiB0aGUg
bXVwZGYgcGFja2FnZSBpbiBjb21taXQKID4gM2MyMDMzY2QyYWNlMDc3ZTdkZmFmNThhMjU4OWIy
YTkzYTVmZDdiMDoKCiA+IHNvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5jOiBJbiBmdW5jdGlvbiAn
ZGVmbGF0ZV93cml0ZSc6CiA+IHNvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5jOjM0MzoyNzogZXJy
b3I6ICdVSU5UX01BWCcgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCiA+
ICAgMzQzIHwgICAgICAgICBuZXdidWZzaXplID0gbiA+PSBVSU5UX01BWCA/IFVJTlRfTUFYIDog
ZGVmbGF0ZUJvdW5kKCZzdGF0ZS0+eiwgbik7CiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICBefn5+fn5+fgogPiBzb3VyY2UvZml0ei9lbmNvZGUtYmFzaWMuYzoyNjoxOiBub3Rl
OiAnVUlOVF9NQVgnIGlzIGRlZmluZWQgaW4gaGVhZGVyICc8bGltaXRzLmg+JzsgZGlkIHlvdSBm
b3JnZXQgdG8gJyNpbmNsdWRlIDxsaW1pdHMuaD4nPwoKID4gRml4ZXM6IGh0dHA6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzg3MTI4ZTk5NjdjZmYyMDA3OGM2NWFiODQ3ODc3YWE0
NGNjNDA5ZDkKCiA+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1l
bG90dGVAbWluZC5iZT4KCkNvbW1pdHRlZCB0byAyMDIzLjAyLngsIHRoYW5rcy4KCi0tIApCeWUs
IFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
