Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AA7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 17:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B28F3405CB;
	Sun, 10 Apr 2022 17:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1LcYaP8NQRxq; Sun, 10 Apr 2022 17:02:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C48754059D;
	Sun, 10 Apr 2022 17:02:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7C891BF2C7
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 17:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A566660D57
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 17:02:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TIMqxerPUnvM for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 17:02:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CE476068D
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 17:02:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 36AF2100005;
 Sun, 10 Apr 2022 17:02:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ndax2-0056cp-59; Sun, 10 Apr 2022 19:02:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent =?utf-8?Q?Stehl=C3=A9?= via buildroot <buildroot@buildroot.org>
References: <20220329205136.32435-1-vincent.stehle@laposte.net>
Date: Sun, 10 Apr 2022 19:02:12 +0200
In-Reply-To: <20220329205136.32435-1-vincent.stehle@laposte.net> ("Vincent
 =?utf-8?Q?Stehl=C3=A9?= via buildroot"'s message of "Tue, 29 Mar 2022
 22:51:36 +0200")
Message-ID: <87fsmkq3cb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/qemu_xtensa_lx60_nommu: use busybox
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlZpbmNlbnQiID09IFZpbmNlbnQgU3RlaGzDqSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gVXBkYXRlIHRoZSBxZW11X3h0ZW5zYV9seDYw
X25vbW11X2RlZmNvbmZpZyB0byB1c2UgdGhlCiA+IGJ1c3lib3gtbWluaW1hbC5jb25maWcsIHRv
IG1ha2UgaXQgbW9yZSBjb25zaXN0ZW50IHdpdGggdGhlIG90aGVyIG5vLU1NVQogPiBkZWZjb25m
aWdzLgoKID4gQWZ0ZXIgY29tbWl0IDNkZTQ4NmY4YjA1MiAoInBhY2thZ2UvYnVzeWJveDogZml4
IHVkaGNwYyBvcHRpb25zIGluIG1pbmltYWwKID4gY29uZmlnIiksIHRoaXMgaGFzIHRoZSBiZW5l
Zml0IG9mIGZpeGluZyB0aGUgZm9sbG93aW5nIG5ldHdvcmsKID4gaW5pdGlhbGl6YXRpb24gZmFp
bHVyZToKCiA+ICAgdWRoY3BjOiBpbnZhbGlkIG9wdGlvbiAtLSBiCgogPiBTaWduZWQtb2ZmLWJ5
OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0PgogPiBDYzogUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgogPiBDYzogR2Vyb21lIEJ1cmxhdHMg
PGdlcm9tZS5idXJsYXRzQHNtaWxlLmZyPgoKQ29tbWl0dGVkIHRvIDIwMjIuMDIueCwgdGhhbmtz
LgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
