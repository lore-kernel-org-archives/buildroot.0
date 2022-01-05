Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BA6C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 16:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0D0841551;
	Wed,  5 Jan 2022 16:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hyas9VRYCi02; Wed,  5 Jan 2022 16:20:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44C40410B8;
	Wed,  5 Jan 2022 16:20:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 248A71BF281
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 16:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1168C40587
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 16:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vaPPZl1MbfSq for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 16:20:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4759340108
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 16:20:17 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id v10so31402216ilj.3
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 08:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=7/Q1hj1xkg5NcNMuZ4M8oppmJG3InKJRhr2rsdq8T18=;
 b=QQUS4LiBza5yPpeVS6vRhy6n4OiP9E6sIjD1ciTDfxtJG9rqsFKTACYi45UW24zWhA
 aliHKhfKDor2MuXgsR+aNNY6vVivWeCr/fc2EB8Iy7B9nqRUwuQt8FCVjAtuTKQcmxa4
 jaqvAzcMa1UQ6gRtGNbkA0sJSFJI+8hY5LTL50MwquF0c+6ItC3o88RC4avCOtIoHI0R
 9hBkleH3r6EjKGuM4BzVqnqFVH4OYJIU6NzIrtiDxCm4IPYYRFA7jACI6x4e4tW5p1Tr
 Tb0NAHZjsA5g3Znrat4dRjlYe/0oJ/PaHn3lBaTV9FkMw0MW0YMuBnQks0gjemmK4Ylu
 VJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=7/Q1hj1xkg5NcNMuZ4M8oppmJG3InKJRhr2rsdq8T18=;
 b=KqV7Gdkju4t7NK6YQYn48EteAzkVzmiTVXpaWBjzvlLOvYUBtNOi0ptQNlJjvrotNi
 5MlN0emnL3O9Sh3zBkB1EqVs4CMMDLg4tDHs+mpw85Bjzf8wpCMLnOaNYEfFCRh/w99+
 PqGZtRKGnyltWflOubY21i48nHJyZtIq40kMOT6dIQ4sEj7jSktEXGmiOD+AnjosdhHT
 HMCHAzbngJLrwzC6PCyZ8JUCfzIV2XwtTf0FacKLK3YkhX8lqNSphvpSeQQrZlUjJRIi
 HXWVqD4r1TcXxKO6klOP6VKEWBznuzMKzd/YlnspmaTDHk8iv3z6qFeKdptfcn9OXsBG
 wODQ==
X-Gm-Message-State: AOAM532QAsnB8G0qMhEDG4Id57jH5NpMKBmu/BvVgupGgrfJu38TIbAj
 gFeQYM0Mo56izEmf0SCZbm/Vi3nAhcidLnjb8k0alNY40cM=
X-Google-Smtp-Source: ABdhPJzeLwmQfJskS362FVEG0/roqjPgavkzkfeapGSj6fQCGqoD7SJbKWSY/w6ruU7jdJ8aEaFTQp+qbpgb15cwxGY=
X-Received: by 2002:a92:4b02:: with SMTP id m2mr73001ilg.280.1641399616329;
 Wed, 05 Jan 2022 08:20:16 -0800 (PST)
MIME-Version: 1.0
From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 5 Jan 2022 11:20:05 -0500
Message-ID: <CANxTyt77U8pvGxbjHi5MRL5Y3OgafCs_rWNSb=aAY=2BJ0X7ZA@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: [Buildroot] call with hooks
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

IEhlbGxvIGFsbCwKCkkgbm90aWNlZCBhIHBvc3NpYmxlIGluY29uc2lzdGVuY3ksIGFuZCB0aG91
Z2h0IEkgc2hvdWxkIHBvc3QgaXQuCkxvb2tpbmcgYXQgcGxhY2VzIHdoZXJlIGJ1aWxkcm9vdCB1
c2VzIGhvb2tzOgoKJCBncmVwIC1yICckKGhvb2spKSQoc2VwKScgLgouL01ha2VmaWxlOiAkKGZv
cmVhY2ggaG9vaywkKFRBUkdFVF9GSU5BTElaRV9IT09LUyksJCgkKGhvb2spKSQoc2VwKSkKLi9w
YWNrYWdlL3BrZy1nZW5lcmljLm1rOiAkKGZvcmVhY2gKaG9vaywkKCQoUEtHKV9QUkVfRE9XTkxP
QURfSE9PS1MpLCQoY2FsbCAkKGhvb2spKSQoc2VwKSkKLi9wYWNrYWdlL3BrZy1nZW5lcmljLm1r
OiAkKGZvcmVhY2gKaG9vaywkKCQoUEtHKV9QT1NUX0RPV05MT0FEX0hPT0tTKSwkKGNhbGwgJCho
b29rKSkkKHNlcCkpCi4vcGFja2FnZS9wa2ctZ2VuZXJpYy5tazogJChmb3JlYWNoCmhvb2ssJCgk
KFBLRylfUFJFX0VYVFJBQ1RfSE9PS1MpLCQoY2FsbCAkKGhvb2spKSQoc2VwKSkKLi9wYWNrYWdl
L3BrZy1nZW5lcmljLm1rOiAkKGZvcmVhY2gKaG9vaywkKCQoUEtHKV9QT1NUX0VYVFJBQ1RfSE9P
S1MpLCQoY2FsbCAkKGhvb2spKSQoc2VwKSkKLi9wYWNrYWdlL3BrZy1nZW5lcmljLm1rOiAkKGZv
cmVhY2gKaG9vaywkKCQoUEtHKV9QUkVfUlNZTkNfSE9PS1MpLCQoY2FsbCAkKGhvb2spKSQoc2Vw
KSkKLi9wYWNrYWdlL3BrZy1nZW5lcmljLm1rOiAkKGZvcmVhY2gKaG9vaywkKCQoUEtHKV9QT1NU
X1JTWU5DX0hPT0tTKSwkKGNhbGwgJChob29rKSkkKHNlcCkpCi4vcGFja2FnZS9wa2ctZ2VuZXJp
Yy5tazogJChmb3JlYWNoCmhvb2ssJCgkKFBLRylfUFJFX1BBVENIX0hPT0tTKSwkKGNhbGwgJCho
b29rKSkkKHNlcCkpCi4vcGFja2FnZS9wa2ctZ2VuZXJpYy5tazogJChmb3JlYWNoCmhvb2ssJCgk
KFBLRylfUE9TVF9QQVRDSF9IT09LUyksJChjYWxsICQoaG9vaykpJChzZXApKQouL3BhY2thZ2Uv
cGtnLWdlbmVyaWMubWs6ICQoZm9yZWFjaApob29rLCQoJChQS0cpX1BPU1RfUFJFUEFSRV9IT09L
UyksJChjYWxsICQoaG9vaykpJChzZXApKQouL3BhY2thZ2UvcGtnLWdlbmVyaWMubWs6ICQoZm9y
ZWFjaApob29rLCQoJChQS0cpX1BSRV9DT05GSUdVUkVfSE9PS1MpLCQoY2FsbCAkKGhvb2spKSQo
c2VwKSkKLi9wYWNrYWdlL3BrZy1nZW5lcmljLm1rOiAkKGZvcmVhY2gKaG9vaywkKCQoUEtHKV9Q
T1NUX0NPTkZJR1VSRV9IT09LUyksJChjYWxsICQoaG9vaykpJChzZXApKQouL3BhY2thZ2UvcGtn
LWdlbmVyaWMubWs6ICQoZm9yZWFjaApob29rLCQoJChQS0cpX1BSRV9CVUlMRF9IT09LUyksJChj
YWxsICQoaG9vaykpJChzZXApKQouL3BhY2thZ2UvcGtnLWdlbmVyaWMubWs6ICQoZm9yZWFjaApo
b29rLCQoJChQS0cpX1BPU1RfQlVJTERfSE9PS1MpLCQoY2FsbCAkKGhvb2spKSQoc2VwKSkKLi9w
YWNrYWdlL3BrZy1nZW5lcmljLm1rOiAkKGZvcmVhY2gKaG9vaywkKCQoUEtHKV9QUkVfSU5TVEFM
TF9IT09LUyksJChjYWxsICQoaG9vaykpJChzZXApKQouL3BhY2thZ2UvcGtnLWdlbmVyaWMubWs6
ICQoZm9yZWFjaApob29rLCQoJChQS0cpX1BPU1RfSU5TVEFMTF9IT09LUyksJChjYWxsICQoaG9v
aykpJChzZXApKQouL3BhY2thZ2UvcGtnLWdlbmVyaWMubWs6ICQoZm9yZWFjaApob29rLCQoJChQ
S0cpX1BSRV9JTlNUQUxMX1NUQUdJTkdfSE9PS1MpLCQoY2FsbCAkKGhvb2spKSQoc2VwKSkKLi9w
YWNrYWdlL3BrZy1nZW5lcmljLm1rOiAkKGZvcmVhY2gKaG9vaywkKCQoUEtHKV9QT1NUX0lOU1RB
TExfU1RBR0lOR19IT09LUyksJChjYWxsICQoaG9vaykpJChzZXApKQouL3BhY2thZ2UvcGtnLWdl
bmVyaWMubWs6ICQoZm9yZWFjaApob29rLCQoJChQS0cpX1BSRV9JTlNUQUxMX0lNQUdFU19IT09L
UyksJChjYWxsICQoaG9vaykpJChzZXApKQouL3BhY2thZ2UvcGtnLWdlbmVyaWMubWs6ICQoZm9y
ZWFjaApob29rLCQoJChQS0cpX1BPU1RfSU5TVEFMTF9JTUFHRVNfSE9PS1MpLCQoY2FsbCAkKGhv
b2spKSQoc2VwKSkKLi9wYWNrYWdlL3BrZy1nZW5lcmljLm1rOiAkKGZvcmVhY2gKaG9vaywkKCQo
UEtHKV9QUkVfSU5TVEFMTF9UQVJHRVRfSE9PS1MpLCQoY2FsbCAkKGhvb2spKSQoc2VwKSkKLi9w
YWNrYWdlL3BrZy1nZW5lcmljLm1rOiAkKGZvcmVhY2gKaG9vaywkKCQoUEtHKV9QT1NUX0lOU1RB
TExfVEFSR0VUX0hPT0tTKSwkKGNhbGwgJChob29rKSkkKHNlcCkpCgpOb3RpY2UgdGhhdCB0aGUg
b25lIGhpdCBpbiBNYWtlZmlsZSB1c2VzICIkKCQoaG9vaykpJChzZXApIiB3aGlsZSB0aGUKaGl0
cyBpbiBwa2ctZ2VuZXJpYy5tayB1c2UgIiQoY2FsbCAkKGhvb2spKSQoc2VwKSIuICBNeSBNYWtl
LWZ1IGlzbid0CnBvd2VyZnVsIGVub3VnaCB0byB1bmRlcnN0YW5kIGlmIHRoZXJlIGlzIGFuIGFj
dHVhbCBwcm9ibGVtIC0gc2hvdWxkCnRoZXJlIGJlIGEgImNhbGwiIGluIHRoZSBNYWtlZmlsZSBs
aW5lPyAgVGhlIGdlbmVyYWwgc3ludGF4IGZvciBjYWxsCmlzICIkKGNhbGwgdmFyaWFibGUscGFy
YW0scGFyYW0s4oCmKSIgc28gSSBkb24ndCBmb2xsb3cgd2hhdCB0aGUgZXh0cmEKY2FsbCBpbiAk
KGNhbGwgJChob29rKSBpcyBkb2luZyBmb3IgdXMuCgpUaGFua3MsCkRhbm9taSAtCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
