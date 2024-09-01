Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAF9CA101E
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 14:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CEF960784;
	Sun,  1 Sep 2024 14:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjZS_hAAbc4w; Sun,  1 Sep 2024 14:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F7076077B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F7076077B;
	Sun,  1 Sep 2024 14:29:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DD311BF2B6
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A6E540535
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iry1B3rZYYxp for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 14:29:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D2B9E4051A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2B9E4051A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2B9E4051A
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 14:29:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.78.25.164]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Ycr-1snmWP3w9D-005R9Q; Sun, 01
 Sep 2024 16:29:46 +0200
Date: Sun, 01 Sep 2024 16:29:45 +0200
MIME-Version: 1.0
Message-Id: <20240901-rgbmatrix-v2-2-3a10c3c367e4@gmx.net>
References: <20240901-rgbmatrix-v2-0-3a10c3c367e4@gmx.net>
In-Reply-To: <20240901-rgbmatrix-v2-0-3a10c3c367e4@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725200985; l=3999;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=yrOASiMjn2peLGfcZjJkRUm9pkqnJucC10k1LaBi2TA=;
 b=3UX3mcYH9ea94DtZW+Wquw7GSadmCjeHoasQ/h6YQJehkSyikSElr3K1Ch5sVjMFpFCydN7Lw
 op/Dbj1gQ2YAbc9u6MM5VjB004RQhAsYR30+swOgCxMwHgVQ2jWbaXJ
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:SVPekcOn5Z3F4ozBHFLhGynF5E2JCKBRalc8tWrCwJzKuzuSJel
 4jw8yg0GwRwZTUZ7xxpSGSzdmlP3+jQG/m9OuFc5N/1nQr9VZGFzC1zb6GtGgdtfz5YLMMS
 H44tTR70zs55dtqGa9gDg8ZX6ffZKjqqVrKhnsKvp60dXw4K2Nfr3FyA7sr7KUrgJo77ZUy
 8jEeUi6NrjKnp7UhM5ISg==
UI-OutboundReport: notjunk:1;M01:P0:nuHKyKrvMl8=;FRfDqrjn8zP1hEfZYqUk6DzDZN+
 AseXbUBoApddQY5gjeHQ/ESPmaNmU0onAbFcgWVvWZyMXlJl0Qhi8WcLf/GM5Qk46zGKkyuJA
 8zPU7ste7AhCYRI57VweNhAACA1UT4VnkSTYUnMCdm+vENb3lhK8i8xjHn6Fi/GdWV3ek01t+
 IUyTwGX+f5PXFR9p4k9JEyEtD0LkEEPJn4/7mpQ99JICDUAoZrwdUGDOMDzfvTwxG473AAUwW
 AL0mwRvo98oLrHfow18F7uBwoLA2OS7pHaZm8DD1/s7u2LWDbu944+ONS9HilUCHrxubRuRJE
 aTntYsOowPVvVR3DyE4s2N2EFgpwVDU8OqmQrUnHw1AJlcIZ2rU5QZrFA6L1utNT2r/fIc7pV
 CDCi2oywwATMcm/AkscSxZljTTRGy8G9N9zXKxgZ61GjQxV4ZHrOSe8WtODSHTlE7CUqEFRfG
 oxe/BL0bvXENLVs6RgRAUDup0kGlOalr5gfF9wMS6+i7F/A1nDpBq0nO51VdXVKTfk8UwNGWP
 GttHDfm05s3+FqNYtXj3IyveTtY1zwQ+ox/xp1BAoKodoEMOG88DuZAH1pUjjQ/r7R1C/Lsjq
 55tHMLy2SAR/V+yehZkBHDeuZSEY6CcT06YeZdkDmNq/mAM9ZUueSZbtSaO2lAypxAEgMdqFt
 dNnlOXspBGSV3Odw007+bHK57WZrKjilHJCqTklc44vnrVuqKUfkXki7ni8sZqd5wJ/Ac1RWy
 taWXT6OrfFVxtBsU/IGrbuBUDuK8DV706YSueAnW6KiXG6EqX7/0sn24kE+DTj6VLV02ZCpRP
 IrHyxoy0AUT0UQXRHQjQvV4Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1725200987; x=1725805787; i=j.neuschaefer@gmx.net;
 bh=/C6fmE45C0k1o+LSW0st/bSRQWR6CKX3JnuDejqzkSE=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=gGTn1C5WmYwxgF6j6idKu79qGl5bRTv99Ys+Aqm5+HlE2OrPDygA9qLwyiZVebCu
 cxPyOxS5wCVBuBFUBetNUkuqTHDTKs3wSsbo9rNeYxwAKNwRWh4CwdA4wm0IgEqHq
 VQlw40JuLktj3woAZo3j7vqLTG1l9vW0paB2PaBI/M3Y7nROsS76J7MaMis462bRZ
 sfJ2rXF67shoNeTCrKR/QEgw+ArDUYszLrnKydtGqCh9LmMGitYk29yTLrK64r3Xs
 9q1WK9zBWWZwMv0YnzNhMvmDtd2h+xV5GyDLpNKSIR3t2j59/6ok9MPLNpMr0BtmN
 04d4i4jpISzPc9de9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=gGTn1C5W
Subject: [Buildroot] [PATCH v2 2/3] package/python-rgbmatrix: new package
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
LS0KIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKIHBhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9Db25maWcuaW4gICAgICAgICAgICAgICB8ICA4
ICsrKysrKysrCiBwYWNrYWdlL3B5dGhvbi1yZ2JtYXRyaXgvcHl0aG9uLXJnYm1hdHJpeC5oYXNo
ICAgfCAgMyArKysKIHBhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9weXRob24tcmdibWF0cml4Lm1r
ICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9ycGktcmdiLWxlZC1t
YXRyaXgvcnBpLXJnYi1sZWQtbWF0cml4Lm1rIHwgIDEgKwogNSBmaWxlcyBjaGFuZ2VkLCAzNyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0Nv
bmZpZy5pbgppbmRleCAwN2JkMTQ5OWQ4Li5iMzY2NWE3NTY5IDEwMDY0NAotLS0gYS9wYWNrYWdl
L0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMTM0Myw2ICsxMzQzLDcgQEAg
bWVudSAiRXh0ZXJuYWwgcHl0aG9uIG1vZHVsZXMiCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1y
ZXF1ZXN0cy1vYXV0aGxpYi9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1yZXF1
ZXN0cy10b29sYmVsdC9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1yZmMzOTg3
L0NvbmZpZy5pbiIKKwlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9Db25maWcuaW4i
CiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1ycGRzLXB5L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBh
Y2thZ2UvcHl0aG9uLXJwaS1ncGlvL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9u
LXJwaS13czI4MXgvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcmdibWF0
cml4L0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9Db25maWcuaW4KbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uM2IzOWJkNTAwYwotLS0gL2Rldi9udWxs
CisrKyBiL3BhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9Db25maWcuaW4KQEAgLTAsMCArMSw4IEBA
Citjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX1JHQk1BVFJJWAorCWJvb2wgInB5dGhvbi1yZ2Jt
YXRyaXgiCisJZGVwZW5kcyBvbiBCUjJfYWFyY2g2NCB8fCBCUjJfYXJtCisJZGVwZW5kcyBvbiBC
UjJfSU5TVEFMTF9MSUJTVERDUFAKKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVB
RFMKKwlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSE9T
VF9QWVRIT05fQ1lUSE9OCisJc2VsZWN0IEJSMl9QQUNLQUdFX1JQSV9SR0JfTEVEX01BVFJJWApk
aWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcmdibWF0cml4L3B5dGhvbi1yZ2JtYXRyaXguaGFz
aCBiL3BhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9weXRob24tcmdibWF0cml4Lmhhc2gKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMTc1MDgxZWI1ZAotLS0gL2Rldi9udWxs
CisrKyBiL3BhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9weXRob24tcmdibWF0cml4Lmhhc2gKQEAg
LTAsMCArMSwzIEBACisjIExvY2FsbHkgY29tcHV0ZWQKK3NoYTI1NiAgOWE2ZGE1YjBhZDczMDg4
M2E1ZmExOGFmYzU5YjEyOTdiNGIwNWViNTgxYzJjMTRhZTUwYTM1ODMyOTZhNGJlZCAgcHl0aG9u
LXJnYm1hdHJpeC1mNTU3MzZmNzU5NWJjMDI4NDUxNjU4OTk2ZWVkZWE5NzQyNjg4YmJjLnRhci5n
egorc2hhMjU2ICA4MTc3Zjk3NTEzMjEzNTI2ZGYyY2Y2MTg0ZDhmZjk4NmM2NzVhZmI1MTRkNGU2
OGE0MDQwMTA1MjFiODgwNjQzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1y
Z2JtYXRyaXgvcHl0aG9uLXJnYm1hdHJpeC5tayBiL3BhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeC9w
eXRob24tcmdibWF0cml4Lm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAu
LjJiZDViYzk3YjcKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5dGhvbi1yZ2JtYXRyaXgv
cHl0aG9uLXJnYm1hdHJpeC5tawpAQCAtMCwwICsxLDI0IEBACisjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIworIworIyBweXRob24tcmdibWF0cml4CisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwor
CisjIFdoZW4gdXBkYXRpbmcgdGhlIHZlcnNpb24sIHBsZWFzZSBhbHNvIHVwZGF0ZSBycGktcmdi
LWxlZC1tYXRyaXgKK1BZVEhPTl9SR0JNQVRSSVhfVkVSU0lPTiA9IGY1NTczNmY3NTk1YmMwMjg0
NTE2NTg5OTZlZWRlYTk3NDI2ODhiYmMgICMgMjAyNC0wOC0xOAorUFlUSE9OX1JHQk1BVFJJWF9T
SVRFID0gJChjYWxsIGdpdGh1YixoemVsbGVyLHJwaS1yZ2ItbGVkLW1hdHJpeCwkKFBZVEhPTl9S
R0JNQVRSSVhfVkVSU0lPTikpCitQWVRIT05fUkdCTUFUUklYX0xJQ0VOU0UgPSBHUEwtMi4wCitQ
WVRIT05fUkdCTUFUUklYX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCitQWVRIT05fUkdCTUFUUklY
X0lOU1RBTExfU1RBR0lORyA9IFlFUworUFlUSE9OX1JHQk1BVFJJWF9TRVRVUF9UWVBFID0gc2V0
dXB0b29scworUFlUSE9OX1JHQk1BVFJJWF9TVUJESVIgPSBiaW5kaW5ncy9weXRob24KK1BZVEhP
Tl9SR0JNQVRSSVhfREVQRU5ERU5DSUVTID0gaG9zdC1weXRob24tY3l0aG9uIHJwaS1yZ2ItbGVk
LW1hdHJpeAorCisjIEdlbmVyYXRlIGJpbmRpbmdzIHdpdGggY3l0aG9uCitkZWZpbmUgUFlUSE9O
X1JHQk1BVFJJWF9DWVRIT04KKwkkKE1BS0UpICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSAtQyAk
KEBEKS9iaW5kaW5ncy9weXRob24vcmdibWF0cml4IFwKKwkJQ1lUSE9OPSQoSE9TVF9ESVIpL2Jp
bi9jeXRob24gYWxsCitlbmRlZgorUFlUSE9OX1JHQk1BVFJJWF9QUkVfQlVJTERfSE9PS1MgKz0g
UFlUSE9OX1JHQk1BVFJJWF9DWVRIT04KKworJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9ycGktcmdiLWxlZC1tYXRyaXgvcnBpLXJnYi1sZWQtbWF0cml4Lm1r
IGIvcGFja2FnZS9ycGktcmdiLWxlZC1tYXRyaXgvcnBpLXJnYi1sZWQtbWF0cml4Lm1rCmluZGV4
IDUzNDA4OTk2YTMuLjIzNTkyN2ZhMWMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcnBpLXJnYi1sZWQt
bWF0cml4L3JwaS1yZ2ItbGVkLW1hdHJpeC5taworKysgYi9wYWNrYWdlL3JwaS1yZ2ItbGVkLW1h
dHJpeC9ycGktcmdiLWxlZC1tYXRyaXgubWsKQEAgLTQsNiArNCw3IEBACiAjCiAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwoKKyMgV2hlbiB1cGRhdGluZyB0aGUgdmVyc2lvbiwgcGxlYXNlIGFsc28g
dXBkYXRlIHB5dGhvbi1yZ2JtYXRyaXgKIFJQSV9SR0JfTEVEX01BVFJJWF9WRVJTSU9OID0gZjU1
NzM2Zjc1OTViYzAyODQ1MTY1ODk5NmVlZGVhOTc0MjY4OGJiYyAgIyAyMDI0LTA4LTE4CiBSUElf
UkdCX0xFRF9NQVRSSVhfU0lURSA9ICQoY2FsbCBnaXRodWIsaHplbGxlcixycGktcmdiLWxlZC1t
YXRyaXgsJChSUElfUkdCX0xFRF9NQVRSSVhfVkVSU0lPTikpCiBSUElfUkdCX0xFRF9NQVRSSVhf
TElDRU5TRSA9IEdQTC0yLjAKCi0tCjIuNDUuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
