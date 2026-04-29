Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9D4FF887E
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 17:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD36F42262;
	Wed, 29 Apr 2026 17:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JT7_zQ0Eyh_R; Wed, 29 Apr 2026 17:41:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF14542285
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777484494;
	bh=5jyfPkptRQME3lpQygVdL3MWZa+BgThMG5Ii3Zstqfw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BFd7+gmzGApZBZAqJXYkuGFeaxcz+A+Lc23vqxXnqYtVDr9Wh6eygRqp/y0O5aANC
	 uvdfwKFPt9C5IpA7xzEp1rZg0/s0UWh1Wr6il6/gP38VPyHHwQUv/G50M6g/t43/gc
	 iN9o86UeHQyV4mN+o2uN2wzOGAPgyz8TAWxif5g1RcbWdDNQe8Kf1rROWUuLlTqiaR
	 jQ4/Wa7wJKsLR/oRyNDILE+PzwVUz15ZfLJ+MtoXpm2T2D5PAXZPK1nVKxsBPopMzj
	 stzl3QZtF1w78WJCRp/oZjkxxEa+Q4pvfMN7sqMofQI3Bjj9L6bWVDk2sro7K55FUD
	 oqpouy+c7hq3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF14542285;
	Wed, 29 Apr 2026 17:41:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A32BB204
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 17:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9578A81C20
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 17:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZzsuYQNPG2aw for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 17:41:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4B6E810E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4B6E810E1
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 17:41:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7976A83B05; Wed, 29 Apr 2026 17:41:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Apr 2026 19:37:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 146c8a518d62f144275a73893b20d4fbf7ab0b98
X-Git-Newrev: c33cdc2ca9cc85dddd6eea62eac4fca858b9e93e
X-Patchwork-Hint: ignore
Message-Id: <20260429174131.7976A83B05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ugetty: support building
 "proxycommand" binary for host
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c33cdc2ca9cc85dddd6eea62eac4fca858b9e93e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The "proxycommand" binary is used with SSH clients to connect to
ugetty over serial. Building it as a host package makes it easy to use
with Buildroot builds including ugetty on the target, without needing
a separate install.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
[Peter: use install -D]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in.host        |  1 +
 package/ugetty/Config.in.host | 13 +++++++++++++
 package/ugetty/ugetty.mk      | 10 ++++++++++
 3 files changed, 24 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index b990ce8b14..bb6732a639 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -124,6 +124,7 @@ menu "Host utilities"
 	source "package/ti-cgt-pru/Config.in.host"
 	source "package/tipidee/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
+	source "package/ugetty/Config.in.host"
 	source "package/util-linux/Config.in.host"
 	source "package/utp_com/Config.in.host"
 	source "package/uuu/Config.in.host"
diff --git a/package/ugetty/Config.in.host b/package/ugetty/Config.in.host
new file mode 100644
index 0000000000..6d907d1c38
--- /dev/null
+++ b/package/ugetty/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_UGETTY
+	bool "host ugetty"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8  # std=c17
+	help
+	  A minimal getty for embedded Linux that auto-detects the
+	  client and dispatches incoming serial connections to a login
+	  prompt, a PPP session, or the local SSH server as
+	  appropriate.
+
+	  The host package builds only the "proxycommand" binary for
+	  use with SSH clients to connect to ugetty over serial.
+
+	  https://github.com/ryancdotorg/ugetty
diff --git a/package/ugetty/ugetty.mk b/package/ugetty/ugetty.mk
index 0e306a02c2..1dc628540d 100644
--- a/package/ugetty/ugetty.mk
+++ b/package/ugetty/ugetty.mk
@@ -20,4 +20,14 @@ define UGETTY_INSTALL_TARGET_CMDS
 	ln -snf ugetty $(TARGET_DIR)/sbin/getty
 endef
 
+define HOST_UGETTY_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) bin/proxycommand
+endef
+
+define HOST_UGETTY_INSTALL_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/bin/proxycommand \
+		$(HOST_DIR)/bin/proxycommand
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
