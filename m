Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09420606A31A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 19:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=la+8Q8ij
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9EE1810D7;
	Tue, 20 Oct 2026 19:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-zrwpXNue6q; Tue, 20 Oct 2026 19:26:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BFDF2810A2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792524407;
	b=o0IllwQkp6TLhAb25tK9VIcJ7sHR/C1UtofiP6GDdbem1Eo94VBpyO8J64mKu4FJQ+ki
	 4qV7R/KGHXIJ6MDTW1ZxN0YnjYsg0+eqS3qvznCC0raZUY3fdYywockmQM2RaPPPZshIx
	 QIrMAX6RIdbvZfUZ1N2/zyfEkgR4WBcWCJwsqxpWvFiH8r74rb2ZcsB2PazFvyb7QiLIc
	 XGhEz1tzCB4VFNF5MXw4xfSYKPZ//j6ZINcLaNncZIIRG0ah9gIN+rFV40QFg+RxMO1wD
	 ckkANPVTt/uakLEhTZUXxft+sTpBbpcfBxbImbKxDPiJA4eKOSr+tkqSSK5PH4O9Muw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792524407;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=faORrkopJmmtTy4ruJ68WTrij7EOiAHrcZ/7lt0t9hY=;
	b=OtXfqvzOlxhgWOaQyCW0KuYfO0ROAYGLRiw+ZIvPSrpJfgaDiQNdfxk3Jyy7lVI9EsbN
	 Ri5vW4khnswOji4fG4RdXHHjnZ35QrvXHlTkx9KVPW8NEstKPieBMBefEEFFyiXM5K6Oo
	 KxnODGgjueTjxTHR0L+b/ZujOaheMJZRr5uiYIycbN54adEWkxMyNwQWJv7l+r7K8b60d
	 eVSKJ8b1Th7VN6+7B7cD1dUMW4UPsXc+CfK0B4sRKQnPYPonUVA6EGTmFdXwAiIpUCs46
	 YegjixSkqyPMSd0ecsMMAZeKkidr1vA4+fCnmJUa0brTzx1YPxbvVGnse/LhiOQ3w7A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792524407;
	bh=faORrkopJmmtTy4ruJ68WTrij7EOiAHrcZ/7lt0t9hY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=la+8Q8ijBLt6xNB+AjbNZZ7oAlEPI7NSyH9hF0EEg7vpictKsVKhFr8Et9CQdOln8
	 BWHUqK7Ss1hLmC8CApizaGyLm2Qeq0Y8IXfkg1o4Xt38QbnGG66P9t7/HjbuSx2Jth
	 JcefaKTzKWE2ZtGoks4501Lgguh3BD7KM8B/Mff/axuSh1MkMyia8xeXM4riBtCEVj
	 xLRNDb7eBGk6aKI61bYp0xhZq6Z1zcgjkI/iZoWMgfIS0gWG3KbEdyOh9/q8+mQRQN
	 60c8EvrD45jAmMIyhXO8lEYtv5zSSaHDYEmXIQqwxaWKTg4QkZq8ni1sy3CQ8zo84t
	 XKgzxl8u967dA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFDF2810A2;
	Tue, 20 Oct 2026 19:26:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1C361AB
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 19:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3CBC810A2
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 19:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMlLtAK00YMg for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 19:26:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DBB1080DC8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792524405;
 b=s4Iq96x4wy+eMLGqE3V2eJkIrxtADqOIm+gm/IQ8WJbJhECaIz4bj+58UGehB7chBhm3
 fQ3Kikinx1lnGjFQPXXs7wD8asUS4A0pZcnU1jzIWQ7uPrLZ4jvxNjd0M7Mh9EHjrecTi
 CyxkF6UPPsp4GqvFesc1U1Phd28jhga7ZNagROP3WMhp2S/pTKTODkU3l6YcyBs4N06eX
 8Okex5TN5Hjbppqy+eqKXFozdlPaSRUfwTBgZtX5skjebQHuuhOfCl+pMu+ZlFHmEP/r0
 ibJGYhqqKznyfHS/hkSZIylYb1W4mabUmS+5oMt+gUQnx9Lpprx+gKNidKaTYWEgupg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792524405;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=dxzHWT56frfO3cYq8rvLUHDTSQoGRdgJ1kAB85BMiGI=;
 b=mvZ1fuRKVY8k3nsHYbo+nRmBoAiJAgD4lz2MG2V1QpbcOLgF1RIdSCDNQ9aUFVftowjX
 X2uXcd19xuU0WDiscqFgEHWduPH1iWMroabHn0feBzHXQOaSgMNDh9BBoMGg84SwCA3V0
 WyYFrgOAlPrlF+M/WJL51s19bQSfNKOEI8pc4QSX4ivT7Dik0rNVOVyOB9fjZ35gjhPS0
 jtfQIerxCDkn09WOp8PUo4Gag5dfSObALCjafYDaembqIEiYYkjcnPuh2mRP704e2yxmE
 IhaHDRkfld5Bu5htx3q5dzXcDZS9xsoNEENmRfHFGV7dHwM9dow2bmnR6LT8yILSbxA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qv9lrPGB; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBB1080DC8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 19:26:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6A3B31A1290;
 Tue, 20 Oct 2026 19:26:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3FBD060393;
 Tue, 20 Oct 2026 19:26:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3532C10328DD0; 
 Tue, 20 Oct 2026 21:26:37 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 20 Oct 2026 21:26:22 +0200
Message-ID: <20261020192623.1982867-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020192623.1982867-1-thomas.petazzoni@bootlin.com>
References: <20261020192623.1982867-1-thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] package/pcmanfm: fix build with gcc >= 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T25jZSB0aGUgbGliZm0gYnVpbGQgaXNzdWVzIHdpdGggZ2NjID49IDE0IGFyZSBmaXhlZCwgcGNt
YW5mbSB0aGVuCmZhaWxzIHRvIGJ1aWxkIHdpdGg6CgovaG9tZS90aG9tYXMvYnVpbGRyb290L3Zh
bGEvb3V0cHV0LWdjYzE0L2hvc3QvYmluLy4uL2FhcmNoNjQtYnVpbGRyb290LWxpbnV4LWdudS9z
eXNyb290L3Vzci9pbmNsdWRlL2dsaWItMi4wL2dvYmplY3QvZ29iamVjdC5oOjUzMzoyODogZXJy
b3I6IHJldHVybmluZyDigJhGbURlc2t0b3BJdGVtQWNjZXNzaWJsZSAq4oCZIHtha2Eg4oCYc3Ry
dWN0IF9GbURlc2t0b3BJdGVtQWNjZXNzaWJsZSAq4oCZfSBmcm9tIGEgZnVuY3Rpb24gd2l0aCBp
bmNvbXBhdGlibGUgcmV0dXJuIHR5cGUg4oCYQXRrT2JqZWN0ICrigJkge2FrYSDigJhzdHJ1Y3Qg
X0F0a09iamVjdCAq4oCZfSBbLVdpbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KZGVza3RvcC5j
OjE0NTc6MTI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhnX29iamVjdF9yZWbigJkK
IDE0NTcgfCAgICAgcmV0dXJuIGdfb2JqZWN0X3JlZihpdGVtKTsKICAgICAgfCAgICAgICAgICAg
IF5+fn5+fn5+fn5+fgoKVGhpcyBpcyBmaXhlZCBieSBiYWNrcG9ydGluZyBvbmUgdXBzdHJlYW0g
Y29tbWl0LiBUaGUgc2Vjb25kIGlzIGp1c3QgYQpjbGVhbnVwIG9uIHRvcCBvZiB0aGUgZml4LCBh
bHNvIHVwc3RyZWFtLgoKVGhlcmUgYXJlIG5vIGF1dG9idWlsZGVyIGZhaWx1cmVzLCBidXQgdGhl
IGJ1aWxkIGZhaWx1cmUgY2FuIGJlCnJlcHJvZHVjZWQgdXNpbmc6CgogQlIyX2FhcmNoNjQ9eQog
QlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0NVU1RPTT15
CiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0RPV05MT0FEPXkKIEJSMl9UT09MQ0hBSU5fRVhURVJO
QUxfVVJMPSJodHRwOi8vdG9vbGNoYWlucy5ib290bGluLmNvbS9kb3dubG9hZHMvcmVsZWFzZXMv
dG9vbGNoYWlucy9hYXJjaDY0L3RhcmJhbGxzL2FhcmNoNjQtLWdsaWJjLS1zdGFibGUtMjAyNS4w
OC0xLnRhci54eiIKIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfR0NDXzE0PXkKIEJSMl9UT09MQ0hB
SU5fRVhURVJOQUxfSEVBREVSU181XzQ9eQogQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9DVVNUT01f
R0xJQkM9eQogIyBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0lORVRfUlBDIGlzIG5vdCBzZXQKIEJS
Ml9UT09MQ0hBSU5fRVhURVJOQUxfQ1hYPXkKIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfT1BFTk1Q
PXkKIEJSMl9QQUNLQUdFX01FU0EzRD15CiBCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklW
RVJfU09GVFBJUEU9eQogQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9HTFg9eQogQlIyX1BBQ0tB
R0VfWE9SRzc9eQogQlIyX1BBQ0tBR0VfUENNQU5GTT15CgpXaXRoIHRoaXMgZml4LCBwY21hbiBi
dWlsZHMgZmluZSB1cCB0byBhbmQgaW5jbHVkaW5nIGdjYyAxNi4KClNpZ25lZC1vZmYtYnk6IFRo
b21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Ci0tLQogLi4uY2Mx
NC1XZXJyb3ItaW5jb21wYXRpYmxlLXBvaW50ZXItdHlwLnBhdGNoIHwgNDAgKysrKysrKysrKysr
KysrKysrKwogLi4uLUFUS19PQkpFQ1QtcmF0aGVyLXRoYW4tYS1wbGFpbi1jYXN0LnBhdGNoIHwg
MzYgKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNzYgaW5zZXJ0aW9ucygrKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcGNtYW5mbS8wMDAyLUZpeC1idWlsZC13aXRoLWdj
YzE0LVdlcnJvci1pbmNvbXBhdGlibGUtcG9pbnRlci10eXAucGF0Y2gKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3BjbWFuZm0vMDAwMy1Vc2UtQVRLX09CSkVDVC1yYXRoZXItdGhhbi1hLXBs
YWluLWNhc3QucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3BjbWFuZm0vMDAwMi1GaXgtYnVp
bGQtd2l0aC1nY2MxNC1XZXJyb3ItaW5jb21wYXRpYmxlLXBvaW50ZXItdHlwLnBhdGNoIGIvcGFj
a2FnZS9wY21hbmZtLzAwMDItRml4LWJ1aWxkLXdpdGgtZ2NjMTQtV2Vycm9yLWluY29tcGF0aWJs
ZS1wb2ludGVyLXR5cC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li5jNWMzMjMyYmEwCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9wY21hbmZtLzAwMDItRml4
LWJ1aWxkLXdpdGgtZ2NjMTQtV2Vycm9yLWluY29tcGF0aWJsZS1wb2ludGVyLXR5cC5wYXRjaApA
QCAtMCwwICsxLDQwIEBACitGcm9tIGI5N2M2MzBhZjk3OTRjMGY4N2JmM2I4YTBiNzc1MzFiMDM0
ZDMxYTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBNYW1vcnUgVEFTQUtBIDxtdGFz
YWthQGZlZG9yYXByb2plY3Qub3JnPgorRGF0ZTogRnJpLCAyNiBKdWwgMjAyNCAxMjoxMzozMiAr
MDkwMAorU3ViamVjdDogW1BBVENIXSBGaXggYnVpbGQgd2l0aCBnY2MxNCAtV2Vycm9yPWluY29t
cGF0aWJsZS1wb2ludGVyLXR5cGVzCisKK2djYzE0IG5vdyBkZWZhdWx0cyB0byAtV2Vycm9yPWlu
Y29tcGF0aWJsZS1wb2ludGVyLXR5cGVzLgorCitBZGQgcmVxdWlyZWQgY2FzdHMgdG8gdGhlIHJl
dHVybmVkIHBvaW50ZXJzLgorCitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2x4ZGUvcGNt
YW5mbS9jb21taXQvMTJhYmQ3ZTE3OWFkYjllMzFkOTk5ODI0MDQ4YTVmNDBmOTAyMThmZAorU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNv
bT4KKy0tLQorIHNyYy9kZXNrdG9wLmMgfCA0ICsrLS0KKyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvc3JjL2Rlc2t0b3AuYyBi
L3NyYy9kZXNrdG9wLmMKK2luZGV4IDA2ODZhNTkuLmIzNThmNTAgMTAwNjQ0CistLS0gYS9zcmMv
ZGVza3RvcC5jCisrKysgYi9zcmMvZGVza3RvcC5jCitAQCAtMTI2Nyw3ICsxMjY3LDcgQEAgc3Rh
dGljIEF0a09iamVjdCAqZm1fZGVza3RvcF9hY2Nlc3NpYmxlX3JlZl9zZWxlY3Rpb24oQXRrU2Vs
ZWN0aW9uICpzZWxlY3Rpb24sCisgICAgICAgICBpdGVtID0gaXRlbXMtPmRhdGE7CisgICAgICAg
ICBpZiAoaXRlbS0+aXRlbS0+aXNfc2VsZWN0ZWQpCisgICAgICAgICAgICAgaWYgKGktLSA9PSAw
KQorLSAgICAgICAgICAgICAgICByZXR1cm4gZ19vYmplY3RfcmVmKGl0ZW0pOworKyAgICAgICAg
ICAgICAgICByZXR1cm4gKEF0a09iamVjdCAqKWdfb2JqZWN0X3JlZihpdGVtKTsKKyAgICAgfQor
ICAgICByZXR1cm4gTlVMTDsKKyB9CitAQCAtMTQ1NCw3ICsxNDU0LDcgQEAgc3RhdGljIEF0a09i
amVjdCAqZm1fZGVza3RvcF9hY2Nlc3NpYmxlX3JlZl9jaGlsZChBdGtPYmplY3QgKmFjY2Vzc2li
bGUsCisgICAgIGl0ZW0gPSBnX2xpc3RfbnRoX2RhdGEocHJpdi0+aXRlbXMsIGluZGV4KTsKKyAg
ICAgaWYgKCFpdGVtKQorICAgICAgICAgcmV0dXJuIE5VTEw7CistICAgIHJldHVybiBnX29iamVj
dF9yZWYoaXRlbSk7CisrICAgIHJldHVybiAoQXRrT2JqZWN0ICopZ19vYmplY3RfcmVmKGl0ZW0p
OworIH0KKyAKKyBzdGF0aWMgdm9pZCBmbV9kZXNrdG9wX2FjY2Vzc2libGVfaW5pdGlhbGl6ZShB
dGtPYmplY3QgKmFjY2Vzc2libGUsIGdwb2ludGVyIGRhdGEpCistLSAKKzIuNTYuMAorCmRpZmYg
LS1naXQgYS9wYWNrYWdlL3BjbWFuZm0vMDAwMy1Vc2UtQVRLX09CSkVDVC1yYXRoZXItdGhhbi1h
LXBsYWluLWNhc3QucGF0Y2ggYi9wYWNrYWdlL3BjbWFuZm0vMDAwMy1Vc2UtQVRLX09CSkVDVC1y
YXRoZXItdGhhbi1hLXBsYWluLWNhc3QucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uMGM1NjAxNWY3OQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcGNtYW5m
bS8wMDAzLVVzZS1BVEtfT0JKRUNULXJhdGhlci10aGFuLWEtcGxhaW4tY2FzdC5wYXRjaApAQCAt
MCwwICsxLDM2IEBACitGcm9tIDNhZTBlOGQyZTI2ZTZlZTU4MzZkZjc2YjRkYjMzNzhiN2I2MWM4
ZTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBBZGFtIFNhbXBzb24gPGF0c0BvZmZv
Zy5vcmc+CitEYXRlOiBGcmksIDExIEp1bCAyMDI1IDEzOjU5OjU2ICswMTAwCitTdWJqZWN0OiBb
UEFUQ0hdIFVzZSBBVEtfT0JKRUNUIHJhdGhlciB0aGFuIGEgcGxhaW4gY2FzdAorCitVcHN0cmVh
bTogaHR0cHM6Ly9naXRodWIuY29tL2x4ZGUvcGNtYW5mbS9jb21taXQvY2IyZTgxZTRlNTQ1ZmYy
NmRkNmE0MTBjY2M1MjM2NmNjOThiYTg1OAorU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9u
aSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KKy0tLQorIHNyYy9kZXNrdG9wLmMgfCA0
ICsrLS0KKyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQor
CitkaWZmIC0tZ2l0IGEvc3JjL2Rlc2t0b3AuYyBiL3NyYy9kZXNrdG9wLmMKK2luZGV4IGIzNThm
NTAuLjI4YjE5Y2EgMTAwNjQ0CistLS0gYS9zcmMvZGVza3RvcC5jCisrKysgYi9zcmMvZGVza3Rv
cC5jCitAQCAtMTI2Nyw3ICsxMjY3LDcgQEAgc3RhdGljIEF0a09iamVjdCAqZm1fZGVza3RvcF9h
Y2Nlc3NpYmxlX3JlZl9zZWxlY3Rpb24oQXRrU2VsZWN0aW9uICpzZWxlY3Rpb24sCisgICAgICAg
ICBpdGVtID0gaXRlbXMtPmRhdGE7CisgICAgICAgICBpZiAoaXRlbS0+aXRlbS0+aXNfc2VsZWN0
ZWQpCisgICAgICAgICAgICAgaWYgKGktLSA9PSAwKQorLSAgICAgICAgICAgICAgICByZXR1cm4g
KEF0a09iamVjdCAqKWdfb2JqZWN0X3JlZihpdGVtKTsKKysgICAgICAgICAgICAgICAgcmV0dXJu
IEFUS19PQkpFQ1QoZ19vYmplY3RfcmVmKGl0ZW0pKTsKKyAgICAgfQorICAgICByZXR1cm4gTlVM
TDsKKyB9CitAQCAtMTQ1NCw3ICsxNDU0LDcgQEAgc3RhdGljIEF0a09iamVjdCAqZm1fZGVza3Rv
cF9hY2Nlc3NpYmxlX3JlZl9jaGlsZChBdGtPYmplY3QgKmFjY2Vzc2libGUsCisgICAgIGl0ZW0g
PSBnX2xpc3RfbnRoX2RhdGEocHJpdi0+aXRlbXMsIGluZGV4KTsKKyAgICAgaWYgKCFpdGVtKQor
ICAgICAgICAgcmV0dXJuIE5VTEw7CistICAgIHJldHVybiAoQXRrT2JqZWN0ICopZ19vYmplY3Rf
cmVmKGl0ZW0pOworKyAgICByZXR1cm4gQVRLX09CSkVDVChnX29iamVjdF9yZWYoaXRlbSkpOwor
IH0KKyAKKyBzdGF0aWMgdm9pZCBmbV9kZXNrdG9wX2FjY2Vzc2libGVfaW5pdGlhbGl6ZShBdGtP
YmplY3QgKmFjY2Vzc2libGUsIGdwb2ludGVyIGRhdGEpCistLSAKKzIuNTYuMAorCi0tIAoyLjU2
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
