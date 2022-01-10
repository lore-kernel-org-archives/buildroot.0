Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E414C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 13:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E772A60591;
	Mon, 10 Jan 2022 13:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oq1vyysQlWV0; Mon, 10 Jan 2022 13:16:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17FD460AC5;
	Mon, 10 Jan 2022 13:16:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F3421BF3EA
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 13:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D4CE60DF9
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 13:16:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MDT7FKEmuE5q for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 13:16:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A280760591
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 13:16:30 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t28so19942548wrb.4
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 05:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/5VRu1KoGowtFVxXBOONzEtVbBEoyuWu68Rhb+hHhsI=;
 b=Dgn9/w9aC8Ltb5N+2hdOzwvaDFtVkybn53LHUoMfLLuMXHOnOX80QEYBZ2/AR81EJ9
 HwHh2uKtkiUc/7PR7FQetn9n5kI7LZAsZbxt23e9xCHr7HFlxMAGapohSzqwEeEKs1D9
 0FMr0782LS2fQQcG98zImyH863gwLRtE/v53wyrcpEzrjczqJvHusmU/Q4x+EX47b7nU
 W2RKMdC7405QJPTlr/59CsAZShcWYo2MwqsbRr1K4i9ml5aCo0TPjx18BK7JT978RD2o
 I1dexkXQvvSYLFEKkeVyu2/yX2+mbWR4vyFWE/zTp5DCqbncd501RGXqT6lqaf6OKYbw
 BV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/5VRu1KoGowtFVxXBOONzEtVbBEoyuWu68Rhb+hHhsI=;
 b=Hx4xOP4tIbccpAQQp31629yb6N1QpZmk4qb2RoIuBGuB8wDmb//Z77bkssyCPMEWdM
 di/icrQN3J2YhwkPoEcXXKQSyY+y5GNoEv1DOJvvTkNiii0bkoszi9zZqJzSVxf7UBgG
 mOye1bUKm5KUOmgUexsT5ns6T+KlXuSFHLczkiirJKeevgGrXyNB7Pv6Il9qBw4dGXtc
 5AFwpHIgC0DX/fCTjVDiBLFB2mBKFeXWMZEHRMzzO9KtsaH5N+ocw8J0UE8VJ0OiP+9P
 WRXrmvYNn1Hvdo/p/oTuC/ddxuGmbE/Ov9S9lFT0uPoGIa0/UtTet7I64a2iVjDI7IMx
 nlpQ==
X-Gm-Message-State: AOAM530Nd4fzTFJbXbY0+Jj0CmI3Xqz2cQvyQkXFzEKeD5HPQoG+j43P
 fsNnIBv1PsXfYZkHl6u6kbwrclod69/6g8U9
X-Google-Smtp-Source: ABdhPJwNc606lJT+ys/ntkx8wCDLbu40VoW/Om4sZv8FH5aLJGe1cu+bqbEc1fNqoBQVyeFnzr1Kvg==
X-Received: by 2002:adf:f8d2:: with SMTP id f18mr7186043wrq.401.1641820588735; 
 Mon, 10 Jan 2022 05:16:28 -0800 (PST)
Received: from arnoutx1.passengers.t39.sncf ([109.190.253.16])
 by smtp.gmail.com with ESMTPSA id o8sm7514993wry.20.2022.01.10.05.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 05:16:28 -0800 (PST)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 14:16:24 +0100
Message-Id: <20220110131624.3639727-1-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/systemd: add checklist of upgrade
 caveats
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
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20ROSEN?= <jeremy.rosen@smile.fr>,
 Norbert Lange <nolange79@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVtcGluZyB0aGUgdmVyc2lvbiBvZiBzeXN0ZW1kIGlzIGEgbGl0dGxlIG1vcmUgY29tcGxpY2F0
ZWQgdGhhbiB0aGUKdXN1YWwgcGFja2FnZSwgYW5kIGl0J3MgZWFzeSB0byBmb3JnZXQgc29tZSBv
ZiB0aGUgdGhpbmdzIHRoYXQgbmVlZCB0bwpiZSBkb25lIC0gYW5kIHRoaXMgaGFzIGhhcHBlbmVk
IHNldmVyYWwgdGltZXMgaW4gdGhlIHBhc3QuCgpBZGQgYSBjaGVja2xpc3Qgb2YgdGhpbmdzIHRv
IHdvcnJ5IGFib3V0IHdoZW4gdXBkYXRpbmcgc3lzdGVtZC4KCk5vdGUgdGhhdCB0aGVyZSBhcmUg
bWFueSBvdGhlciBjb21wbGljYXRlZCBwYWNrYWdlcyB0aGF0IGFsc28gbmVlZCBhIGxvdApvZiBh
dHRlbnRpb24gd2hlbiB1cGdyYWRpbmcuIEhvd2V2ZXIsIHN5c3RlbWQgaXMgYSByZWFsbHkgY3Jp
dGljYWwKcGFja2FnZSBzbyBpdCdzIG1vcmUgaW1wb3J0YW50IHRoYXQgd2UgZ2V0IHRoYXQgb25l
IHJpZ2h0IHRoYW4sIHNheSwKdmFsZ3JpbmQuCgpDYzogTm9yYmVydCBMYW5nZSA8bm9sYW5nZTc5
QGdtYWlsLmNvbT4KQ2M6IErDqXLDqW15IFJPU0VOIDxqZXJlbXkucm9zZW5Ac21pbGUuZnI+CkNj
OiBBZGFtIER1c2tldHQgPGFkdXNrZXR0QGdtYWlsLmNvbT4KQ2M6IEphbWVzIEhpbGxpYXJkIDxq
YW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBBcm5vdXQgVmFuZGVjYXBw
ZWxsZSAoRXNzZW5zaXVtL01pbmQpIDxhcm5vdXRAbWluZC5iZT4KLS0tCiBwYWNrYWdlL3N5c3Rl
bWQvc3lzdGVtZC5tayB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tayBiL3BhY2th
Z2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCmluZGV4IDM4MTFkYmFlNDIuLjRkODJkMmFiODEgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCisrKyBiL3BhY2thZ2Uvc3lzdGVtZC9z
eXN0ZW1kLm1rCkBAIC00LDYgKzQsMTggQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAK
KyMgV2hlbiB1cGRhdGluZyBzeXN0ZW1kLCB0YWtlIGNhcmUgb2YgdGhlIGZvbGxvd2luZzoKKyMg
LSBDaGVjayBpZiB0aGUgcmVxdWlyZW1lbnRzIGhhdmUgY2hhbmdlZCAoc2VlIFJFQURNRSksIGlu
IHBhcnRpY3VsYXIKKyMgICBhcmNoIGFuZCBoZWFkZXJzCisjIC0gSWYgeWVzLCBwcm9wYWdhdGUg
dGhlIGRlcGVuZGVuY2llcyB0byBCUjJfSU5JVF9TWVNURU1ECisjIC0gSWYgdGhlIHJlcXVpcmVk
IGtlcm5lbCBvcHRpb25zIGhhdmUgY2hhbmdlZCwgdXBkYXRlIHRoZSBDb25maWcuaW4KKyMgICBo
ZWxwIHRleHQgYW5kIHRoZSBsaXN0IG9mIEtDT05GSUdfRU5BQkxFX09QVC4KKyMgLSBDaGVjayBp
ZiB0aGVyZSBhcmUgbmV3IG1lc29uX29wdGlvbnMuIE1ha2Ugc3VyZSBhbGwgb3B0aW9ucyBhcmUg
c2V0CisjICAgZXhwbGljaXRseSAodXN1YWxseSB0byBkZWZhdWx0IHZhbHVlKS4KKyMgLSBJZiB0
aGVyZSBhcmUgbmV3IHNlcnZpY2VzOgorIyAgIC0gY3JlYXRlIG5ldyBvcHRpb25zIGZvciB0aGVt
IChpZiB0aGV5IHJlYWxseSBhcmUgb3B0aW9uYWwpOworIyAgIC0gY3JlYXRlIGEgbmV3IF9VU0VS
IGlmIG5lY2Vzc2FyeTsKKyMgICAtIGNyZWF0ZSBuZXcgZGlyZWN0aW9ucnkgKHdpdGggX1BFUk1J
U1NJT05TKSBpZiBuZWNlc3NhcnkuCiBTWVNURU1EX1ZFUlNJT04gPSAyNTAuMQogU1lTVEVNRF9T
SVRFID0gJChjYWxsIGdpdGh1YixzeXN0ZW1kLHN5c3RlbWQtc3RhYmxlLHYkKFNZU1RFTURfVkVS
U0lPTikpCiBTWVNURU1EX0xJQ0VOU0UgPSBcCi0tIAoyLjMxLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
