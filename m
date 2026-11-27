Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D70606A32A
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 13:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=erswVkUI
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5162540A51;
	Fri, 27 Nov 2026 13:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6cXPdOEg12OW; Fri, 27 Nov 2026 13:26:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C8E5240A3A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795785996;
	b=R8KdiLD+JABDzriya4XM+T3AjT+w/3yRCR86YR7c/JlpZ/kARiXDcMvuJpP3allvcRAl
	 rsMIluXBk5Yu0gnePeEQCkPDXkABY9qZoe/+e3Ywo4UrRtV0cmdiL7j0kISi9H01vN2EQ
	 exyVKUfKDG0vz4zEsnfVd3T5g2RvxUp756K4k7q0/xWA80vIyQePwR/WWW76FMUK5pgMb
	 6NbBMUoS4EDgSUP3vwL44oJJuvZnX+xfbBfWeLTY9FJ5EuKuCb8YiUdB9Rw5y8CfbFw5f
	 W2/qIls/RxG3V7Azq4+FLnTyabCOAaGP2Ag0+XjaktZB+F1++svW0m+uGne+mIZK5cQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795785996;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:X-Mailer:X-Last-TLS-Session-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=auhgPTCUVTggGTNkr8DcKy29udvYu22X6Yms5BB6+k4=;
	b=KkYlA/lALwgMTrlCbE/tCa3+I0djhS1Wq9rozBZilwJzNGJQKOzbA6HI8ttuHYsI2CMZ
	 FBSzKbkPxiI3LZPj8bHo7E4nnDXRVKGIPmdQUllamMIoXOCy/CKipllflGMwHKms9Um36
	 fJnaV5ssX1M0K4dK0kpQ0Ei24FzA6v4iK0aVf29digdgYW+QcLkk2h4x+AmDVd1k6CW6f
	 F/XLolAzVwarXvO1F/4/b+EqaDkHJ4WwLr7YIx0RA6MVUtp57q5IZ0TRwRHGNsvCx1Z7m
	 qFTccW8tFewSmk9NBZId9xCNzeMpru9QlGuqY/8v0iXkCbe4hbwCDMW1rIk+SpbztHg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795785996;
	bh=auhgPTCUVTggGTNkr8DcKy29udvYu22X6Yms5BB6+k4=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=erswVkUI3DtE5t2NL8sHfEDQxnBMXuhmA7Ei1mv/qfiX4pDXzli+maH95j4qcG9Hr
	 EimN0wpCCnvi5YDaebPThAZ44h1/9S9DZTiJW7/xgdqb4vAvvLleyAQfgqRTGxiP9S
	 e0wmQenHfthG/sn0o4voVfB5vfLAjsp3VCejY3xaFJJD8SR1v85T0Q+FH7xA/VkEt/
	 55GL0WAz+8RgkxYuTAHrgfFny5EhNW1rig6qSHfsneBO8rXCX+SJMyYVPmr58YGIqr
	 eielSc+HuHp3uQmUmDawvrQaaleHH+6Mc7UNuKJwtTzg1hrGOpN3ek5AusOtwoBi9z
	 w/wgqTISnxG+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8E5240A3A;
	Fri, 27 Nov 2026 13:26:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 29AD026D
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 13:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B51C81205
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 13:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJlgGtGoLx-p for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 13:26:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 31C6C8121F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=theo.lebrun@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31C6C8121F
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 13:26:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B5DB41A1836;
 Fri, 27 Nov 2026 13:26:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8BFA56049C;
 Fri, 27 Nov 2026 13:26:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 16F4411E68913; Fri, 27 Nov 2026 14:26:28 +0100 (CET)
Date: Fri, 27 Nov 2026 14:26:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-xdp-tools-tleb-v2-1-686bf38f45b8@bootlin.com>
References: <20261127-xdp-tools-tleb-v2-0-686bf38f45b8@bootlin.com>
In-Reply-To: <20261127-xdp-tools-tleb-v2-0-686bf38f45b8@bootlin.com>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Valentin Korenblit <valentinkorenblit@gmail.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2 1/2] package/llvm: add option to build the
 BPF backend in host-llvm
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Th=C3=A9o_Lebrun_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QSBwYWNrYWdlIHRoYXQgY3Jvc3MtY29tcGlsZXMgQlBGIHByb2dyYW1zIGF0IGJ1aWxkLXRpbWUg
bmVlZHMgYQpob3N0LWNsYW5nIHdpdGggQlBGIGJhY2tlbmQuIFRvZGF5LCBpdCBpcyBvbmx5IHBv
c3NpYmxlIHRocm91Z2ggYQpiZWhhdmlvciB0aGF0IGxvb2tzIGxpa2UgYSBidWc6IGlmIEJSMl9Q
QUNLQUdFX0xMVk1fQlBGPXkgdGhlbgpgTExWTV9UQVJHRVRTX1RPX0JVSUxEICs9IEJQRmAgYW5k
IEhPU1RfTExWTV9DT05GX09QVFMgaW5oZXJpdHMgdGhpcwppbXBsaWNpdGx5IGJlY2F1c2Ugb2Yg
dGhlIGRlZmVycmVkIGV4cGFuc2lvbiBvZiBMTFZNX1RBUkdFVFNfVE9fQlVJTEQuCgpDaGFuZ2Vz
OgooMSkgQlIyX1BBQ0tBR0VfTExWTV9CUEY9eSBkb2VzIG5vdCBpbXBseSBCUEYgYmFja2VuZCBp
biBob3N0LWxsdm0uCigyKSBDcmVhdGUgYSBuZXcgQlIyX1BBQ0tBR0VfSE9TVF9MTFZNX0JQRiBj
b25maWcgZW50cnkuCigzKSBTdXBwb3J0IGJ1aWxkaW5nIGhvc3QtbGx2bSB3aXRoIEJQRiBhcyBz
b2xlIGJhY2tlbmQuCgpBYm91dCAoMyk6IG1ha2Ugc3VyZSBOT1QgdG8gcGFzcyBhbiBlbXB0eSAt
RExMVk1fVEFSR0VUX0FSQ0g9IGVsc2UgbGx2bQpyZWZ1c2VzIGNvbXBpbGF0aW9uLiBUaGUgZmxh
ZyBtdXN0IG5vdCBiZSBwcmVzZW50IGZvciBMTFZNIHRvIGFjY2VwdApidWlsZGluZyB3aXRoIG9u
bHkgdGhlIEJQRiBiYWNrZW5kLgoKU2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxl
YnJ1bkBib290bGluLmNvbT4KLS0tCiBwYWNrYWdlL0NvbmZpZy5pbi5ob3N0ICAgICAgICAgICAg
ICAgICAgIHwgIDEgKwogcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9Db25maWcuaW4uaG9zdCB8
IDEwICsrKysrKysrKysKIHBhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tayAgICAgICAg
fCAxMiArKysrKysrKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdl
L0NvbmZpZy5pbi5ob3N0CmluZGV4IDU5NWNhZjllN2YuLjQyNGQzZTBhYzIgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2UvQ29uZmlnLmluLmhvc3QKKysrIGIvcGFja2FnZS9Db25maWcuaW4uaG9zdApAQCAt
NjMsNiArNjMsNyBAQCBtZW51ICJIb3N0IHV0aWxpdGllcyIKIAlzb3VyY2UgInBhY2thZ2Uva21v
ZC9Db25maWcuaW4uaG9zdCIKIAlzb3VyY2UgInBhY2thZ2UvbGlicDExL0NvbmZpZy5pbi5ob3N0
IgogCXNvdXJjZSAicGFja2FnZS9sbHZtLXByb2plY3QvbGxkL0NvbmZpZy5pbi5ob3N0IgorCXNv
dXJjZSAicGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9Db25maWcuaW4uaG9zdCIKIAlzb3VyY2Ug
InBhY2thZ2UvbHBjMzI1MGxvYWRlci9Db25maWcuaW4uaG9zdCIKIAlzb3VyY2UgInBhY2thZ2Uv
bHR0bmctYmFiZWx0cmFjZS9Db25maWcuaW4uaG9zdCIKIAlzb3VyY2UgInBhY2thZ2UvbHptYS1h
bG9uZS9Db25maWcuaW4uaG9zdCIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xs
dm0vQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL0NvbmZpZy5pbi5o
b3N0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjdlNzI5NGIyYWQKLS0t
IC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL0NvbmZpZy5pbi5ob3N0
CkBAIC0wLDAgKzEsMTAgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX0xMVk1fQlBGCisJYm9v
bCAiaG9zdCBsbHZtIEJQRiBiYWNrZW5kIgorCWhlbHAKKwkgIEJ1aWxkIHRoZSBCUEYgYmFja2Vu
ZCBpbiBob3N0LWxsdm0gc28gdGhhdCBob3N0LWNsYW5nIGNhbgorCSAgY29tcGlsZSBlQlBGIG9i
amVjdHMuIFRoaXMgaXMgc3VwcG9ydGVkIGV2ZW4gd2l0aCBCUEYgYXMKKwkgIHNvbGUgYmFja2Vu
ZC4KKworCSAgRW5hYmxpbmcgdGhpcyBvcHRpb24gZG9lcyBub3QgYnVpbGQgaG9zdCBMTFZNIGJ5
IGl0c2VsZjogYQorCSAgcGFja2FnZSBkZXBlbmRpbmcgb24gaG9zdC1jbGFuZyB0cmlnZ2VycyB0
aGUgaG9zdCBMTFZNL2NsYW5nCisJICBidWlsZC4KZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGx2bS1w
cm9qZWN0L2xsdm0vbGx2bS5tayBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tawpp
bmRleCBmYjU5YWE2NGU4Li5lMTgxNTkxNjZiIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xsdm0tcHJv
amVjdC9sbHZtL2xsdm0ubWsKKysrIGIvcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9sbHZtLm1r
CkBAIC01MywxNCArNTMsMTYgQEAgTExWTV9UQVJHRVRTX1RPX0JVSUxEID0gUklTQ1YKIGVsc2UK
IExMVk1fVEFSR0VUU19UT19CVUlMRCA9ICQoTExWTV9UQVJHRVRfQVJDSCkKIGVuZGlmCi1IT1NU
X0xMVk1fQ09ORl9PUFRTICs9IC1ETExWTV9UQVJHRVRTX1RPX0JVSUxEPSIkKHN1YnN0ICQoc3Bh
Y2UpLDssJChMTFZNX1RBUkdFVFNfVE9fQlVJTEQpKSIKIExMVk1fQ09ORl9PUFRTICs9IC1ETExW
TV9UQVJHRVRTX1RPX0JVSUxEPSIkKHN1YnN0ICQoc3BhY2UpLDssJChMTFZNX1RBUkdFVFNfVE9f
QlVJTEQpKSIKIAogIyBMTFZNIHRhcmdldCB0byB1c2UgZm9yIG5hdGl2ZSBjb2RlIGdlbmVyYXRp
b24uIFRoaXMgaXMgcmVxdWlyZWQgZm9yIEpJVCBnZW5lcmF0aW9uLgogIyBJdCBtdXN0IGJlIHNl
dCB0byBMTFZNX1RBUkdFVF9BUkNIIGZvciBob3N0IGFuZCB0YXJnZXQsIG90aGVyd2lzZSB3ZSBn
ZXQKICMgIk5vIGF2YWlsYWJsZSB0YXJnZXRzIGFyZSBjb21wYXRpYmxlIGZvciB0aGlzIHRyaXBs
ZSIgd2l0aCBsbHZtcGlwZSB3aGVuIGhvc3QKICMgYW5kIHRhcmdldCBhcmNoaXRlY3R1cmVzIGFy
ZSBkaWZmZXJlbnQuCisjIGhvc3QtbGx2bSB3aXRoIExMVk1fVEFSR0VUX0FSQ0ggZW1wdHkgaXMg
c3VwcG9ydGVkIHRvIGdldCBvbmx5IHRoZSBCUEYgYmFja2VuZC4KK2lmbmVxICgkKExMVk1fVEFS
R0VUX0FSQ0gpLCkKIEhPU1RfTExWTV9DT05GX09QVFMgKz0gLURMTFZNX1RBUkdFVF9BUkNIPSQo
TExWTV9UQVJHRVRfQVJDSCkKK2VuZGlmCiBMTFZNX0NPTkZfT1BUUyArPSAtRExMVk1fVEFSR0VU
X0FSQ0g9JChMTFZNX1RBUkdFVF9BUkNIKQogCiAjIEJ1aWxkIEFNREdQVSBiYWNrZW5kCkBAIC03
Miw2ICs3NCwxNCBAQCBpZmVxICgkKEJSMl9QQUNLQUdFX0xMVk1fQU1ER1BVKSx5KQogTExWTV9U
QVJHRVRTX1RPX0JVSUxEICs9IEFNREdQVQogZW5kaWYKIAorIyBIb3N0IExMVk0gdGFyZ2V0cy4g
U25hcHNob3QgdGhlIHRhcmdldCBsaXN0IGhlcmUgYW5kIGlnbm9yZQorIyB3aGF0J3MgY29taW5n
IGFmdGVyIChCUEYgaWYgQlIyX1BBQ0tBR0VfTExWTV9CUEYpLgorSE9TVF9MTFZNX1RBUkdFVFNf
VE9fQlVJTEQgOj0gJChMTFZNX1RBUkdFVFNfVE9fQlVJTEQpCitpZmVxICgkKEJSMl9QQUNLQUdF
X0hPU1RfTExWTV9CUEYpLHkpCitIT1NUX0xMVk1fVEFSR0VUU19UT19CVUlMRCArPSBCUEYKK2Vu
ZGlmCitIT1NUX0xMVk1fQ09ORl9PUFRTICs9IC1ETExWTV9UQVJHRVRTX1RPX0JVSUxEPSIkKHN1
YnN0ICQoc3BhY2UpLDssJChIT1NUX0xMVk1fVEFSR0VUU19UT19CVUlMRCkpIgorCiAjIEJ1aWxk
IEJQRiBiYWNrZW5kCiBpZmVxICgkKEJSMl9QQUNLQUdFX0xMVk1fQlBGKSx5KQogTExWTV9UQVJH
RVRTX1RPX0JVSUxEICs9IEJQRgoKLS0gCjIuNTYuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
