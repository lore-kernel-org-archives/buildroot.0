Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8DFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 16:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51A9A401F9;
	Thu, 30 Dec 2021 16:08:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jePO1CRxMf3y; Thu, 30 Dec 2021 16:08:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE75A401CD;
	Thu, 30 Dec 2021 16:08:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DABE1BF3CB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AA8A401FB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:08:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c8lkonHYF3wm for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 16:08:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A67440166
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 16:08:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 485B440008;
 Thu, 30 Dec 2021 16:08:26 +0000 (UTC)
Date: Thu, 30 Dec 2021 17:08:25 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20211230170825.48b43015@windsurf>
In-Reply-To: <a9bed606-385d-137d-134f-71bdf9d20222@benettiengineering.com>
References: <20200306071440.30433-1-miquel.raynal@bootlin.com>
 <20200306071440.30433-5-miquel.raynal@bootlin.com>
 <20211230151428.1a49b1bf@windsurf>
 <a9bed606-385d-137d-134f-71bdf9d20222@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/7] package/mali-bifrost-driver: new package
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org, Luca Ceresoli <luca@lucaceresoli.net>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBUaHUsIDMwIERlYyAyMDIxIDE2OjI4OjU3ICswMTAwCkdpdWxpbyBCZW5ldHRp
IDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKCj4gSSBoYWQg
bm8gY2hhbmNlIHRvIHRlc3QgaXQgb24gcmVhbCBoYXJkd2FyZSBmb3IgbGFjayBvZiB0aW1lIDot
LyBzbyBJIAo+IGRvbid0IGtub3cgaWYgaXQgd29ya3MsIGFuZCBpdCBzaG91bGQgbm90IGJlIGV4
cGVjdGVkIHRvIHdvcmsuIEkndmUgCj4gY29tcGFyZWQgcjggdmVyc2lvbiBvZiBtaWRnYXJkIGFn
YWluc3QgYmlmcm9zdCBhbmQgdGhleSBhcmUgcHJldHR5IAo+IGRpZmZlcmVudC4KCkknbSBwcmV0
dHkgc3VyZSBpdCB3b3Jrcywgc2luY2UgSSd2ZSBzZWVuIG15c2VsZiB0aGUgcGF0Y2hlcyBmcm9t
Ck1pcXXDqGwgYWxsb3dpbmcgdG8gcnVuIFF0NS9PcGVuR0wgb24gYSBSb2NrY2hpcCBQWDMwIHBs
YXRmb3JtLiBJJ20KcXVlc3Rpb25pbmcgdGhlIHRlcm1pbm9sb2d5L2Nob2ljZSBvZiBuYW1pbmcu
Cgo+IEknbSB3b3JraW5nIG9uIHRoaXMgcGF0Y2hzZXQgaW4gc3BhcmUgdGltZVsxXSB3aXRoIHRo
ZSBnb2FsIHRvIGNyZWF0ZSBhIAo+IHNpbmdsZSBtYWxpLWRyaXZlciBwYWNrYWdlIHRvIGRlYWwg
d2l0aCBVdGdhcmQsIE1pZGdhcmQgYW5kIEJpZnJvc3QuCj4gSSd2ZSBhbHJlYWR5IHJlcXVlc3Rl
ZCB0byBjaGFuZ2UgcmVwb3NpdG9yeSBuYW1lIGZyb20gCj4gbWFsaS1iaWZyb3N0LWRyaXZlciB0
byBtYWxpLWRyaXZlciBhbmQgaXQncyBiZWVuIGRvbmUgcGx1cyBtZXJnaW5nIAo+IHBhdGNoZXMg
dG8gYWxsb3cgYnVpbGRpbmcgd2l0aCB1cCB0byBMaW51eCA1LjE1WzJdLgoKQWgsIHdlIGRpZCB0
aGlzIHJlbmFtZT8KCj4gVGhvbWFzLCBkbyB5b3Ugd2FudCBtZSB0byBzZW5kIHRoZSB2MiBwYXRj
aHNldCBpblsxXSB0byBCdWlsZHJvb3QgCj4gbWFpbGluZyBsaXN0PyBJdCdzIG5vdCBjb21wbGV0
ZSBhdCBhbGwsIGJ1dCBpdCdzIHNvbWUgc3RlcCBmb3J3YXJkLgoKSSdtIGEgYml0IGxvc3Qgd2l0
aCBhbGwgdGhlc2UgcmVuYW1lcy4gV2UgYWxyZWFkeSBoYXZlCnN1bnhpLW1hbGktbWFpbmxpbmUt
ZHJpdmVyIGluIHRoZSB0cmVlLCB3aGljaCBwb2ludHMgdG8KaHR0cHM6Ly9naXRodWIuY29tL21y
aXBhcmQvc3VueGktbWFsaS4gSSdtIG5vdCBzdXJlIHdoaWNoIGtlcm5lbCBkcml2ZXIKaGFuZGxl
cyB3aGljaCBHUFUgdmFyaWFudC4KCkJlc3QgcmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBl
dGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
