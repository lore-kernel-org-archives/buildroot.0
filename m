Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473DFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 11:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF01F60B32;
	Sat, 12 Feb 2022 11:17:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c3SXQGUvy26k; Sat, 12 Feb 2022 11:17:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E21DC60AFC;
	Sat, 12 Feb 2022 11:17:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A13CB1BF3A4
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85B8A83E63
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:17:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ntoX1hjnzhpj for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 11:17:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69DA183E50
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 11:17:19 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id c192so6884679wma.4
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 03:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p/UlkcdCffDQfjQ7du7CVOjkNbzC8h6NqmVeOoGzlIE=;
 b=etMuyfzpBzcYjqaEyahRD9epj74+m2/5DeQi3kQWvX8+EpCkVlR3qrN/kxrFlqGG53
 Zl5CBzDygFvWpzBhS2DeR3vWNp8V2J519fTqXzWQUrPRo7PpmeQUe49ZeKRc2qOXANiM
 Y3Ym3OtqEVO/OnhjHbDdn8Sg6+ZXukXzTRlZ7ZNqzDD1jBbXywTJ2A3iWBkZoy7/5UGA
 TXkRd/fljFuRYpnq+Eukj3Jp2C8Aj4i2dbetbvsBj5tr0wWS/aYDAeb9MMwVEKRWupR/
 C52EHH74PZtIOnQUIHPM3bNxI3X3XWDLce+deCbzvlwaQRlJcB9NQroo/bk4gzBSl3V1
 EhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p/UlkcdCffDQfjQ7du7CVOjkNbzC8h6NqmVeOoGzlIE=;
 b=lND2LGxnfRvghj1t5arE/4er43TPBznVrep5J3mTZ5cf0wysB6qcvzGnW3CpWjbMiy
 rr6eFR9E9pKNbkvqP9auA9+2Vq9CdsH+mO4ot2GWP5jT3i7XnU/hL/E/1mUExFFYnH0R
 Sg0gwllmiJ8tD0kP1TXlvY974UJ0GLI91gyQN5OHZuZegXBZx8R+L3jazmBELgEQX1D6
 4eT8f+f/oUMvafUa2+dsltZ3sLym5NWXxDJHBJXjl99tLhQLm4cXDrDD4fSTLGK460fh
 dBh73kgvdBbWfsbyf8BPveHBpYuMARf9bLtm5PtvrlNA6/ZZcTABAmsWgY5YQEkKzjgx
 vDRA==
X-Gm-Message-State: AOAM530wdtirNc48Ogus71OU+LkIjitGpZiNlKj188BUs99+DN4uG1+L
 P6BTei2KSvd5drU/RTZgc8h4ufCdgvM=
X-Google-Smtp-Source: ABdhPJzs6wnxOiZ3DxF9zJgAqxaUfoScKZr5Mue7065vTBcsGB3pAgXWelHtU/wDifFpsERpNSIJ/A==
X-Received: by 2002:a1c:a141:: with SMTP id k62mr3830806wme.0.1644664637086;
 Sat, 12 Feb 2022 03:17:17 -0800 (PST)
Received: from Clement-Blade14.home
 (2a01cb0003ba9b005ce88ca2b701695e.ipv6.abo.wanadoo.fr.
 [2a01:cb00:3ba:9b00:5ce8:8ca2:b701:695e])
 by smtp.gmail.com with ESMTPSA id l26sm6005401wmp.31.2022.02.12.03.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 03:17:16 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 12:17:10 +0100
Message-Id: <20220212111710.22559-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/beelink_gs1: select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2VsZWN0IEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BFTlNTTCB0byBmaXggdGhlIGZvbGxvd2lu
ZyBidWlsZAplcnJvcjoKCmluY2x1ZGUvaW1hZ2UuaDoxMTc4OjEyOiBmYXRhbCBlcnJvcjogb3Bl
bnNzbC9ldnAuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQogMTE3OCB8ICMgIGluY2x1ZGUg
PG9wZW5zc2wvZXZwLmg+CiAgICAgIHwgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn4KCkZpeGVz
OgotIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMjA3
NjQ3NTAzMwoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWls
LmNvbT4KLS0tCiBjb25maWdzL2JlZWxpbmtfZ3MxX2RlZmNvbmZpZyB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvY29uZmlncy9iZWVsaW5rX2dzMV9k
ZWZjb25maWcgYi9jb25maWdzL2JlZWxpbmtfZ3MxX2RlZmNvbmZpZwppbmRleCBjYTk1M2RmM2Vh
Li5iN2I3ZWI4NGQwIDEwMDY0NAotLS0gYS9jb25maWdzL2JlZWxpbmtfZ3MxX2RlZmNvbmZpZwor
KysgYi9jb25maWdzL2JlZWxpbmtfZ3MxX2RlZmNvbmZpZwpAQCAtMzksNiArMzksNyBAQCBCUjJf
VEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OPXkKIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZF
UlNJT05fVkFMVUU9IjIwMjEuMTAiCiBCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0i
YmVlbGlua19nczEiCiBCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQz15CitCUjJfVEFSR0VUX1VC
T09UX05FRURTX09QRU5TU0w9eQogQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWVRIT04zPXkKIEJS
Ml9UQVJHRVRfVUJPT1RfTkVFRFNfUFlMSUJGRFQ9eQogQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19B
VEZfQkwzMT15Ci0tIAoyLjMyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
