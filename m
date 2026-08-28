Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD3FC61DD6
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 16:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 487E560882;
	Fri, 28 Aug 2026 16:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1oypkjoSCFt; Fri, 28 Aug 2026 16:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787935633;
	bh=AQkVONgShelZJ0lrZjtxEHu3WaDs6+svWl8HMYRGHc8=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Azofrc9CF+A5mnPD4sB2R44qmiVkcroNrTO3bUEje0b7jCfy6/Iq5agzlL/wBzuQt
	 rKzXCmcYa2hlFYPzyJuow/DZHYFTrbVjM9X6U+FBK7wtoT0sofrdtCX/7XF7m1YXQe
	 z7FQjl16a3kopBbEzxzLMlYFR/lCIg4u29S3YakH1lOg+h3iF7H2rUW67uDUDfJRgx
	 GX6WkcJn15LS/LA6MbHn6YGLjuS1WzAgNENK6xBrtR19fAqJqohu5XqPJz3kzhRTss
	 dVsQbWzMGKP9n8+oBOnw0IO2bP9lU7WqZZk69Ai6p3fagC24WOfXn1Y4QE6NfzyIo6
	 jla2dQ9GIb2Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5677560843;
	Fri, 28 Aug 2026 16:47:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E68F127
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 16:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04BC640856
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 16:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Dw4dKa0WZrv for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 16:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=theo.lebrun@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 000DF407A0
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 16:47:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C8A584E41407;
 Fri, 28 Aug 2026 16:47:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9D81660537;
 Fri, 28 Aug 2026 16:47:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AFD6211C78160; 
 Fri, 28 Aug 2026 18:47:02 +0200 (CEST)
Date: Fri, 28 Aug 2026 18:46:47 +0200
MIME-Version: 1.0
Message-Id: <20260828-xdp-tools-tleb-v1-1-463c25b5a99b@bootlin.com>
References: <20260828-xdp-tools-tleb-v1-0-463c25b5a99b@bootlin.com>
In-Reply-To: <20260828-xdp-tools-tleb-v1-0-463c25b5a99b@bootlin.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>, Daniel Lang <dalang@gmx.at>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Valentin Korenblit <valentinkorenblit@gmail.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15-dev
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/4] package/bpftool: disable feature
 auto-detection for host build
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
From: =?utf-8?q?Th=C3=A9o_Lebrun_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gbXkgc3lzdGVtOgoKICAgICQgcmVhZGVsZiAtZCBob3N0L3NiaW4vYnBmdG9vbCB8IGF3ayAn
L05FRURFRC8geyQxPSIiOyBwcmludH0nCiAgICAoTkVFREVEKSBTaGFyZWQgbGlicmFyeTogW2xp
YmVsZi5zby4xXSAgICAgIyBBQ0sKICAgIChORUVERUQpIFNoYXJlZCBsaWJyYXJ5OiBbbGliei5z
by4xXSAgICAgICAjIEFDSwogICAgKE5FRURFRCkgU2hhcmVkIGxpYnJhcnk6IFtsaWJjYXAuc28u
Ml0gICAgICMgTkFDSwogICAgKE5FRURFRCkgU2hhcmVkIGxpYnJhcnk6IFtsaWJMTFZNLnNvLjIy
LjFdICMgTkFDSwogICAgKE5FRURFRCkgU2hhcmVkIGxpYnJhcnk6IFtsaWJjLnNvLjZdICAgICAg
ICMgQUNLCgpBZnRlcjoKCiAgICAkIHJlYWRlbGYgLWQgaG9zdC9zYmluL2JwZnRvb2wgfCBhd2sg
Jy9ORUVERUQvIHskMT0iIjsgcHJpbnR9JwogICAgKE5FRURFRCkgU2hhcmVkIGxpYnJhcnk6IFts
aWJlbGYuc28uMV0KICAgIChORUVERUQpIFNoYXJlZCBsaWJyYXJ5OiBbbGliei5zby4xXQogICAg
KE5FRURFRCkgU2hhcmVkIGxpYnJhcnk6IFtsaWJjLnNvLjZdCgpIb3N0IGJwZnRvb2wgYXV0by1k
ZXRlY3RzIG9wdGlvbmFsIGZlYXR1cmVzIGJ5IHByb2JpbmcgdGhlIHN5c3RlbS4KSW4gbXkgY2Fz
ZSBpdCBmaW5kczoKIC0gbGliY2FwIHdoaWNoIHJlc29sdmVzIHRvIG15IHN5c3RlbSBzaGFyZWQg
b2JqZWN0IGJlY2F1c2UKICAgQlIyX1BBQ0tBR0VfTElCQ0FQPW4uCiAtIGxpYkxMVk0gd2hpY2gg
cmVzb2x2ZXMgdG8gdGhlIEJSMi1idWlsdCBvbmUgdGhhbmtzIHRvIGxsdm0tY29uZmlnIGluCiAg
ICRQQVRILiBCdXQgd2UgZG9uJ3QgaGF2ZSB0aGF0IG1hcmtlZCBhcyBhbiBleHBsaWNpdCBkZXBl
bmRlbmN5LgoKQXZvaWQgdGhlIG1lY2hhbmlzbSBieSBoYXJkY29kaW5nIEZFQVRVUkVfVEVTVFMg
dG8gdGhlIGVtcHR5IHN0cmluZy4KR29hbCBpcyB0byBtYWtlIHRoZSBob3N0LWJwZnRvb2wgbW9y
ZSBoZXJtZXRpYyB0byB0aGUgaG9zdCBzeXN0ZW0uIElmCndlIGV2ZXIgbmVlZCB0aG9zZSBmZWF0
dXJlcyAoZnV0dXJlIHhkcC10b29scyBwYWNrYWdlIGRvZXNuJ3QpLCB0aGVuCndlJ2xsIGFkZCB0
aGUgZGVwZW5kZW5jeSBleHBsaWNpdGx5LgoKU2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0
aGVvLmxlYnJ1bkBib290bGluLmNvbT4KLS0tCiBwYWNrYWdlL2JwZnRvb2wvYnBmdG9vbC5tayB8
IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2JwZnRvb2wvYnBmdG9vbC5tayBiL3BhY2thZ2UvYnBmdG9v
bC9icGZ0b29sLm1rCmluZGV4IDFiNzY1YmEzOGYuLjk0YmU5ZjY3NTQgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvYnBmdG9vbC9icGZ0b29sLm1rCisrKyBiL3BhY2thZ2UvYnBmdG9vbC9icGZ0b29sLm1r
CkBAIC0xMyw2ICsxMyw5IEBAIEJQRlRPT0xfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UgTElDRU5T
RS5CU0QtMi1DbGF1c2UgTElDRU5TRS5HUEwtMi4wCiBCUEZUT09MX0RFUEVOREVOQ0lFUyA9IGJp
bnV0aWxzIGVsZnV0aWxzCiBIT1NUX0JQRlRPT0xfREVQRU5ERU5DSUVTID0gaG9zdC1lbGZ1dGls
cyBob3N0LXBrZ2NvbmYgaG9zdC16bGliCiAKKyMgRGlzYWJsZSB0aGUgYXV0byBkZXRlY3Rpb24g
b2YgZmVhdHVyZXMgb24gdGhlIGhvc3Qgc3lzdGVtLgorSE9TVF9CUEZUT09MX01BS0VfT1BUUyA9
IEZFQVRVUkVfVEVTVFM9CisKIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCQ0FQKSx5KQogQlBGVE9P
TF9ERVBFTkRFTkNJRVMgKz0gbGliY2FwCiBlbmRpZgpAQCAtMjgsNyArMzEsNyBAQCBlbmRlZgog
CiBkZWZpbmUgSE9TVF9CUEZUT09MX0JVSUxEX0NNRFMKIAkkKEhPU1RfTUFLRV9FTlYpICQoSE9T
VF9DT05GSUdVUkVfT1BUUykgJChNQUtFKSBcCi0JCS1DICQoQEQpL3NyYworCQktQyAkKEBEKS9z
cmMgJChIT1NUX0JQRlRPT0xfTUFLRV9PUFRTKQogZW5kZWYKIAogZGVmaW5lIEJQRlRPT0xfSU5T
VEFMTF9UQVJHRVRfQ01EUwoKLS0gCjIuNTUuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
