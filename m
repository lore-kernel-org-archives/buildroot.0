Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96582C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 12:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BDED83E91;
	Mon,  6 Jun 2022 12:15:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jfYqFgzCf8AB; Mon,  6 Jun 2022 12:15:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45AAF83E77;
	Mon,  6 Jun 2022 12:15:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 278021BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23BDF608B7
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:15:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JEzGWBn0ZGnw for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 12:15:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 443BE60644
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 12:15:54 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id z17so2731466wmi.1
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 05:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jScJxJfuYu5+6so2oFld9KYA0wHHkmxIoSc1zdho5io=;
 b=PoP4u9XzlZRJmz//bdT23cANiBuM5wz2HByro6RaBXftaSwhMIihQdZI0edqchz+Y1
 7Zpjm6zfT9/gZE5CReyd1jSdwXpZiE3twQqQxlVJbF4p6O0tb9Ud4SBPiFjRK2KuRsmY
 VH751sDdcjcrd7wohpAcULn3+Z3fIviyqjztMtSNETuqBwHNowf5w/LyxYLdkxmljvPz
 edxprhQBAZ1q4JttGG7w2iVgPnFxhkAM3inM6SGl8ryDbB7g1ueThMV+jHKMNc2Ya+vt
 IpM9Ypfg739r7w7EgTVkGNJVLIKElhp8KJ1vniixG9z+nx7805gWAWqugEQR/294bouF
 zDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jScJxJfuYu5+6so2oFld9KYA0wHHkmxIoSc1zdho5io=;
 b=g+jDOXk4CbzwwNJxpGMR8APzdAbTyGkH+ywf5SAIySCIpW5410IaGYwd3qfeh2xKxp
 wYNj9sIzfzbwyxOqzftg02nlHlY+4irIMBry1JN8e45RmpOP5toqThot+0lqC+nynbGA
 JM83rLMpPXqoYnECubmLFDbAhs+BNdvTdAwwGQZ9c8HE5dv/l77y2Xd70pZpeHD3W9F+
 p0B4j7VCgasAVX5kAddl+GWPnTGOKFgTSW6w41RnEH4gS/oGQquBskzlkovcR65OASYE
 zlkJHmd+w2GzkuoTi+Wzgc49gZ1BftvNUStaxhaysTXycBncyIAqwkJYTl4hyJJbzoN7
 A5Sg==
X-Gm-Message-State: AOAM532yAhKYX6hl/188ec3f/J3pCj56XHhr8F7PGXvHi7mDIsVefd/R
 TNOB42xaWkr0ywjZQA1RNMb4y1G9qaU=
X-Google-Smtp-Source: ABdhPJw9FgJ0eCfp1yx02BVZ8eeUdFppprkFJ/kO1PB2T/1Z9nnZVyUZVzf5wMM1zYIKhe+6XgQphw==
X-Received: by 2002:a05:600c:420c:b0:39c:4674:aac4 with SMTP id
 x12-20020a05600c420c00b0039c4674aac4mr11934538wmh.127.1654517751992; 
 Mon, 06 Jun 2022 05:15:51 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a056000000100b0020c5253d8casm15158064wrx.22.2022.06.06.05.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 05:15:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 14:13:12 +0200
Message-Id: <20220606121312.592311-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qemu: fix armeb build
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following armeb build failure raised since at least version
6.2.0:

ERROR: Unknown target name 'armeb-softmmu'

Fixes:
 - http://autobuild.buildroot.org/results/dbd1417fb638ad41e9f23941141bbeb9c999fb05
 - http://autobuild.buildroot.org/results/a6f97308aa2e634ed3d5b80b33b4663aa16c4693

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qemu/qemu.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 6c69aee7bc..55cd0cd0e0 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -278,6 +278,9 @@ HOST_QEMU_DEPENDENCIES = host-meson host-pkgconf host-zlib host-libglib2 host-pi
 #       xtensa          xtensa
 
 HOST_QEMU_ARCH = $(ARCH)
+ifeq ($(HOST_QEMU_ARCH),armeb)
+HOST_QEMU_SYS_ARCH = arm
+endif
 ifeq ($(HOST_QEMU_ARCH),i486)
 HOST_QEMU_ARCH = i386
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
