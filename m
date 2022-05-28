Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A083C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 07:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDCE642ACC;
	Sat, 28 May 2022 07:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uOpqbrAsKyXj; Sat, 28 May 2022 07:10:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA79842AC7;
	Sat, 28 May 2022 07:10:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 310C01BF95F
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 07:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6AA860B55
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 07:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LN4y3be37Wxc for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 07:08:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EF0E60F1A
 for <buildroot@buildroot.org>; Sat, 28 May 2022 07:08:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 32A0783CD9; Sat, 28 May 2022 06:57:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 08:37:53 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c7f645976a802f6c730e0af459739923a3060c4f
X-Git-Newrev: 612c06b37923553429896c654eb2841865365bfd
X-Patchwork-Hint: ignore
Message-Id: <20220528065730.32A0783CD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/cryptodev-linux:
 needs CONFIG_CRYPTO_USER_API_AEAD
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=612c06b37923553429896c654eb2841865365bfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

CONFIG_CRYPTO_AEAD2=y.

CONFIG_CRYPTO_AEAD2 and CONFIG_CRYPTO_SKCIPHER2 are needed to fix the
following build failure:

ERROR: modpost: "crypto_alloc_skcipher" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "scatterwalk_map_and_copy" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "crypto_ahash_final" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "crypto_aead_encrypt" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "crypto_aead_setkey" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "crypto_skcipher_decrypt" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "crypto_destroy_tfm" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "crypto_skcipher_setkey" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "crypto_aead_decrypt" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
ERROR: modpost: "crypto_aead_setauthsize" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!

However, those options are not user-selectable. They are enabled by the
appropriate consumers of those cyphers. Since cryptodev is anyway meant
to give userspace access to kernel crypto (hardware), it makes sense to
enable CONFIG_CRYPTO. The easiest way to also get AEAD2 and SKCIPHER2 is
to enable CONFIG_CRYPTO_USER_API_AEAD as well.

Fixes:
 - http://autobuild.buildroot.org/results/a06708369c233f6e60a1a3ffd7a77a4edd932c9a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4b12336d1fad12fbb82b4d9144e6cb5636a12256)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptodev-linux/cryptodev-linux.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index f9026053c8..d0c3bc5218 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -23,5 +23,10 @@ define CRYPTODEV_LINUX_INSTALL_STAGING_CMDS
 		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
 endef
 
+define CRYPTODEV_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_USER_API_AEAD)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
