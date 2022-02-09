Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3257AC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 22:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE3EB403A7;
	Wed,  9 Feb 2022 22:43:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XoEs0-rKfDcD; Wed,  9 Feb 2022 22:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A492B4013B;
	Wed,  9 Feb 2022 22:43:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC0271BF3F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 22:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D87C34013B
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 22:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zgmPi3tHf15x for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 22:43:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp2.osuosl.org (Postfix) with ESMTP id E80A44013A
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 22:43:02 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id Hvfvn5NLdXfntHvfvnodnC; Wed, 09 Feb 2022 23:43:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644446580; bh=ya3iwfUaJibD9lNB/34nXWvde7vbU42B9goT6CkEegk=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=XiQFNriIeCpTL4+gCAhgyGljY5eIfj0jJph2hwP8BaQ6Dv5ORCd0MPygcEqiZel7p
 958kKBKP5m7d+MmzTdsKGr83MDuj337RGWeh9iUzqYQmls9hiBctXn2hpWTJCorY1P
 vaY8SsqpJuMNlostR81CFjLAXb0VDXc5qe2+gcoDeZtv5pI02Jo0BSSVESntRd2iRT
 EmFWdtxC6iThOeuMcYDyWKvXSj8Fr7ziW4s3i1nAAtyxpcbANppgF/AThjQB+LUJ/s
 xwywcIKcnCjQv2OzJGd7E61zb2ljXeRDQn2oFxtIgYNl3SnL2/20BsAi/j3NY45uRE
 ZFIENJNOWBLeQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 9 Feb 2022 23:42:59 +0100
Message-Id: <5D73A104-6D13-4082-9A55-E22215647C87@benettiengineering.com>
References: <YgM7SDj7OxQiOfKt@APC323>
In-Reply-To: <YgM7SDj7OxQiOfKt@APC323>
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4xfBYIi++bRYhT7nrASCH42Nad86yM6wRtpaLu97RQkdtiq/khDGTC18/V90c1TkAT3sDPS2hxUi40h5AJ82loYl0vPCmWSSZo0jC0aVHQje/HAGntUt2s
 /l/mlbWvYBRnCyYb/7fkYAd32NJfZFFiM/U6By2Q28QB2kBDmq7+k6vK3+XZwypyKY6iyHdiVyz833NSD9BEF3N/0iadLnQqpZE7dFezLs/FgWTo7Tq6PdMt
 Ckc/5XTioPY7ah8DR4OIW6ud9uw3Rcn4H2eFn9EbG65n8QMAdt8CjPnyr4g8WRhD2KozIfDHmX5RGMD7sHRLn/xbA13w/xcwEWeKWa/eihc=
Subject: Re: [Buildroot] Patch state of andes/ae350
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
Cc: alankao@andestech.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpJ4oCZbSBnb2luZyB0byByZXZpZXcgdGhpcyBwYXRjaCBzb29uLiBTb3JyeSBJ
4oCZdmUgc2tpcHBlZCB5b3VyIGJvYXJkIHRoYXQgY2FtZSBiZWZvcmUgb3RoZXIgSeKAmXZlIHJl
dmlld2VkLgoKQmVzdCByZWdhcmRzCuKAlC0KR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBFbmdpbmVl
cmluZyBzYXMKCj4gSWwgZ2lvcm5vIDkgZmViIDIwMjIsIGFsbGUgb3JlIDA0OjU3LCBZdSBDaGll
biBQZXRlciBMaW4gPHBldGVybGluQGFuZGVzdGVjaC5jb20+IGhhIHNjcml0dG86Cj4gCj4g77u/
SGkgVGhvbWFzLAo+IAo+IEkgd291bGQgbGlrZSB0byBmb2xsb3cgdXAgb24gbXkgcGF0Y2hlcyBs
YXN0IG1vbnRoLgo+IEFyZSB0aGV5IHN0aWxsIHVuZGVyIHJldmlldz8gUGxlYXNlIGxldCBtZSBr
bm93IGlmCj4gSSBtaXNzZWQgc29tZXRoaW5nIHRoYXQgbmVlZHMgdG8gYmUgZml4ZWQuCj4gCj4g
UmVnYXJkcywKPiBZdS1DaGllbiBQZXRlciBMaW4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
