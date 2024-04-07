Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AAECD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E43E54080C;
	Sun,  7 Apr 2024 15:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCTBCdt3jdWC; Sun,  7 Apr 2024 15:37:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCE3540853
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCE3540853;
	Sun,  7 Apr 2024 15:37:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24DAA1BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2ACF608DE
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FOfFulWgGFx4 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 342F9608F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 342F9608F6
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F96F85615; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 17:34:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55f3df2dbedc7880bd949d722254cec7fc9af522
X-Git-Newrev: c08c98c889ef3e7622717c5247000d4f505a24ce
X-Patchwork-Hint: ignore
Message-Id: <20240407153657.2F96F85615@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: add libxcrypt optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=c08c98c889ef3e7622717c5247000d4f505a24ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-1/output-1/per-package/frr/host/bin/../lib/gcc/i686-buildroot-linux-gnu/12.3.0/../../../../i686-buildroot-linux-gnu/bin/ld: lib/.libs/libfrr.so: undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/668da3829cacbe883e6cf97ce6191a8180441db6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/frr/Config.in | 1 +
 package/frr/frr.mk    | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/frr/Config.in b/package/frr/Config.in
index f6c058e6df..0afd8c61a2 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_FRR
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, libyang
 	select BR2_PACKAGE_BASH
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBYANG
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_JSON_C
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index a4b4bccaf9..1b7d66fc68 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -13,7 +13,8 @@ FRR_CPE_ID_PRODUCT = free_range_routing
 FRR_AUTORECONF = YES
 
 FRR_DEPENDENCIES = host-frr readline json-c libyang \
-	$(if $(BR2_PACKAGE_C_ARES),c-ares)
+	$(if $(BR2_PACKAGE_C_ARES),c-ares) \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
 
 HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
