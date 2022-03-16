Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8F1C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 09:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3FDA415E6;
	Wed, 16 Mar 2022 09:27:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtStBZRFHiMc; Wed, 16 Mar 2022 09:27:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0F46415D2;
	Wed, 16 Mar 2022 09:27:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C4ED1BF8C7
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 09:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 094D18413C
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 09:27:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tOavMQETv4sh for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 09:27:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C98E884128
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 09:27:51 +0000 (UTC)
Received: (Authenticated sender: theo.lebrun@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D9F9B24000B;
 Wed, 16 Mar 2022 09:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647422867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D3xRvN299Gg5emZ+pCDRsaxLfeoZRqNNg/v8KiWULLg=;
 b=c1XBWVi4olgHGOJ5Vz0E+GkvbXt0addOD9ouBQrOE8yX92STx9KoJh/yaDlBsH+lh+3DJx
 PJm2e861HMH71pHYOYtQet5WkrlAc6GQ8quCdaYGaZCaR2NBCZWPVnEvS/GPcAhUsx4uSv
 3hLiFd5RKDheUu/6FI6ZYkfqYc/Zmlri2+SA4dXoygW9ohOg9Aplod1N93lF/hNOG4sTyE
 HsmhBO+/DEg8cL94dl++OZU1GOxqhAgSmL52Im3bDqnPFUmLZmFmuT4PqSAtb9dfI11GnR
 Uc67oiiE83ui+OkAQG13zP6n2r2oN+5s10TU6As3UQ0Sv5rDI7pgIzJJAdlD/w==
Mime-Version: 1.0
Date: Wed, 16 Mar 2022 10:27:46 +0100
Message-Id: <CIL6O0YFVA9E.3SEXZ6TDJJMH0@xps13>
To: "Arnout Vandecappelle" <arnout@mind.be>, <buildroot@buildroot.org>
X-Mailer: aerc 0.8.2-0-g6412559
References: <20220228161345.378966-1-theo.lebrun@bootlin.com>
 <80b6dcef-8b08-5ee0-9c82-b10758a5af54@mind.be>
In-Reply-To: <80b6dcef-8b08-5ee0-9c82-b10758a5af54@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/wireplumber: bump version to
 0.4.8
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
From: =?utf-8?q?Th=C3=A9o_Lebrun_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlIE1hciAxNSwgMjAyMiBhdCAxMDoxMSBQTSBDRVQsIEFybm91dCBWYW5kZWNhcHBlbGxl
IHdyb3RlOgo+IE9uIDI4LzAyLzIwMjIgMTc6MTMsIFRow6lvIExlYnJ1biB2aWEgYnVpbGRyb290
IHdyb3RlOgo+ID4gQ2hhbmdlbG9nOgo+ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L3BpcGV3aXJlL3dpcmVwbHVtYmVyLy0vYmxvYi9lMTRiYjcyZGNjODVlMjEzMGQwZWE5Njc2OGU1
YWUzYjM3NWEwNDFlL05FV1MucnN0Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFRow6lvIExlYnJ1
biA8dGhlby5sZWJydW5AYm9vdGxpbi5jb20+Cj4KPiAgIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFu
a3MuCgpUaGFua3MuIFNhZGx5LCB0aGlzIGxhdGVzdCB2ZXJzaW9uIGlzIGJyb2tlbiBhbmQgcmVx
dWlyZXMgYSBwYXRjaCB0bwpzdXBwb3J0IHNldHRpbmcgYSBkZWZhdWx0IGRldmljZSBpbiBXaXJl
UGx1bWJlci4gSSBqdXN0IHNlbnQgYSBwYXRjaAp3aGljaCBpcyB0aGUgY29tbWl0IHRoYXQgd2Fz
IHNlbnQgdXBzdHJlYW0gdG8gZml4IGl0LiBJdCBpcyByZXF1aXJlZAp1bnRpbCB1cHN0cmVhbSBn
ZXRzIGEgbmV3IHZlcnNpb24gKG5vIGRhdGUgYW5ub3VuY2VkKS4KClJlZ2FyZHMsClRow6lvCgo+
Cj4gICBSZWdhcmRzLAo+ICAgQXJub3V0Cj4KPiA+IC0tLQo+ID4gICBwYWNrYWdlL3dpcmVwbHVt
YmVyL3dpcmVwbHVtYmVyLmhhc2ggfCAyICstCj4gPiAgIHBhY2thZ2Uvd2lyZXBsdW1iZXIvd2ly
ZXBsdW1iZXIubWsgICB8IDIgKy0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dpcmVwbHVt
YmVyL3dpcmVwbHVtYmVyLmhhc2ggYi9wYWNrYWdlL3dpcmVwbHVtYmVyL3dpcmVwbHVtYmVyLmhh
c2gKPiA+IGluZGV4IDU2MWZjYzJlNWUuLjIwNmQ3ZDE1YWYgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNr
YWdlL3dpcmVwbHVtYmVyL3dpcmVwbHVtYmVyLmhhc2gKPiA+ICsrKyBiL3BhY2thZ2Uvd2lyZXBs
dW1iZXIvd2lyZXBsdW1iZXIuaGFzaAo+ID4gQEAgLTEsMyArMSwzIEBACj4gPiAgICMgTG9jYWxs
eSBjYWxjdWxhdGVkCj4gPiAtc2hhMjU2ICA0MWYxNzRlYWFlNWE2MzBlMTk1MDAxZmRkNTgwOTE4
ZmE1MTQzYTcxZWRjZWIwNTBiMzIwZjg1YThlNjVlNTNiICB3aXJlcGx1bWJlci0wLjQuMi50YXIu
YnoyCj4gPiArc2hhMjU2ICA2NDI5ZThhOTVlMzU1Y2UyMWI0YzRmMWE1ZWJjNzY5ZjAzN2U4ZGJl
ZWM1MTkwNWFkOTA5Y2U2MDlhMzhkMGNlICB3aXJlcGx1bWJlci0wLjQuOC50YXIuYnoyCj4gPiAg
IHNoYTI1NiAgZmYyZWI5YWY1YjA1ZDkyYWMzYTM4Y2ZmY2FkMjc1ODJlZjU1NWEzMWZmMTc4MWUx
YzFkNGUwODdmNzdjOWM4MSAgTElDRU5TRQo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2lyZXBs
dW1iZXIvd2lyZXBsdW1iZXIubWsgYi9wYWNrYWdlL3dpcmVwbHVtYmVyL3dpcmVwbHVtYmVyLm1r
Cj4gPiBpbmRleCAyZGFiNjA0MmVhLi4zYmY3Y2VjZTQ1IDEwMDY0NAo+ID4gLS0tIGEvcGFja2Fn
ZS93aXJlcGx1bWJlci93aXJlcGx1bWJlci5tawo+ID4gKysrIGIvcGFja2FnZS93aXJlcGx1bWJl
ci93aXJlcGx1bWJlci5tawo+ID4gQEAgLTQsNyArNCw3IEBACj4gPiAgICMKPiA+ICAgIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiA+ICAgCj4gPiAtV0lSRVBMVU1CRVJfVkVSU0lPTiA9IDAuNC4y
Cj4gPiArV0lSRVBMVU1CRVJfVkVSU0lPTiA9IDAuNC44Cj4gPiAgIFdJUkVQTFVNQkVSX1NPVVJD
RSA9IHdpcmVwbHVtYmVyLSQoV0lSRVBMVU1CRVJfVkVSU0lPTikudGFyLmJ6Mgo+ID4gICBXSVJF
UExVTUJFUl9TSVRFID0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BpcGV3aXJlL3dp
cmVwbHVtYmVyLy0vYXJjaGl2ZS8kKFdJUkVQTFVNQkVSX1ZFUlNJT04pCj4gPiAgIFdJUkVQTFVN
QkVSX0xJQ0VOU0UgPSBNSVQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
