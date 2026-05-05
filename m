Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF84FF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 20:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D22781951;
	Tue,  5 May 2026 20:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3xfjvi1HuS1; Tue,  5 May 2026 20:13:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C62228191E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778011990;
	bh=mqHLJFHnOlDImsegQ8q9J9OQ5zYi1ATn1gfHgwAczeM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MFOex2ktN94sluHXa92cSYsozrm+Jf3X+o2BCEpRhuOJtvUBKYFjNGaHyx+KqlWdD
	 RaTWTryr3XvkpWcuZRY9yaGM/FZfshEvzg3W/1G0te51C461BIHdpsroAE/HrlAt6p
	 U6uxQaJpztyxB+S5Ro56bG/j8snwP5xYY8KitdvlKJo6SWovwOmhI4yZMUfqWE0jfG
	 fH6MFX5gZcIOY+6jSfVdD3V+pKaELoEGtKeGerqXn838ABYRi/nukSTEh35ooxt5KK
	 GcfetXQsFVuKfEIDxFbzaJD98UycYpwtxA4OPsiAKab8OGpcTiNKE9F2QxPlUvUxZE
	 GSBWbIBEPErNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C62228191E;
	Tue,  5 May 2026 20:13:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB00F280
 for <buildroot@buildroot.org>; Tue,  5 May 2026 20:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0F9E60A60
 for <buildroot@buildroot.org>; Tue,  5 May 2026 20:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lykZFD5FLY-V for <buildroot@buildroot.org>;
 Tue,  5 May 2026 20:13:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1202060710
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1202060710
 for <buildroot@buildroot.org>; Tue,  5 May 2026 20:13:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E0DE84659; Tue,  5 May 2026 20:13:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 22:09:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8cde69e1011e82e44447803d6dbbaac96375d0a7
X-Git-Newrev: 3d937c4a8e646777c134b9fa215c8c151e432b5c
X-Patchwork-Hint: ignore
Message-Id: <20260505201308.0E0DE84659@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpiod: enable the kernel GPIO
 ABI v1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3d937c4a8e646777c134b9fa215c8c151e432b5c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Unlike libgpiod2, this version of libgpiod relies on the deprecated GPIO
ABI version 1. This ABI used to be enabled by default. However, since
Linux 7.1-rc1 (commit 7673e4c7f7f9 "Do not enable the v1 uAPI by
default"), this is not the case anymore. Failing to enable the ABI
results in a non-functional libgpiod. For instance:

    # gpioinfo
    gpioinfo: error creating line iterator: Invalid argument

Fix this by enabling the ABI v1 in LIBGPIOD_LINUX_CONFIG_FIXUPS.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libgpiod/libgpiod.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index f669643b39..4df26074d2 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -24,6 +24,10 @@ else
 LIBGPIOD_CONF_OPTS += --disable-tools
 endif
 
+define LIBGPIOD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_GPIO_CDEV_V1)
+endef
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 LIBGPIOD_CONF_OPTS += --enable-bindings-cxx
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
