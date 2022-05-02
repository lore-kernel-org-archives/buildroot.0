Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC3FC433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 20:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AF9C4046A;
	Mon,  2 May 2022 20:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KB0kasPkz3y8; Mon,  2 May 2022 20:46:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F51E4019F;
	Mon,  2 May 2022 20:46:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C81371BF963
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 20:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5D5C4019F
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 20:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hr4XozrpY_ax for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 20:46:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73E5940151
 for <buildroot@buildroot.org>; Mon,  2 May 2022 20:46:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4935784DC0; Mon,  2 May 2022 20:35:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 May 2022 22:42:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7280ac83d87b116835307303cca591493b72ef3
X-Git-Newrev: 4b12336d1fad12fbb82b4d9144e6cb5636a12256
X-Patchwork-Hint: ignore
Message-Id: <20220502203544.4935784DC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptodev-linux: needs
 CONFIG_CRYPTO_USER_API_AEAD
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
From: "Arnout Vandecappelle \(Essensium/Mind\) via buildroot"
 <buildroot@buildroot.org>
Reply-To: "Arnout Vandecappelle \(Essensium/Mind\)" <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4b12336d1fad12fbb82b4d9144e6cb5636a12256
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
