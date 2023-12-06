Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41146C10DCE
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 19:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACBDF60A84;
	Wed,  6 Dec 2023 19:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACBDF60A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jvynOw6myj86; Wed,  6 Dec 2023 19:25:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1276E60A9E;
	Wed,  6 Dec 2023 19:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1276E60A9E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 247E71BF343
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 19:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA75941E61
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 19:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA75941E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4foKYligMRT3 for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 19:25:36 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0EA941E5B
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 19:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0EA941E5B
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id 92E62240B6D
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 20:25:34 +0100 (CET)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id 77119A00E2;
 Wed,  6 Dec 2023 20:25:34 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 3120A240A8B;
 Wed,  6 Dec 2023 20:25:34 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  6 Dec 2023 20:25:27 +0100
Message-Id: <20231206192527.90222-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1692
X-purgate-ID: 154282::1701890734-967E9338-2234C58F/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1701890734;
 bh=4PrbPWCMncCD3NaKMA/jofkVYMEtRuvmmqzMSX4D0SA=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=WZEtJax0Q6KJD92MvhRWK71j8y2VJfhoY8jdR1badw9k7VSG39plMYEM60ZnJhuxf
 QJuP85LvlSiqWzhyoNOh3+w8DYollk4jHG8R842DkSpk5W2mTm9Vsd38TC77qRUwkX
 3RuVoD+xTBt6Denh3s5RZf7puAJ4mrn0plBzrbln+BxW9oOy3DQHBPn5bWEY0Njc3d
 wkT0Nh4aKC/0c9aZ20tm88if730HapY0oHp3eJsZTdkT/PZbw5vmKI5mg6ts0IqA7Z
 vWIdYjYihgoS1W431QFEUJaxURr2Z6lG1+YyJypYAYFZVnpndhbrzDcIoS9LX/V4An
 fP5l+i8SqtPFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=WZEtJax0
Subject: [Buildroot] [PATCH 1/1] configs/rock5b: add hash for custom kernel,
 uboot
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
From: "kilian.zinnecker--- via buildroot" <buildroot@buildroot.org>
Reply-To: kilian.zinnecker@mail.de
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kilian Zinnecker <kilian.zinnecker@mail.de>

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 board/radxa/rock5b/patches/linux/linux.hash | 2 ++
 board/radxa/rock5b/patches/uboot/uboot.hash | 2 ++
 configs/rock5b_defconfig                    | 1 +
 3 files changed, 5 insertions(+)
 create mode 100644 board/radxa/rock5b/patches/linux/linux.hash
 create mode 100644 board/radxa/rock5b/patches/uboot/uboot.hash

diff --git a/board/radxa/rock5b/patches/linux/linux.hash b/board/radxa/rock5b/patches/linux/linux.hash
new file mode 100644
index 0000000000..95ad749554
--- /dev/null
+++ b/board/radxa/rock5b/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  a5eca7b8f929a1918125e2e4fbd7ab4ea5b3910b5ae4547e81c794b47373ffb5  linux-52f51a2b5ba178f331af62260d2da86d7472c14b-br1.tar.gz
diff --git a/board/radxa/rock5b/patches/uboot/uboot.hash b/board/radxa/rock5b/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..efd629bd2f
--- /dev/null
+++ b/board/radxa/rock5b/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  12e921b466ae731cdbc355e6832b7f22bc90b01aeceef9886f98aaba7b394300  u-boot-2023.07.tar.bz2
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index eed656ef5f..2e72b386b1 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -6,6 +6,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS=""
 BR2_TARGET_GENERIC_HOSTNAME="rock5b"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the rock5b board"
 BR2_GLOBAL_PATCH_DIR="board/radxa/rock5b/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
