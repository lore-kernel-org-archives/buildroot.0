Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4F4C25B10
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08F4A41582;
	Sat,  4 May 2024 21:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xMoKIpsZ15Jv; Sat,  4 May 2024 21:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FF0C415BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FF0C415BA;
	Sat,  4 May 2024 21:40:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D0241BF3C9
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2613840300
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1H908qZvWYP6 for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 84F8740189
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84F8740189
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84F8740189
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:27 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55e8so5058725e9.1
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858825; x=1715463625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SlcW3mDuy1ZTF9bzgSOOxfU2ELk7ofqQCgSubXEah8k=;
 b=ADAKZvvkKtQ3/ryiDRvzZPDOkHv8/691x5e4kEoMb4rB8S/F+KA4FDYDjPARBZwthw
 BEPtU9jXcW5r6a5U3FhHiHPczdgBl7X7lhR5XIlpP0kJSRiVkCwQ7rVi10lfgBls7UwE
 YRJbsOQG4GHoTv5u0KF+XYC8f0gWlNXHucxlwI0RIsCTQDtvo2PEFSQwHH2/kvcFOfKp
 13k1y9vyw20sum/IenO2/NoQ5w1dkLkTZOoSutyQRQvdvHvilE2G53zZ5T6cSDgpd8ET
 86GWMEvmc+Jjqb6e7kfDs27qxIAE/iMO8yeR5crjTYtQCkrQQxXUfa0/ZN0SPKh1MGaD
 PNcA==
X-Gm-Message-State: AOJu0YzsDdXEgtUY6daGYSE8hLw7dIGaoIjtOKFhonIN3ScbcIg5NJQb
 2wN1OMQ5V8iLyFQ9o2RQJY4xkR+zoJvx0ztcJ5y4J2/mCK2DZOdRg/z/hg==
X-Google-Smtp-Source: AGHT+IEGoss6AFgpLDDVcVDid5I63+FAnXeifjlBnDzSyxGjSeh8VTX+9xkGF9qhAMIfCp48+ccUhQ==
X-Received: by 2002:a05:600c:458e:b0:41c:83aa:18b7 with SMTP id
 r14-20020a05600c458e00b0041c83aa18b7mr4575328wmo.33.1714858825644; 
 Sat, 04 May 2024 14:40:25 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm10464230wmq.7.2024.05.04.14.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:25 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:03 +0200
Message-ID: <d38c18d5fb11a2df58f67b1b71634f84e7c55819.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714858818.git.yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858825; x=1715463625; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SlcW3mDuy1ZTF9bzgSOOxfU2ELk7ofqQCgSubXEah8k=;
 b=a1QW12VAhANeGqretiuOImAqg3tGzLzUeTU0wycOsF9v/+0hTWB3X7Lj6Sf/SrsmMu
 XXrbo8UIBQqFky7uUkBUKlXXKcbWNdLRFjhEZMGL7WHyJhC+ttjmwcjdKHBE9lo85rVK
 MUZh6sVG6NgXWHo8xJ59TyO/VTjFa5jXmKsA9C21xbaqwbUmDlbkvmAdfu6uMwDgVBqZ
 48evjxmw7lyygtA797UCE6neUUFOF4Vg2CpNUP4fz+wsw8bnNSRa+dXJWenHoBz9QLKt
 lwdQ7+06pNNJ8VuMHTXZ/vfAwRYmS2aZ8vV3mu/pDWA7b9+mxNBrEurHb1zfCIVNfvfB
 Q3aA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a1QW12VA
Subject: [Buildroot] [PATCH 02/22 v3] package/am33x-cm3: switch upstream
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upstream host, arago-project.org, has vanished, bringing down the
git repository with it.

Switch to another, github-hosted repository, that has the commit we're
interested in.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/am33x-cm3/am33x-cm3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/am33x-cm3/am33x-cm3.mk b/package/am33x-cm3/am33x-cm3.mk
index 629a83238c..d5ace7bb0e 100644
--- a/package/am33x-cm3/am33x-cm3.mk
+++ b/package/am33x-cm3/am33x-cm3.mk
@@ -6,7 +6,7 @@
 
 # This should correpsond to v05.00.00.02
 AM33X_CM3_VERSION = 11107db2f1e9e58ee75d4fe9cc38423c9a6e4365
-AM33X_CM3_SITE = http://arago-project.org/git/projects/am33x-cm3.git
+AM33X_CM3_SITE = https://github.com/RobertCNelson/am33x-cm3
 AM33X_CM3_SITE_METHOD = git
 AM33X_CM3_LICENSE = TI Publicly Available Software License
 AM33X_CM3_LICENSE_FILES = License.txt
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
