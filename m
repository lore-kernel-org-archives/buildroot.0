Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F186CD6AAF9
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 19:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E7B940AC7;
	Thu,  2 Apr 2026 19:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmUYtIVZ5trJ; Thu,  2 Apr 2026 19:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A716640AB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775156866;
	bh=Ddgqx5t/HIr9gmze9iFpA+Zm06AtuCKTDnSGTI+gh+A=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cysI+uzOB3FpX4wMxe6Q+NRU27u1ILKLXM/OXk0F9XG6tmazKLe9blZd4jr7Da/7N
	 w7JlshrC4k92eIAdR6GB0V3fTz+LH9QhqYB5d0Dnn75u3KA49JplRcuWWBj7rxOTUc
	 ExcDtlB3a2/6fNYCem55VumZecZDlb0iVYfE922BlPahcta/vBhMM+NKhQhjYcq1QR
	 rcQOakCqRWlTQYxY11vWnKxX30WqWXmTgWEcPpRyWBO6/seSMiUVakgD8EYxpZeCkW
	 JtDEW5bk3vnbO598gPPB0rPd7rjFY67IENV+OXrjnfUbYEsUTnCiBYnrc4D8sUTXsg
	 fVJoy2Oqyls5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A716640AB7;
	Thu,  2 Apr 2026 19:07:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CBF232D3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA10E401E0
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EaMwQMPF-IuO for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 19:07:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.101;
 helo=smtpdh16-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 09BA8400BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09BA8400BE
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09BA8400BE
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:07:42 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id 8NOEwd5ee0dL08NOFwVKia; Thu, 02 Apr 2026 21:07:39 +0200
Mime-Version: 1.0 (1.0)
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <bd057c4a-ad38-4d13-a3d0-090648529153@kuhls.net>
Cc: Buildroot <buildroot@buildroot.org>
Date: Thu, 2 Apr 2026 21:07:38 +0200
Message-Id: <90567E24-F02A-4DBC-A9A3-4C12D40E2316@benettiengineering.com>
References: <bd057c4a-ad38-4d13-a3d0-090648529153@kuhls.net>
To: Bernd Kuhls <bernd@kuhls.net>
X-Mailer: iPhone Mail (23E246)
X-CMAE-Envelope: MS4xfFtXfFEHHsI0JuYGa42ruUZ/VA/uAfrkrwOqqGHpyKTtdB4xfMaPSJW+xPKFSXG1BCFfKpPli7rPCbnUe76nmlW/Irl/RcGjRyTXkwjWvRtODDqPichI
 oUkoWa7OnmMv1maY6HU9WCONtvL4UdoPu1w9Fo4wEZtb7j7aqjiPwy0LHqesfrVBvjMc/V6+OWA7xq9tvEt+lWO4gGjaxIZi7qgnrlmqm8cwVZmRE24LEB4t
 9gpImIjcUAkLNZSM2JH7nQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1775156859; bh=fP75W9GYQHJLnm+wwMRo97lRr5aj6HqYqNF5ffkeoyE=;
 h=Content-Type:Mime-Version:Subject:From:Date:To;
 b=QVbtAgds1W1SNxPGoI+JX6Ha4SCKxcxqXm/mKm2c5NqyQvQ6cVXerHrMLNCqM6DDi
 AmQ/TBQAerQVugL+wl7uklsjlMiNS7KHj9wybk8akehi3Thank08YbiurBI4vlllz1
 60aAzF0u8wPegmit912ihPMXnmJQuDy8oIPwQ8WrpN3vQdH7+lrE+71xIO4g8HcCAd
 sdjKI+BU51WLlXPhcjYJe6KOgLnDpMPnDi8yHztrZUHkRf8DbYrHPRU97Pr4Wpoy9X
 7lQm5Yyur4prbSz3mKxzCQVRbiL65Dy/qJ1Cn6nPiS+O94n0bG6vi3KnntltXJFr2x
 Qm2QbXCQt8QQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=QVbtAgds
Subject: Re: [Buildroot] [PATCH 1/1] package/harfbuzz: bump version to 14.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

SGkgQmVybmQsCgo+IElsIGdpb3JubyAyIGFwciAyMDI2LCBhbGxlIG9yZSAyMDo1MywgQmVybmQg
S3VobHMgPGJlcm5kQGt1aGxzLm5ldD4gaGEgc2NyaXR0bzoKPiAKPiDvu79bVGhpcyBtYWlsIHdh
cyBhbHNvIHBvc3RlZCB0byBnbWFuZS5jb21wLmxpYi51Y2xpYmMuYnVpbGRyb290Ll0KPiAKPiBB
bSBUaHUsIDIgQXByIDIwMjYgMjA6NDc6MTYgKzAyMDAgc2NocmllYiBHaXVsaW8gQmVuZXR0aToK
PiAKPj4gSGkgQmVybmQsCj4+IHNpbmNlIHRoaXMgaXMgYSBtYWpvciB2ZXJzaW9uIGNoYW5nZSBo
YXZlIHlvdSBidWlsdCBoYXJkIGJ1enogd2l0aCBhbGwKPiBwYWNrYWdlcyB0aGF0IGRlcGVuZCBv
biBpdCBhcyBJ4oCZdmUgYWx3YXlzIGRvbmUgaW4gdGhlIHBhc3Q/Cj4gCj4gSGkgR2l1bGlvLAo+
IAo+IGJlY2F1c2UgdGhlIHJlbGVhc2Ugbm90ZXMgb25seSBhbm5vdW5jZXMgbmV3IEFQSSBhbmQg
bm8gY2hhbmdlcyB0byBleGlzdGluZyBBUEkgSSBvbmx5IGJ1aWx0IG15IHVzdWFsIHBhbmdvL2Zm
bXBlZy9saWJhc3Mva29kaSBkZWZjb25maWcgYW5kIHRoaXMgZmluaXNoZWQgd2l0aG91dCBhbnkg
cHJvYmxlbXMuCgpPaCwgdGhpcyBtYWtlcyBzZW5zZQpNYW55IHllYXJzIGFnbyBJ4oCZdmUgYmVl
biBhc2tlZChjYW7igJl0IGZpbmQgdGhlIGVtYWlsIGFueW1vcmUpIHRvIHRlc3QgYXBpLCBidXQg
dGhlIG9uZSB3aG/igJlzIHdyaXR0ZW4gYXQgdGhhdCB0aW1lIG5ldmVyIHBvaW50ZWQgbWUgdG8g
YnVpbGQgYWxsIHRoZSBwYWNrYWdlcywgdGhlbiBsYXRlciBvbiBJ4oCZdmUgc2VudCBwYXRjaGVz
IHdpdGggYWxsIHBhY2thZ2VzIGJ1aWxkIHRlc3RlZCBhbmQgaXQgYmVjYW1lIGEgc3RhbmRhcmQg
dG8gbWUuCgpTbyBpdCBzb3VuZHMgZ29vZCBhbmQgZWFzaWVyLgoKVGhhbmtzIGEgbG90IGZvciBj
bGFyaWZ5aW5nIQoKQmVzdCByZWdhcmRzCkdpdWxpbwoKPiAKPiBSZWdhcmRzLCBCZXJuZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
