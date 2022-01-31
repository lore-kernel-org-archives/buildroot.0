Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D6CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 02:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45AD94024B;
	Mon, 31 Jan 2022 02:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqul-t2imPzr; Mon, 31 Jan 2022 02:03:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DB5240202;
	Mon, 31 Jan 2022 02:03:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0BB41BF3ED
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 02:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE1CF40202
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 02:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v5OW1LOBNWjc for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 02:03:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26B0A401F6
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 02:03:01 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id q204so14890701iod.8
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 18:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WI1xrcER2fIrqxKaGvckz/ycsiPXwtPZ5KFhDFd9sYY=;
 b=IaYccmVnUvTa+8a0fR5bvj566DH6GjJjJJc/SQ4CVkmXJCzwvbqZ9atva8/SodiT2o
 b2MW8TQIWvk3SYu1XsYIyyPl27Fu/SppKntKdb5gPZbNZZwkTYV08RiMOqyUTa3URCqx
 Bj58HMyL+ghS9HiI2GJ7VMhy/s3ebXplDsDrtUR5ljADbTfWvepyinmgWCe6OksmoiZu
 DJU3JT9URdAC2mUoVhq2GeKs5IqmZcZs7pSWjLHrLQzWM+XvJn1ip6YzffZMqOpxOnXa
 EFBgb9Cq/mytszv90MzxelPA4GbmwO2C9Oqhs+lv/AzM0g4VrKVtsDZNHfe+2p8j/MKN
 JV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WI1xrcER2fIrqxKaGvckz/ycsiPXwtPZ5KFhDFd9sYY=;
 b=CPkkNEwbC6SOip2Iq3hk2lJf4GXOgugG7wKykgppNRtq+2jSFH6PpLC2rpOjZBTsla
 inRk/LqhrbgioYawX8Wmh7lmv5XSWgi1H9zFeHrE7nXcHWjJBysJR5meTqFlpm+1ZFIN
 0im6steXzSwn+rYsxMlLHTxvXzCaM/QrGNiNAnl2W6b9EoKlm5n38PtrZOW0LHQZS59h
 LlnXd4DT3omEhX4iRRls7I0UwBqIWpgHh1ca0KobEGMJuEcLDX3I34m5B+iyv/Bhd+cn
 +8K2I4ymcBkH2Px4ESiiq+727EMcQTUcX6Oz3L//5NRSxARWxT857qpK93nies6oYyKm
 VTuQ==
X-Gm-Message-State: AOAM532+r1Kd6v40IOdgegHrZdWWRocRfs1hin8DfV0fgERjxx07BjpH
 c7dl68Ie9wGtzCWZC+98CAf6DND7gag=
X-Google-Smtp-Source: ABdhPJwDTBf6AsH5B8tRwhSOvKjLE+kI+vT3L+6rd8L9kfnhIkZSzCtI+276V4gJOCOzbzDdq7he1A==
X-Received: by 2002:a6b:ea08:: with SMTP id m8mr10135128ioc.172.1643594580091; 
 Sun, 30 Jan 2022 18:03:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id o20sm3645386iov.12.2022.01.30.18.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 18:02:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 19:02:58 -0700
Message-Id: <20220131020258.4114933-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libbpf: bump to version 0.6.1
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libbpf/libbpf.hash | 2 +-
 package/libbpf/libbpf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libbpf/libbpf.hash b/package/libbpf/libbpf.hash
index afc7aec1bf..27e22be9e9 100644
--- a/package/libbpf/libbpf.hash
+++ b/package/libbpf/libbpf.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  21cbee4df093e7fd29e76ed429650d3f3abe3a893f35e346ab9bc3484f6e68c0  libbpf-0.4.0.tar.gz
+sha256  ce3a8eb32d85ac48490256597736d8b27e0a5e947a0731613b7aba6b4ae43ac0  libbpf-0.6.1.tar.gz
 sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LGPL-2.1
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 3f09cc38dc..6750b063c0 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBPF_VERSION = 0.4.0
+LIBBPF_VERSION = 0.6.1
 LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
 LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
 LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
