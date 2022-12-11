Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0BCC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 14:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04D6A4052F;
	Sun, 11 Dec 2022 14:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04D6A4052F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2fZTlU-kzySt; Sun, 11 Dec 2022 14:03:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26E574026A;
	Sun, 11 Dec 2022 14:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26E574026A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9044D1BF2F0
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 14:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7922E4026A
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 14:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7922E4026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wrbU9a3Kc6fM for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 14:03:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3731A40135
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3731A40135
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 14:03:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c8de:37ee:6661:285c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 449F113F8CC;
 Sun, 11 Dec 2022 15:03:27 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Dec 2022 15:03:26 +0100
Date: Sun, 11 Dec 2022 15:03:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Etienne Carriere <etienne.carriere@linaro.org>
Message-ID: <20221211140326.GO1044805@scaer>
References: <20221209075104.1168297-1-etienne.carriere@linaro.org>
 <20221209075104.1168297-3-etienne.carriere@linaro.org>
 <20221210101150.GS2855@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221210101150.GS2855@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670767410;
 bh=zXP4OlCZob2V6EBNqYaoVdRx21B1uhOKGEq+mBBLjwA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jBOmktJ1EUT8Ms/yZfn4CaXrvia3glSa4X99eKuDpj2CQiDG+6Gl+UAgiOBiLQO4e
 tVRWCLApGdmG4Kqy29niwrjSlAYu+9z87ZVZyRfllDVtUaLNsnAi6+Dmu9k/oFQBJf
 QQBIqmWdmpB4GWjE2yqfQd4Wvr3fOLzLww+CJ+7Cpo1mhBTi8vqw4GP7D7OMzz4i0g
 pcy67XuAOQcCxbpza3f8dyu0v//+Baf6xvv5KV5ODeVD55yeuUzl7W48wPZ6JkxHPV
 lZhUTiEDhy9t14bfytlF/Y43N8OT8JUS8FQnEZSqLzuIh3RaZ1fflj4ANF+/P67m3K
 +/UFfxIBr+gLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jBOmktJ1
Subject: Re: [Buildroot] [PATCH v2 3/5] package/optee-client: bump to
 version 3.19.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

w4l0aWVubmUsIEFsbCwKCk9uIDIwMjItMTItMTAgMTE6MTEgKzAxMDAsIFlhbm4gRS4gTU9SSU4g
c3Bha2UgdGh1c2x5Ogo+IE9uIDIwMjItMTItMDkgMDg6NTEgKzAxMDAsIEV0aWVubmUgQ2Fycmll
cmUgc3Bha2UgdGh1c2x5Ogo+ID4gQnVtcHMgT1AtVEVFIGNsaWVudCBwYWNrYWdlIHZlcnNpb24g
dG8gT1AtVEVFIHJlbGVhc2UgMy4xOS4wLgpbLS1TTklQLS1dCj4gPiAraWZlcSAoJChCUjJfUEFD
S0FHRV9PUFRFRV9DTElFTlRfVEVFQUNMKSx5KQo+ID4gK09QVEVFX0NMSUVOVF9FWFRfREVQRU5E
RU5DSUVTID0gaG9zdC1wa2djb25mIHV0aWwtbGludXgtbGlicwoKSSBtaXNzZWQgY2hhbmdpbmcg
dGhlIGRlcGVuZGVuY3kgdG8gdXRpbC1saW51eCBoZXJlLCBhcyBub3RpY2VkIGJ5ClRob21hcywg
c28gSSBqdXN0IHB1c2hlZCBhIGZvbGxvdy11cCBjb21taXQgdG8gZml4IHRoYXQuCgpSZWdhcmRz
LApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4g
TU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBj
b25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAv
IENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAt
LS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5v
ICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJ
TCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
