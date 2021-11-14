Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55415C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:15:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1728E61104
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1728E61104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E201340285;
	Sun, 14 Nov 2021 14:15:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cKO2oXRu1Fdt; Sun, 14 Nov 2021 14:15:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CFD940282;
	Sun, 14 Nov 2021 14:14:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E03E91BF3D9
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC72A80DB6
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sipL0_NCxV9J for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:14:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED0D380D80
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:14:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 189D91BF205;
 Sun, 14 Nov 2021 14:14:55 +0000 (UTC)
Date: Sun, 14 Nov 2021 15:14:54 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211114151454.3b75b9d5@windsurf>
In-Reply-To: <20211114135722.12386-1-ps.report@gmx.net>
References: <20211114135722.12386-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next v1] package/qt5declarative: move the
 qt5gui select from qt5declarative to qt5quick
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
Cc: =?UTF-8?B?0JrRg9C30YzQvNC40L3QvtCyINCh0LU=?= =?UTF-8?B?0YDQs9C10Lk=?=
 <kuzminov.sergey81@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAxNCBOb3YgMjAyMSAxNDo1NzoyMiArMDEwMApQZXRlciBTZWlkZXJlciA8cHMucmVw
b3J0QGdteC5uZXQ+IHdyb3RlOgoKPiBBcyByZXF1ZXN0ZWQvc3VnZ2VzdGVkIGJ5IFNlcmdleSBL
dXptaW5vdihbMV0pIG1vdmUgdGhlIHF0NWd1aSBzZWxlY3QgZnJvbQo+IHF0NWRlY2xhcmF0aXZl
IHRvIHF0NXF1aWNrLgo+IAo+IFRoZSBxdDVkZWNsYXJhdGl2ZSAod2l0aG91dCBxdDVxdWljaykg
Y29tcGlsZXMgYW5kIGluc3RhbGxzIGZpbmUgd2l0aG91dAo+IHF0NWd1aSBlbmFibGVkIGFuZCBj
b2RlIGluc3BlY3Rpb24gb2YgdGhlIHF0NWRlY2xhcmF0aXZlIHNvdWNlIHBhY2thZ2UgKi5wcm8K
PiBmaWxlcyBzaG93cyB0aGUgdW5jb25kaXRpb25hbGx5IGd1aSBkZXBlbmRlbmNpZXMgb25seSBp
biBmb3IgZG9jLXNuaXBwZXRzCj4gYW5kL29yIHRlc3QgcHJvamVjdGVzIG9yIHJlYWwgdGhlIHF0
NXF1aWNrIG1vZHVscy4KPiAKPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290
LzZmZDA1Zjk3LTdmYjktOTZkOC1jY2EwLTUwNjNiZThhZDYyMEBnbWFpbC5jb20KPiAKPiBSZXBv
cnRlZC1ieTogItCa0YPQt9GM0LzQuNC90L7QsiDQodC10YDQs9C10LkiIDxrdXptaW5vdi5zZXJn
ZXk4MUBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9y
dEBnbXgubmV0Pgo+IC0tLQo+IE5vdGVzOgo+ICAgLSBAU2VyZ2V5OiBJIHVzZWQgdGhlIEFTQ0lJ
IHZlcnNpb24gb2YgeW91ciBuYW1lLCBob3BlIGl0IGlzIG8uay4gZm9yIHlvdT8KPiAtLS0KPiAg
cGFja2FnZS9xdDUvcXQ1ZGVjbGFyYXRpdmUvQ29uZmlnLmluIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCkFwcGxpZWQgdG8gbmV4dCwgdGhh
bmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
