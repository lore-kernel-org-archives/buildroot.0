Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B8BC433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 03:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD0AB60F87;
	Wed,  2 Feb 2022 03:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VYxYITlVWc81; Wed,  2 Feb 2022 03:17:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8C4A60AE9;
	Wed,  2 Feb 2022 03:17:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBE821BF95D
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E88AD60AE9
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:17:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id runk2rlst1m0 for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 03:17:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A52860AD5
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 03:17:54 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id h23so17152487pgk.11
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 19:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RbwTM0xeiQgJpUFGdzcxVpRsK8gToZi2x5sy5DIiia8=;
 b=cIzBAUj3FiYMlIBhRMee2t1zToCD0kbBFkIc4haHwNuqqgxPkgd143ZZ5NIdaRhNcG
 cfDHszFftJ+q583RzL7heXw/4hz8yB+vTcfy/+IU5whabpLBxT9b/pGiRfbbk3rvZ8TK
 s6Q1x1I0O/T19qEo42yTCMQJBfkZuwXAGa4LokfGNpi9Gke/Dww/UadAp5CpE2011owz
 5dR6lybLljtAJHyhQPmq4S5Q6THlw03jTfFC36Nc7puAUqQ5EamXnAfvO9Qr3oQHeXZA
 hN1W5v+GNZYMir/ThusTfMS+7D/4oO8TLY8cvtmE0gnlLRLTgFxle8oo+RuRJOHc1amz
 gz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=RbwTM0xeiQgJpUFGdzcxVpRsK8gToZi2x5sy5DIiia8=;
 b=wkj9vk0awd+OF6X/9D/VtQuWWBzkbhfOOZbK+PeMpatS2DFt7TIleB8lOwxKkuCNU9
 yZEBmb8aR65hly7vGRs1fH72IFDjsAOmJRtkdanuPsKWocIXWT8uQYOg6RdFE9hcoFH+
 pncCRKN17KsY8FsYhz3X5S4LT02CqDQujdCVcqj4CiERycO2VTRI7yQtSzTcFnxAHt35
 BY3ZWljs+HhJBUr684OHYwud6fYphPKYcR1lSm8ZDawyyrC0zJWHweSBF4nv/XkfKa3T
 eo4I85dueIQRA7JvvI39pW8RsgVN+DiUnAbPldr+Tos+ltPxezjaPZk4iJow55NqCMCH
 F6Jw==
X-Gm-Message-State: AOAM5336+HBUGMwYKrwRieMe8AQYKL7FcsagYonAnf+6VAwm3pKklhj4
 usmF355Eq6b1psr4p1PAl25tdYyq74A=
X-Google-Smtp-Source: ABdhPJw2yy8a+2g84r0eoMOMBmXp/QsQXWaEjAoVpSLjPDlnwhf3vAeGNC6WEx7kiLx5hI2zTTPBZA==
X-Received: by 2002:a63:f803:: with SMTP id n3mr22963586pgh.348.1643771873130; 
 Tue, 01 Feb 2022 19:17:53 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id ca12sm4029993pjb.11.2022.02.01.19.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 19:17:52 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 13:47:45 +1030
Message-Id: <20220202031745.448551-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] board: x86_64: Enable and mount debugfs
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add DEBUG_FS to the kernel options, and modify fstab so it is
automatically mounted at boot.

This is useful when testing.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 board/qemu/x86_64/linux.config  | 1 +
 board/qemu/x86_64/post-build.sh | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/board/qemu/x86_64/linux.config b/board/qemu/x86_64/linux.config
index e1d2ce01b004..2ed5c4194560 100644
--- a/board/qemu/x86_64/linux.config
+++ b/board/qemu/x86_64/linux.config
@@ -50,4 +50,5 @@ CONFIG_EXT4_FS=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_DEBUG_FS=y
 CONFIG_UNWINDER_FRAME_POINTER=y
diff --git a/board/qemu/x86_64/post-build.sh b/board/qemu/x86_64/post-build.sh
index bf83a002c2fc..0b27ab2c8074 100755
--- a/board/qemu/x86_64/post-build.sh
+++ b/board/qemu/x86_64/post-build.sh
@@ -9,3 +9,6 @@ if [ -e ${TARGET_DIR}/etc/inittab ]; then
 	sed -i '/GENERIC_SERIAL/a\
 tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' ${TARGET_DIR}/etc/inittab
 fi
+
+# Mount debugfs on boot
+echo "debugfs     /sys/kernel/debug debugfs defaults 0 0" >> ${TARGET_DIR}/etc/fstab
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
