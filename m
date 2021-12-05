Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3751C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 11:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81B44832DC;
	Sun,  5 Dec 2021 11:27:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XcGxbV75hOYK; Sun,  5 Dec 2021 11:27:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F12A8832D0;
	Sun,  5 Dec 2021 11:27:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C84231BF27E
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 11:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4F41405D0
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 11:27:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C1easvGUQqoe for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 11:27:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AE72405CE
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 11:27:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C4C9960006;
 Sun,  5 Dec 2021 11:27:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mtpgD-0008O2-R5; Sun, 05 Dec 2021 12:27:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211204231325.562144-1-yann.morin.1998@free.fr>
Date: Sun, 05 Dec 2021 12:27:41 +0100
In-Reply-To: <20211204231325.562144-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 5 Dec 2021 00:13:25 +0100")
Message-ID: <87a6hf9tqq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/mender-grubenv: fix install for
 legacy BIOS or ARM U-Boot
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
Cc: =?utf-8?Q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IFNvbWUgbGFzdC1taW51dGUgY2hhbmdlcyB3ZXJlIG1hZGUgd2hlbiBhcHBseWlu
ZyBjb21taXRzIDdhNjg5NjBiNjgyYzAKID4gKGJvb3QvZ3J1YjIvQ29uZmlnLmluOiBhZGQgc3lt
Ym9scyB0byByZXByZXNlbnQgbGVnYWN5IGFuZCBFRkkgYm9vdCkgYW5kCiA+IDRkNWIyMDkzODRl
MCAocGFja2FnZS9tZW5kZXItZ3J1YmVudjogZml4IGdydWIgbW9kdWxlIGNoZWNrcyksIGFuZCB0
aGUKID4gcmVuYW1pbmcgb2YgdGhlIEJSMl9UQVJHRVRfR1JVQl9MRUdBQ1kgd2FzIG5vdCBmdWxs
eSBwcm9wYWdhdGVkLgoKID4gVGhpcyBjYXVzZWQgdGhlIHBhdGggdG8gdGhlIGJvb3QgZmlsZXMg
dG8gYWx3YXlzIGJlIGludGVycHJldGVkIGFzIGJlaW5nCiA+IHRoZSBFRkkgb25lLCBhbmQgbmV2
ZXIgdGhlIGxlZ2FjeSBvbmUuIEluIHByYWN0aWNlLCB0aGF0IHdhcyBub3QgY2F1c2luZwogPiBh
bnkgYnVpbGQgZmFpbHVyZSwgYmVjYXVzZSB0aGUgcGF0aCB3YXMgcGFzc2VkIGF0IGJ1aWxkLXRp
bWUgdG8KID4gbWVuZGVyLWdydWJlbnYsIHRoYXQgd291bGQgdXNlIGl0IGFzIHRoZSBsb2NhdGlv
biB3aGVyZSB0byBpbnN0YWxsIGl0cwogPiBmaWxlcywgYW5kIGZpbmFsbHkgYXMgdGhlIGxvY2F0
aW9uIHdoZXJlIG91ciBpbWFnZS1pc250YWxsIGNvbW1hbmRzCiA+IHdvdWxkIGxvb2sgZm9yIHRo
ZW0uCgogPiBTdGlsbCB0aGlzIGlzIGluY29ycmVjdCBiZWNhdXNlIGl0IHdvdWxkIG5vdCBtYXRj
aCB3aGVyZSBncnViMiB3b3VsZAogPiBldmVudHVhbGx5IGVuZCB1cCBsb29raWcgZm9yIGl0cyBm
aWxlcyBhdCBydW50aW1lLi4uCgogPiBUbyBhdm9pZCBmdXJ0aGVyIGlzc3VlLCBkcm9wIHRoZSBj
b25kaXRpb25hbCBibG9jayBkZWRpY2F0ZWQgdG8gc2V0dGluZwogPiB0aGUgcGF0aCB0byB0aGUg
Ym9vdCBmaWxlcywgZHJvcCB0aGUgaW50ZXJtZWRpYXRlIHZhcmlhYmxlLCBhbmQgbW92ZQogPiBz
ZXR0aW5nIHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZSBkb3duIGludG8gdGhlIGV4aXN0aW5nIGNv
bmRpdGlvbmFsCiA+IGJsb2NrLgoKID4gV2UgZG8gZHJvcCB0aGUgaW50ZXJtZWRpYXRlIHZhcmlh
YmxlLCBiZWNhdXNlIHRoZXJlIGlzIG5vIGxvbmdlciBhbnkKID4gZ2VuZXJpY2l0eSBuZWVkZWQ6
IHRoZSBpbnN0YWxsYXRpb24gY29tbWFuZHMgYXJlIGFscmVhZHkgZHVwbGljYXRlZCBmb3IKID4g
dGhlIHR3byBjYXNlcyBhbnl3YXkuCgogPiBSZXBvcnRlZC1ieTogUGV0ZXIgS29yc2dhYXJkIDxw
ZXRlckBrb3JzZ2FhcmQuY29tPgogPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5u
Lm1vcmluLjE5OThAZnJlZS5mcj4KID4gQ2M6IEFkYW0gRHVza2V0dCA8YWR1c2tldHRAZ21haWwu
Y29tPgogPiBDYzogS8O2cnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+CgpD
b21taXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
