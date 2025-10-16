Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0042CCD19A
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 14:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23F478470D;
	Thu, 16 Oct 2025 14:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQXSfSbVO9tL; Thu, 16 Oct 2025 14:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CE18846FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CE18846FA;
	Thu, 16 Oct 2025 14:46:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10C9A961
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 14:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAC4F41F92
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 14:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGyS-hE1rOxn for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 14:46:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AA7FB41F91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA7FB41F91
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA7FB41F91
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 14:46:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4F92F4E410EE;
 Thu, 16 Oct 2025 14:46:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 16ACD6062C;
 Thu, 16 Oct 2025 14:46:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2361A102F22F7; 
 Thu, 16 Oct 2025 16:46:41 +0200 (CEST)
Date: Thu, 16 Oct 2025 16:46:33 +0200
Message-Id: <20251016-openscap-v3-0-d7b28e958f5f@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEkF8WgC/1WMUQvCIBRG/0rc5wy9bgo99T+iB6d3TSgdOqQY+
 ++5EbQez8d3zgyZkqcM58MMiYrPPoYK8ngAO5hwJ+ZdZUCOLdfYsDhSyNaMTAul+o5EqwVBvY+
 Jev/aUtdb5cHnKab3Vi5iXb8RyX+RIhhnjaLGSCRUzly6GKeHDycbn7BmCu5VsVOxqq3TPVluO
 6ncv7osywf+bCl03QAAAA==
X-Change-ID: 20250724-openscap-7166fbe1571e
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760626010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=QgcTnlmmP/ekEqkyZ22UShXPrAITcX3fn4v8GoPHu54=;
 b=wgzdK3/KGYFJqR1JxXgLE7Tc8KYVAF4wLRtjcWimCcTr9OS5Sqsn20G1mMUfvKwKLmOsKP
 4wZnSESWEVlL5OBXUUIfxFfzVu7vGGHYNVJ3fVQCskW7PjcgA86O8CJpF6NUOA67eSwIos
 gy+0Vu4UjsrZ0e3n+eMsqZs/V4MZXEKG2P1xf+F3QJzkI1GwQTNs6+Xmn5MKAt8N43ftfo
 48c67HFBTnMAlxU8Ylw1RQoPV1S8DGm+6olaOIFQFvl51LlYTMEIkuUC8rGLlp+w7zPdAA
 Oav13BMwVVV6qwmiF7K5a6k5dPDZtZyJGniJ1JkcUXDKXA3NEzdQbiRztbzE1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=wgzdK3/K
Subject: [Buildroot] [PATCH v3 0/5] package/compliance-as-code: introduce
 new package
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: tim.hammer@nav-timing.safrangroup.com,
 nicolas.carrier@nav-timing.safrangroup.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCnRoaXMgaXMgdGhlIHYzIG9mIHRoZSBzZXJpZXMgYnJpbmdpbmcgaW4gQ29tcGxpYW5j
ZSBBcyBDb2RlIHBvbGljaWVzIFsxXQooQ2FDKSBvbiBhIHRhcmdldC4gdjIgaGFzIG5vdCByZWNl
aXZlZCBhbnkgbmV3IHJldmlldyBzaW5jZSBpdCBoYXMgYmVlbgpzZW50LCBidXQgaW4gdGhlIG1l
YW4gdGltZSwgSSBmb3VuZCBzb21lIHNtYWxsIGlzc3VlcyAoZWl0aGVyIGF0IGJ1aWxkCnRpbWUg
b3IgcnVudGltZSwgZHVlIHRvIGEgbGFjayBpbiBteSB0ZXN0aW5nIHNldHVwKSBzbyB0aGlzIG5l
dyByZXZpc2lvbgphY3RzIGJvdGggYXMgYW4gdXBkYXRlIGFuZCBhIHJlc2VuZC4KClRoaXMgcHJv
amVjdCBhaW1zIHRvIHByb3ZpZGUgc2VjdXJpdHkgcG9saWN5IGNvbnRlbnQgb24gc3lzdGVtczog
dGhpcwpjb250ZW50IGJyaW5ncyBkYXRhIGZpbGVzIGRlc2NyaWJpbmcgY2hlY2tzIHN0YW5kYXJk
cyBhbmQgYXV0b21hdGlvbnMKZm9yIHN5c3RlbSBjb25maWd1cmF0aW9uLiAgVGhvc2UgZmlsZXMg
Y29tZSBpbiB2YXJpb3VzIGZvcm1hdHMgKFhDQ0RGLApPVkFMLCBTQ0FQKS4gIFRoaXMgcHJvamVj
dCBpcyB0aWdodGx5IGNvdXBsZWQgdG8gdGhlIE9wZW5TQ0FQIHRvb2wgWzJdOgotIHRvIGJ1aWxk
IHRoZSBkYXRhIGZpbGVzIHRvIGVtYmVkIG9uIHRoZSB0YXJnZXQgc3lzdGVtCi0gYW5kIHRvIHBl
cmZvcm0gYW5hbHlzaXMgb24gdGhlIHN5c3RlbSwgYnkgY29uc3VtaW5nIHRoZSBkYXRhIGZpbGVz
CgpDYUMgdGhlbiBkZXBlbmRzIG9uIGJvdGggb3BlbnNjYXAgYW5kIGhvc3Qtb3BlbnNjYXAuClRo
ZSBzZXJpZXMgYnJpbmdzIGluIHRoZSBmb2xsb3dpbmcgY29tbWl0czoKLSBjb21taXQgMSBicmlu
Z3MgbGlieG1zZWMxLCBvbmUgb2Ygb3BlbnNjYXAgZGVwZW5kZW5jaWVzCi0gY29tbWl0IDIgYnJp
bmdzIGJhY2sgaG9zdC1saWJjdXJsICh3aGljaCBoYXMgYmVlbiBzdXBwb3J0ZWQgYW5kIGxhdGVy
CiAgcmVtb3ZlZCBmcm9tIEJSLCBhcyB0aGVyZSB3YXMgbm8gdXNlciBhbnltb3JlKSwgc2luY2Ug
aG9zdC1vcGVuc2NhcAogIG5lZWRzIGhvc3QtbGliY3VybAotIGNvbW1pdCAzIGJyaW5ncyBvcGVu
c2NhcCBwYWNrYWdlCi0gY29tbWl0IDQgYnJpbmdzIENhQyBwYWNrYWdlCgpUaGUgbmV3IENhQyBw
YWNrYWdlIGJyaW5ncyBhIG1pbmltYWwgZmVhdHVyZSBzZXQgZm9yIG5vdzogaXQgb25seSBicmlu
Z3MKdGhlIHNlY3VyaXR5IHBvbGljeSBkYXRhIGZpbGVzIChpZTogWE1MIGZpbGVzKSBvbiB0aGUg
dGFyZ2V0LiBJdCBjYW4gYmUKZXh0ZW5kZWQgbGF0ZXIgYXMgbmVlZGVkIHRvIGJyaW5nIGluIGZv
ciBleGFtcGxlIGdlbmVyYXRlZCBiYXNoIHNjcmlwdCwKYW5zaWJsZSBwbGF5Ym9va3MsIGV0Yy4K
ClRlc3Rpbmcgb3V0cHV0OgokIC4vdXRpbHMvdGVzdC1wa2cgLWMgY2FjLmNvbmZpZyAtcCBjb21w
bGlhbmNlLWFzLWNvZGUKICAgYm9vdGxpbi1hcm12NS11Y2xpYmMgWzEvNl06IE9LCiAgIGJvb3Rs
aW4tYXJtdjctZ2xpYmMgWzIvNl06IE9LCiAgIGJvb3RsaW4tYXJtdjdtLXVjbGliYyBbMy82XTog
U0tJUFBFRAogICBib290bGluLXg4Ni02NC1tdXNsIFs0LzZdOiBPSwogICBici1hcm0tZnVsbC1z
dGF0aWMgWzUvNl06IFNLSVBQRUQKICAgYXJtLWFhcmNoNjQgWzYvNl06IE9LCgpbMV0gaHR0cHM6
Ly9naXRodWIuY29tL0NvbXBsaWFuY2VBc0NvZGUvY29udGVudApbMl0gaHR0cHM6Ly9naXRodWIu
Y29tL09wZW5TQ0FQL29wZW5zY2FwCgpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFs
ZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KQ2hhbmdlcyBpbiB2MzoKLSBhZGRlZCBtaXNz
aW5nIC0tZGlzYWJsZS1saWJwc2wgZm9yIGhvc3QtbGliY3VybCB0byBwcmV2ZW50IGJ1aWxkCiAg
ZmFpbHVyZQotIG1ha2Ugb3BlbnNjYXAgc2VsZWN0cyBDT05GSUdfQlIyX1BBQ0tBR0VfUENSRV9V
VEYgdG8gcHJldmVudCBydW50aW1lCiAgZmFpbHVyZQotIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyNTA3MzEtb3BlbnNjYXAtdjItMC01ZDdmZWMwY2IzNmRAYm9vdGxp
bi5jb20KCkNoYW5nZXMgaW4gdjI6Ci0gcmV3b3JkZWQgY29tbWl0cyB0aXRsZXMgYW5kIG1lc3Nh
Z2VzCi0gcmVmb3JtYXRlZCwgcmVvcmRlcmVkIGNvbnRlbnQgYW5kL29yIGNsZWFuZWQgbXVsdGlw
bGUgZmlsZXMKLSBhZGRlZCBLY29uZmlnIGNvbW1lbnRzIGZvciB0b29sY2hhaW4gZGVwcwotIGFk
ZGVkIG1pc3NpbmcgREVWRUxPUEVSUyBlbnRyeQotIGZpeGVkIGxpY2Vuc2luZyBpc3N1ZXMgZm9y
IG9wZW5zY2FwCi0gZGlzYWJsZWQgcHl0aG9uMyBpbiBvcGVuc2NhcAotIHJlbW92ZWQgc29tZSBu
b24gZXhpc3RpbmcgS0NvbmZpZyBkZXBlbmRlbmNpZXMgYW5kIGhvb2tzIAotIGZpeGVkIEtDb25m
aWcgbWFuYWdlbWVudCBpbiBDYUMgLm1rIGZpbGUKLSB1cGRhdGVkIGluc3RhbGwgdGFyZ2V0IGlu
IENhQyB0byB1c2UgY3AKLSBpbnRyb2R1Y2VkIGEgc2ltcGxlIHJ1bnRpbWUgdGVzdCBmb3Igb3Bl
bnNjYXAvQ2FDCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDcz
MC1vcGVuc2NhcC12MS0wLTQ2ZTRhMzJlMjZkYUBib290bGluLmNvbQoKLS0tCkFsZXhpcyBMb3Ro
b3LDqSAoNSk6CiAgICAgIHBhY2thZ2UvbGlieG1sc2VjMTogbmV3IHBhY2thZ2UKICAgICAgcGFj
a2FnZS9saWJjdXJsOiBSZWFwcGx5ICJsaWJjdXJsOiBhZGQgaG9zdCB2YXJpYW50IgogICAgICBw
YWNrYWdlL29wZW5zY2FwOiBuZXcgcGFja2FnZQogICAgICBwYWNrYWdlL2NvbXBsaWFuY2UtYXMt
Y29kZTogbmV3IHBhY2thZ2UKICAgICAgc3VwcG9ydC90ZXN0aW5nOiBhZGQgcnVudGltZSB0ZXN0
aW5nIGZvciBjb21wbGlhbmNlLWFzLWNvZGUKCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsKIHBhY2thZ2UvY29tcGxpYW5jZS1hcy1j
b2RlL0NvbmZpZy5pbiAgICAgICAgICAgICAgIHwgMzMgKysrKysrKysrKysKIHBhY2thZ2UvY29t
cGxpYW5jZS1hcy1jb2RlL2NvbXBsaWFuY2UtYXMtY29kZS5oYXNoIHwgIDQgKysKIHBhY2thZ2Uv
Y29tcGxpYW5jZS1hcy1jb2RlL2NvbXBsaWFuY2UtYXMtY29kZS5tayAgIHwgNDEgKysrKysrKysr
KysrKwogcGFja2FnZS9saWJjdXJsL2xpYmN1cmwubWsgICAgICAgICAgICAgICAgICAgICAgICAg
fCAxMiArKysrCiBwYWNrYWdlL2xpYnhtbHNlYzEvQ29uZmlnLmluICAgICAgICAgICAgICAgICAg
ICAgICB8IDEzICsrKysKIHBhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLmhhc2ggICAgICAg
ICAgICAgICAgIHwgIDMgKwogcGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEubWsgICAgICAg
ICAgICAgICAgICAgfCAzMiArKysrKysrKysrCiBwYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbiAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDIyICsrKysrKysKIHBhY2thZ2Uvb3BlbnNjYXAvb3Bl
bnNjYXAuaGFzaCAgICAgICAgICAgICAgICAgICAgIHwgIDMgKwogcGFja2FnZS9vcGVuc2NhcC9v
cGVuc2NhcC5tayAgICAgICAgICAgICAgICAgICAgICAgfCA2OSArKysrKysrKysrKysrKysrKysr
KysrCiAuLi4vdGVzdHMvcGFja2FnZS90ZXN0X2NvbXBsaWFuY2VfYXNfY29kZS5weSAgICAgICB8
IDIzICsrKysrKysrCiAxMyBmaWxlcyBjaGFuZ2VkLCAyNjQgaW5zZXJ0aW9ucygrKQotLS0KYmFz
ZS1jb21taXQ6IDM5ZWE3NGZmYzdkNjM4N2FmMGEzMDQwNTQyMDA4OTYwYzdjZGJmMmYKY2hhbmdl
LWlkOiAyMDI1MDcyNC1vcGVuc2NhcC03MTY2ZmJlMTU3MWUKCkJlc3QgcmVnYXJkcywKLS0gCkFs
ZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
