Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2E1C3DA49
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 20:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 436EE40D87;
	Fri, 26 Jul 2024 20:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZ2uJeHXNpkr; Fri, 26 Jul 2024 20:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BF2540DB7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BF2540DB7;
	Fri, 26 Jul 2024 20:04:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74C251BF995
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 20:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60EAC81A18
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 20:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xfQdA0ayNNR for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 20:04:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A76280E03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A76280E03
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A76280E03
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 20:04:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.34.233.124]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4axq-1sWtTE1TAk-00ES9x; Fri, 26
 Jul 2024 22:04:06 +0200
Date: Fri, 26 Jul 2024 22:03:53 +0200
MIME-Version: 1.0
Message-Id: <20240726-s6-tests-v1-2-fb57b051e87f@gmx.net>
References: <20240726-s6-tests-v1-0-fb57b051e87f@gmx.net>
In-Reply-To: <20240726-s6-tests-v1-0-fb57b051e87f@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722024243; l=1030;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=/az9JxRfJWD1zT+oz4DJp6K48prCIREiTCZMmlAuKuo=;
 b=QdNBlYjn39rDkFlZha0FR4N0fATPxKJCRC3jxzR7n1H8VAY4rbrWKkTn7I2uId6OUbIHp7zXJ
 xX2o/58hqOmC08MCjAjZp3UL4GYqhuLs7WDhodKMOX78ZIUvH1sfFk3
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:V+Uz7wOY+0jcjCT/GunDDsN7YNK3e1ZumG3kTERAkPzYkr62bJA
 dr5Q/5ZMOzKSHnT0x3RDWksEmYFOV5vM94aOcbbR10Rq9tp3ePdcGb19bjfXKGsYqpv59R5
 NsExzJRvsOET8b/vKL0tCRBfW8+RqTHmL7joGG11K8v/hWf+6DpS/Zmrkfuwrv1hTZUKqyu
 iD6Kt1NBk/9cXEM5/4svw==
UI-OutboundReport: notjunk:1;M01:P0:qJABbGza2E4=;X364TZt8rU2Bek+UFmgyvrmgxDG
 N0N2GEl2322cW6F6yV4gKfNdWW5OGtdy9fsUcpleDhLfmPHarR0SR1Si+cvrWIQUnftDf4yYK
 XAB9GygpiGlKC+fUfVg/AhcRMXu1NrDXM8aoQNwtRlkC5WGQXpCkzF6gvJ3PYYEihO1LNOqZ/
 TIm/2KSMYxiKcGuS05HiSZNiwtGFG5TL6hkcqTm+4q/DRc+PexrKVoN4YoLojx8As/TZ8RtpC
 NmofGWeyGfgbbAt+XmT9KqncDapYKWQ6SfsN+pTDHRfVdEhRGfK+q2rOCgxP9SfnxOrLG4qdO
 KmEC2bb1zOUv/pKjoRMFBFHM/e8/ib79Jbr4pytBrv+5reYifIoZkiIYo3YP6KqgLcZDzBc0X
 rBkMpLUTq6aTsf/87MgMCBAgp9E7NP5nb4HW1DIDB2q7bRCMmyFyESBXxnGhEs0Ii0ZFRTT33
 1pBpHU/shukVndWsVluk44FCSqjzd4MqJ0EFJxGz2xhmPCzn9QpWW/B4+ArQdUSm4R1QwKDpB
 kM5KDPeDZH7VeO1BKR4//fd3IyJTsckUT9f2ULIi5QbbUADWe9vnkQpmwVpvuSc1IUtXjei3L
 symaCAFeC6xX9aSs2HE+eBcoimv8L7FrSOy3POv929ieFgUQvXuVGfZurdALv3OgnTBz25zs7
 28nt/iv/e5DwMIW1NLSL7DVuIEd8mHM+pREBa5CSsdA8xDnj9pEXDNYVPvPzU13UAMe6X2aJm
 k+A+pCcxWWxItaUK0gy6TM7K+Mn9msdgkzpT1vIqleEKgX+ROAwox9F5eyPx5YbsvPFr8pYHC
 rswxfGiMzqjFZS2XiKy+2/vA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1722024246; x=1722629046; i=j.neuschaefer@gmx.net;
 bh=WCmyEE3qUvTwASkujvf41s+ykVZM0WQppIbB4fL/tSU=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=OybnQpLQnp4shNp13hDGqNfu7YeO67Ji67pKVsbHOad9DUipQRysOJ1ksjpncnaK
 xO1sfVuasYYxTHhcnMYgm/ab65omG49FnMqAAap5igPc6P4VUj5HzT/9IbTv3h8rU
 XBAiAKm35AyWQMYr0raSgDlnfu8mIoUBDp5e2DY2xc2pVqGOdxGPzhJNW/hmJMGOJ
 8KOTZwpUD1JETA2aChh10DZqxC2aDQFJHeKBGTsHq3QiWLwGVYT8gaSzk6MF1OYLq
 zaZ2qPWd9sgxfZZzzSW2Ei43aL/ItpnBDcnqqje2zq756BPYA7yPPoXiVShrJTkPx
 GKwFLDubqcvqPdiNLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=OybnQpLQ
Subject: [Buildroot] [PATCH 2/2] support/testing: Test eltest (part of
 execline)
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
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHByZXZpb3VzIGNvbW1pdCByZW1vdmVzIHM2LXRlc3QgZnJvbSB0aGUgcnVudGltZSB0ZXN0
cy4gVGhpcyBjb21taXQKYWRkcyB0aGUgc2FtZSB0ZXN0IGZvciBlbHRlc3QsIHdoaWNoIHJlcGxh
Y2VkIHM2LXRlc3QuCgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZl
ckBnbXgubmV0PgotLS0KIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZXhlY2xp
bmUucHkgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9leGVjbGluZS5weSBiL3N1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZXhlY2xpbmUucHkKaW5kZXggYTdlYTM2
YzFhMi4uMTVmZjkyZDc2MiAxMDA2NDQKLS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF9leGVjbGluZS5weQorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X2V4ZWNsaW5lLnB5CkBAIC0yMSwzICsyMSw4IEBAIGNsYXNzIFRlc3RFeGVjbGluZShpbmZy
YS5iYXNldGVzdC5CUlRlc3QpOgogICAgICAgICBvdXRwdXQsIGV4aXRfY29kZSA9IHNlbGYuZW11
bGF0b3IucnVuKCJleGVjbGluZWIgLWMgJ2VjaG8gaGVsbG8gd29ybGQnIikKICAgICAgICAgc2Vs
Zi5hc3NlcnRFcXVhbChleGl0X2NvZGUsIDApCiAgICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwob3V0
cHV0WzBdLnN0cmlwKCksICJoZWxsbyB3b3JsZCIpCisKKyAgICAgICAgXywgZXhpdF9jb2RlID0g
c2VsZi5lbXVsYXRvci5ydW4oIm1rZmlmbyB0ZXN0cGlwZSIpCisgICAgICAgIHNlbGYuYXNzZXJ0
RXF1YWwoZXhpdF9jb2RlLCAwKQorICAgICAgICBfLCBleGl0X2NvZGUgPSBzZWxmLmVtdWxhdG9y
LnJ1bigiZXhlY2xpbmViIC1jICdlbHRlc3QgLXAgdGVzdHBpcGUnIikKKyAgICAgICAgc2VsZi5h
c3NlcnRFcXVhbChleGl0X2NvZGUsIDApCgotLQoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
