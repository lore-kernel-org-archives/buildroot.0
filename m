Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D95C433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 20:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C8A7416F9;
	Sun, 22 May 2022 20:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cVXpNxns7qmJ; Sun, 22 May 2022 20:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FC6841635;
	Sun, 22 May 2022 20:40:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD15F1BF392
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA499400DD
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iq4eAU8hEe8Z for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 20:40:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4DEC40133
 for <buildroot@buildroot.org>; Sun, 22 May 2022 20:40:40 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 h205-20020a1c21d6000000b003972dda143eso4172732wmh.3
 for <buildroot@buildroot.org>; Sun, 22 May 2022 13:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q3rIrbowVO2hkHZwNtSaGWRt5IBBdGycSydVxuGf/Ws=;
 b=CZ55OZ8Rhji0e6ZVYQL8hPzJfPs72smgCFzNTgi43xBMM8VpW7DAyaopsHWWdDoW1S
 EButRPCzcJq5oGpl+tJwYCLUE9Qwagp6HRAlc6Iack/tGoxkVhqYECEQxMm+kkoeohTi
 DWSBz0nfavzA87Pc5IiYpZOOurrrC71Cjhezt2s+Grv+HCKyLbWwdmjIkO8Q+hyLN2rD
 53hRVlRoDzDazZmPjMkVf9hMrj1Ps6/n7902fQLHV7v1W594fgTFefA4uBCHLRebjOg2
 RhCwqWkmNus78Yl730pzHBHRT5Upg8mhYVTeGO1PLUBQ2x2E+EduvEXwGrww+NAZeXcT
 hc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q3rIrbowVO2hkHZwNtSaGWRt5IBBdGycSydVxuGf/Ws=;
 b=GDDy0ZGZK5SnzcjZMTmR3BDdjaynrsM1KF3ZM3L+nMNCmH1RWpYhoEqlOkWHQxz9qR
 NsNKqgsjyEwPIGCexPpxQtVuCK0QRRO10Yq0kTn6E0IEOHAPky752G1Ls56yhcxXNTvD
 UoxaDxfcYquLZhwMG0rIs0TCEXw2qRQedlkfc9Wwy76nc44T06MpPaKPGukyN3lnxF0x
 uJdJYm5z7dC4nrEHIFjpYgs7+xWC85gFhBZJ1HT8BWg2Jl5CGm0ZpGdyiFxTSXBvqz8j
 3GoB6EjWWsLO8+A7CwHi9xk7artphufGnyAdc2BzpBzjj5kCfWTNtKKwsczKNJgtXEIR
 xbMw==
X-Gm-Message-State: AOAM531hEfFr4YlXj6KhUpGO6KGxBcGqwPZIoypDILn/1GFjZuOYijkA
 IObinYm5kOiGH6PTxumFgs4jRwGx8jM=
X-Google-Smtp-Source: ABdhPJzgf2DJ60egfu337NVlajhEPJG0z8Ykn8Yf67WM/2mq/NJyg71zMNHN6NDCZQ5u4Fhtd/L46w==
X-Received: by 2002:a05:600c:1d18:b0:394:6469:abec with SMTP id
 l24-20020a05600c1d1800b003946469abecmr17406033wms.89.1653252038589; 
 Sun, 22 May 2022 13:40:38 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a05600c42cb00b003942a244ec8sm6748351wme.13.2022.05.22.13.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 13:40:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 22:38:14 +0200
Message-Id: <20220522203814.1408407-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rtl8812au-aircrack-ng: bump to
 version 37e27f9165300c89607144b646545fac576ec510
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aXRoIGtlcm5lbCA+PSA1LjE3IHRoYW5r
cyB0bwpodHRwczovL2dpdGh1Yi5jb20vYWlyY3JhY2stbmcvcnRsODgxMmF1L2NvbW1pdC83ZTYx
YWQ4OWNjYWU1MWE4MDcwNmY3NjVlMWQ1ZjJlODJhMTY2MmM3OgoKL2hvbWUvYXV0b2J1aWxkL2F1
dG9idWlsZC9pbnN0YW5jZS0xNC9vdXRwdXQtMS9idWlsZC9ydGw4ODEyYXUtYWlyY3JhY2stbmct
M2E2NDAyZTllNzk4MDI4OTFmMTUzMWI0MzViZTU0ZjRkOGI3MWYwYi8uL29zX2RlcC9vc2RlcF9z
ZXJ2aWNlLmM6IEluIGZ1bmN0aW9uIOKAmHRocmVhZF9leGl04oCZOgovaG9tZS9hdXRvYnVpbGQv
YXV0b2J1aWxkL2luc3RhbmNlLTE0L291dHB1dC0xL2J1aWxkL3J0bDg4MTJhdS1haXJjcmFjay1u
Zy0zYTY0MDJlOWU3OTgwMjg5MWYxNTMxYjQzNWJlNTRmNGQ4YjcxZjBiLy4vb3NfZGVwL29zZGVw
X3NlcnZpY2UuYzoxMjk1OjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlv
biDigJhjb21wbGV0ZV9hbmRfZXhpdOKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNs
YXJhdGlvbl0KIDEyOTUgfCAgY29tcGxldGVfYW5kX2V4aXQoY29tcCwgMCk7CiAgICAgIHwgIF5+
fn5+fn5+fn5+fn5+fn5+CgpGaXhlczoKIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3Jn
L3Jlc3VsdHMvMWZmZjUwMjNiNWI3OWE3ZDgxZmQ0Y2JhNmRlYThkY2IzZjQyODM0MAoKU2lnbmVk
LW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Ci0t
LQogcGFja2FnZS9ydGw4ODEyYXUtYWlyY3JhY2stbmcvcnRsODgxMmF1LWFpcmNyYWNrLW5nLmhh
c2ggfCAyICstCiBwYWNrYWdlL3J0bDg4MTJhdS1haXJjcmFjay1uZy9ydGw4ODEyYXUtYWlyY3Jh
Y2stbmcubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnRsODgxMmF1LWFpcmNyYWNrLW5nL3J0
bDg4MTJhdS1haXJjcmFjay1uZy5oYXNoIGIvcGFja2FnZS9ydGw4ODEyYXUtYWlyY3JhY2stbmcv
cnRsODgxMmF1LWFpcmNyYWNrLW5nLmhhc2gKaW5kZXggZWQxOTIxZDFjMi4uNjY3Y2YzNGVmYyAx
MDA2NDQKLS0tIGEvcGFja2FnZS9ydGw4ODEyYXUtYWlyY3JhY2stbmcvcnRsODgxMmF1LWFpcmNy
YWNrLW5nLmhhc2gKKysrIGIvcGFja2FnZS9ydGw4ODEyYXUtYWlyY3JhY2stbmcvcnRsODgxMmF1
LWFpcmNyYWNrLW5nLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAot
c2hhMjU2ICBhY2FlNzU4YzM4MzQxOTZjNzFmNGVlNThmNTNhM2MxYjI5ZmZkOTg0ZjYzZmYyZjQw
ZjJiMDgwYzg3ODVjNDlmICBydGw4ODEyYXUtYWlyY3JhY2stbmctM2E2NDAyZTllNzk4MDI4OTFm
MTUzMWI0MzViZTU0ZjRkOGI3MWYwYi50YXIuZ3oKK3NoYTI1NiAgNzQ5YmEyZTc3ZDAzNjQzODE0
NDVlNDBmN2YwYjcwNDFkODYxY2Y5YTM1NmRiZTUzMDg1ZTNhYmFlZjg4OGMxZCAgcnRsODgxMmF1
LWFpcmNyYWNrLW5nLTM3ZTI3ZjkxNjUzMDBjODk2MDcxNDRiNjQ2NTQ1ZmFjNTc2ZWM1MTAudGFy
Lmd6CiBzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0
ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnRsODgx
MmF1LWFpcmNyYWNrLW5nL3J0bDg4MTJhdS1haXJjcmFjay1uZy5tayBiL3BhY2thZ2UvcnRsODgx
MmF1LWFpcmNyYWNrLW5nL3J0bDg4MTJhdS1haXJjcmFjay1uZy5tawppbmRleCAyYmJjYTg4Y2Zi
Li41NWMxMThhODI1IDEwMDY0NAotLS0gYS9wYWNrYWdlL3J0bDg4MTJhdS1haXJjcmFjay1uZy9y
dGw4ODEyYXUtYWlyY3JhY2stbmcubWsKKysrIGIvcGFja2FnZS9ydGw4ODEyYXUtYWlyY3JhY2st
bmcvcnRsODgxMmF1LWFpcmNyYWNrLW5nLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKIAotUlRMODgxMkFVX0FJUkNSQUNLX05HX1ZFUlNJT04gPSAzYTY0MDJl
OWU3OTgwMjg5MWYxNTMxYjQzNWJlNTRmNGQ4YjcxZjBiCitSVEw4ODEyQVVfQUlSQ1JBQ0tfTkdf
VkVSU0lPTiA9IDM3ZTI3ZjkxNjUzMDBjODk2MDcxNDRiNjQ2NTQ1ZmFjNTc2ZWM1MTAKIFJUTDg4
MTJBVV9BSVJDUkFDS19OR19TSVRFID0gJChjYWxsIGdpdGh1YixhaXJjcmFjay1uZyxydGw4ODEy
YXUsJChSVEw4ODEyQVVfQUlSQ1JBQ0tfTkdfVkVSU0lPTikpCiBSVEw4ODEyQVVfQUlSQ1JBQ0tf
TkdfTElDRU5TRSA9IEdQTC0yLjAKIFJUTDg4MTJBVV9BSVJDUkFDS19OR19MSUNFTlNFX0ZJTEVT
ID0gTElDRU5TRQotLSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
