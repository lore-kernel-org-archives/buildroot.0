Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4078DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 19:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D569160E2B;
	Sun,  8 May 2022 19:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n0bl3PZlxPPV; Sun,  8 May 2022 19:46:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAA3560BA1;
	Sun,  8 May 2022 19:46:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27DA91BF842
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 19:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 158FF60BA1
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 19:46:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ruirx8M6SNKc for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 19:45:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C76B56003C
 for <buildroot@buildroot.org>; Sun,  8 May 2022 19:45:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6C9BB20004;
 Sun,  8 May 2022 19:45:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nnmqp-001KsB-J2; Sun, 08 May 2022 21:45:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220407163947.1024467-1-fontaine.fabrice@gmail.com>
Date: Sun, 08 May 2022 21:45:55 +0200
In-Reply-To: <20220407163947.1024467-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 7 Apr 2022 18:39:47 +0200")
Message-ID: <875ymfhkp8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: doesn't build with
 libressl
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
Cc: Norbert Lange <nolange79@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBzeXN0ZW1kIGRvZXNuJ3QgcGxhbiB0byBmaXggdGhlIGZvbGxv
d2luZyBidWlsZCBmYWlsdXJlIHdpdGggbGlicmVzc2wKID4gKGh0dHBzOi8vZ2l0aHViLmNvbS9z
eXN0ZW1kL3N5c3RlbWQvaXNzdWVzLzE0OTI4KSBhbmQgRUQyNTUxOSBzdXBwb3J0CiA+IGlzIHN0
aWxsIG5vdCBhdmFpbGFibGUgaW4gbGlicmVzc2wKID4gKGh0dHBzOi8vZ2l0aHViLmNvbS9saWJy
ZXNzbC1wb3J0YWJsZS9wb3J0YWJsZS9pc3N1ZXMvMzkzIG9wZW5lZCBmb3IKID4gbW9yZSB0aGFu
IDMgeWVhcnMpOgoKID4gLi4vc3JjL2hvbWUvaG9tZWQtbWFuYWdlci5jOiBJbiBmdW5jdGlvbiDi
gJhtYW5hZ2VyX2dlbmVyYXRlX2tleV9wYWly4oCZOgogPiAuLi9zcmMvaG9tZS9ob21lZC1tYW5h
Z2VyLmM6MTM5MzozNTogZXJyb3I6IOKAmEVWUF9QS0VZX0VEMjU1MTnigJkKID4gdW5kZWNsYXJl
ZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYRVZQX1BLRVlf
RFNBMeKAmT8KID4gIDEzOTMgfCAgICAgICAgIGN0eCA9IEVWUF9QS0VZX0NUWF9uZXdfaWQoRVZQ
X1BLRVlfRUQyNTUxOSwgTlVMTCk7CiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgRVZQX1BLRVlfRFNBMQoKID4gRml4ZXM6CiA+ICAtIGh0dHA6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzQ3ZjMxYjM2ZjEyM2M0YmU0NjYxZjRmZGUyZDFm
NzM4NWM1ZDBlZDUKCiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5l
LmZhYnJpY2VAZ21haWwuY29tPgoKQ29tbWl0dGVkIHRvIDIwMjIuMDIueCwgdGhhbmtzLgoKLS0g
CkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
