Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C4DE8305C
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 07:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB0236070C;
	Tue,  3 Feb 2026 07:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eKavgWL-VV7; Tue,  3 Feb 2026 07:52:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D97E460720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770105140;
	bh=VRF+iCto7lNCpuAvjTnBGYZGvhq8u1d73Tb0acLxt3M=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bCMMAeGz3PGfIAH1ERo0aG1+9/zUoak5VgEncXIXw5uuY8w45CTH4oUlWA88LexRf
	 VVA6Vedv31+Hs9oPI6WZ+jmwbSOkrIAVokmoSj0FYpFUiz9+kP6tYDNcQxNSNcTjyV
	 r6DNCWDWZelNo7EhPz0ndmvGLmogn0EXNxJjSCo4faDwT4BqbJydKD0eFqif0GxMT8
	 w43qKQHROQzN7ggIS7byAKIR/7er1I382NPbdas/BFeTyg6Bn4yM+kEQdpM1uQMeRd
	 xVJidr12ZfXioNwOXeam5dO3lVjh0vC4kcpYkPORIy4PSoiG01nVyFKnzlAHyj0fMQ
	 /chwGvlwqn1Yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D97E460720;
	Tue,  3 Feb 2026 07:52:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5CCAF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2F1260720
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hh71RyKs1scW for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 07:52:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE7956070C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE7956070C
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE7956070C
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:52:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9C4821A2BB3
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:52:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6BD7960767;
 Tue,  3 Feb 2026 07:52:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A397A119A88F7; Tue,  3 Feb 2026 08:52:12 +0100 (CET)
Date: Tue, 3 Feb 2026 08:52:11 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Baxiche Su <baxiche@gmail.com>, 
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <aYGpGnHjcMfvTGvS@windsurf>
References: <20260106193017.1817810-1-bernd@kuhls.net>
 <20260106193017.1817810-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260106193017.1817810-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770105133; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=KS4y7KSJqIOV8J4OK9rWhqFxP1qqqxEOWbR8heEjidI=;
 b=jfkGlx1VL8ywF4tYsZUKdXnYgwzhbhdCGD/BxehQYvfJNm4HY2sfi79852nvmq3kRJbsD6
 IMCLiWRyGRMbdXH6kOThfplHoEJNsz7ygEDP0EanW9Qo4n90EvkuQsdCy5CXfoSY9vJM/R
 JnsnLFCi8nyiY/352iysEVPCvF3uUEFN4SBsrGAqJQ4lgBcFH6x+rFWIYArstQUils0V8h
 Q3u5gIyBFD8mD38hFCwnsFHUvDN/sfX2zKKHLY8zKPn/KVp3RQet6ash5r0ZEmqvKA1srL
 Re3r8uZ+xmsPpSXHJOlvdH4CWKbS24L8WtYS/vZr9XdG0p5cpJoLPyBI8jKJOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jfkGlx1V
Subject: Re: [Buildroot] [PATCH v3 1/3] package/freerdp: fix build with
 ffmpeg 8.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKYW4gMDYsIDIwMjYgYXQgMDg6MzA6MTRQTSArMDEwMCwgQmVybmQgS3VobHMgd3Jv
dGU6Cj4gQWRkZWQgZm91ciB1cHN0cmVhbSBwYXRjaGVzIGJhY2twb3J0ZWQgZnJvbSBGcmVlUkRQ
IDMueC4KPiAKPiBUaGUgcmVtYWluaW5nIGJ1aWxkIGVycm9yOgo+IAo+IC9ob21lL2Jlcm5kL2J1
aWxkcm9vdC9vdXRwdXQvYnVpbGQvZnJlZXJkcC0yLjExLjctMTgtZzBlZTE3ZTJmOGU0OWQ1NmFi
NWI5MGQ1MTYwZmE4Zjg3ZmZjNDQ1ZTAvCj4gIGNoYW5uZWxzL2NsaWVudC90YWJsZXMuYzoxMjk6
MjI6Cj4gIGVycm9yOiBpbml0aWFsaXphdGlvbiBvZiDigJhVSU5UICgqKSh2b2lkKeKAmSB7YWth
IOKAmHVuc2lnbmVkIGludCAoKikodm9pZCnigJl9Cj4gIGZyb20gaW5jb21wYXRpYmxlIHBvaW50
ZXIgdHlwZSDigJhVSU5UICgqKSh2b2lkICop4oCZIHtha2Eg4oCYdW5zaWduZWQgaW50ICgqKSh2
b2lkICop4oCZfQo+ICBbLVdpbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KPiAgIDEyOSB8ICAg
ICAgICAgeyAib3NzIiwgIiIsIG9zc19mcmVlcmRwX3JkcHNuZF9jbGllbnRfc3Vic3lzdGVtX2Vu
dHJ5IH0sCj4gCj4gaXMgZml4ZWQgYnkgYWRkaW5nIC1Xbm8taW5jb21wYXRpYmxlLXBvaW50ZXIt
dHlwZXMgdG8gQ0ZMQUdTIGR1ZSB0bwo+IHRhYmxlcy5jIGJlaW5nIGR5bmFtaWNhbGx5IGNyZWF0
ZWQgZHVyaW5nIHRoZSBidWlsZCBhbmQgYmFja3BvcnRpbmcgdGhlCj4gc3VwcG9zZWQgdXBzdHJl
YW0gZml4Cj4gaHR0cHM6Ly9naXRodWIuY29tL0ZyZWVSRFAvRnJlZVJEUC9jb21taXQvZmU2ZDg2
MWE1YzIxZWRmNTM0MWVjMjAzYTEyZDZmNjJmOGE4MDM2Nwo+IGlzIHRvbyBpbnZhc2l2ZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgoKVGhhbmtzIGEg
bG90LCBlbnRpcmUgc2VyaWVzIGFwcGxpZWQhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmks
IGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
