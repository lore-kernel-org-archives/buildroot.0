Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A91C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 18:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 704A5606EC;
	Sun,  5 Mar 2023 18:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 704A5606EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mtaP0m6MBijv; Sun,  5 Mar 2023 18:33:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EA6F60E66;
	Sun,  5 Mar 2023 18:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EA6F60E66
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22CB71BF3DA
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A032401CA
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A032401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hAyMdJC79lqZ for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 18:33:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94940401BA
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94940401BA
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 18:33:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0842960004;
 Sun,  5 Mar 2023 18:33:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYtAb-001kyw-5j; Sun, 05 Mar 2023 19:33:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart via buildroot <buildroot@buildroot.org>
References: <20230302151859.400567-1-giulio.benetti@benettiengineering.com>
 <CA+h8R2r5SvTysWRJO12UFCG8TdMQo1+Y+q+Mdam4nwj43+yNVw@mail.gmail.com>
Date: Sun, 05 Mar 2023 19:33:17 +0100
In-Reply-To: <CA+h8R2r5SvTysWRJO12UFCG8TdMQo1+Y+q+Mdam4nwj43+yNVw@mail.gmail.com>
 (Christian Stewart via buildroot's message of "Thu, 2 Mar 2023
 23:49:24 -0800")
Message-ID: <87zg8r59qq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: fix build failure on
 PowerPC64
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkNocmlzdGlhbiIgPT0gQ2hyaXN0aWFuIFN0ZXdhcnQgdmlhIGJ1aWxkcm9vdCA8YnVp
bGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyaXRlczoKCiA+IEhpIEdpdWxpbywKID4gT24gVGh1LCBN
YXIgMiwgMjAyMyBhdCA3OjE54oCvQU0gR2l1bGlvIEJlbmV0dGkKID4gPGdpdWxpby5iZW5ldHRp
QGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgogPj4gCiA+PiBMZXQncyBhZGQgbG9jYWwg
cGF0Y2ggcGVuZGluZyB1cHN0cmVhbSB0byBmaXggZ2V0X3JhKCkgY29uZmxpY3Qgb24KID4+IFBv
d2VyUEM2NCBhcmNoaXRlY3R1cmUuCiA+PiAKID4+IFswXTogaHR0cHM6Ly9naXRodWIuY29tL21v
cnJvd25yLzg4MjFjdS0yMDIxMDExOC9wdWxsLzkzCiA+PiAKID4+IFNpZ25lZC1vZmYtYnk6IEdp
dWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgogPj4g
LS0tCiA+PiAuLi4vMDAwMS1GaXgtYnVpbGQtb24tUG93ZXJQQzY0LnBhdGNoICAgICAgICAgfCAx
MjMgKysrKysrKysrKysrKysrKysrCiA+PiAxIGZpbGUgY2hhbmdlZCwgMTIzIGluc2VydGlvbnMo
KykKID4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3J0bDg4MjFjdS8wMDAxLUZpeC1idWls
ZC1vbi1Qb3dlclBDNjQucGF0Y2gKCiA+IFRoZSByZXBvIG93bmVyIG1vcnJvd25yIHJlcXVlc3Rl
ZCB0aGF0IHdlIHN3aXRjaCB0byB0aGUgbmV3ZXIgdmVyc2lvbgogPiBvZiB0aGUgcGFja2FnZSwg
YW5kIHNlbmQgdGhlIFBSIHRoZXJlLgoKID4gSSBzZW50IHRoZSBQUiB0aGVyZTogaHR0cHM6Ly9n
aXRodWIuY29tL21vcnJvd25yLzg4MjFjdS0yMDIxMDkxNi9wdWxsLzczCgogPiBUaGUgcGF0Y2gg
dG8gdXBkYXRlIHRvIHRoZSBuZXcgdmVyc2lvbjoKCiA+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFi
cy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMzAzMDMwNzQ4MjkuMjEzOTg4MS0xLWNo
cmlzdGlhbkBwYXJhbC5pbi8KCldoYXQgaXMgdGhlIHJlbGF0aW9uIGV4YWN0bHkgYmV0d2VlbiB0
aGVzZSB0d28gcGF0Y2hlcz8gQXJlIHRoZXkgZml4aW5nCnRoZSBzYW1lIGlzc3VlPyBJcyB0aGlz
IHBhdGNoIHN1cGVyc2VlZGVkIGJ5IHlvdXIgcGF0Y2ggY2hhbmdpbmcgdGhlCnZlcnNpb24/Cgot
LSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
