Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82857CE79AC
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 08:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18503612D9;
	Wed, 20 Sep 2023 08:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18503612D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ler9inIuqsTr; Wed, 20 Sep 2023 08:37:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6529A60F2C;
	Wed, 20 Sep 2023 08:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6529A60F2C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7DC3E1BF475
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 08:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63DA2404F9
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 08:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63DA2404F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lQCmoLkxQffj for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 08:37:26 +0000 (UTC)
X-Greylist: delayed 476 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 20 Sep 2023 08:37:25 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3A3540108
Received: from ibeerc.linenoise.info (ibeerc.linenoise.info [130.61.186.89])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3A3540108
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 08:37:25 +0000 (UTC)
Received: from [192.168.2.3] (unknown [109.227.157.234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by ibeerc.linenoise.info (Postfix) with ESMTPSA id A6CBF20073
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 10:29:25 +0200 (CEST)
Message-ID: <80626c1241b95842495fb1c36196e849776d7159.camel@linenoise.info>
From: =?ISO-8859-1?Q?=C1lvaro?= "G. M." <alvaro@linenoise.info>
To: buildroot@buildroot.org
Date: Wed, 20 Sep 2023 10:29:24 +0200
User-Agent: Evolution 3.48.4-1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=linenoise.info; s=ibeerc; t=1695198565;
 bh=vm5baJpkNntODyccZMRDXJ8VdQ8mZnw8eadrY8KIA5w=;
 h=Subject:From:To:Date:From;
 b=YaTtu8dHtglJd+f0qg9Y6A2IM03TE+9U5EsA3O6hw7CyMzWcV2Wqm/cDfDuOLWT5G
 UeEkFQL4uz/8n9PjiDIhm6w1FhJr39xL8/9BeY4HCacDX22AHKFS7AQtzXGMZRV6mz
 zhd/kMYFWjz1cSBQ/YT0TGUpJBQ10quyPVOHBzKcl8sQLYselLAVQqm3phpyWBVUAL
 p9TepWRsN3a4xZq8z7ddnOm7L6FrsfH+uvOn3VuOB2Y7ebrytuO6d3+o+PhAX32bSb
 2UsqNN1vKhtBoc9pfg82KDuEcopx8o/iCVKI9gAA17x6fU2jr4Yasyfk1C1c+LnCpe
 juhmLJLK5II2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linenoise.info header.i=@linenoise.info
 header.a=rsa-sha256 header.s=ibeerc header.b=YaTtu8dH
Subject: [Buildroot] Error while compiling new package fakechroot: multiple
 definition of `fopen64'
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkhCgpJJ20gdHJ5aW5nIHRvIGNyZWF0ZSBhIG5ldyBwYWNrYWdlIGZvciAnZmFrZWNocm9vdCcg
YXBwbGljYXRpb24uIFRoZQp3YXkgaXQgd29ya3MgaXMgYnkgY3JlYXRpbmcgYSBsaWJyYXJ5IHRo
YXQgd2lsbCBiZSBwcmVsb2FkZWQgdmlhIG1lYW5zCm9mIExEX1BSRUxPQUQgYW5kIGl0IHN1YnN0
aXR1dGVzIGEgbG90IG9mIGxpYnJhcnkgY2FsbHMgd2l0aCBpdHMgb3duCnZlcnNpb24gdGhhdCBt
b2RpZmllcyBwYXRocyBzbyBpdCBjYW4gcmVwbGljYXRlIGEga2luZCBvZiBjaHJvb3QKZW52aXJv
bm1lbnQgZm9yIGEgbm9uIHJvb3QgdXNlci4KCkFtb25nIHRoZSBmdW5jdGlvbnMgaXQgcmVwbGFj
ZXMgYXJlIHRoZSAqNjQgZmFtaWx5OiBmb3BlbjY0LApmcmVvcGVuNjQsIGZ0czY0X29wZW4sIGZ0
dzY0LCBhbmQgc2V2ZXJhbCBtb3JlLiBUaGUgLm1rIGZpbGUgSSBjcmVhdGVkCmlzIHF1aXRlIGVt
cHR5IGJlY2F1c2UgaXQncyBzaW1wbHkgYW4gYXV0b3Rvb2xzIHBhY2thZ2UsIHNvIGl0IGp1c3QK
Y2FsbHMgJChldmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKSBhbmQgSSd2ZSBhbHNvIGFkZGVkIHRo
ZSBob3N0CnZlcnNpb24sIGJlY2F1c2UgdGhpcyB1dGlsaXR5IGNhbiBiZSBxdWl0ZSB1c2VmdWwg
dG8gdGVzdCB0aGUgLnRhci5negppbWFnZXMgYXMgYSB1c2VyIGluc2lkZSBhIGZha2UgY2hyb290
IGVudmlyb25tZW50LgoKU28sIHdoZW4gY29tcGlsaW5nIHRoZSBob3N0IHZlcnNpb24gaW4gbXkg
NjQgYml0IG1hY2hpbmUsIGl0IGJ1aWxkcwpzdWNjZXNzZnVsbHksIGJ1dCB3aGVuIEkgYnVpbGQg
aXQgZm9yIHRoZSB0YXJnZXQgd2hpY2ggaW4gdGhpcyBjYXNlIGlzCmFuIDMyIGJpdCBpNjg2IGFy
Y2hpdGVjdHVyZSwgaXQgZmFpbHMgd2l0aCB0aGUgZm9sbG93aW5nIGJ1bmNoIG9mCmVycm9yczoK
Ci9ob21lL3NzbGF5ZXIvUHJveWVjdG9zL0FSVC9hcnQtbmV0Ym94LWNhcHR1cmUuZ2l0L0FOQy9v
dXRwdXQvaG9zdC9vcHQvZXh0LXRvb2xjaGFpbi9iaW4vLi4vbGliL2djYy9pNjg2LWJ1aWxkcm9v
dC1saW51eC1nbnUvMTIuMy4wLy4uLy4uLy4uLy4uL2k2ODYtYnVpbGRyb290LWxpbnV4LWdudS9i
aW4vbGQ6IC5saWJzL2ZvcGVuNjQubzogaW4KZnVuY3Rpb24gYGZvcGVuNjQnOgpmb3BlbjY0LmM6
KC50ZXh0KzB4MCk6IG11bHRpcGxlIGRlZmluaXRpb24gb2YgYGZvcGVuNjQnOyAubGlicy9mb3Bl
bi5vOmZvcGVuLmM6KC50ZXh0KzB4MCk6IGZpcnN0IGRlZmluZWQgaGVyZQovaG9tZS9zc2xheWVy
L1Byb3llY3Rvcy9BUlQvYXJ0LW5ldGJveC1jYXB0dXJlLmdpdC9BTkMvb3V0cHV0L2hvc3Qvb3B0
L2V4dC10b29sY2hhaW4vYmluLy4uL2xpYi9nY2MvaTY4Ni1idWlsZHJvb3QtbGludXgtZ251LzEy
LjMuMC8uLi8uLi8uLi8uLi9pNjg2LWJ1aWxkcm9vdC1saW51eC1nbnUvYmluL2xkOiAubGlicy9m
cmVvcGVuNjQubzogaW4KZnVuY3Rpb24gYGZyZW9wZW42NCc6CmZyZW9wZW42NC5jOigudGV4dCsw
eDApOiBtdWx0aXBsZSBkZWZpbml0aW9uIG9mIGBmcmVvcGVuNjQnOyAubGlicy9mcmVvcGVuLm86
ZnJlb3Blbi5jOigudGV4dCsweDApOiBmaXJzdCBkZWZpbmVkIGhlcmUKL2hvbWUvc3NsYXllci9Q
cm95ZWN0b3MvQVJUL2FydC1uZXRib3gtY2FwdHVyZS5naXQvQU5DL291dHB1dC9ob3N0L29wdC9l
eHQtdG9vbGNoYWluL2Jpbi8uLi9saWIvZ2NjL2k2ODYtYnVpbGRyb290LWxpbnV4LWdudS8xMi4z
LjAvLi4vLi4vLi4vLi4vaTY4Ni1idWlsZHJvb3QtbGludXgtZ251L2Jpbi9sZDogLmxpYnMvZnRz
NjQubzogaW4KZnVuY3Rpb24gYGZ0czY0X29wZW4nOgpmdHM2NC5jOigudGV4dCsweGUxMCk6IG11
bHRpcGxlIGRlZmluaXRpb24gb2YgYGZ0czY0X29wZW4nOyAubGlicy9mdHMubzpmdHMuYzooLnRl
eHQrMHhlMTApOiBmaXJzdCBkZWZpbmVkIGhlcmUKL2hvbWUvc3NsYXllci9Qcm95ZWN0b3MvQVJU
L2FydC1uZXRib3gtY2FwdHVyZS5naXQvQU5DL291dHB1dC9ob3N0L29wdC9leHQtdG9vbGNoYWlu
L2Jpbi8uLi9saWIvZ2NjL2k2ODYtYnVpbGRyb290LWxpbnV4LWdudS8xMi4zLjAvLi4vLi4vLi4v
Li4vaTY4Ni1idWlsZHJvb3QtbGludXgtZ251L2Jpbi9sZDogLmxpYnMvZnRzNjQubzogaW4KZnVu
Y3Rpb24gYGZ0czY0X2Nsb3NlJzoKCkknbSBub3Qgc3VyZSB3aGF0J3MgZ29pbmcgb24gaGVyZSwg
YXMgdGhlIHdheSBmYWtlY2hyb290IGlzIHdyaXR0ZW4KaXMgaGVhdmlseSBiYXNlZCBvbiBtYWNy
b3MgKHdoaWNoIEkgZnVsbHkgdW5kZXJzdGFuZCwgYXMgaXQncyBtb3N0bHkKYm9pbGVycGxhdGUg
ZXZlcnl3aGVyZSksIGFuZCBwcm9iYWJseSB0aGUgY2F1c2Ugb2YgdGhpcyBpcyBvbiB0aGUgYXV0
b3Rvb2xzCm5vdCBmaW5kaW5nIHRoZSBwcm9wZXIgdmVyc2lvbiBvZiB0aGUgZnVuY3Rpb25zIHRo
YXQgYXJlIChvciBhcmVuJ3QgYXZhaWxhYmxlKSwKYnV0IEknbSBhdCBhIGxvc3MgcmlnaHQgbm93
IGFuZCBtYXliZSBzb21lIG9mIHlvdSBoYXZlIGV4cGVyaWVuY2Ugd2l0aCB0aGlzLgoKSSdsbCBh
cHByZWNpYXRlIGFueSBjb21tZW50cywgdGhhbmtzIQoKLS0gCsOBbHZhcm8gRy4gTS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
