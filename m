Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8851AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 10:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5A5760651;
	Tue, 23 Nov 2021 10:41:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XUufaev7UDlJ; Tue, 23 Nov 2021 10:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34DCB60622;
	Tue, 23 Nov 2021 10:41:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA4E91BF873
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 10:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B564140132
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 10:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pK5swcRYtpiZ for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 10:41:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8016840019
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 10:41:28 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id i6so42716244uae.6
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 02:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9JMJen6dEyuy6GU/9cZPEUjz5PeH1XaCfiEBbfhm+GA=;
 b=pLx1vDGQEU9uBKfKlMwilrhQUxyNAq8kkyMZ9zmdu6EdvIeOPHOc8q4ivjqD8mjWfJ
 825h51+fWpRP0mg/a3rEnM3njUqUe0iSC0EhK+k6sFgzPeSf0CMWYcIXjZlUcYPuCjlE
 JxP5w89+iMfUwI0fwwS5N5iXF0rEpsXG3xxKlVoIUJZdOJgJ/R4ON8u1euOQvGbmPboW
 Y4AaLFNH/QPCrKS9cDI+afO3RdB9mU+tVyh4lEb7EyXGJmE2jI4nG6IF+T8VjG/Zx8Ka
 97BsYEhAP9kXG3MiXiROglsk8dedJF+DnLUcyMv15q6ZKP7uFYlwwi5O2jdzn7dx59It
 /tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9JMJen6dEyuy6GU/9cZPEUjz5PeH1XaCfiEBbfhm+GA=;
 b=yimGZexVnuNm9Mh9imV3liKsNUVPmguh6SlnvCfXHJs8/Xc912aC4r1OpdBFitXPMT
 yf3c3uybq43/Hj31dCq0f7KH34OTdsPvDE41ZZjzlPioZQrG9twH3SBExrY4rrot/g/c
 GS9dMPppp9Us9PT0oJjBqReVUH8bRgq4ZrVg31dAKYEKaPEgX4jscgd5yWVitU5r85A5
 3d7D49L6hw7A0VZ8Kevvs0GZSALSZyq1Zk807FDWzgaOMjmUc4KZfbXTWef29Mar5usF
 gjxiep8DilSbKwbK+A1t3MseUNvgU2UnNhoDr+vjia0Z3QXkffhj3bbrkqATKWPN5JVV
 sngg==
X-Gm-Message-State: AOAM532fZtT7JvrM9H/5h4oDf3f64/lC5NGyJr4AB4VM+LQR8kgiWMI7
 UBQNaZ5X8vA8r8AcCSSJ9a+slocPYTM=
X-Google-Smtp-Source: ABdhPJyYDO1OSmTG8Kb2BRi/hx403m3Ccx4jVFE45dEKlTi9HgSOGaskI23UFRdXkRU8sblrPPvd9A==
X-Received: by 2002:a67:5f47:: with SMTP id t68mr6748236vsb.56.1637664087380; 
 Tue, 23 Nov 2021 02:41:27 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id e13sm5929384vkd.21.2021.11.23.02.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 02:41:26 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Nov 2021 07:38:01 -0300
Message-Id: <20211123103801.114861-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-master] package/stress-ng: fix broken URL
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMu
Y29tPgoKRG8gdGhlIHNhbWUgYXMgY29tbWl0ICIxMmMwMTA3OWJkIHBhY2thZ2Uvc3RyZXNzLW5n
OiBidW1wIHRvIHZlcnNpb24KMC4xMy4wNSIgZGlkIGZvciAyMDIyLjAyIGJ1dCB3aXRob3V0IHRo
ZSB2ZXJzaW9uIGJ1bXAuCgpUaGUgcHJvamVjdCBVUkwgcmV0dXJucyA0MDQgZXJyb3IgYmVjYXVz
ZToKClF1b3RpbmcgQ29saW5nIEtpbmc6CiJVbmZvcnR1bmF0ZWx5IHdoZW4gSSBsZWZ0IENhbm9u
aWNhbCBsYXN0IHdlZWsgdGhleSByZW1vdmVkIG15IHRhcmJhbGxzIgoKU28gdXNlIGdpdGh1YiBh
bmQgdXBkYXRlIGhhc2guCgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2Vi
YXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CkNjOiBBcm5vdXQgVmFuZGVjYXBwZWxsZSAo
RXNzZW5zaXVtL01pbmQpIDxhcm5vdXRAbWluZC5iZT4KW1JpY2FyZG86IGRvIG5vdCBidW1wIHRo
ZSB2ZXJzaW9uLgogVGhlcmUgd2lsbCBiZSBubyB2ZXJzaW9uIGNsYXNoIGF0IHNvdXJjZXMuYnVp
bGRyb290Lm5ldCBzaW5jZSB0aGUgZmlsZQogZm9ybWF0IGNoYW5nZWRdClNpZ25lZC1vZmYtYnk6
IFJpY2FyZG8gTWFydGluY29za2kgPHJpY2FyZG8ubWFydGluY29za2lAZGF0YWNvbS5jb20uYnI+
CkNjOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Ci0tLQpodHRwczovL2dp
dGxhYi5jb20vUmljYXJkb01hcnRpbmNvc2tpL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy80MTQ1Mjk0
MTIvYnVpbGRzCjQwIHBhc3NlZCwgMCBmYWlsZWQKdGVzdC1wa2cgY29uZmlnOgpCUjJfUEFDS0FH
RV9TVFJFU1NfTkc9eQotLS0KIHBhY2thZ2Uvc3RyZXNzLW5nL0NvbmZpZy5pbiAgICAgIHwgMiAr
LQogcGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLmhhc2ggfCAyICstCiBwYWNrYWdlL3N0cmVz
cy1uZy9zdHJlc3MtbmcubWsgICB8IDMgKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N0cmVzcy1uZy9Db25m
aWcuaW4gYi9wYWNrYWdlL3N0cmVzcy1uZy9Db25maWcuaW4KaW5kZXggNjRiNDczYjc1Yy4uODM5
Y2JiMWNjMCAxMDA2NDQKLS0tIGEvcGFja2FnZS9zdHJlc3MtbmcvQ29uZmlnLmluCisrKyBiL3Bh
Y2thZ2Uvc3RyZXNzLW5nL0NvbmZpZy5pbgpAQCAtMTIsNyArMTIsNyBAQCBjb25maWcgQlIyX1BB
Q0tBR0VfU1RSRVNTX05HCiAJICBzdWJzeXN0ZW1zIG9mIGEgY29tcHV0ZXIgYXMgd2VsbCBhcyB0
aGUgdmFyaW91cyBvcGVyYXRpbmcKIAkgIHN5c3RlbSBrZXJuZWwgaW50ZXJmYWNlcy4KIAotCSAg
aHR0cDovL2tlcm5lbC51YnVudHUuY29tL35ja2luZy9zdHJlc3MtbmcvCisJICBodHRwczovL2dp
dGh1Yi5jb20vQ29saW5JYW5LaW5nL3N0cmVzcy1uZwogCiBjb21tZW50ICJzdHJlc3MtbmcgbmVl
ZHMgYSB0b29sY2hhaW4gdy8gaGVhZGVycyA+PSAzLjMiCiAJZGVwZW5kcyBvbiAhQlIyX25pb3My
ICYmICFCUjJfYXJjCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N0cmVzcy1uZy9zdHJlc3MtbmcuaGFz
aCBiL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5oYXNoCmluZGV4IGYzZWI3NmZhODIuLmJi
ZGNkMTU1YzggMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5oYXNoCisr
KyBiL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBM
b2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgZjM3ZjczOWU0ZDE1MzQzMzYwYTQ3OTgwYjY3ZGM4
YjJhNmJmM2Q0ZDNlZjcyN2Q1NWUyZGQ5OWEwYjY0ZjllYSAgc3RyZXNzLW5nLTAuMTMuMDEudGFy
Lnh6CitzaGEyNTYgIDE5NzNiMTQyYjliNzMxOTUyZGQ0Y2U3N2MzNjE4YTdlM2M2MjQ5NDU4N2Uy
M2JmMzdjODY4MzUwM2QwNDhmNjggIHN0cmVzcy1uZy0wLjEzLjAxLnRhci5negogc2hhMjU2ICA4
MTc3Zjk3NTEzMjEzNTI2ZGYyY2Y2MTg0ZDhmZjk4NmM2NzVhZmI1MTRkNGU2OGE0MDQwMTA1MjFi
ODgwNjQzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N0cmVzcy1uZy9zdHJlc3Mtbmcu
bWsgYi9wYWNrYWdlL3N0cmVzcy1uZy9zdHJlc3MtbmcubWsKaW5kZXggZTBiMzg1ZTc1Ni4uNTQ1
NzIzODNjNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLm1rCisrKyBi
L3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5tawpAQCAtNSw4ICs1LDcgQEAKICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCiAKIFNUUkVTU19OR19WRVJTSU9OID0gMC4xMy4wMQotU1RSRVNTX05H
X1NPVVJDRSA9IHN0cmVzcy1uZy0kKFNUUkVTU19OR19WRVJTSU9OKS50YXIueHoKLVNUUkVTU19O
R19TSVRFID0gaHR0cHM6Ly9rZXJuZWwudWJ1bnR1LmNvbS9+Y2tpbmcvdGFyYmFsbHMvc3RyZXNz
LW5nCitTVFJFU1NfTkdfU0lURSA9ICQoY2FsbCBnaXRodWIsQ29saW5JYW5LaW5nLHN0cmVzcy1u
ZyxWJChTVFJFU1NfTkdfVkVSU0lPTikpCiBTVFJFU1NfTkdfTElDRU5TRSA9IEdQTC0yLjArCiBT
VFJFU1NfTkdfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKIAotLSAKMi4yNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
