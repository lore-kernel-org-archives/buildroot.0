Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB86CC83F37
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 19:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DA0D61366;
	Thu, 31 Aug 2023 19:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DA0D61366
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zLxaJ5BXstQH; Thu, 31 Aug 2023 19:52:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9609561321;
	Thu, 31 Aug 2023 19:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9609561321
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73D5F1BF295
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 19:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D8C0408D1
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 19:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D8C0408D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VuszVVB9FaV1 for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 19:52:31 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE68240278
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 19:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE68240278
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([89.144.220.251]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mwfai-1pj9ec0PIQ-00y6tz; Thu, 31
 Aug 2023 21:52:24 +0200
Message-ID: <00d15b88-0d94-491e-800c-c36f4a3ddbe7@gmx.at>
Date: Thu, 31 Aug 2023 21:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20230812192842.135682-1-dalang@gmx.at>
 <20230812192842.135682-3-dalang@gmx.at>
 <4c576534-7bd0-d1c4-61f3-a84821da3825@mind.be>
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <4c576534-7bd0-d1c4-61f3-a84821da3825@mind.be>
X-Provags-ID: V03:K1:lYV0d4ZptKkJ+S3mk8GyfrJylCi4GvIgC9CQIolSo26yBNB0KwD
 cN75RSzLV6NuTjH5I/mtQsxhLpC6dlTmvJDr6666ZIS5t/LYPEt0ooLEJsDh6QVMOAK3+w1
 d4wRxVqMkUA9Y6Y+2qwZBy1qIpk72q6nqiW/je0WYpEogJWJiky8NBc9gYhG/5cFSgib/Yi
 5JON3Se2SwOs006zeeXgQ==
UI-OutboundReport: notjunk:1;M01:P0:EaB0+LN6+jQ=;rCq16lW0MZRQSZcyli8im8ibOJc
 H6Eqy59f/DIsMv4kIBS4wsokzRu++O/HBi412E7iq4l7I3sMPjIm7qwCcO7iiHzgkfn4yKP83
 Edt8w06MHREU9/GWRFl/RAIDLbuyYXgrnu8ARVJMnt6cAKhAn1v+IKoFjK7TO3meDaR/RGEyF
 bQHstudhpP791smPVO7Q+Jba8E2gB2L5V6swy21xhhHgITvNoOZMYxYbb+Pr802ukeQBtu1Kb
 y/z4uf+Xj/NPatID83fpuNT7p4VHfTb/cymsHIp73iZgQVzyL5nZhVKT9DCfViRQVR8lm+Bb+
 ZiJTKkBWoQS7MJn6jbmR6HaLWWwnUtZH7ctBgMubuJpeJ3v+yJML/g24ljATvJ4HaV/fRB+AG
 q9CL4qbgjoFdZOB/AXGo9Y18NOJzBAI+5gDsqhAgSF+w1dvvnuZ49kkqGtWWxTtCkA1Uo/UEa
 KQPH8lm/DIY9TBvPkVEUzyBFXyLyZkcLJ7LOKkRM4GPUMroy31q9yJ/ehomnd5n2AyoVuBb/a
 i7/7dyfTNE443xqMBsG8IYPZrsv4Dw0NVcC6nlfSGWAYUwLC+sN8vTgvY1H8n0xlIJE3khwrx
 XfbGvWg/n1hhDoXI3pcHi6oyVrfsFIl28x0o5pTQ7dQk/t1U7wr6OZ3txU/zGqZ+ySUdwv+Xi
 gObMYpRpVhoR+csi2/0z71GMG34kxI9WEIuLMA1+OMiRAJ9s6MibQwkiuBo0dznL1C5qPbo0v
 v6L4zHOTx+b3zzeWnBEFUTodmODh2D/2Ku1pkagS5BU2IvnnQpF4JimW9PtipL9ssI2Dl7vJ8
 ww8Ua7bwmrNp1Z3KqyWuVT4FssO/gNtMThvUpCg0Icja9yXkNK8+br4NRzkEmJuoN1N/r91Bj
 bC+w3A6O1tibCs+QI3OxVx3Ixvft5EfnHeAGH4+VM8CONhVf5M47INOCaqbW9ph+fRGunYmVl
 eh6yFs3ptI3EUJFGctyxY1BcQZ4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1693511544; x=1694116344; i=dalang@gmx.at;
 bh=wXf4vZMj5wJeoFfNgc8NAhEK+weePTW9zriO5qST2eI=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=VF04UQ95/8b7Vtw3rtAQuMehYapVFwD7C3LXBDxLNt/NL2uf59T7rGv6nShCCK558OmbF3N
 OkVcqWsfGKPrcsZh4oxOdxjtCU7P3rhU4sTgcWxe5/CJ2iLg+MUwSSZiJ4MeMUuLjydpT4+g6
 zYUd8Hvx9PVA7tuioThZC2sL68Ei7B9Qp/qs37hgLeQn/0cJ5t7ntrrbne5WnSCVh2+kr4zcv
 6f059BTxEzd0ii2CsoFsB2mpPMJyBEqmD2MPXpgIN8odlHyv6NVXcHqWYiSExC4Ysq7gsri3A
 QVzmDUsCxNuZFWzf9EdIKdHD6EulgI81NdggLr50jhSHHh8Iqktg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=VF04UQ95
Subject: Re: [Buildroot] [PATCH v3 3/8] support/scripts/pkg-stats: check all
 files for warnings
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
Cc: Romain Naour <romain.naour@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LAoKT24gMzAuMDguMjMgMjI6MzYsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdy
b3RlOgo+Cj4KPiBPbiAxMi8wOC8yMDIzIDIxOjI4LCBEYW5pZWwgTGFuZyB3cm90ZToKPj4gSW5z
dGVhZCBvZiBvbmx5IGNoZWNraW5nIC5tayBhbmQgQ29uZmlnLmlueywuaG9zdH0sIGNoZWNrCj4+
IGFsbCBmaWxlcyBpbiBhIHBhY2thZ2UgZGlyZWN0b3J5Lgo+Cj4gwqAoImNoZWNraW5nIiBoZXJl
IG1lYW5zICJydW4gY2hlY2stcGFja2FnZSIpLgoKQ29ycmVjdC4KCj4KPiDCoEkgdGhpbmsgd2Ug
c2hvdWxkIGluc3RlYWQgcmVtb3ZlIHRoZSAud2FybmluZ3MgYW5kIC5zdGF0dXNbJ3BrZy1jaGVj
ayddIGZpZWxkcyBlbnRpcmVseS4gSXQgbWFkZSBzZW5zZSBiYWNrIGluIHRoZSBkYXlzLCBiZWNh
dXNlIHdlIHdlcmVuJ3QgcnVubmluZyBjaGVjay1wYWNrYWdlIGluIENJLiBOb3csIGhvd2V2ZXIs
IHdlIGRvLCBzbyB0aGVyZSdzIGxpdHRsZSBwb2ludCB0byBydW4gY2hlY2stcGFja2FnZSBhcyBw
YXJ0IG9mIHBrZy1zdGF0cyBhcyB3ZWxsLiBPbiBhLmIubyB0aGUgd2FybmluZ3MgY29sdW1uIHdp
bGwgKGFsbW9zdCkgYWx3YXlzIGJlIGFsbCAwLgoKSXQgd2lsbCBhbHdheXMgYmUgMCBpZiAuY2hl
Y2twYWNrYWdlaWdub3JlIGlzIGNvbnNpZGVyZWQgd2hpY2ggaXNuJ3QgdGhlIGNhc2UKaGVyZS4g
VGhlcmVmb3JlIHRoZSB3YXJuaW5nIGNvbHVtbiB3b3VsZCBzaG93IHRoZSBudW1iZXIgb2Ygd2Fy
bmluZ3MgaW5jbHVkaW5nCnRob3NlIGlnbm9yZWQuClRoZSBxdWVzdGlvbiBvZiB3aGV0aGVyIG9y
IG5vdCB0aGlzIGluZm9ybWF0aW9uIGlzIG5lZWRlZCBpcyBzdGlsbCByZWxldmFudC4KSSBqdXN0
IHdhbnRlZCB0byBwb2ludCBvdXQgdGhhdCBpbiBteSB0ZXN0aW5nIHRoZSB2YWx1ZSB3YXNuJ3Qg
MCBmb3IgYWxsIHBhY2thZ2VzLgoKPgo+IMKgVGhlcmUgaXMgdGhlIHBvaW50IG9mIHBlb3BsZSB1
c2luZyBwa2ctc3RhdHMgZm9yIHRoZWlyIGJyMi1leHRlcm5hbCwgYnV0Ogo+Cj4gMS4gcGtnLXN0
YXRzIGlzIHByZXR0eSBmcmFnaWxlIHNvIHVzZXJzIHNob3VsZG4ndCBiZSB0b28gc3VycHJpc2Vk
IGIgc29tZSBicmVha2FnZTsKPiAyLiBpdCdzIHZlcnkgZWFzeSBmb3IgdGhvc2UgdXNlcnMgdG8g
cnVuICdtYWtlIGNoZWNrLXBhY2thZ2UnIGluc3RlYWQuCj4KPgo+IMKgRG8gb3RoZXIgbWFpbnRh
aW5lcnMgaGF2ZSB0aGUgc2FtZSBvcGluaW9uPwoKU2VlaW5nIGFzIFRob21hcyBhbHJlYWR5IGFn
cmVlZCwgSSB3aWxsIHByZXBhcmUgdGhlIHJlbW92YWwsIHVubGVzcyBvdGhlciBvcGluaW9ucwph
cmUgcmFpc2VkLgoKPgo+Cj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0CgpSZWdhcmRzLApEYW5pZWwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
