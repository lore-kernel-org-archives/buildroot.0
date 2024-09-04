Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD52CD3431
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 12:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0782A400FF;
	Wed,  4 Sep 2024 12:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbTSb1Btr88Y; Wed,  4 Sep 2024 12:04:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD7564010F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD7564010F;
	Wed,  4 Sep 2024 12:04:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F15F1BF47A
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BB184025E
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpJQA7UAiWE0 for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 12:04:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D28940129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D28940129
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D28940129
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 12:04:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([176.5.9.176]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOA3F-1sNpq10NnV-00OUVO; Wed, 04
 Sep 2024 14:04:04 +0200
Date: Wed, 4 Sep 2024 14:04:02 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <ZthMslmRa2q2EA5R@probook>
References: <20240901-rgbmatrix-v2-0-3a10c3c367e4@gmx.net>
 <20240901-rgbmatrix-v2-2-3a10c3c367e4@gmx.net>
 <ZteDUZoQYrmvwS8A@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZteDUZoQYrmvwS8A@landeda>
X-Provags-ID: V03:K1:QqHXP3on6p4rdHJusCHANZIzhuqkioM4jga5JWco3fBmaxD9Yy7
 HtL6CmvVPi1isgCBF9gfzSWAuyGNccyRiBdz3gebiWtAJvKDsIujRxd0WCbqXKH/YIqUB0X
 BtlS/NUpPXgKJGkJPJ++zYk0OTmQvnTsfscP9tcI3JTQS0lbACU0lPmBRXrT26tLbvLZNhN
 2oR+BYGfYR4Ozl3SLZl1A==
UI-OutboundReport: notjunk:1;M01:P0:FXEDwCU1sYQ=;gp/1ciJpdjpO1dr2RkRcsszpBXc
 NpIVrcu0PFFJ2AOXsxMzn4bPG4hDFsgzTKCDqoIx8QfBuz9pa7XrNw9eRChfpLviBrO7XvX4d
 Q0MVUt6EYrmvzvXSFFYopWW1bHhGLXybWY2FD/jIboze2klhBtGC6V57NtNagpe+1GcgJMP9+
 V42d0Ne1yOIGhy5L7W79WhToBn2YGR8sOUKr6IFePDwFDHVcVIi6MPhAMcJzVdYHcymxY9B9d
 UIt2XbNI/4B+5rYs3tIhjOxSFJvhAQfM/CAcwk/0jh/wPAPuLBw/Z+VAsHT5a/aoEBub1tZXv
 w0g3ZqLviUq4GIjkZuoze2y2Y+UTt6Em1KVtxoJNiYVQPhxZRnpSABKI36EpkZuT23AGOYZ3e
 RGwBwJCBOnO8j6ND9sYGUo+LO5oMGknPvcAo+TWlb8dLWCFqfKMyCdaDbHY59A42OF3+bzakY
 RNho3KH1rVBFmx1SfJlKao80Yqd/NoRt21i/cUAeEiR2/b3pwgaN/l0c7BJIa5Z6DN8B8+DNW
 Dn8NPFJV9Frdtf9rZzMveY5c06LABHnPlouM8VJO1lOSWBRljVDm5k0lrIcynTH7GYABS+gyz
 xwnrSUqMM0PQcLIVY5xFxpa7TbV682CQ6BMjbQpx/IjjH6XaZRp7JyLRKjIrT7A9tLm+XzfB1
 aHNXcIC39FKpk1t8sIsxEACaV/MWpy/mEaPBTTkrQuNr4dkHPTsKTkSBKHi99rgBMto2w/iWq
 pebSRdQvTM7kNSlEtOOobsFecDzXx9mntiP7Rd0PRFkduFqTTdKsYJIZwYn8Jo2m/+P6aq17m
 2Cv93dYpxglFT1x8Q+P+9Vlw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1725451444; x=1726056244; i=j.neuschaefer@gmx.net;
 bh=UynXRegCXFOlPt4PTkqNPFL1SI2Jr73HQCnHTDkq1wY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=RZMY+T/PMOhqodTS/R40Bm8IOK1qpWihYQ+5SatYIY4+Ho0bf2O+v8a9qtzajMys
 mz4s2+g1sZ8JJG28vUhXOt39RGQMRGyPhJ8/KcVLPWiHKNsHdkTKrX7EO7CCXKj4P
 8UIHUBF051f/tZRpFC3dByND11wL0IlynzcoehOy/OhcpsJ9p2ojF4L9OcaTEMcE4
 pm7n+CxADvwKjR388AVO4EF4kGHeZQQ93dxBMslEGTHTef+h+nRkFDPz2Ha4xeDEr
 k7tG8AF78GKHOMOO1kww/PaYJurShs2cUB4jl8QMJ0BAOtbNtUbL05QOdxQYdJUeB
 /KEyi8DSH2lvPb6R4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=RZMY+T/P
Subject: Re: [Buildroot] [PATCH v2 2/3] package/python-rgbmatrix: new package
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBTZXAgMDMsIDIwMjQgYXQgMTE6NDQ6NDlQTSArMDIwMCwgWWFubiBFLiBNT1JJTiB3
cm90ZToKPiBKLiwgQWxsLAo+Cj4gT24gMjAyNC0wOS0wMSAxNjoyOSArMDIwMCwgSi4gTmV1c2No
w6RmZXIgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gPiBUaGUgInJnYm1hdHJpeCIgcHl0
aG9uIG1vZHVsZSBpcyB0aGUgUHl0aG9uIGJpbmRpbmcgZm9yCj4gPiBycGktcmdiLWxlZC1tYXRy
aXgsIGJ1aWx0IGZyb20gdGhlIHNhbWUgc291cmNlIHJlcG9zaXRvcnkuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KPgo+IEkgZGlk
IGEgZmV3IGNoYW5nZXM6Cj4KPiAgIC0gYWRkIGNvbW1lbnQgZm9yIHByb3BhZ2F0ZWQgZGVwZW5k
ZW5jaWVzCj4gICAtIGFkZCBjb21tZW50IG9uIG1pc3NpbmcgZGVwZW5kZW5jaWVzCj4gICAtIGRy
b3AgY29tbWVudCBhdCBlbmQgb2YgX1ZFUlNJT04gbGluZQo+Cj4gQXBwbGllZCB0byBuZXh0LCB0
aGFua3MuCgpUaGFua3MgZm9yIHRha2luZyBjYXJlIG9mIHRoZXNlIHRoaW5ncyEKCi0tIGpuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
