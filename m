Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93732C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 21:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22EF960E43;
	Mon, 11 Apr 2022 21:52:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id msUUzXofhfpC; Mon, 11 Apr 2022 21:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1134F60D75;
	Mon, 11 Apr 2022 21:52:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5A31BF30D
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 21:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A0AB4029F
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 21:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 05lWbdQEocuJ for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 21:52:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDC264027D
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 21:52:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso439299wml.1
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 14:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vZviErbaoSYmTEhCGJN4sXQgjC7x5yzJXQr3KXqmM9A=;
 b=b53WSKl1PjUq3BuezlM7nHaiW9Y9efJSepOzHl5x3mKMJQ0Ut3An8eMbQJ/p36PmNV
 UInQkivziImsrdSLuXDotXXXABX8jACM1/wC6VEVQ9WY9iGmtOr9AIM61MnxUJK7NzzA
 4Id4pTM6VtGkxl3EwU2v2dhhHqmqSTZhkSgBmSbnUbcUtNF4sZn5OdACBow9YzNUQLa8
 lJ7K13JcWKh4c3k/jyOBCZ3aURjWvSL2pdAvemrkugmwRvpy7IC+d96ERbWgZWIOauie
 4O9HfkV5pfyaXLDP9GsRI+HyK9Ap1Yhl+FghFGHnFIm0AE//5Yr/krZpvLkPpeNW4J8k
 7CCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vZviErbaoSYmTEhCGJN4sXQgjC7x5yzJXQr3KXqmM9A=;
 b=UQVPtPBu6F7QRhIPxyxCfekDbP1XW40i+wLUomJ0LD2XPXAUJigvwICb68mkvwTlJI
 NKzrn00ZF1TxwlQzBQ+SJ8+FIeXDwbEZWQOWWJe8v91AU0+uiK9jd63rV4TKaZihaD+t
 1cg0TyTZrIvT43Z9XKsJdPDDWChb08qXYKWVH3kMe7cpACbQ+rWx/aWfgMi/jCT+HQ3S
 2+EiqZrDHhRXmkW6EaIfLUKhOXRj5S8NwuQZmRQ0F8WiiH2XUlgFfXJSPDN8HnFxpS0w
 sEgNP/ijWjqH4RSyUiYSd3JxdI5UdG2dO+G+3Eno2DhkPdUmo12pt7d5TDgWuQKaPPQw
 5itQ==
X-Gm-Message-State: AOAM532x0yTP/HiV30aSLjhPqEdExUXpd3H13LYSyMxyyLrlaZ7gbagr
 54ByNs0YHeKtQ9OIkgNPCp9fjn9vvg4=
X-Google-Smtp-Source: ABdhPJxr5pB864YeatDMnuBv4yiIAZtinO77kC6ksjnJ7bVOmD+SH6qaJ5+CvTO/nkn2GyqK3nO9ag==
X-Received: by 2002:a05:600c:420c:b0:38e:b1d4:773a with SMTP id
 x12-20020a05600c420c00b0038eb1d4773amr1068629wmh.120.1649713924870; 
 Mon, 11 Apr 2022 14:52:04 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a5d59a1000000b002078c8b6dabsm14177097wrr.9.2022.04.11.14.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 14:52:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 23:50:02 +0200
Message-Id: <20220411215002.518739-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: fix FTBFS
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4IHRoZSBmb2xsb2luZyBidWlsZCBmYWlsdXJlIHJhaXNlZCBzaW5jZSBjb21taXQKMDQxNjRi
ODFlNzZlMjlmYjk0ODIyNDVlODA4YjQ2YWYyYWE2N2JjNjoKCnNyYy91dGlscy5jOiBJbiBmdW5j
dGlvbiAnc2hhNTEyc3VtMjU2JzoKc3JjL3V0aWxzLmM6NjE5OjQ1OiBlcnJvcjogdG9rZW4gIiAi
IGlzIG5vdCB2YWxpZCBpbiBwcmVwcm9jZXNzb3IgZXhwcmVzc2lvbnMKICA2MTkgfCAjaWYgT1BF
TlNTTF9WRVJTSU9OX05VTUJFUiA+PSAweDEwMTAxMDFmTCAmJiAhZGVmaW5lZChMSUJSRVNTTF9W
RVJTSU9OX05VTUJFUikKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF4KCkZpeGVzOgogLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVz
dWx0cy9jYWYwZjVlNGM2YWQwZjI3NjRmMDdkMzNmNTk0YjYxMjFjZWE4N2JjCgpTaWduZWQtb2Zm
LWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KLS0tCiAu
Li4vdHZoZWFkZW5kLzAwMDMtRml4LUZUQkZTLWluLXV0aWxzLWMucGF0Y2ggfCAyOCArKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvdHZoZWFkZW5kLzAwMDMtRml4LUZUQkZTLWluLXV0aWxzLWMucGF0
Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3R2aGVhZGVuZC8wMDAzLUZpeC1GVEJGUy1pbi11dGls
cy1jLnBhdGNoIGIvcGFja2FnZS90dmhlYWRlbmQvMDAwMy1GaXgtRlRCRlMtaW4tdXRpbHMtYy5w
YXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4yY2FhMjgxNDkwCi0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS90dmhlYWRlbmQvMDAwMy1GaXgtRlRCRlMtaW4tdXRp
bHMtYy5wYXRjaApAQCAtMCwwICsxLDI4IEBACitGcm9tIGZkMDE3MzcyNzBkOThjMjg0NjVjODZh
Njg4YmQ3ZDFjNjQwNDg2YzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBNaWNoYWVs
IE1hcmxleSA8bWljaGFlbEBtaWNoYWVsbWFybGV5LmNvbT4KK0RhdGU6IFdlZCwgNiBBcHIgMjAy
MiAyMTo0Nzo0OSAtMDQwMAorU3ViamVjdDogW1BBVENIXSBGaXggRlRCRlMgaW4gdXRpbHMuYwor
CitVKzAwMjAgU1BBQ0UgYW5kIFUrMDBBMCBOTy1CUkVBSyBTUEFDRSBsb29rIHRoZSBzYW1lLCBi
dXQgdGhleQorYXJlbid0IHRoZSBzYW1lLgorCitbUmV0cmlldmVkIGZyb206CitodHRwczovL2dp
dGh1Yi5jb20vdHZoZWFkZW5kL3R2aGVhZGVuZC9jb21taXQvZmQwMTczNzI3MGQ5OGMyODQ2NWM4
NmE2ODhiZDdkMWM2NDA0ODZjNV0KK1NpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZv
bnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgorLS0tCisgc3JjL3V0aWxzLmMgfCAyICstCisgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQg
YS9zcmMvdXRpbHMuYyBiL3NyYy91dGlscy5jCitpbmRleCBlZWNiMTBlMTE2Li5iYzY0MDFkMjJm
IDEwMDY0NAorLS0tIGEvc3JjL3V0aWxzLmMKKysrKyBiL3NyYy91dGlscy5jCitAQCAtNjE2LDcg
KzYxNiw3IEBAIHNoYTI1NnN1bSAoIGNvbnN0IGNoYXIgKnN0ciwgaW50IGxvd2VyY2FzZSApCisg
Y2hhciAqCisgc2hhNTEyc3VtMjU2ICggY29uc3QgY2hhciAqc3RyLCBpbnQgbG93ZXJjYXNlICkK
KyB7CistI2lmIE9QRU5TU0xfVkVSU0lPTl9OVU1CRVIgPj0gMHgxMDEwMTAxZkwgJibCoCFkZWZp
bmVkKExJQlJFU1NMX1ZFUlNJT05fTlVNQkVSKQorKyNpZiBPUEVOU1NMX1ZFUlNJT05fTlVNQkVS
ID49IDB4MTAxMDEwMWZMICYmICFkZWZpbmVkKExJQlJFU1NMX1ZFUlNJT05fTlVNQkVSKQorICAg
cmV0dXJuIG9wZW5zc2xfaGFzaF9oZXhzdHIoc3RyLCBsb3dlcmNhc2UsIEVWUF9zaGE1MTJfMjU2
KCksIDMyKTsKKyAjZWxzZQorICAgcmV0dXJuIE5VTEw7Ci0tIAoyLjM1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
