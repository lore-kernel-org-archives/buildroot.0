Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E00DC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 17:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 299BA415B7;
	Tue,  1 Feb 2022 17:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_7Z1fRky9Zv; Tue,  1 Feb 2022 17:19:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60B46409F7;
	Tue,  1 Feb 2022 17:19:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9264B1BF4E2
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80EDD60F36
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sR2GjCm0dN8N for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 17:19:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTP id C470360B1B
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 17:19:15 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id EwoBnrzQ7roAhEwoBnXuSB; Tue, 01 Feb 2022 18:19:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643735954; bh=U6SzdRXTlgb2JBLm28J56hz91O7gHZEGP2iQ0UxFanM=;
 h=From:To:Subject:Date:MIME-Version;
 b=gtaoAwRqiYeu0va21BCrGNxlwV81rrb5ZLZSg/hXSRuESPs2JwL/scIfw9CVHtkew
 An6IoUIUCWYAMblKhkaC9eUDo1WyKpfb5kbxyykFC9imJ7kZ8aNoC7LTosKBi0tqkR
 yJrXjN/2q58YFjMQ+H9CW0MjIb3ibUErF4UAibv3GLJjA7+vUTm/dJaPjvv+e+B40I
 Qe+/N0DXNyLsVYfEgOAmtVCh1NtD1dRhK81wYCJUcJEEDee0J+7fp4vh86p1idCIkW
 bhIx71SiAmQ1dtDnssrb0SSuTF2hFHNo9POjVbrd9PN6dImi9mVOypj6+VC6cIS7gE
 cFCq5qgjig8ZA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 18:19:10 +0100
Message-Id: <20220201171910.32728-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNLLIKLp5NdBDsL0MqFS4qJvdwnn742tQpvKqFdgnxaVWX5Y+eSqScWs/wUrqL9uY2ZZUBlpkOLzO94IUAisRbYrKyDxiqRBO+2RC35aJPMaR4H3da4u
 jjD418xyggw3x0Q4h9rjkjVFGk4sdKf2P7q40mZZr2tNOdbIaOSVaxZGP6ACoWyjjfbcp23x2eQV4lLqw/6PdefQ1nce2AZLMpfNu0szXxWrYESLynGc7Bp/
 LJHbqwKrGsvsLQLM61g//Zd5ox10liyGX5hI0I9t7Vl77YlbjZmFUi1PD8sl2Q/B9eeY8pQN4B8wNI8vC3yp/tP1s0CSVwH+uWRMH3feaRkHxBJMphyvgeyM
 CNx+hbbnPn/phNqcGk54tx2AH8Povg8SXKVsgt/P0Iv9tF/qjFxKdOPpih4iV6TF3SSslfZ4CAxkXGz328gaY3mpWWr58w==
Subject: [Buildroot] [PATCH] package/cryptsetup: disable package if we build
 for Microblaze
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>, Martin Hicks <mort@bork.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cryptsetup has the same build failure found for libfuse. For libfuse I've
patched meson that now correctly checks if symver is available:
https://github.com/libfuse/libfuse/pull/620/commits/3aba09a5c56e017746c5c1652dbc845f4db7374a
But in cryptsetup the check is done in a header file while building, so I
can't use the same approach and that would take not few work to move the
check to Autotools, so I've opened an issue on cryptsetup's gitlab:
https://gitlab.com/cryptsetup/cryptsetup/-/issues/709
asking if they can manage it the way I've done for libfuse.

So let's disable cryptsetup if we're building on Microblaze for the moment
and when the issue will be fixed upstream, I will bump the version and
re-enable building for Microblaze.

Fixes:
http://autobuild.buildroot.net/results/86b/86b6b13e6be8375875caebcd91de91fef83f72e8/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/Config.in  | 1 +
 package/libblockdev/Config.in | 1 +
 package/luksmeta/Config.in    | 1 +
 package/systemd/Config.in     | 1 +
 package/udisks/Config.in      | 1 +
 5 files changed, 5 insertions(+)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index f36883ea47..2f3dd8d2b2 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CRYPTSETUP
 	bool "cryptsetup"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
+	depends on !BR2_microblaze # wrong symver detection
 	depends on BR2_USE_MMU # lvm2, libargon2
 	depends on !BR2_STATIC_LIBS # lvm2, libargon2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 4389fd794c..38fe2331cf 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -23,6 +23,7 @@ comment "plugins"
 config BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
 	bool "crypto"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
+	depends on !BR2_microblaze # cryptsetup
 	select BR2_PACKAGE_CRYPTSETUP
 
 config BR2_PACKAGE_LIBBLOCKDEV_FS
diff --git a/package/luksmeta/Config.in b/package/luksmeta/Config.in
index ddc9b6f3bf..88a10bc9da 100644
--- a/package/luksmeta/Config.in
+++ b/package/luksmeta/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LUKSMETA
 	bool "luksmeta"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup -> lvm2
+	depends on !BR2_microblaze # cryptsetup
 	depends on BR2_USE_MMU # cryptsetup -> lvm2
 	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index cc0736561e..d1e692f826 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -228,6 +228,7 @@ config BR2_PACKAGE_SYSTEMD_HIBERNATE
 config BR2_PACKAGE_SYSTEMD_HOMED
 	bool "enable home daemon"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup -> lvm2
+	depends on !BR2_microblaze # cryptsetup
 	depends on BR2_USE_MMU # cryptsetup -> lvm2
 	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 82f11ae7de..8a48d85924 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_UDISKS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # polkit
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libblockdev -> cryptsetup -> json-c
+	depends on !BR2_microblaze # cryptsetup
 	depends on !BR2_STATIC_LIBS # polkit -> duktape
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
