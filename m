Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0D0107BCEB
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 22:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7031081E58;
	Fri, 13 Mar 2026 22:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ok0Uix4r3gah; Fri, 13 Mar 2026 22:50:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ADEE81EA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773442252;
	bh=GoK4byhqnuKf05WniKdKJWEejAdZbddrT7d7CvkOgF8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fiX3qqxxi9kzZmo1rn1CChTmy9Ve9vyzZ6RA9SSBEN8LpjFxPuHnThTeYcyCOeT2Z
	 nf4yj0yVwmVk+TC0eaViLCXyfBoN4GALeth5XdpGvxISnvnCbyg/THcoXzrSjOuFGW
	 KM4Lmkw2HNdjI2WRHm3WF23R4wf6zp4U2zq6I7bTzqMm0KsbDjXM8s0vkvZ3BcpWbB
	 DbRP1C9jGqYaDYH9zXCSiRLMWDBsxvDmMYVWPvOJ6knPTjMZccMm4juLKgmDO3lead
	 gECW+nRsh7BcVT8k7578AgK7JDJRojPPF7GS0jnvUQQWAm+/puuzenMaXVDo1m9gm+
	 G2nQZwtShv6rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ADEE81EA0;
	Fri, 13 Mar 2026 22:50:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CED9201
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6490E60AA5
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZmdxxJUqpJM for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B519F60E61
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B519F60E61
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C22CC87394; Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 23:29:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9af1a2bd07d739ecdca5e6d3c0632cb773f46ea9
X-Git-Newrev: 45a74068df22bd88db10bf2296cca9e995c4d097
X-Patchwork-Hint: ignore
Message-Id: <20260313225044.C22CC87394@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xfsprogs: enable host package
 variant
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/45a74068df22bd88db10bf2296cca9e995c4d097
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The host mkfs.xfs is needed to create XFS root filesystems
in Buildroot.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/Config.in.host          | 1 +
 package/xfsprogs/Config.in.host | 6 ++++++
 package/xfsprogs/xfsprogs.mk    | 8 ++++++++
 3 files changed, 15 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 2160a0f558..b990ce8b14 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -128,6 +128,7 @@ menu "Host utilities"
 	source "package/utp_com/Config.in.host"
 	source "package/uuu/Config.in.host"
 	source "package/vboot-utils/Config.in.host"
+	source "package/xfsprogs/Config.in.host"
 	source "package/xorriso/Config.in.host"
 	source "package/zip/Config.in.host"
 	source "package/zstd/Config.in.host"
diff --git a/package/xfsprogs/Config.in.host b/package/xfsprogs/Config.in.host
new file mode 100644
index 0000000000..f200b766fe
--- /dev/null
+++ b/package/xfsprogs/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_XFSPROGS
+	bool "host xfsprogs"
+	help
+	  The XFS file system utilities and libraries
+
+	  https://xfs.wiki.kernel.org
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index ab78f8e2cc..729f4f753f 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -20,6 +20,13 @@ XFSPROGS_CONF_OPTS = \
 	INSTALL_GROUP=root \
 	--enable-static
 
+HOST_XFSPROGS_DEPENDENCIES = host-inih host-liburcu host-util-linux
+HOST_XFSPROGS_CONF_OPTS = \
+	--enable-gettext=no \
+	--enable-lib64=no \
+	--enable-libicu=no \
+	--enable-static
+
 ifeq ($(BR2_PACKAGE_ICU),y)
 XFSPROGS_DEPENDENCIES += icu
 XFSPROGS_CONF_OPTS += --enable-libicu
@@ -34,3 +41,4 @@ endif
 XFSPROGS_INSTALL_TARGET_OPTS = DIST_ROOT=$(TARGET_DIR) install
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
