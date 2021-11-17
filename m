Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAB9C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:48:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E5D61AFF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1E5D61AFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCDD260A8B;
	Wed, 17 Nov 2021 20:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fKiUcTyF8Gky; Wed, 17 Nov 2021 20:48:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11E9E60A8E;
	Wed, 17 Nov 2021 20:48:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31FAE1BF9B2
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21B5381DA3
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KT_LK0B-Rs1R for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 20:47:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71F3081DA0
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 20:47:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7BA948D4D2; Wed, 17 Nov 2021 20:43:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 21:36:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0258c013b1c37a8b9bab5fec92ea69ec4f06df6f
X-Git-Newrev: 8bd40a0303c697822f2c65b4ede80ad1252bbc07
X-Patchwork-Hint: ignore
Message-Id: <20211117204335.7BA948D4D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apparmor: fix per-package build
 with apache
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bd40a0303c697822f2c65b4ede80ad1252bbc07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following per-package build failure with apache:

/home/buildroot/autobuild/instance-3/output-1/per-package/apparmor/host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/../../usr/build-1/libtool --silent --mode=link /home/buildroot/autobuild/instance-3/output-1/per-package/apparmor/host/bin/aarch64-linux-gcc    -o mod_apparmor.la  -rpath /usr/modules -module -avoid-version    mod_apparmor.lo -L/home/buildroot/autobuild/instance-3/output-1/per-package/apparmor/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib -lapparmor
/home/buildroot/autobuild/instance-3/output-1/per-package/apache/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/9.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: cannot find /lib64/libc.so.6

This build failure is raised because the fix added by commit
3c836e54203b16015c9c52cbe007adc92d293a0d was incomplete as the apr
special libtool script was not patched (see commit
b747c29c4e8eb89b7b99658dfd34f4a6b6b0744d for a detailled explanation)

Fixes:
 - http://autobuild.buildroot.org/results/6747b1cb11b129ea4bcb1ecc9645e94fb8e095e8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/apparmor/apparmor.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 400ea349ae..6f0e59224d 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -59,7 +59,8 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 define APPARMOR_FIXUP_APXS
 	$(SED) "s@$(PER_PACKAGE_DIR)/[^/]\+/@$(PER_PACKAGE_DIR)/apparmor/@g" \
 		$(STAGING_DIR)/usr/bin/apxs \
-		$(STAGING_DIR)/usr/build/config_vars.mk
+		$(STAGING_DIR)/usr/build/config_vars.mk \
+		$(STAGING_DIR)/usr/build-1/libtool
 endef
 APPARMOR_POST_CONFIGURE_HOOKS += APPARMOR_FIXUP_APXS
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
