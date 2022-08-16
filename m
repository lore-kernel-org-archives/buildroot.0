Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E848AC25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 21:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7288841591;
	Tue, 16 Aug 2022 21:00:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7288841591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKnQOAmL2vZM; Tue, 16 Aug 2022 21:00:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C98941570;
	Tue, 16 Aug 2022 21:00:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C98941570
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4ABC91BF39C
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 21:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25D7C60B3F
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 21:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25D7C60B3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PchAbUXmzDzU for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 21:00:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D465F60B3D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D465F60B3D
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 21:00:19 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7A15E240003;
 Tue, 16 Aug 2022 21:00:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oO3fb-009dvY-Gr; Tue, 16 Aug 2022 23:00:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220724101830.3AF4285BF9@busybox.osuosl.org>
Date: Tue, 16 Aug 2022 23:00:15 +0200
In-Reply-To: <20220724101830.3AF4285BF9@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sun, 24 Jul 2022 12:31:53 +0200")
Message-ID: <87k077c3a8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/qt5/qt5webkit: backport
 upstream fix for GStreamer 1.19.x compatibility
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gY29tbWl0OiBodHRwczovL2dpdC5idWlsZHJv
b3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPWJiNTBiODIxNzAyODQxZmRjNzViZjgxNTE1NTVj
ZDQwMWY3NjRmMDcKID4gYnJhbmNoOiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9v
dC9jb21taXQvP2lkPXJlZnMvaGVhZHMvbWFzdGVyCgogPiBJbiBHU3RyZWFtZXIgY29tbWl0IDBh
NjU3ZDZkYjViYTkxMmIxMzA5MmE5MDdlYTUwNzYzOGNkMDFjZjksIG1lcmdlZAogPiBpbiBHc3Ry
ZWFtZXIgMS4xOS54LCB0aGUgR3N0QXBwU2lua0NhbGxiYWNrcyBzdHJ1Y3R1cmUgd2FzIGV4dGVu
ZGVkCiA+IHdpdGggYW5vdGhlciBmaWVsZCBjYWxsZSBuZXdfZXZlbnQuIFRoaXMgcmVxdWlyZXMg
YW4gdXBkYXRlIGluIHRoZQogPiBXZWJLaXQgY29kZSwgd2l0aG91dCB3aGljaCB3ZSBoYXZlIGEg
YnVpbGQgZmFpbHVyZToKCiA+ICAgICBwbGF0Zm9ybS9hdWRpby9nc3RyZWFtZXIvQXVkaW9GaWxl
UmVhZGVyR1N0cmVhbWVyLmNwcDoyMzQ6NTogZXJyb3I6IGJyYWNlcyBhcm91bmQgc2NhbGFyIGlu
aXRpYWxpemVyIGZvciB0eXBlIOKAmGdib29sZWFuICgqKShHc3RBcHBTaW5rKiwgZ3BvaW50ZXIp
IHtha2EgaW50ICgqKShfR3N0QXBwU2luayosIHZvaWQqKX3igJkKCiA+IFRoZXJlIGFyZSBubyBh
dXRvYnVpbGRlciBmYWlsdXJlcywgYnV0IHRoZSBpc3N1ZSBjb3VsZCBiZSByZXByb2R1Y2VkCiA+
IHVzaW5nIHRoZSBmb2xsb3dpbmcgZGVmY29uZmlnOgoKID4gQlIyX2FybT15CiA+IEJSMl9jb3J0
ZXhfYTg9eQogPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKID4gQlIyX1RPT0xDSEFJTl9FWFRF
Uk5BTF9MSU5BUk9fQVJNPXkKID4gQlIyX1BBQ0tBR0VfUVQ1PXkKID4gQlIyX1BBQ0tBR0VfUVQ1
V0VCS0lUPXkKCiA+IFNpZ25lZC1vZmYtYnk6IE5pY29sYXMgQ2FycmllciA8bmljb2xhcy5jYXJy
aWVyQG9yb2xpYS5jb20+CiA+IFtUaG9tYXM6IGZpbmQgdGhlIGFjdHVhbCB1cHN0cmVhbSBmaXgg
YW5kIHVzZSB0aGF0LCBpbXByb3ZlIHRoZQogPiBleHBsYW5hdGlvbiBhYm91dCB0aGUgaXNzdWUg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlXQogPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25p
IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgoKQ29tbWl0dGVkIHRvIDIwMjIuMDUueCBh
bmQgMjAyMi4wMi54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
