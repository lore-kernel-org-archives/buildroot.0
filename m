Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82045C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:48:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ED6760F39
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3ED6760F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7844D40177;
	Fri, 15 Oct 2021 20:48:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bR7gLiCXazRP; Fri, 15 Oct 2021 20:48:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D949404B4;
	Fri, 15 Oct 2021 20:48:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4EEF11BF2CC
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AE6C40177
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ShYDBa8seLQ1 for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 20:47:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54FF240101
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 20:47:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DDC8995C15; Fri, 15 Oct 2021 20:44:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 22:46:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21d2a0c2ecfdddb250007ce75d1839ba81278e5b
X-Git-Newrev: 7ab915fe4cc14583df29d27c2ebe9be602d7df74
X-Patchwork-Hint: ignore
Message-Id: <20211015204457.DDC8995C15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/psplash: add support to psplash
 personalized png image
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ab915fe4cc14583df29d27c2ebe9be602d7df74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an configuration to use personalized png image. If the configuration is
empty we keep the psplash default image.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use ifneq condition instead of $(if ...)]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/psplash/Config.in  | 10 ++++++++++
 package/psplash/psplash.mk | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/psplash/Config.in b/package/psplash/Config.in
index 5053ebacf7..da99b264e0 100644
--- a/package/psplash/Config.in
+++ b/package/psplash/Config.in
@@ -27,5 +27,15 @@ config BR2_PACKAGE_PSPLASH
 
 	  http://git.yoctoproject.org/cgit/cgit.cgi/psplash/
 
+if BR2_PACKAGE_PSPLASH
+
+config BR2_PACKAGE_PSPLASH_IMAGE
+	string "psplash image"
+	help
+	  Use a personalized png image as boot splash.
+	  Let it empty if you want to keep the psplash default image.
+
+endif
+
 comment "psplash needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index a0f01869b4..199509ecd6 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -18,6 +18,16 @@ else
 PSPLASH_CONF_OPTS += --without-systemd
 endif
 
+PSPLASH_IMAGE = $(call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE))
+
+ifneq ($(PSPLASH_IMAGE),)
+define PSPLASH_COPY_IMAGE
+	cp $(PSPLASH_IMAGE) $(@D)/base-images/psplash-poky.png
+endef
+
+PSPLASH_POST_EXTRACT_HOOKS += PSPLASH_COPY_IMAGE
+endif
+
 define PSPLASH_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/psplash/psplash-start.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/psplash-start.service
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
