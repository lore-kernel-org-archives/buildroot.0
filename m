Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2B2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 02:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 101EB817AC;
	Tue, 10 May 2022 02:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tqs6s30taL83; Tue, 10 May 2022 02:21:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CB648176A;
	Tue, 10 May 2022 02:21:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 874041BF302
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 02:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76A1E8176A
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 02:21:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S7TCjrBt5nZJ for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 02:21:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4389B81767
 for <buildroot@buildroot.org>; Tue, 10 May 2022 02:21:07 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id 204so10968408pfx.3
 for <buildroot@buildroot.org>; Mon, 09 May 2022 19:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0t+NNWrJIFXvplqi9My1K7xQdXqfyGdRPPSkWHRDF6c=;
 b=jTnlJGF590W6/j9a0w3ndbnCkIymDtq2ND+rBPTDjaG3V+obyVE61eOgyUHl+ZPU3Y
 7TsyONGil12V1pEIwa+swExUzehx2BO7Cv1gKtcY34nMgWcLeItmWzTzzvsiMnJigjy8
 F2qJ3mV/A4UQpl/gfvz5NX6rTBY6SvwUhh6wSUaBzgMHHi7D4LoNQMjfD0e29YRjfg/l
 SsMRQY+LqtYt87+RlqFEWdr1JM/c4AwNvg4wlS1UYTXiF+SeAWryi0pM2t4enESxTNcE
 qUB89IPSCE4nKVlx4Eg1eDQG9aPuPzEPiWbZdqe/NoF8U7X+32GRyGAMagVzDRSPclS7
 XW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=0t+NNWrJIFXvplqi9My1K7xQdXqfyGdRPPSkWHRDF6c=;
 b=1x7dYozt49NroTLDif/lJJaRh+N3Zu2CcHIbtt7JNJwgcicxLa3ZjljMmyOKP1nNWg
 TRMyGn+bcHpDmWlg7beH2bofDTiVbQtbs+kBUeshBAQAKcH5SHCb/398688lmtLnqKMs
 7wAHyo+61D2VJti2qxJrFXGM+mpK1kAYXLq3j5t76LoNoQnAAAoo8brjxwwPI3qnGnlZ
 S2Zxt6t1Qq4B/f3CKTPJg32d2c9ZcUBDDkYwFWpM0lQafgjy84BqtuOYknbHBdp6ULeU
 NbqX6oJij3AS0upR307VQzgn8tG2YtRxU3ymRVhrK8006ua/OUMMWx5G1ckIztuirXBx
 naDQ==
X-Gm-Message-State: AOAM532LsIofYqofuJr3BCqfqBl7uFapIe6GdpyJ7lNkZN184jiNPpGY
 V2J3eJNm22cBIKzZK+dWQp8TN3sCq6M=
X-Google-Smtp-Source: ABdhPJzfNTvIdeREqtJGeVO338oSmq4ceIcVhGRMiGPm+0GZbqWhz2gWBGnau73kjOI3a50Huxu7gg==
X-Received: by 2002:a63:8b41:0:b0:3c6:26ba:ab14 with SMTP id
 j62-20020a638b41000000b003c626baab14mr15589055pge.49.1652149265874; 
 Mon, 09 May 2022 19:21:05 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a170902d50900b0015e8d4eb22asm599661plg.116.2022.05.09.19.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 19:21:04 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 11:50:55 +0930
Message-Id: <20220510022055.67582-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] linux: Fix powerpc64le defconfig selection
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
Cc: mpe@ellerman.id.au
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGRlZmF1bHQgZGVmY29uZmlnIHRhcmdldCBmb3IgdGhlIDY0IGJpdCBwb3dlcnBjIGtlcm5l
bCBpcwpwcGM2NF9kZWZjb25maWcsIHRoZSBiaWcgZW5kaWFuIGNvbmZpZ3VyYXRpb24uCgpXaGVu
IGJ1aWxkaW5nIGZvciBwb3dlcnBjNjRsZSB1c2VycyB3YW50IHRoZSBsaXR0bGUgZW5kaWFuIGtl
cm5lbCBhcwp0aGV5IGNhbid0IGJvb3QgTEUgdXNlcnNwYWNlIG9uIGEgQkUga2VybmVsLgoKRml4
IHVwIHRoZSBkZWZjb25maWcgdXNlZCBpbiB0aGlzIGNhc2UuIFRoaXMgd2lsbCBhdm9pZCB0aGUg
Zm9sbG93aW5nCmF1dG9idWlsZGVyIGZhaWx1cmU6CgogVkRTTzMyQSBhcmNoL3Bvd2VycGMva2Vy
bmVsL3Zkc28zMi9zaWd0cmFtcC5vCiBjYzE6IGVycm9yOiDigJgtbTMy4oCZIG5vdCBzdXBwb3J0
ZWQgaW4gdGhpcyBjb25maWd1cmF0aW9pbgogbWFrZVs0XTogKioqIFthcmNoL3Bvd2VycGMva2Vy
bmVsL3Zkc28zMi9NYWtlZmlsZTo0OTogYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvMzIvc2lndHJh
bXAub10gRXJyb3IgMQoKIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2Rk
NzZkNTNiYWI1NjQ3MGMwYjgzZTI5Njg3MmQ3YmI5MGY5ZTgyOTYvCgpOb3RlIHRoYXQgdGhlIGZh
aWx1cmUgaW5kaWNhdGVzIHRoZSB0b29sY2hhaW4gaXMgY29uZmlndXJlZCB0byBkaXNhYmxlCnRo
ZSAzMiBiaXQgdGFyZ2V0LCBjYXVzaW5nIHRoZSBrZXJuZWwgdG8gZmFpbCB3aGVuIGJ1aWxkaW5n
IHRoZSAzMiBiaXQKVkRTTy4gVGhpcyBpcyBvbmx5IGEgcHJvYmxlbSBvbiB0aGUgQkUga2VybmVs
IGFzIHRoZSBMRSBrZXJuZWwgZGlzYWJsZXMKQ09ORklHX0NPTVBBVCwgYWthIDMyIGJpdCB1c2Vy
c3BhY2Ugc3VwcG9ydCwgYnkgZGVmYXVsdC4KClNpZ25lZC1vZmYtYnk6IEpvZWwgU3RhbmxleSA8
am9lbEBqbXMuaWQuYXU+Ci0tLQpBbHRlcm5hdGl2ZWx5LCB3ZSBjb3VsZCBkaXNhbG93IEJSMl9M
SU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUcKd2hlbiBCUjJfcG93ZXJwYzY0bGU9
eS4KCiBsaW51eC9saW51eC5tayB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2xpbnV4L2xpbnV4Lm1rIGIvbGludXgvbGludXgubWsKaW5kZXgg
YjI3ZTQzNmIwZDU3Li42NzgzMjEyN2Q5MmUgMTAwNjQ0Ci0tLSBhL2xpbnV4L2xpbnV4Lm1rCisr
KyBiL2xpbnV4L2xpbnV4Lm1rCkBAIC0zMDcsNyArMzA3LDExIEBAIGVuZGlmCiBpZmVxICgkKEJS
Ml9MSU5VWF9LRVJORUxfVVNFX0RFRkNPTkZJRykseSkKIExJTlVYX0tDT05GSUdfREVGQ09ORklH
ID0gJChjYWxsIHFzdHJpcCwkKEJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHKSlfZGVmY29uZmln
CiBlbHNlIGlmZXEgKCQoQlIyX0xJTlVYX0tFUk5FTF9VU0VfQVJDSF9ERUZBVUxUX0NPTkZJRyks
eSkKK2lmZXEgKCQoQlIyX3Bvd2VycGM2NGxlKSx5KQorTElOVVhfS0NPTkZJR19ERUZDT05GSUcg
PSBwcGM2NGxlX2RlZmNvbmZpZworZWxzZQogTElOVVhfS0NPTkZJR19ERUZDT05GSUcgPSBkZWZj
b25maWcKK2VuZGlmCiBlbHNlIGlmZXEgKCQoQlIyX0xJTlVYX0tFUk5FTF9VU0VfQ1VTVE9NX0NP
TkZJRykseSkKIExJTlVYX0tDT05GSUdfRklMRSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9DT05GSUdfRklMRSkpCiBlbmRpZgotLSAKMi4zNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
