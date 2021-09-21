Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5A5C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:46:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C1A160FC1
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C1A160FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 978634042B;
	Tue, 21 Sep 2021 20:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A_Tr_xVnLuGp; Tue, 21 Sep 2021 20:46:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95E3E401B0;
	Tue, 21 Sep 2021 20:46:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E701E1BF995
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4CCB400CF
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8dY81h5-7ek for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:46:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEB0B400E9
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:46:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EDD558C981; Tue, 21 Sep 2021 20:44:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:39:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 521b6f85508ee9ab848b0b2ea1d36edaf1701bc1
X-Git-Newrev: ddad938149e80d14ab2c7695ac3ba7e7de6c327b
X-Patchwork-Hint: ignore
Message-Id: <20210921204419.EDD558C981@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: add option to enable
 media-session support
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ddad938149e80d14ab2c7695ac3ba7e7de6c327b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The example media-session pipewire session manager requires
pipewire to be built with examples enabled, add support for
enabling this while depending on examples being enabled.

To simplify adding support for additional session managers in
the future such as wireplumber we pass a comma separated list
to the -Dsession-managers meson config option. This also will
ensure that systemd services that depend on media-session are
only installed if media-session support is enabled.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pipewire/Config.in   | 6 ++++++
 package/pipewire/pipewire.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index b15bbfa8d3..506b85e856 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -19,6 +19,12 @@ config BR2_PACKAGE_PIPEWIRE_EXAMPLES
 	help
 	  Build pipewire examples
 
+config BR2_PACKAGE_PIPEWIRE_MEDIA_SESSION
+	bool "pipewire media-session"
+	depends on BR2_PACKAGE_PIPEWIRE_EXAMPLES
+	help
+	  Build pipewire media-session support
+
 config BR2_PACKAGE_PIPEWIRE_GSTREAMER
 	bool "pipewire gstreamer plugins"
 	depends on BR2_USE_WCHAR # libglib2
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index d088710827..d6cbe1605f 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -156,6 +156,12 @@ else
 PIPEWIRE_CONF_OPTS += -Decho-cancel-webrtc=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_PIPEWIRE_MEDIA_SESSION),y)
+PIPEWIRE_SESSION_MANAGERS_LIST = media-session
+endif
+
+PIPEWIRE_CONF_OPTS += -Dsession-managers='$(subst $(space),$(comma),$(PIPEWIRE_SESSION_MANAGERS_LIST))'
+
 define PIPEWIRE_USERS
 	pipewire -1 pipewire -1 * - - - PipeWire System Daemon
 endef
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
