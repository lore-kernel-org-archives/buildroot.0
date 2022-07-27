Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167E0C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B04482716;
	Wed, 27 Jul 2022 15:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B04482716
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OOa_m54cMgsA; Wed, 27 Jul 2022 15:04:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B43C181763;
	Wed, 27 Jul 2022 15:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B43C181763
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B37581BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B73C60B00
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B73C60B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qTgD1mOZW4qv for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:04:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58FCE60B30
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58FCE60B30
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:04:24 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id AE2BF240026
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 17:04:21 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4LtH9w6fGrz9rxQ;
 Wed, 27 Jul 2022 17:04:20 +0200 (CEST)
Date: Wed, 27 Jul 2022 15:04:18 +0000
Message-ID: <98262979-2921-499d-8e91-cf90f2da2001@email.android.com>
X-Android-Message-ID: <98262979-2921-499d-8e91-cf90f2da2001@email.android.com>
In-Reply-To: <20220727153827.6a926131@windsurf>
From: Dominik Rauh <dmrauh@posteo.de>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Importance: Normal
X-Priority: 3
X-MSMail-Priority: Normal
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.de; s=2017; 
 t=1658934261; bh=Zn+U1Lc2ePcAfmd4tfxVc2COJIbOLXnljVaWHaKsepo=;
 h=Date:Subject:From:To:Cc:From;
 b=egdeHdnuU30NPwajrY9WI18Ek2Te0CxZ5ZxbG5FTMt2l0yTv8knZxE7caryTpJScE
 bU/9Gim/mkRkOYJS3HfEQbIv4KhTIzLlGIocVLnQCxqQSy5BJE4cJb28tCzYOL2ES0
 6fc8/1TGtO4Nv7eoPrBaSPGKfU0OHkoMCbmzLp21s/9dNk2LZstrBdApHp1r8G3eut
 GETtM8rCf2QlRHXdMfOFpKTIhrqBRFwOOttwBOKA+ACIbWofNnQKAX6rv+6/Qh0usI
 OaZUEoad//8j8KlwBDh1/P6Vf0Pi6elEYjOv75KZ0pv/FrJYi202kDCeA1ONyMlc/e
 RktPiYdTNvQuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de
 header.a=rsa-sha256 header.s=2017 header.b=egdeHdnu
Subject: Re: [Buildroot] [PATCH v5] package/gdal: new package
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
Content-Type: multipart/mixed; boundary="===============7955415241929383929=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7955415241929383929==
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9J2F1dG8nPjxkaXY+SGkgVGhvbWFzLDwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+
PC9kaXY+PGRpdiBkaXI9ImF1dG8iPlRoYW5rcyE8L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwv
ZGl2PjxkaXYgZGlyPSJhdXRvIj5UaGlzIHdhcyBxdWl0ZSB0aGUgZXhwZXJpZW5jZSBpbmRlZWQg
Oik8L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5CZXN0IHJl
Z2FyZHMsPC9kaXY+PGRpdiBkaXI9ImF1dG8iPkRvbWluaWs8YnI+PGRpdiBkaXI9ImF1dG8iPjxi
cj48ZGl2IGNsYXNzPSJlbGlkZWQtdGV4dCI+T24gMjcgSnVsIDIwMjIgMTU6MzgsIFRob21hcyBQ
ZXRhenpvbmkgJmx0O3Rob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20mZ3Q7IHdyb3RlOjxiciB0
eXBlPSJhdHRyaWJ1dGlvbiI+PGJsb2NrcXVvdGUgc3R5bGU9Im1hcmdpbjowIDAgMCAwLjhleDti
b3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48cCBkaXI9Imx0ciI+
SGVsbG8gRG9taW5paywKPGJyPgoKPGJyPgpPbiBTYXQsJm5ic3A7IDcgTWF5IDIwMjIgMDk6NDY6
NTAgKzAwMDAKPGJyPgpEb21pbmlrIE1pY2hhZWwgUmF1aCAmbHQ7ZG1yYXVoQHBvc3Rlby5kZSZn
dDsgd3JvdGU6Cjxicj4KCjxicj4KJmd0OyBHREFMIGlzIGEgdHJhbnNsYXRvciBsaWJyYXJ5IGZv
ciByYXN0ZXIgYW5kIHZlY3RvciBnZW9zcGF0aWFsIGRhdGEKPGJyPgomZ3Q7IGZvcm1hdHMuIEFz
IGEgbGlicmFyeSwgaXQgcHJlc2VudHMgYSBzaW5nbGUgcmFzdGVyIGFic3RyYWN0IGRhdGEgbW9k
ZWwKPGJyPgomZ3Q7IGFuZCBzaW5nbGUgdmVjdG9yIGFic3RyYWN0IGRhdGEgbW9kZWwgdG8gdGhl
IGNhbGxpbmcgYXBwbGljYXRpb24gZm9yIGFsbAo8YnI+CiZndDsgc3VwcG9ydGVkIGZvcm1hdHMu
IEl0IGFsc28gY29tZXMgd2l0aCBhIHZhcmlldHkgb2YgdXNlZnVsIGNvbW1hbmQgbGluZQo8YnI+
CiZndDsgdXRpbGl0aWVzIGZvciBkYXRhIHRyYW5zbGF0aW9uIGFuZCBwcm9jZXNzaW5nLgo8YnI+
CiZndDsgCjxicj4KJmd0OyBodHRwczovL2dkYWwub3JnLwo8YnI+CiZndDsgCjxicj4KJmd0OyB0
ZXN0LXBrZyBzaG93cyB0aGF0IHRoaXMgcGFja2FnZSBpcyBhZmZlY3RlZCBieSBiaW51dGlscyBi
dWcgMjc1OTcuCjxicj4KJmd0OyAKPGJyPgomZ3Q7IFNpZ25lZC1vZmYtYnk6IERvbWluaWsgTWlj
aGFlbCBSYXVoICZsdDtkbXJhdWhAcG9zdGVvLmRlJmd0Owo8YnI+Cgo8YnI+CkJlbGlldmUgaXQg
b3Igbm90LCBidXQgd2UgZmluYWxseSBhcHBsaWVkIHlvdXIgcGF0Y2ghIEkgaGFkIHRvIGRvIGEg
ZmV3Cjxicj4KY2hhbmdlczoKPGJyPgoKPGJyPgogLSBBZGRpdGlvbiBvZiBhbiBlbnRyeSB0byB0
aGUgREVWRUxPUEVSUyBmaWxlCjxicj4KCjxicj4KIC0gUmVtb3ZhbCBvZiBQUk9WRU5BTkNFLlRY
VCBhcyBhIGxpY2Vuc2UgZmlsZSwgYW5kIHNpbXBsaWZpY2F0aW9uIG9mCjxicj4KJm5ic3A7Jm5i
c3A7IHRoZSBsaWNlbnNlIHZhcmlhYmxlIHRvIGp1c3QgIk1JVCwgbWFueSBvdGhlcnMiIGFzIHRo
ZSBsaWNlbnNpbmcKPGJyPgombmJzcDsmbmJzcDsgc2l0dWF0aW9uIG9mIEdEQUwgaXMgdmVyeSBj
b21wbGljYXRlZC4KPGJyPgoKPGJyPgogLSBVc2UgR0RBTF9DT05GX09QVFMgPSAoYW5kIG5vdCAr
PSkgdG8gZGVmaW5lIGFsbCB1bmNvbmRpdGlvbmFsCjxicj4KJm5ic3A7Jm5ic3A7IG9wdGlvbnMs
IGFuZCBkbyB0aGF0IGJlZm9yZSB0aGUgY29uZGl0aW9uYWwgZmVhdHVyZXMuCjxicj4KCjxicj4K
IC0gUmVtb3ZhbCBvZiB0aGUgcG9zdGdpcyBjaGFuZ2UgZm9yIGdkYWwgc3VwcG9ydCwgd2hpY2gg
SSBoYXZlIG1vdmVkCjxicj4KJm5ic3A7Jm5ic3A7IHRvIGEgc2VwYXJhdGUgY29tbWl0LiBJdCBh
bHNvIHJlcXVpcmVkIGFuIGV4dHJhIHBhdGNoIHRvIFBvc3RHSVMgdG8KPGJyPgombmJzcDsmbmJz
cDsgYnVpbGQgcHJvcGVybHkuCjxicj4KCjxicj4KIC0gQnVtcCB0byB0aGUgbGF0ZXN0IHZlcnNp
b24gb2YgZ2RhbC4KPGJyPgoKPGJyPgpZb3UgY2FuIHNlZSB0aGUgZmluYWwgMyBjb21taXRzIGF0
Ogo8YnI+Cgo8YnI+CiZuYnNwOyBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9jb21taXQvZDQ4YWY3MDc3MzdlY2U2MjQyZDU4ZTgzYjk4ZTVjNjAxZmE1NWFjYwo8
YnI+CiZuYnNwOyBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9j
b21taXQvMWU2NGZhMjk1NjE3MWNkYzlkNmU2Yzg4OTZiNGI1ODljZTU3MzUxMwo8YnI+CiZuYnNw
OyBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvYjlh
MzhhNDJhYzgxN2I5NjNiZTJiNGI1MWQyMThjNWVhYmIxMDU5ZAo8YnI+Cgo8YnI+CkJlc3QgcmVn
YXJkcywKPGJyPgoKPGJyPgpUaG9tYXMKPGJyPgotLSAKPGJyPgpUaG9tYXMgUGV0YXp6b25pLCBD
VE8sIEJvb3RsaW4KPGJyPgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCjxi
cj4KaHR0cHM6Ly9ib290bGluLmNvbQo8YnI+CjwvcD4KPC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48
L2Rpdj48L2Rpdj48L2Rpdj4=


--===============7955415241929383929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7955415241929383929==--
