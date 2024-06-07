Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E47DC27C5F
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 16:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72FF44270A;
	Fri,  7 Jun 2024 16:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbVUxu5a7_Kp; Fri,  7 Jun 2024 16:32:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 493014270B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 493014270B;
	Fri,  7 Jun 2024 16:32:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81CE61BF47A
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 16:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E0A940272
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 16:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbWC5PJ0LuHw for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 16:32:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 564034004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 564034004A
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 564034004A
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 16:32:33 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52bc1acb9f0so633509e87.2
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 09:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717777951; x=1718382751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d9qwp+9rh+B0R5IeYN89qYMCYT/I32QR0xpyr0AfoQY=;
 b=eeobgYyoaJaK8isLXelKtQdFOZrYepIlSSkKjqEc4rBaHSrEZPlY/vQPaEVYprUgqv
 iEKTKjoNujHsyV1PGhAo2iFCp/dp3jCHlfYrSZi6jsP3lzU80k0UVJpqk3Q6hoDIc4U5
 oGX6qxXKiWIL7P0lGir3lmd/fziRQbz2g0WItPaKB2bzUnhHek+gmjl/K/TDPzWmKPOi
 jFNAs0DNmsKj7hRrqdHyahYnXVUz/Y4nB6NcoKmASftnLI6/QQ9JqEj9TOtWIaGVrULf
 LeJwiFs+scD/VcjJ49K80JIoQOdjiNGXhZwcvHzkZj5DIyj5EOQDHxrWRmxkLWrnTliS
 M2kw==
X-Gm-Message-State: AOJu0Yzqu1yTrx38KmY1Xr2QinC4HNIvVwNGNIKF2z/HVt138bVzrwGh
 rIxKEnqnDuNQTR/HvNyMW+klnwD+/td3LSnJo3GXd7O7m+k0u4GSa/CoDGuQCqjbnpWTN2bfHZT
 l/tc=
X-Google-Smtp-Source: AGHT+IE2y8nZ5LMz2uMMyVhjUkGB5uhTR2dvdHNDphL6vz3lnV3zsxcmGOjUMxww+mMtvd14OEWLWQ==
X-Received: by 2002:ac2:4895:0:b0:52a:b1d7:1ba with SMTP id
 2adb3069b0e04-52bb9f77271mr1914521e87.27.1717777951316; 
 Fri, 07 Jun 2024 09:32:31 -0700 (PDT)
Received: from junian.fritz.box (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2cd7e7sm55804205e9.46.2024.06.07.09.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 09:32:30 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 18:32:02 +0200
Message-Id: <20240607163208.1445715-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240216211344.1807353-2-raphael.melotte@mind.be>
References: <20240216211344.1807353-2-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717777951; x=1718382751; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d9qwp+9rh+B0R5IeYN89qYMCYT/I32QR0xpyr0AfoQY=;
 b=REeCpHhzQ0SiNDLJPtZib24sqaUtnoYG0Xt6Rw3VOPaNkiUY9D/BT948NKNKzvN3N1
 jvZbwl3f1V0JP9px3efhhXgKtP93xQe3jywIwJN4TagO24llENCPL4exHN2QFSnO1/bU
 jP0vWKLRvzuPmEaJUsZ+lRx2Lk+nKbhvn467UZamXCcwMSKbWDOxuYPelGHHIRUS9LRi
 lG/bM8tWKzfl2E0aM7TFv1f2xtqRpoeoUmJxDBtWseWLBd23drz7BzWx3qIDeS8xP6RL
 mN/RP52wAWiA55PkWt9MP2ZGsTHHgXOcsvbJVAxLfcTDpFL06MLNhJLXkkTaUFh5du3Z
 lE4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=REeCpHhz
Subject: [Buildroot] [PATCH v2 1/5] package: python-pymupdf: add missing
 python-zlib dependency
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SXQgdHVybnMgb3V0IHRoYXQgcHl0aG9uLXB5bXVwZGYgZG9lc24ndCByZXF1aXJlIHpsaWIgZGly
ZWN0bHksIGJ1dCBpdApkb2VzIHJlcXVpcmUgdGhlIHpsaWIgcHl0aG9uIG1vZHVsZS4KClRoaXMg
Zml4ZXMgdGhlIGZvbGxvd2luZyBydW50aW1lIGVycm9yOgoKVHJhY2ViYWNrIChtb3N0IHJlY2Vu
dCBjYWxsIGxhc3QpOgogIEZpbGUgIjxzdGRpbj4iLCBsaW5lIDEsIGluIDxtb2R1bGU+CiAgRmls
ZSAiL3Vzci9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzL2ZpdHovX19pbml0X18ucHkiLCBs
aW5lIDIyLCBpbiA8bW9kdWxlPgogIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTEvc2l0ZS1wYWNr
YWdlcy9maXR6L2ZpdHoucHkiLCBsaW5lIDM0MDIsIGluIDxtb2R1bGU+CiAgRmlsZSAiL3Vzci9s
aWIvcHl0aG9uMy4xMS9nemlwLnB5IiwgbGluZSA5LCBpbiA8bW9kdWxlPgpNb2R1bGVOb3RGb3Vu
ZEVycm9yOiBObyBtb2R1bGUgbmFtZWQgJ3psaWInCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBN
w6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogcGFja2FnZS9weXRob24tcHlt
dXBkZi9Db25maWcuaW4gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1weW11cGRmL0NvbmZpZy5p
biBiL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvQ29uZmlnLmluCmluZGV4IGVjYWE1NDk2YjUuLjM4
MzFhMjU0NTEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvQ29uZmlnLmluCisr
KyBiL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvQ29uZmlnLmluCkBAIC03LDcgKzcsNyBAQCBjb25m
aWcgQlIyX1BBQ0tBR0VfUFlUSE9OX1BZTVVQREYKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVF9T
V0lHCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0ZSRUVUWVBFCiAJc2VsZWN0IEJSMl9QQUNLQUdFX01V
UERGCi0Jc2VsZWN0IEJSMl9QQUNLQUdFX1pMSUIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9O
M19aTElCICMgcnVudGltZQogCWhlbHAKIAkgIFB5dGhvbiBiaW5kaW5ncyBmb3IgdGhlIFBERiBy
ZW5kZXJpbmcgbGlicmFyeSBNdVBERi4KIAotLSAKMi4zNy4zCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
