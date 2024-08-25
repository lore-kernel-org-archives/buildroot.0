Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DBFC5320E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 13:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FB5A60596;
	Sun, 25 Aug 2024 13:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G48RlJju65_5; Sun, 25 Aug 2024 13:56:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E0836059E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E0836059E;
	Sun, 25 Aug 2024 13:56:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14AEF1BF951
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 039DC80A66
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7oBF5imAXb8n for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 13:56:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9773780A4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9773780A4E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9773780A4E
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 13:56:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.48.155]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJm5-1sLTkj3bwh-00l9eJ; Sun, 25
 Aug 2024 15:55:58 +0200
Date: Sun, 25 Aug 2024 15:55:50 +0200
MIME-Version: 1.0
Message-Id: <20240825-rgbmatrix-v1-2-0f2b0106f2ee@gmx.net>
References: <20240825-rgbmatrix-v1-0-0f2b0106f2ee@gmx.net>
In-Reply-To: <20240825-rgbmatrix-v1-0-0f2b0106f2ee@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724594157; l=3201;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=cusMP3qtn5pqxeBuBdkbaTuX/dw+G/cX3/qCSPi9B6w=;
 b=NTxCPUDBhkEPEqTOqPM8JxVvbsrUTcyNVLUIMOmutJIW9FORWP+gl12+0jwiMtkzRBEt8gukK
 dlNncWcHXbPBoBKLwb1D4WYEPJU5R5ZQyA7z/O9oZ20dntiGFV7tBO6
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:zMPkvuKhycOb0nfCqHixjNze+5d054tgPp+VU8oU+/4fQY277wE
 QwZHoqr0lf5bx8L0TlAq0FVAQY/Oh8ItmdIXV1NRClQepMc3mGKS0JqVlHALgv8h6vMQv+W
 +XK4FBJDNtIRGevuQVm6Nb42Nw7Y0F+BxFBC0FI/aHqhpBshri8BITo18M2NMqNGV7q+5Zb
 fjomyZRkahJNy8hfJg5Iw==
UI-OutboundReport: notjunk:1;M01:P0:YFkREZwzj7Y=;W0me2WwzFeuTfLY158iDF6aYB5x
 rkDGZLd7TCAXAfiTiOctWVq6nwlqnTAEYM1IujXXuFN1HTHXO7gvBrydLlCGZXs2aPWWmEESj
 1b2S0M11KXDz7FExr1IoOC1x8dV0E/MTd/cSNOQ434gw9Stf+YplytqHoThBUa45z98kHZOmo
 Vfdr32arD8sQpkhhs228aNoKzKG9TcyuH4l4EUV06mLk5/myu8lN2U4UdnCUn38mlWO3S0wR/
 v+VALaLK1s4RJGlclAp97LyOdrV3DQKtu/ii06K/UG6G2b2gBKHcgRdQKzaadCh2O1K2N505r
 8SClqhWpksdUXcoQ4yCcOOt1c7W0ADkZDdbWQGgvCToPnYZqXvDeX4wza/k9PriXINpEMuPmS
 ceAbnawN8GEMivKlaN6pm0SfOm5R4PSl3V7wof/uabuTx+ezg+MiRiEEklfQGW48sqvyUhQIb
 xCIDk5NY9OVJMoKkXmuK48E9LyuPWQCXhwSVd4TD3SBt4aoDrB5kfRXv2XhDxXY9tuHunNqkg
 fSwhw5TLl0YN5YgwUvL7M7Ln2lV+L2t2OIStceGw3RbzQS3rpfcPNaEMRugG8fbhZ5qtM8pOl
 gzK3YlbwNJhIB3lZVWwZf12ikbZtY/L+1mwokrsFYxMiKQnBGFBE1xHWEPi+sAyz160qFOJhD
 ZIaYYW8bwZpyXKaybWQfHTnPOtIW86aXp0YA2f7ZtZGmQXljnRBRP+InNrCCBdtiJF+/F5US7
 4RG1wSMbVtlqBAafVC7td2JEvWdOuNTwHLNJqRbpE5VgTMp6OKvPPgmWG8dtpSUBN9dXiy7Qe
 wNI1dUL81UzvBzmNfx6P1kJA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1724594159; x=1725198959; i=j.neuschaefer@gmx.net;
 bh=8G2d83p+PXsgPJrAAj7edHBXQNc71CPf+YiLUIfknq8=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tl/MSd3QK0GZcXmgi6p4UhaaNDv5+YglkLqqYQfWq/Vp+ldUMi0WrYuxb9rNMbQ1
 qlBMw/dBlQ+jdoFB43zm9FCPMtaVXAJoLVgT8mXEgkyBmYDFLiO4ysPQq4A48fz1T
 RFUvvuMWcDkOUuJX8BWa0ZCKUFvRODY+yYBuPCBFfA6zPKY4I1f9g5zV/VD0Rscne
 F+1tiwFM7IZ0N4VM4KrwylRiV+fTqQeIFVSY51C+EVMoAhgZ1ttTKvUfDSQ6EUew+
 8Z4cfKIxEIlNXczxLov8SYDdn5bMROQ9l/kqQ4v2O0fmORvnfMnwNHv+yFhETxNnf
 1azLs/K6ZO1IEQvbog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=tl/MSd3Q
Subject: [Buildroot] [PATCH RFC 2/3] package/python-rgbmatrix: new package
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlICJyZ2JtYXRyaXgiIHB5dGhvbiBtb2R1bGUgaXMgdGhlIFB5dGhvbiBiaW5kaW5nIGZvcgpy
cGktcmdiLWxlZC1tYXRyaXgsIGJ1aWx0IGZyb20gdGhlIHNhbWUgc291cmNlIHJlcG9zaXRvcnku
CgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0Pgot
LS0KIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAr
CiBwYWNrYWdlL3B5dGhvbi1yZ2JtYXRyaXgvQ29uZmlnLmluICAgICAgICAgICAgIHwgIDggKysr
KysrKysKIHBhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9weXRob24tcmdibWF0cml4Lmhhc2ggfCAg
MyArKysKIHBhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9weXRob24tcmdibWF0cml4Lm1rICAgfCAy
MyArKysrKysrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgpp
bmRleCAwN2JkMTQ5OWQ4Li5iMzY2NWE3NTY5IDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5p
bgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMTM0Myw2ICsxMzQzLDcgQEAgbWVudSAiRXh0
ZXJuYWwgcHl0aG9uIG1vZHVsZXMiCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1yZXF1ZXN0cy1v
YXV0aGxpYi9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1yZXF1ZXN0cy10b29s
YmVsdC9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1yZmMzOTg3L0NvbmZpZy5p
biIKKwlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9Db25maWcuaW4iCiAJc291cmNl
ICJwYWNrYWdlL3B5dGhvbi1ycGRzLXB5L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0
aG9uLXJwaS1ncGlvL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXJwaS13czI4
MXgvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcmdibWF0cml4L0NvbmZp
Zy5pbiBiL3BhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uM2IzOWJkNTAwYwotLS0gL2Rldi9udWxsCisrKyBiL3Bh
Y2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9Db25maWcuaW4KQEAgLTAsMCArMSw4IEBACitjb25maWcg
QlIyX1BBQ0tBR0VfUFlUSE9OX1JHQk1BVFJJWAorCWJvb2wgInB5dGhvbi1yZ2JtYXRyaXgiCisJ
ZGVwZW5kcyBvbiBCUjJfYWFyY2g2NCB8fCBCUjJfYXJtCisJZGVwZW5kcyBvbiBCUjJfSU5TVEFM
TF9MSUJTVERDUFAKKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKKwlkZXBl
bmRzIG9uICFCUjJfU1RBVElDX0xJQlMKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVF9QWVRIT05f
Q1lUSE9OCisJc2VsZWN0IEJSMl9QQUNLQUdFX1JQSV9SR0JfTEVEX01BVFJJWApkaWZmIC0tZ2l0
IGEvcGFja2FnZS9weXRob24tcmdibWF0cml4L3B5dGhvbi1yZ2JtYXRyaXguaGFzaCBiL3BhY2th
Z2UvcHl0aG9uLXJnYm1hdHJpeC9weXRob24tcmdibWF0cml4Lmhhc2gKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMTc1MDgxZWI1ZAotLS0gL2Rldi9udWxsCisrKyBiL3Bh
Y2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9weXRob24tcmdibWF0cml4Lmhhc2gKQEAgLTAsMCArMSwz
IEBACisjIExvY2FsbHkgY29tcHV0ZWQKK3NoYTI1NiAgOWE2ZGE1YjBhZDczMDg4M2E1ZmExOGFm
YzU5YjEyOTdiNGIwNWViNTgxYzJjMTRhZTUwYTM1ODMyOTZhNGJlZCAgcHl0aG9uLXJnYm1hdHJp
eC1mNTU3MzZmNzU5NWJjMDI4NDUxNjU4OTk2ZWVkZWE5NzQyNjg4YmJjLnRhci5negorc2hhMjU2
ICA4MTc3Zjk3NTEzMjEzNTI2ZGYyY2Y2MTg0ZDhmZjk4NmM2NzVhZmI1MTRkNGU2OGE0MDQwMTA1
MjFiODgwNjQzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1yZ2JtYXRyaXgv
cHl0aG9uLXJnYm1hdHJpeC5tayBiL3BhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9weXRob24tcmdi
bWF0cml4Lm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjU0NWMzZmE4
NzgKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5dGhvbi1yZ2JtYXRyaXgvcHl0aG9uLXJn
Ym1hdHJpeC5tawpAQCAtMCwwICsxLDIzIEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIwor
IyBweXRob24tcmdibWF0cml4CisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitQWVRIT05f
UkdCTUFUUklYX1ZFUlNJT04gPSBmNTU3MzZmNzU5NWJjMDI4NDUxNjU4OTk2ZWVkZWE5NzQyNjg4
YmJjICAjIDIwMjQtMDgtMTgKK1BZVEhPTl9SR0JNQVRSSVhfU0lURSA9ICQoY2FsbCBnaXRodWIs
aHplbGxlcixycGktcmdiLWxlZC1tYXRyaXgsJChQWVRIT05fUkdCTUFUUklYX1ZFUlNJT04pKQor
UFlUSE9OX1JHQk1BVFJJWF9MSUNFTlNFID0gR1BMLTIuMAorUFlUSE9OX1JHQk1BVFJJWF9MSUNF
TlNFX0ZJTEVTID0gQ09QWUlORworUFlUSE9OX1JHQk1BVFJJWF9JTlNUQUxMX1NUQUdJTkcgPSBZ
RVMKK1BZVEhPTl9SR0JNQVRSSVhfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKK1BZVEhPTl9SR0JN
QVRSSVhfU1VCRElSID0gYmluZGluZ3MvcHl0aG9uCitQWVRIT05fUkdCTUFUUklYX0RFUEVOREVO
Q0lFUyA9IGhvc3QtcHl0aG9uLWN5dGhvbiBycGktcmdiLWxlZC1tYXRyaXgKKworIyBHZW5lcmF0
ZSBiaW5kaW5ncyB3aXRoIGN5dGhvbgorZGVmaW5lIFBZVEhPTl9SR0JNQVRSSVhfQ1lUSE9OCisJ
JChNQUtFKSAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgLUMgJChARCkvYmluZGluZ3MvcHl0aG9u
L3JnYm1hdHJpeCBcCisJCUNZVEhPTj0kKEhPU1RfRElSKS9iaW4vY3l0aG9uIGFsbAorZW5kZWYK
K1BZVEhPTl9SR0JNQVRSSVhfUFJFX0JVSUxEX0hPT0tTICs9IFBZVEhPTl9SR0JNQVRSSVhfQ1lU
SE9OCisKKyQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKCi0tCjIuNDMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
