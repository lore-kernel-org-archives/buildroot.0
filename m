Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7516C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0D25405E9;
	Wed,  1 May 2024 21:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NK6YGpNjPhZ2; Wed,  1 May 2024 21:13:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B94A041799
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B94A041799;
	Wed,  1 May 2024 21:13:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD2781BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B986E41719
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:13:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_e8efNKvUje for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:13:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF7D7401D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF7D7401D8
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF7D7401D8
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:13:12 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-34e0d47bd98so127657f8f.0
 for <buildroot@buildroot.org>; Wed, 01 May 2024 14:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714597990; x=1715202790;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O19mkPwHoQ/hkzKsPvEhEDOkQjPfFbfKC+/Lc4NxmxI=;
 b=R1YXu3ObOFSKtnXKHqccFcyobIo+RvUsMYFwWlLiNC0kR2toj4+kvTdsIkYl4qPiHr
 rxOOmU+xuj4DmHgPe41cnKRvimJBJRfIWlw2u4a07BFHOK4WBANRKvY8Xi6/j2YWjnyr
 hTHnlqUFYDF9s+T45XnNOxD02WwXKKA9YhoE1WySgl4KdaEYfsNUX01nJ0n85izqisQS
 o/uGhiwHXQB6JocDkg+72Nth62FIEthPX+0k4czVGTXGjQTGJEdM7tGMdLuWO2fZat5J
 Ql94fNz1ZVBQzruSmrWyCsRTqUpcGccBGwzB5h2Cqa/F9mKX1UcU7nKQsqw63WYPVJIv
 rhRw==
X-Gm-Message-State: AOJu0YyF5sfFYdgyxwG2xt6eGGNVAeEq6yuMI4BqaSv6Dkk39PjOnwLq
 mVqWvtzHhFxcH31rgZtLmT2Ws5qLA398v5Q6Csu3TfE53/dnN8fG6aZ8kYGzxH+d0PwgwApmDrY
 x
X-Google-Smtp-Source: AGHT+IHHig88h5tUlxGKFQL6ZSX4d5NIVl1bYV4RgGTmAQu6rW7sswu6EjbdjEnYaDM3iwnVubrpAQ==
X-Received: by 2002:a5d:61cb:0:b0:34d:a19b:56af with SMTP id
 q11-20020a5d61cb000000b0034da19b56afmr599329wrv.5.1714597990653; 
 Wed, 01 May 2024 14:13:10 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 bg33-20020a05600c3ca100b0041c14e42e2bsm3313766wmb.44.2024.05.01.14.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 14:13:10 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  1 May 2024 23:12:43 +0200
Message-ID: <20240501211300.1590881-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714597990; x=1715202790;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O19mkPwHoQ/hkzKsPvEhEDOkQjPfFbfKC+/Lc4NxmxI=;
 b=r4mBXOSYinyFcM+gd2qJI9ib23kJsnTw7ODi3UnAUX/10D65Q8Y96/fE2oVRrFIv8N
 tP7P564Qe997jAPJsdAtfshnuzR9ICll0t4XP2Qo/s/UMteqtarmbw9vkmLkGmCKmY3v
 6AphEW+y1XGyeAkaMk8nrPjzBh1WbEiHYvDc2pWav74JwMtyJLn5QOHREeqfqvGiS0XT
 Z5zxP8nJ7Of3iQF+VMkyjVeoNDicYyte6l+gTHkIVYhsu4zV7LURkeHcI1gQ2ny6Csv5
 XFgjVWrUFLAqh9Mp3ig7I3EE3jQNaoEpmWmOBdtxPuT6X0dZFRQsBptZuS6Fzkmr5Jbh
 wD5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=r4mBXOSY
Subject: [Buildroot] [PATCH] DEVELOPERS: remove Sebastian Weyer
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2ViYXN0aWFuIGVtYWlsIGFkZHJlc3MgYXQgU21pbGUgaXMgYm91bmNpbmcsIHNvIGRyb3AgaXQK
ZnJvbSB0aGUgREVWRUxPUEVSUyBmaWxlLgoKU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAc21pbGUuZnI+Ci0tLQogREVWRUxPUEVSUyB8IDggLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZF
TE9QRVJTCmluZGV4IDExZmZlMTdmOTIuLjVkMTk4NTY3ZDggMTAwNjQ0Ci0tLSBhL0RFVkVMT1BF
UlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMjc2OSwxNCArMjc2OSw2IEBAIEY6CXN1cHBvcnQvbWlz
Yy90b29sY2hhaW5maWxlLmNtYWtlLmluCiBOOglTYW0gVm9zcyA8c2FtLnZvc3NAZ21haWwuY29t
PgogRjoJcGFja2FnZS9yaXBncmVwLwogCi1OOglTZWJhc3RpYW4gV2V5ZXIgPHNlYmFzdGlhbi53
ZXllckBzbWlsZS5mcj4KLUY6ICAgICAgcGFja2FnZS9hbWxvZ2ljLWJvb3QtZmlwLwotRjoJcGFj
a2FnZS9udXNoZWxsLwotRjoJcGFja2FnZS9ydXN0LWJpbmRnZW4vCi1GOglwYWNrYWdlL3NwaXJ2
LWhlYWRlcnMvCi1GOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfbnUubnUK
LUY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbnUucHkKLQogTjoJU8OpYmFz
dGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgogRjoJYm9h
cmQvYXJtYWRldXMvCiBGOgljb25maWdzL2FybWFkZXVzKgotLSAKMi40NC4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
