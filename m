Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA0BC5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 006E2415B4;
	Mon,  4 Mar 2024 15:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IC5g1r1Vjlw9; Mon,  4 Mar 2024 15:35:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86748417C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86748417C0;
	Mon,  4 Mar 2024 15:35:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE2001BF3B0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB5AB4152F
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZKUhIepCvyu for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:34:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 05AB54149E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05AB54149E
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05AB54149E
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:34:33 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d208be133bso61774651fa.2
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566471; x=1710171271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8FsuUnW0ZvZ+XZhTAOg/VpBNCVCV6RFCLKo+tBgu5TQ=;
 b=wc1EnWSdu5bhwEi8esshs4OMgejg7zIqYKKdM/nay6u57k6xf9wvYj0q4v9XtNvNnT
 pc+8rjFTkmDs70j0PSTTXWRktYPbXbilefnooq4FHSA1aJNfdL7Wx6XQJ0L0SPusGB7P
 J5ZnJoT9GgIvM7vuCYmO8aDiQGfINjEhN/XNRScLCMVa6byGe2AbgU6GvMnFkSXINbuN
 yQgs8Q1l5Z/9Q2al2jvZ3BtvN0GwTqjAtbyilI569am8BxwFIEOLJ9NzqpSjCWX8wCds
 viXUSNBafw8iYHmpKw/E84jf9fiN8X6BPD8yTdp2w+KU6s8qt0OUUfun0pyhBbiUCx3d
 PkOQ==
X-Gm-Message-State: AOJu0YwJe+oT93c8ph0VL/bDmMgDsdI5zsuYH9ZQnNIYJLScCifhyXwF
 4sjEilVCqzJL2ew6SgytzjpifoKBhKDkk6dDM745iueEAsyYTYx4vuTlsoH58SmSw+yWtVT62Up
 m9Yc=
X-Google-Smtp-Source: AGHT+IGRo64RrZNlccVfWwnk8YJ4WJBTOd66fEWgv5B5JsRAZyFm4Mx1v4LQzV0Qw13RlRktol93JQ==
X-Received: by 2002:ac2:4983:0:b0:513:2181:d412 with SMTP id
 f3-20020ac24983000000b005132181d412mr6181050lfl.19.1709566471448; 
 Mon, 04 Mar 2024 07:34:31 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:72fe:558f:d55e:d423])
 by smtp.gmail.com with ESMTPSA id
 sa20-20020a1709076d1400b00a4432543b21sm4936082ejc.198.2024.03.04.07.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:34:31 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:32:50 +0100
Message-ID: <20240304153253.732708-20-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709566471; x=1710171271;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8FsuUnW0ZvZ+XZhTAOg/VpBNCVCV6RFCLKo+tBgu5TQ=;
 b=XITOHbaZCN0FY5WswxrqLm0ZUSespE7e+9M6KWq555I4UctLfOCS980okAivqsE3+f
 oR/r6wu5SxERXlFrbDv+rI8yfgBsfrJY7RRaa5MKf1B9qe5f11qX9vCvFkc29HG5itCB
 Wcz4k3O8sZH9xOEsegFqqh2UZKfHrYN7Jke9M=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=XITOHbaZ
Subject: [Buildroot] [PATCH v9 19/22] board/ti/am62x-sk: move post-{build,
 image}.sh to board/ti/common/am6xx
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch makes it clear that the moved scripts can be used by the
am6{2,4}x platforms.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v8

 board/ti/am62x-sk/post-image.sh                   |  5 -----
 board/ti/{am62x-sk => common/am6xx}/post-build.sh |  0
 board/ti/common/am6xx/post-image.sh               | 11 +++++++++++
 configs/ti_am62x_sk_defconfig                     |  4 ++--
 4 files changed, 13 insertions(+), 7 deletions(-)
 delete mode 100755 board/ti/am62x-sk/post-image.sh
 rename board/ti/{am62x-sk => common/am6xx}/post-build.sh (100%)
 create mode 100755 board/ti/common/am6xx/post-image.sh

diff --git a/board/ti/am62x-sk/post-image.sh b/board/ti/am62x-sk/post-image.sh
deleted file mode 100755
index 34f732c091ad..000000000000
--- a/board/ti/am62x-sk/post-image.sh
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh -x
-
-BOARD_DIR="$(dirname "$0")"
-
-support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
diff --git a/board/ti/am62x-sk/post-build.sh b/board/ti/common/am6xx/post-build.sh
similarity index 100%
rename from board/ti/am62x-sk/post-build.sh
rename to board/ti/common/am6xx/post-build.sh
diff --git a/board/ti/common/am6xx/post-image.sh b/board/ti/common/am6xx/post-image.sh
new file mode 100755
index 000000000000..917ca238aa78
--- /dev/null
+++ b/board/ti/common/am6xx/post-image.sh
@@ -0,0 +1,11 @@
+#!/bin/sh -x
+
+board_dir() {
+    if grep -Eq "^BR2_DEFCONFIG=.*/ti_am64x_sk_defconfig\"$" "${BR2_CONFIG}"; then
+        echo "am64x-sk"
+    else
+        echo "am62x-sk"
+    fi
+}
+
+support/scripts/genimage.sh -c "board/ti/$(board_dir)/genimage.cfg"
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index bd294bb712ee..310ba6fb6453 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/am62x-sk/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/common/am6xx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
