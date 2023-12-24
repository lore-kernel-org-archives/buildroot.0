Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D259EC46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 15:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 496106079D;
	Sun, 24 Dec 2023 15:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 496106079D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fs0Bkq0prelK; Sun, 24 Dec 2023 15:23:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66EC260A68;
	Sun, 24 Dec 2023 15:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66EC260A68
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96F9A1BF275
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 15:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3715181CA0
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 15:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3715181CA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U0IuCGJ2Kw3Y for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 15:23:05 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2993481BFA
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 15:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2993481BFA
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id DAE53C15F3
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 15:23:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07C2540002;
 Sun, 24 Dec 2023 15:22:55 +0000 (UTC)
Date: Sun, 24 Dec 2023 16:22:54 +0100
To: Louis Chauvet <louis.chauvet@bootlin.com>
Message-ID: <20231224162254.589b395c@kmaincent-XPS-13-7390>
In-Reply-To: <20231206164437.22191-1-louis.chauvet@bootlin.com>
References: <20231206164437.22191-1-louis.chauvet@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703431376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=guN1Y6DzwH9cu6el/7+Z6hteS/EhGxFvBwYTTWESSgk=;
 b=D6pOAhJon3GuOLKVG0FudlyaCoAWIQbVCeTIwEkg+CO61MIjmM6Qu019cxEEPPkUOaLw+B
 vZl9w/sUs9uVPzwKn+VOLv+50feI36UyhYpKvVB+QJeTaKM3wWPKk5gXtTjPjd7+6ZATvA
 kfHp688j3Rv1cPvbbpp53dOVyI6th3iCGJYevDDXgZxNHRw53/MlQu2s0zHs6E5vXtFwfU
 r11KHzzCHSOO+6N6fVNLg84RCzdEQUHHxBdMUgS+cGZ4MjbYOX9drl2rJwDcGB0yrfWVfX
 bFZcoJc8JOtdJnPR9yqI9aQruMQkdamV86PeKXxL1pfp24ttHb2q9+3cCYR4bA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D6pOAhJo
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: fix the RPATH of
 fiptool
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
From: =?utf-8?q?K=C3=B6ry_Maincent_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Cc: thomas.petazzoni@bootlin.com, geomatsi@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTG91aXMsCgpPbiBXZWQsICA2IERlYyAyMDIzIDE3OjQ0OjM3ICswMTAwCkxvdWlzIENo
YXV2ZXQgPGxvdWlzLmNoYXV2ZXRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBUaGUgYXJtLXRydXN0
ZWQtZmlybXdhcmUgcGFja2FnZSBidWlsZHMgYSBob3N0IHRvb2wgY2FsbGVkICJmaXB0b29sIiwK
PiB3aGljaCBpcyB1c2VkIGR1cmluZyB0aGUgYnVpbGQgcHJvY2VzcyBvZiBhcm0tdHJ1c3RlZC1m
aXJtd2FyZQo+IGl0c2VsZi4gVGhpcyB0b29sIGxpbmtzIGFnYWluc3QgdGhlIE9wZW5TU0wgaG9z
dCBsaWJyYXJ5LCBhbmQKPiB0aGVyZWZvcmUgbmVlZHMgdG8gYmUgYnVpbHQgd2l0aCB0aGUgY29y
cmVjdCBSUEFUSCBwb2ludGluZyB0bwo+ICRIT1NUX0RJUi9saWIuCj4gCj4gVGhpcyBpcyB3aHkg
Y29tbWl0IGE5NTdkOWE5MGFkZTQxOTRkZmZlM2ViMmZjMDEzNmJjNWQwNzdjMjgKPiAoImJvb3Qv
YXJtLXRydXN0ZWQtZmlybXdhcmU6IGJ1aWxkIGZpcHRvb2wgc2VwYXJhdGVseSB3aXRoIGRlcGVu
ZGVuY3kKPiBvIG4gaG9zdC1vcGVuc3NsIikgYWRkZWQgdGhlIEFSTV9UUlVTVEVEX0ZJUk1XQVJF
X0JVSUxEX0ZJUFRPT0wKPiB2YXJpYWJsZSwgd2hpY2ggYnVpbGRzIHRoZSBmaXB0b29sIHRvb2wg
Zmlyc3QsIHdpdGggdGhlIHJpZ2h0Cj4gdmFyaWFibGVzIHNldCwgYmVmb3JlIGludm9raW5nIHRo
ZSBmdWxsIGJ1aWxkIG9mIFRGLUEuIFRoaXMgZW5zdXJlZAo+IHRoYXQgZmlwdG9vbCB3YXMgYnVp
bHQgd2l0aCB0aGUgY29ycmVjdCBSUEFUSC4KPiAKPiBIb3dldmVyLCBtb3JlIHJlY2VudCB2ZXJz
aW9ucyBvZiBURi1BIGhhdmUgbW9kaWZpZWQgdGhlaXIgTWFrZWZpbGUKPiBtYWNoaW5lcnksIGFu
ZCBmaXB0b29sIGlzIGJlaW5nIHJlYnVpbHQgZXZlbiBpZiBpdCB3YXMgYnVpbHQKPiBiZWZvcmUu
IFVuZm9ydHVuYXRlbHksIHRoaXMgcmVidWlsZCBpcyBubyBsb25nZXIgZG9uZSB3aXRoIHRoZSBy
aWdodAo+IGZsYWdzLCBzbyB3ZSBlbmQgdXAgd2l0aCBhIGZpcHRvb2wgYmluYXJ5IHRoYXQgbm8g
bG9uZ2VyIGhhcyB0aGUgcmlnaHQKPiBSUEFUSCwgYW5kIGZpcHRvb2wgZmFpbHMgdG8gZmluZCB0
aGUgT3BlblNTTCBsaWJyYXJpZXMgZnJvbQo+ICRIT1NUX0RJUi9saWIuCj4gCj4gSW4gb3JkZXIg
dG8gZml4IHRoaXMsIHdlIHRha2UgYSBkaWZmZXJlbnQgYXBwcm9hY2g6IHdlIGRvIG5vdCBidWls
ZAo+IGZpcHRvb2wgc2VwYXJhdGVseSBmaXJzdCwgYnV0IHdlIGluamVjdCB0aGUgbmVjZXNzYXJ5
IGZsYWdzIHRocm91Z2gKPiB0aGUgSE9TVENDIHZhcmlhYmxlLiBJbmRlZWQsIHRoZXJlJ3Mgbm8g
SE9TVF9MREZMQUdTIG9yIEhPU1RfTERMSUJTCj4gdmFyaWFibGUgb3Igc2ltaWxhciB0aGF0IHdv
dWxkIGFsbG93IHVzIHRvIHBhc3MgdGhlIC1XbCwtcnBhdGggZmxhZwo+IHRoYXQgaXMgbmVlZGVk
LiBTaG9lLWhvcm5pbmcgdGhpcyBmbGFnIGludG8gSE9TVENDIGdldHMgdGhlIGpvYiBkb25lLAo+
IGFuZCBhY3R1YWxseSBzaW1wbGlmaWVzIG91ciBhcm0tdHJ1c3RlZC1maXJtd2FyZS5tay4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBMb3VpcyBDaGF1dmV0IDxsb3Vpcy5jaGF1dmV0QGJvb3RsaW4uY29t
Pgo+IENvLWF1dGhvcmVkLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJv
b3RsaW4uY29tPgo+IC0tLQo+ICAuLi4vYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQt
ZmlybXdhcmUubWsgfCAxNiArKy0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKWW91ciBwYXRjaCBicmVha3MgdGhlIGJ1aWxk
IG9mIGZpcHRvb2wuCkl0IGNhbid0IGZpbmQgdGhlIGhvc3Qtb3BlbnNzbCBoZWFkZXJzIGFueW1v
cmUuCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBmaXB0b29sLmg6MTYsCiAgICAgICAgICAgICAgICAg
ZnJvbSBmaXB0b29sLmM6MTk6CmZpcHRvb2xfcGxhdGZvcm0uaDoxOToxMTogZmF0YWwgZXJyb3I6
IG9wZW5zc2wvc2hhLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKICAgMTkgfCAjIGluY2x1
ZGUgPG9wZW5zc2wvc2hhLmg+CgpUZXN0ZWQgd2l0aCB0aGUgbWFpbmxpbmUgb2N0YXZvX29zZDMy
bXAxX3JlZF9kZWZjb25maWcgYW5kCnNvbGlkcnVuX21hY2NoaWF0b2Jpbl9kZWZjb25maWcgb24g
YW4gVWJ1bnR1IDIwLjA0LiBJIHN1cHBvc2Ugb3RoZXIgY29uZmlncyB3aXRoCkZJUCBlbmFibGVk
IHdpbGwgaGF2ZSB0aGUgc2FtZSBlcnJvci4KCldlaXJkIHRoYXQgeW91IGRpZG4ndCBzZWUgdGhl
IGlzc3VlIGFzIHlvdSBzcGVjaWFsbHkgdGFja2xlZCB0aGUgb3BlbnNzbApkZXBlbmRlbmNpZXMu
CgpSZWdhcmRzLAotLSAKS8O2cnkgTWFpbmNlbnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IGtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
