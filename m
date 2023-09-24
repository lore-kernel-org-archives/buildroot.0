Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79913CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 18:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BBDC40743;
	Sun, 24 Sep 2023 18:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BBDC40743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0GSbSrA5ie3T; Sun, 24 Sep 2023 18:43:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D4AF40363;
	Sun, 24 Sep 2023 18:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D4AF40363
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 567C01BF337
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F8AD40A95
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F8AD40A95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j-gv-gPCz2rO for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 18:43:09 +0000 (UTC)
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC7CB40A15
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 18:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC7CB40A15
Received: from smtpclient.apple ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPA
 id kU4Oqj1yiE2jMkU4OqjbZA; Sun, 24 Sep 2023 20:43:04 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 24 Sep 2023 20:43:04 +0200
Message-Id: <2AA1D4B5-B3D5-4F74-8E47-E2F2B7430E83@benettiengineering.com>
References: <87o7hrjvv5.fsf@48ers.dk>
In-Reply-To: <87o7hrjvv5.fsf@48ers.dk>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailer: iPhone Mail (21A329)
X-CMAE-Envelope: MS4xfLm8cOlT3HDLtEwtwEJolxs13awpHTxmDXgef3meNUi1UqxchCPzmMvEFnze3yNCbkDu87sC2NSpWToNz5oD5IbsB2OGbucgGPh7+K7j9iJ8cPVRLGCn
 NNI00cUMJwGrkhBfVK3tbFfp0zRrS8W3ZUrrFlrBwS6WHSeYIpLZlPnPGrkKrJ38PapAb2kDP14sEwDu69pa2U8BS4qFU7MaZzkJHe4EQdOW/HkOBVCWPm/e
 2q3L74GuikW/9CrmlRDg9A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695580984; bh=BALfoPRs9odZmKr0GUJBHFZxb7EKNG1JsuRQMwAXBDU=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=aNE1l+so0sIRKTbstdYiFiWUGWygxSZqu9w7eFpl4h42BcWywAf51bmxJHKpLRU40
 o6FBTrLxf8AfnlFU7aHcX9a9F3QQDxUSgH4IQ1yN65F+x4SicDIzj76JLZ2OGCoJ3Q
 YVkXshCNZFAgmK4wnmTqUa4URowaAcWqY5w2HYFPOKh3NzEnkmRyL5oF1FMO8QdETS
 LhuUUW0rnrhbd/pxBYoNCZfPDB71xYLv2SIhhRG/zaUdJjNyBylK/1T++l5myouq0t
 ClWmb7TEtrH45JmrUrYj3NGjmr4Rne1xLjsVN2OEf0hrxCnGbZwA5EGtQDcIlSVun+
 j9pQEAbrZLnDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=aNE1l+so
Subject: Re: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: bump to
 version 2023-07-23
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgo+IElsIGdpb3JubyAyNCBzZXQgMjAyMywgYWxsZSBvcmUgMTk6NTksIFBldGVy
IEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gaGEgc2NyaXR0bzoKPiAKPiDvu78KPj4g
Cj4+Pj4+PiAiR2l1bGlvIiA9PSBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0
aWVuZ2luZWVyaW5nLmNvbT4gd3JpdGVzOgo+IAo+PiBUaGlzIHZlcnNpb24gZml4IGJ1aWxkIGZh
aWx1cmUgb24gTGludXggdmVyc2lvbiA8IDUuMTUuCj4gCj4gV2hlbiB3YXMgdGhpcyBmYWlsdXJl
IGludHJvZHVjZWQ/IFBlcmhhcHMgYnkgY29tbWl0IDhkNmRkYjdhMgo+IChwYWNrYWdlL3J0bDg4
MTItYWlyY3JhY2stbmc6IGJ1bXAgdG8gMjAyMy0wNS0wMSB2ZXJzaW9uIHRvIGZpeCBidWlsZAo+
IGZhaWx1cmUgd2l0aCBMaW51eCA2LjMpPyBJIGRpZG4ndCByaWdodCBhd2F5IGZpbmQgYW55IGF1
dG9idWlsZGVyCj4gZmFpbHVyZXMgZm9yIDIwMjMuMDIueCwgc28gSSBkaWRuJ3QgYnVtcCB0aGUg
dmVyc2lvbiB0aGVyZS4KCkl04oCZcyBiYXNlZCBvbiBjb21taXQgbG9ncyBvZiB0aGUgZHJpdmVy
IHJlcG9zaXRvcnkuClRoZXJlIGlzIGEgY29tbWl0IHRoYXQgcG9pbnRzIHRoYXQgaXQgZml4ZXMg
YnVpbGQgZmFpbHVyZSBvbiBMaW51eCA1LjE1IGJ1dCB0aGVyZSBoYXZlIGJlZW4gbm8gYXV0b2J1
aWxkZXIgZmFpbHVyZXMuCgpCZXN0IHJlZ2FyZHMKR2l1bGlvCgo+IAo+IENvbW1pdHRlZCB0byAy
MDIzLjA1LnggYW5kIDIwMjMuMDgueCwgdGhhbmtzLgo+IAo+IC0tCj4gQnllLCBQZXRlciBLb3Jz
Z2FhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
