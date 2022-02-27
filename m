Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690C1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 19:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2085760B2C;
	Sun, 27 Feb 2022 19:55:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4m0tEry0Rhlc; Sun, 27 Feb 2022 19:55:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5643B60670;
	Sun, 27 Feb 2022 19:55:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EB731BF3EC
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C825408E8
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IeWTES1Fbq7L for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 19:54:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BABBD408B5
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 19:54:27 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id a8so20852671ejc.8
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 11:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=y6vgKEyM656mNsuW+YMlV2vUaVRc8S94XajwfvBe7DU=;
 b=AoxxsRrJx66R5EjJC6QAoHSZD5cdTF++HqwcJBYBjd2NG1NW7rR4OCdmWGDNE+oZUz
 aM7VJOd4ReLafPlTtipgf+NYFOUFf8vuP7Oun0eijv++2yZ5Cu0o5kC6gj/PaUdILg9T
 MCIWa0liDyuxkPW5vKjqLRRJkuZ5KGD8AuZT8T3zJL0G6i5lm4PQ9qCIsMHU6hQgrUj+
 Et+HmKwCh6LIMNNLektS6Q2+/l9FdCdVpph7R1Ey2bRJ42eC65aHkudpvlYz9KqtmITv
 lgHQ19M2/5/Krg4ix94mCvD+SO4gN78M2fXVIhK0fNrXZ6yRykoXchyTDaudnxFxIV+4
 ymXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=y6vgKEyM656mNsuW+YMlV2vUaVRc8S94XajwfvBe7DU=;
 b=6j5wpCdE7Wa5nGT0s3E+lDGqsFDiqIv/53ghb4kYGk+AUkLF5CLDkRpxOyOLoIDmjN
 DO77YfX+Xpht6DwvfIBQsBIxbEcpSrALVkv11KG/ElFf4OI0kp6KsVgI0yFSZFdC2j5c
 eAubti7aKnIgmJ6Q71xS6jiqTFOdU82t2M+tgxGC8LYalVboFE2mjAksyh6b3XGB5gok
 MYuSrVB7EiUu/sotfM63BtPDj8OxC7Z4llstVJYTopTKk+nYXQxKEP1iKiBmTy2iKuTx
 d6JRdH8qBHbGfEV3eNeCaNiFI7uZP9mAzAifFBcnNNjlG2rEXWbSjiPPkepD9/fJA9Jl
 vvBg==
X-Gm-Message-State: AOAM531pCZKheOv7aG8plNXoy8cJLS9KqKw0fzTWLh/u8YJIIccxiY10
 zbEylr/nnrW3Nvpgrne/D4q1dMSyHYO4YxZOGvuRvSquzX8u6g==
X-Google-Smtp-Source: ABdhPJzM9xCmh95twTwqpFozFsM+HKQiCDpIrTdhNTQIfp+K/e/MewwW855UPs1Md7mBcJ0bFpIoi2oGPuww73dGZgQ=
X-Received: by 2002:a17:906:3152:b0:6cf:d100:a8b2 with SMTP id
 e18-20020a170906315200b006cfd100a8b2mr12882404eje.529.1645991665644; Sun, 27
 Feb 2022 11:54:25 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Sun, 27 Feb 2022 19:54:14 +0000
Message-ID: <CAEXMXLQM7jq3REiVmSJCSAYW_p5rbwPY1+6Z2wtTSpca3AAeoA@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] [PATCH] package/rauc: only install systemd service if
 built with dbus/service support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHN5c3RlbWQgc2VydmljZSB3aWxsIHRyeSB0byBjYWxsIHJhdWMgaW4gc2VydmljZSBtb2Rl
LCBzbyBpdCBpcyB1c2VsZXNzCmFuZCB3aWxsIGZhaWwgaWYgcmF1YyBkb2VzIG5vdCBoYXZlIHN1
Y2ggc3VwcG9ydAoKU2lnbmVkLW9mZi1ieTogTnVubyBHb27Dp2FsdmVzIDxudW5vanBnQGdtYWls
LmNvbT4KLS0tCiBwYWNrYWdlL3JhdWMvcmF1Yy5tayB8IDIwICsrKysrKysrKy0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9wYWNrYWdlL3JhdWMvcmF1Yy5tayBiL3BhY2thZ2UvcmF1Yy9yYXVjLm1rCmluZGV4
IDM5ZjUyNTU4MTIuLmQyOWVmNjYwNDYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcmF1Yy9yYXVjLm1r
CisrKyBiL3BhY2thZ2UvcmF1Yy9yYXVjLm1rCkBAIC0xNSw2ICsxNSwxNSBAQCBSQVVDX0RFUEVO
REVOQ0lFUyA9IGhvc3QtcGtnY29uZiBvcGVuc3NsIGxpYmdsaWIyCiBpZmVxICgkKEJSMl9QQUNL
QUdFX1JBVUNfREJVUykseSkKIFJBVUNfQ09ORl9PUFRTICs9IC0tZW5hYmxlLXNlcnZpY2UKIFJB
VUNfREVQRU5ERU5DSUVTICs9IGRidXMKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfU1lTVEVNRCkseSkK
KyMgY29uZmlndXJlIHVzZXMgcGtnLWNvbmZpZyAtLXZhcmlhYmxlPXN5c3RlbWRzeXN0ZW11bml0
ZGlyIHN5c3RlbWQKK1JBVUNfREVQRU5ERU5DSUVTICs9IHN5c3RlbWQKK2RlZmluZSBSQVVDX0lO
U1RBTExfSU5JVF9TWVNURU1ECisgbWtkaXIgLXAgJChUQVJHRVRfRElSKS91c3IvbGliL3N5c3Rl
bWQvc3lzdGVtL3JhdWMuc2VydmljZS5kCisgcHJpbnRmICdbSW5zdGFsbF1cbldhbnRlZEJ5PW11
bHRpLXVzZXIudGFyZ2V0XG4nIFwKKyA+JChUQVJHRVRfRElSKS91c3IvbGliL3N5c3RlbWQvc3lz
dGVtL3JhdWMuc2VydmljZS5kL2J1aWxkcm9vdC1lbmFibGUuY29uZgorZW5kZWYKK2VuZGlmCiBl
bHNlCiBSQVVDX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtc2VydmljZQogZW5kaWYKQEAgLTMzLDE3
ICs0Miw2IEBAIGVsc2UKIFJBVUNfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1qc29uCiBlbmRpZgoK
LWlmZXEgKCQoQlIyX1BBQ0tBR0VfU1lTVEVNRCkseSkKLSMgY29uZmlndXJlIHVzZXMgcGtnLWNv
bmZpZyAtLXZhcmlhYmxlPXN5c3RlbWRzeXN0ZW11bml0ZGlyIHN5c3RlbWQKLVJBVUNfREVQRU5E
RU5DSUVTICs9IHN5c3RlbWQKLWVuZGlmCi0KLWRlZmluZSBSQVVDX0lOU1RBTExfSU5JVF9TWVNU
RU1ECi0gbWtkaXIgLXAgJChUQVJHRVRfRElSKS91c3IvbGliL3N5c3RlbWQvc3lzdGVtL3JhdWMu
c2VydmljZS5kCi0gcHJpbnRmICdbSW5zdGFsbF1cbldhbnRlZEJ5PW11bHRpLXVzZXIudGFyZ2V0
XG4nIFwKLSA+JChUQVJHRVRfRElSKS91c3IvbGliL3N5c3RlbWQvc3lzdGVtL3JhdWMuc2Vydmlj
ZS5kL2J1aWxkcm9vdC1lbmFibGUuY29uZgotZW5kZWYKLQogSE9TVF9SQVVDX0RFUEVOREVOQ0lF
UyA9IFwKICBob3N0LXBrZ2NvbmYgXAogIGhvc3Qtb3BlbnNzbCBcCi0tIAoyLjMyLjAKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
