Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9610EE3F3F
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 22:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56C2E41B8F;
	Tue, 12 Sep 2023 22:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56C2E41B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qe3EC1ysplwf; Tue, 12 Sep 2023 22:16:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C50441B88;
	Tue, 12 Sep 2023 22:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C50441B88
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 089C81BF831
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 22:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D52E760E7A
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 22:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D52E760E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 719j7-SQkE4C for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 22:15:56 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3358060D88
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 22:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3358060D88
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-403004a96eeso41873025e9.3
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 15:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694556954; x=1695161754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MrJofmGJAqTo7N9UyLvrsRvs6YMRJzik/ugUkrDdQyk=;
 b=XEhskEiMaSAPEWyaD/Drl3/rt6e5rl+Vs4O6B0hlWKdJByzY+u0ErF/Yd6xn/UE/Q5
 Yf4IIZ1Co0RygUOJ3AfSDQU6ii3RIWSKRmUbHD+OccOIrvVkQmScbjvQ9Ed2eKv7uXm9
 idhJi/yvGMZCPFBFM5/RWbp8x1KHMGgMcfmoF5Rnt0LSIkQeb+9qFEUNRrRfFAJ0J7G+
 wdWIbzcRBF9KlSJhBPHy/XITyFhNxvwP/B0AJi4n08m8juEp4is+Dy7emlTGWy5ImdSQ
 vu4uFOHZyKIQXOsmy5Bcr6aKrd0Ojh+85NcWcZ8Sf4cAwPiW4zj4BbJ/832+aLrqANNg
 VFWg==
X-Gm-Message-State: AOJu0YwGv+iXSrQk3M4+371B4p3Zuu2zGjzfPs3bqAuZ7IWG3Iwo0tVg
 ScvI6N1wHp6+ZQNzpfdm12ZNqR9NpyQ=
X-Google-Smtp-Source: AGHT+IET136DqoIsHtejRyCaz8CSNG8BqRH04xZisVtfe9gkdhCazAUlauRVWYy7fa11knsEZJihWA==
X-Received: by 2002:a05:600c:20d5:b0:3fb:d1db:545b with SMTP id
 y21-20020a05600c20d500b003fbd1db545bmr557374wmm.20.1694556954221; 
 Tue, 12 Sep 2023 15:15:54 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:d377:8b3f:c881:5464])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a5d67c7000000b0031423a8f4f7sm13901170wrw.56.2023.09.12.15.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 15:15:53 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 00:15:49 +0200
Message-Id: <87ecf117f50e4758946f6b0ce54436f09435f4bc.1694556946.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1694556946.git.yann.morin.1998@free.fr>
References: <cover.1694556946.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694556954; x=1695161754; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MrJofmGJAqTo7N9UyLvrsRvs6YMRJzik/ugUkrDdQyk=;
 b=mkh/pJJaxAk2dKFY0xZkRZ9BNYCmnD8Kh6PMDtdxUqO/YgsqJ2OsFWAP2WT95Y/5Zr
 f7vGUq8TtuuE7w/xSmq23SnbGqz+8xmm0qp3ZFCiAY81xhO2vTX5oEx1crcyrZhY8D0A
 UDv9wziCfOD8qWASQjYJBv/mB++paeZfQYbiVZZEdWTKfHMX/Se/PBl4E0FvyHSgjZcR
 +tHdLbg8V5N2YEmATFMs1uxTd8SeHUNslja152NX9e+1vP252VDwunt1rfCcy4mCQnEJ
 ElB1c7CtiOpi43NxK6Ls5IS8W+/ogCywz9VAzAS4/c71JkbD9muJfLggB31x1Dh5Jg0V
 OtXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=mkh/pJJa
Subject: [Buildroot] [PATCH 2/5] support/download: generate even more
 reproducible tarballs
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When we generate the taballs off a local working copy of a VCS tree,
the umask is the one that we enforce in out top-level Makefile.

However, it is possible that a user manually tinkers in said working
copy (e.g. to check an upstream bug fix, or regression). If the user
umask is different from the one Buildroot enfirces, such tinkering
can impact the mode bits of the files, even if their content is not
modified.

When we eventually need to create a tarball from said working copy,
the VCS (e.g. git) will only be interested in checking whether the
content of the files have changed before chcking them out, and will
not look at, and restore/fix the mode bits.

As a consequence, we may create non-reproducible archives.

We fix that by enforcing the mode bits on the files before we create
the tarball: we disable the write and execute bits, and only set the
execute bit if the user execute bit is set.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vincent Fazio <vfazio@xes-inc.com>
---
 support/download/helpers | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/download/helpers b/support/download/helpers
index 90a7d6c1ec..265685eff5 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -53,6 +53,9 @@ mk_tar_gz() {
     tmp="$(mktemp --tmpdir="$(pwd)")"
     pushd "${in_dir}" >/dev/null
 
+    # Enforce group/others mode bits
+    chmod -R go-wx+X .
+
     # Establish list
     find . -not -type d -and -not \( -false "${find_opts[@]}" \) >"${tmp}.list"
     # Sort list for reproducibility
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
