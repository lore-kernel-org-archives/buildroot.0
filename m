Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC0FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 20:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A94D60EC1;
	Sun, 29 May 2022 20:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P1eYuVlWNFrL; Sun, 29 May 2022 20:20:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 563CC60F02;
	Sun, 29 May 2022 20:20:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5439A1BF3D7
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 427D5842ED
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VB6Acz9gxYW3 for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 20:20:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6325F81BF4
 for <buildroot@buildroot.org>; Sun, 29 May 2022 20:20:22 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 r9-20020a1c4409000000b00397345f2c6fso1782869wma.4
 for <buildroot@buildroot.org>; Sun, 29 May 2022 13:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OUd+0S45738NQGwZnQzsajH/Jm4azXA9FawpWYVaYnA=;
 b=JB2X1OTgtn5CkY8gNabVFxEZgsmJZp9w9aVP88L4iScfVF6kK4UpisPKxAUKrL1ian
 xvRt5a0Dx+zq33QtZg4t8hSdtZG0cDJAXKzOcbdYJUrM6/C1ZUXRRE3SH+aiWFtTfUB6
 PCKRtN002q6CeL/tDkzIq5WHckoIQGVZS4nWs/iYPuAE4OaeoUbZ1rrdfSKeJfyHR+tQ
 0ttTwHxszbja+ewlY3C8qyklGP2QoBGggDLEi6oIfBmHew2UDbQqCL61A9YNgIxJxknG
 ITSYHWfv+Deb4hPoDCXQw4gYIrwum0xM1lLOIYQ7eove3SOKhRfVBJioaMWztO1Pg3Yo
 36Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OUd+0S45738NQGwZnQzsajH/Jm4azXA9FawpWYVaYnA=;
 b=hXnC1zarv2++bALjj0MrSaewDc+ovKCNvXUSvTnzbfEfhsDocPyCJdtzt+QDPetPGu
 YLoo2zbxGHxi2mvqZ2TlYZXPggPBov98MpoeQ+hH19qgDXRcJh2VzIA+8JPUEzL04odR
 lUb7Y1+hsUys1aR8FdmqRt7pM7v8WaOpxHIYp7dNp8cDlOaF+zhtgcvTUUxaf/JtvHAx
 TnWXhAWyzHLIa76AaQVRH570Bw2IeB6UiRj4fEiD8K0zQL0kLM6r+5SkxwnxuX9IL1On
 o98pJNMhtnUYCA2iWRHNr+LQKaV1fsXEW6CdtB6zZSPVA00ybCl4fqpEZl6hSYRJ+PUO
 q3lQ==
X-Gm-Message-State: AOAM533g7wZ5jhvik5rIezKv8nZBlj8T7kVQHN+abRUyZPDLwduz6OY3
 zrC2FSR+y8zmsvvbavpwuc5Ur9ZrBpo=
X-Google-Smtp-Source: ABdhPJx6yZGBcN/vivtsFNqK9MPvyyWFiJcsU6PqCjjsBVsh0DoXbUyxSLHDZ3JqNOQZuSnkLNE39Q==
X-Received: by 2002:a05:600c:4147:b0:397:3c98:b6d with SMTP id
 h7-20020a05600c414700b003973c980b6dmr16235493wmm.111.1653855620533; 
 Sun, 29 May 2022 13:20:20 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 12-20020a5d47ac000000b0020c6b78eb5asm7857209wrb.68.2022.05.29.13.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 13:20:20 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 22:20:17 +0200
Message-Id: <20220529202017.822191-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/testing: test_oci: update to _OCI_CMD
 option
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
 "Yann E . MORIN" <yann.morin@orange.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Matthew Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS option has been
replaced by BR2_TARGET_ROOTFS_OCI_CMD in commit [1].

Since BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS contains
only one item, we can safely replace by
BR2_TARGET_ROOTFS_OCI_CMD in the defconfig fragment
used by the test_oci test case.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2491321058

[1] 08d65d81d88418b0cd7edd3bd2227faa58d022f0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin@orange.com>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Cc: Matthew Weber <matthew.weber@collins.com>
---
 support/testing/tests/fs/test_oci.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_oci.py b/support/testing/tests/fs/test_oci.py
index 347332f30d..0ecf58f626 100644
--- a/support/testing/tests/fs/test_oci.py
+++ b/support/testing/tests/fs/test_oci.py
@@ -20,7 +20,7 @@ class TestOci(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_EXT2_SIZE="600M"
         BR2_TARGET_ROOTFS_OCI=y
         BR2_TARGET_ROOTFS_OCI_ENTRYPOINT="df"
-        BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="-h"
+        BR2_TARGET_ROOTFS_OCI_CMD="-h"
         BR2_TARGET_ROOTFS_OCI_ARCHIVE=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
