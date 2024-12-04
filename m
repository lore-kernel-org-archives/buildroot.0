Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E20EE7716D
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 18:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F99A60873;
	Wed,  4 Dec 2024 18:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ArMAP9ean2v; Wed,  4 Dec 2024 18:29:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A172860E49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A172860E49;
	Wed,  4 Dec 2024 18:29:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 364B61DDD
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1672484437
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gkjx8cndxjnx for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 18:29:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F9BE84436
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F9BE84436
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F9BE84436
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.124.249]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfHEP-1tqYn23zFT-00qfi0; Wed, 04
 Dec 2024 19:29:24 +0100
To: buildroot@buildroot.org
Date: Wed,  4 Dec 2024 19:29:11 +0100
Message-ID: <20241204182913.4085670-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204182913.4085670-1-fiona.klute@gmx.de>
References: <20241204182913.4085670-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:9CfxQ9Alaut7pY9ZJJfgwWIt8maTn5uH3Jd+lz4YmJ58lH0cHL/
 ryTZMYxyvqzPlS6UTojalAZjc9EF1Nfn3ec2/aoSZSXWHhfvfbB7gvTkfSRJS+T8yetb2Pu
 tTKGPqY9CqATs0BQ2VWALBA8ZNx9MW9dLqM6C+Tk2g2nQtgcfIGvCgvVpcDfZDTKI8G6mKH
 QWD9thWq8WKEE3rxAGJOQ==
UI-OutboundReport: notjunk:1;M01:P0:JT5bcvX1j8M=;2I3cOb77SR0fvs2OTYkqseh9Pcz
 5iPji+3O3RWzxj1xwqDy+ZwVHeeTidITlFi1UKeCLOvt+JO5Dm9IJyYuCyxQau5XWgA0L4pzd
 eFjc+T05aOFoom5qxL6kXAKsJevj6nn7MCbS0fbiRbQGWcUl757cCV1X1PCn+Icow4+tHo7Ki
 iVMWx8izYUmEkkpIlxBO/3W4qLUI0z2VIDfOC3rYBlt6ZgO4+EQFTGld4O7qtxBIcJY2l2t9x
 I4UiLb/pYQBVI91Daz1JutT3c9SnnONhvwPXdlhHH54S/ijADIPwjlyVYV54m54eEHrtXicC2
 4jmj/IhNACwjGoqDWGY4kRoYHkOiUaSTzgOqd1a1P8EDSUIVthooJIq5kR1B9g9hzpxVDxSO0
 ytRzR4R3TnPaNF9zRQ0LjRTxT7YTEmOs/Jn02+08+N796uUNiabBK/9kB7VDdJXTQ4wMLsKiF
 AbEiNBR7FNTP36/FhPTUAK6T3wKVSroqgJEYY9pgE4r8sn1RvN2U51CALtGLhC+jCUAQtrH/B
 RjFD8c68OFq6tFvQ3MZJgrdSxTqIvNQrt4zMWsgT3BbGel5ZcSk/H8ihnYtvIpvgEcbDvR5RJ
 I/qNVEHHqLX/6WIfpJaPehfhhueVYkzeb8x9oKQmKMWvdvEmaL9AjvxGT4Cu8W7SlA01bN9rj
 cA1rwGq3wDy3gWQCeQWRVj2X/dlk/dSBsNfj3IfxJOI+yoFuTwq+rnTqifcehhxWeANrotxwx
 Z+rHEq+7olq0sHUqKC9JNONcq7p5fAspUXNrA+7Ji85jxkfy3PmPeKS2xevZZ5wkh8PiK/ZHE
 z+XWq00I6DXVRHstQQnrpBjofJS2saBtg3bftxqnpJm2a/waATnqJsEibDjCvX3dr/OvFnj1o
 Vub80i8lHFhMMEqkBPNHrHH1Hwj6o1TIsRuf2H6kRA7EKS+BLG2rRPleNAEMFjtxqMwmESkoz
 JqG8fVPMxh+EHb0Xhh9ScZCGsXYPGQMobtrFC9mnDb5sQrghMhNbnkqbVb5mjDPtLKVzzNZhx
 71GmZ0NqkispQNmBFjeozjNwP5wvSQJ10LBLP+kC8iC84Ln5QsVlSZ+xCO2W5va/CflpL7TNU
 tqBxlPo1FQu3o0neUx0wuukrhOa8Y9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733336964; x=1733941764; i=fiona.klute@gmx.de;
 bh=y0uzZdZAkT3/JkVeZzF/zxWNrAhKMNe5juprGxmmH/8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=IzZKexuaMOn60OymtilQT4AZ8fzfsj17YzhdY3q3N/IGovs2UG8uy73cZbjQ5diw
 QHWKv3JVO1dahtT2tV7GfDcOTUbcKK/JPq7bBxegOfcEUThH+UfQpynKOEMHkY7cI
 h1AQnGujX7ZBGUj0WaECaGF9OMevsYLblskNFkmLfM667Qu0gmmQfXm/o/f4FtiMw
 zOp4bp2meNLIRT61XSc1j1ZMNuOAC+wvPYU+bq/EWCJ4NsaQocLACQZGDeDP0Zb8k
 37FUwWEaL+AZPBNBBxn5ziZntSrUg/rzGWLNnTe4Pa56Cm6idsj8mgNsqgiqNZ8tF
 ljslJEwSS5Jc5CAghQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=IzZKexua
Subject: [Buildroot] [PATCH v5 4/6] support/testing: test for nftables init
 script
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogIkZpb25hIEtsdXRlIChXSVdBKSIgPGZpb25hLmtsdXRlQGdteC5kZT4KClRoZSBuZXcg
dGVzdCBjaGVja3MgdGhhdCBhIHByZS1kZWZpbmVkIHJ1bGVzIGZpbGUgY2FuIGJlIGxvYWRlZCBh
bmQKd29ya3MgYXMgZXhwZWN0ZWQsIGFuZCB0aGF0IGFmdGVyIGZsdXNoaW5nIHRoZSBibG9ja2Vk
IElQIHJlc3BvbmRzIHRvCnBpbmcgYWdhaW4uCgpTaWduZWQtb2ZmLWJ5OiBGaW9uYSBLbHV0ZSAo
V0lXQSkgPGZpb25hLmtsdXRlQGdteC5kZT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiAuLi4vdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfbmZ0YWJsZXMucHkgICAgfCAzNyArKysrKysrKysrKysrKysrKystCiAuLi4vcm9vdGZzLW92
ZXJsYXkvZXRjL25mdGFibGVzLmNvbmYgICAgICAgICAgfCAgOCArKysrCiAzIGZpbGVzIGNoYW5n
ZWQsIDQ1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25mdGFibGVzL3Jvb3Rmcy1vdmVybGF5
L2V0Yy9uZnRhYmxlcy5jb25mCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMK
aW5kZXggYWVkZDczNjc3Mi4uOWQxYTZiMGRlZiAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysg
Yi9ERVZFTE9QRVJTCkBAIC0xMDk5LDYgKzEwOTksNyBAQCBGOglwYWNrYWdlL3B5dGhvbi1kdW5h
bWFpLwogRjoJcGFja2FnZS9weXRob24tcG9ldHJ5LWR5bmFtaWMtdmVyc2lvbmluZy8KIEY6CXBh
Y2thZ2UvcHl0aG9uLXB5YXN5bmNoYXQvCiBGOglwYWNrYWdlL3B5dGhvbi1weWFzeW5jb3JlLwor
RjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZnRhYmxlcy5weQogCiBOOglG
bMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KIEY6CWNvbmZp
Z3MvYXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmlnCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25mdGFibGVzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF9uZnRhYmxlcy5weQppbmRleCAxNDJlN2QwMzUyLi4yNjIyYzdlODIy
IDEwMDY0NAotLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25mdGFibGVz
LnB5CisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmZ0YWJsZXMucHkK
QEAgLTg1LDcgKzg1LDcgQEAgY2xhc3MgVGVzdE5mdGFibGVzKGluZnJhLmJhc2V0ZXN0LkJSVGVz
dCk6CiAgICAgICAgICMgc3VwcG9zZWQgdG8gZmFpbCBlYXJsaWVyIGlzIG5vdyBzdXBwb3NlZCB0
byBzdWNjZWVkLgogICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKHBpbmdfdGVzdF9jbWQpCiAKLSAg
ICBkZWYgdGVzdF9ydW4oc2VsZik6CisgICAgZGVmIGJvb3Rfdm0oc2VsZik6CiAgICAgICAgIGlt
ZyA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgInJvb3Rmcy5jcGlvLmd6
IikKICAgICAgICAga2VybiA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwg
IkltYWdlIikKICAgICAgICAgc2VsZi5lbXVsYXRvci5ib290KGFyY2g9ImFhcmNoNjQiLApAQCAt
OTcsNiArOTcsOSBAQCBjbGFzcyBUZXN0TmZ0YWJsZXMoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICItaW5pdHJkIiwgaW1nXSkKICAg
ICAgICAgc2VsZi5lbXVsYXRvci5sb2dpbigpCiAKKyAgICBkZWYgdGVzdF9ydW4oc2VsZik6Cisg
ICAgICAgIHNlbGYuYm9vdF92bSgpCisKICAgICAgICAgIyBXZSBjaGVjayB0aGUgcHJvZ3JhbSBj
YW4gZXhlY3V0ZS4KICAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygibmZ0IC0tdmVyc2lvbiIpCiAK
QEAgLTEwNywzICsxMTAsMzUgQEAgY2xhc3MgVGVzdE5mdGFibGVzKGluZnJhLmJhc2V0ZXN0LkJS
VGVzdCk6CiAgICAgICAgICMgV2UgcnVuIGFnYWluIHRoZSBzYW1lIHRlc3Qgc2VxdWVuY2UgdXNp
bmcgb3VyIHNpbXBsZSBuZnQKICAgICAgICAgIyBweXRob24gaW1wbGVtZW50YXRpb24sIHRvIGNo
ZWNrIHRoZSBsYW5ndWFnZSBiaW5kaW5ncy4KICAgICAgICAgc2VsZi5uZnRhYmxlc190ZXN0KHBy
b2c9Ii9yb290L25mdC5weSIpCisKKworY2xhc3MgVGVzdE5mdGFibGVzSW5pdChUZXN0TmZ0YWJs
ZXMpOgorICAgIGNvbmZpZyA9IFRlc3ROZnRhYmxlcy5jb25maWcgKyBcCisgICAgICAgICIiIgor
ICAgICAgICBCUjJfSU5JVF9CVVNZQk9YPXkKKyAgICAgICAgIiIiCisKKyAgICBkZWYgdGVzdF9y
dW4oc2VsZik6CisgICAgICAgIHNlbGYuYm9vdF92bSgpCisKKyAgICAgICAgIyBzdGFydCB3aXRo
IGtub3duIHN0YXRlIChydWxlcyBmcm9tIC9ldGMvbmZ0YWJsZXMuY29uZikKKyAgICAgICAgc2Vs
Zi5hc3NlcnRSdW5PaygiL2V0Yy9pbml0LmQvUzM1bmZ0YWJsZXMgcmVsb2FkIikKKworICAgICAg
ICAjIFNhbWUgY29uY2VwdCBhcyBpbiBUZXN0TmZ0YWJsZXMubmZ0YWJsZXNfdGVzdDogVGhlIHJ1
bGVzCisgICAgICAgICMgc2hvdWxkIGFsbG93IHBpbmcgdG8gMTI3LjAuMC4xLCBidXQgbm90IDEy
Ny4wLjAuMi4KKyAgICAgICAgcGluZ19jbWRfcHJlZml4ID0gInBpbmcgLWMgMyAtaSAwLjUgLVcg
MiAiCisgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2socGluZ19jbWRfcHJlZml4ICsgIjEyNy4wLjAu
MSIpCisgICAgICAgIF8sIGV4aXRfY29kZSA9IHNlbGYuZW11bGF0b3IucnVuKHBpbmdfY21kX3By
ZWZpeCArICIxMjcuMC4wLjIiKQorICAgICAgICBzZWxmLmFzc2VydE5vdEVxdWFsKGV4aXRfY29k
ZSwgMCkKKworICAgICAgICAjIFN0b3Agc2hvdWxkIGZsdXNoIHRoZSBydWxlcywgcGluZyB0byBi
b3RoIGFkZHJlc3NlcyBzaG91bGQKKyAgICAgICAgIyB3b3JrIG5vdy4KKyAgICAgICAgc2VsZi5h
c3NlcnRSdW5PaygiL2V0Yy9pbml0LmQvUzM1bmZ0YWJsZXMgc3RvcCIpCisgICAgICAgIHNlbGYu
YXNzZXJ0UnVuT2socGluZ19jbWRfcHJlZml4ICsgIjEyNy4wLjAuMSIpCisgICAgICAgIHNlbGYu
YXNzZXJ0UnVuT2socGluZ19jbWRfcHJlZml4ICsgIjEyNy4wLjAuMiIpCisKKyAgICAgICAgIyBT
dGFydCBpcyBlc3NlbnRpYWxseSB0aGUgc2FtZSBhcyByZWxvYWQsIGNoZWNrIHRoYXQKKyAgICAg
ICAgIyAxMjcuMC4wLjIgZ2V0cyBibG9ja2VkIGFnYWluLgorICAgICAgICBzZWxmLmFzc2VydFJ1
bk9rKCIvZXRjL2luaXQuZC9TMzVuZnRhYmxlcyBzdGFydCIpCisgICAgICAgIF8sIGV4aXRfY29k
ZSA9IHNlbGYuZW11bGF0b3IucnVuKHBpbmdfY21kX3ByZWZpeCArICIxMjcuMC4wLjIiKQorICAg
ICAgICBzZWxmLmFzc2VydE5vdEVxdWFsKGV4aXRfY29kZSwgMCkKZGlmZiAtLWdpdCBhL3N1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmZ0YWJsZXMvcm9vdGZzLW92ZXJsYXkvZXRj
L25mdGFibGVzLmNvbmYgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25mdGFi
bGVzL3Jvb3Rmcy1vdmVybGF5L2V0Yy9uZnRhYmxlcy5jb25mCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAuLmEwNGFmMWQ2MzQKLS0tIC9kZXYvbnVsbAorKysgYi9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25mdGFibGVzL3Jvb3Rmcy1vdmVybGF5L2V0Yy9u
ZnRhYmxlcy5jb25mCkBAIC0wLDAgKzEsOCBAQAorZmx1c2ggcnVsZXNldAorCit0YWJsZSBpbmV0
IGZpbHRlciB7CisJY2hhaW4gaW5wdXQgeworCQl0eXBlIGZpbHRlciBob29rIGlucHV0IHByaW9y
aXR5IGZpbHRlcjsgcG9saWN5IGFjY2VwdDsKKwkJaXAgZGFkZHIgMTI3LjAuMC4yIGljbXAgdHlw
ZSBlY2hvLXJlcXVlc3QgZHJvcAorCX0KK30KLS0gCjIuNDUuMgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
