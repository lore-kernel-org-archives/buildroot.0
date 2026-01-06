Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26F9CEFD0C
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 20:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 358496069E;
	Tue,  6 Jan 2026 20:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYyMRod5bU50; Tue,  6 Jan 2026 20:58:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAEF8606A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767733105;
	bh=CH9d7f4kDqpCMr0RICl3zqfxj8LdSdyhfKREO3iCgbY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MET5dcZAdIa8Wi9BGJrhxgVQOz4eU5b3RGefmRJY3kxLQq9nxcAy+dz94Xx0Nq/fX
	 6+i68wwtV82C/XcA4bC1tkRNH8xE80PQHmbYSVu5S7RXIV0djs/WQlbF6U0HsPoYwm
	 Kx8cpBQMp28ziW4/9blRoIjhke0bDorc8/Z8C+xyysbvHF23STcwOsnDiCRFF3+zzh
	 MIaq5vl7/43wiA2s6LeiYuvgtqgNUAxc8yqH6vdXJoaSz85xxpp9gLCQCPD6jNDGHe
	 cSctuFBmsXQjYkEqZ7HBb6gC+yUTJfFXJF6P8rvQl/8oKTHTJmGYDZOpVLjCPY7qLM
	 i37V1BVwe54Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAEF8606A3;
	Tue,  6 Jan 2026 20:58:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4689670B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CB38606A3
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEvhfcI3W1W6 for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 20:58:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD1636069E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD1636069E
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:58:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABBD8882FF; Tue,  6 Jan 2026 20:58:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 21:57:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e45ba467210b85ff2dc6406411cce178b03ee280
X-Git-Newrev: cdc6981e42d6d1a1a095da69091ec0a5cf720dcc
X-Patchwork-Hint: ignore
Message-Id: <20260106205822.ABBD8882FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/k3conf: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cdc6981e42d6d1a1a095da69091ec0a5cf720dcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

K3CONF is a Linux user-space standalone application
designed to provide a quick'n easy way to dynamically
diagnose Texas Instruments' K3 architecture based
processors. K3CONF is intended to provide similar
experience to that of OMAPCONF that runs on legacy TI platforms.

K3CONF currently supports Texas Instruments AM654, J721E, J7200,
AM64x,AM62x,J721S2,J784S4,J722S, AM62Ax, AM62Px, and AM62Lx devices.
Along with the BeagleBoard variants of the above mentioned TI SOC's.

Signed-off-by: Mohammed Sadik Shaik <s-sadik@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  3 +++
 package/Config.in          |  1 +
 package/k3conf/Config.in   | 14 ++++++++++++++
 package/k3conf/k3conf.hash |  3 +++
 package/k3conf/k3conf.mk   | 17 +++++++++++++++++
 5 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f982e3123a..2dbd64a455 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2488,6 +2488,9 @@ F:	package/libfribidi/
 N:	Mircea Gliga <gliga.mircea@gmail.com>
 F:	package/mbuffer/
 
+N:	Mohammed Sadik Shaik <s-sadik@ti.com>
+F:	package/k3conf/
+
 N:	Murat Demirten <mdemirten@yh.com.tr>
 F:	package/jpeg-turbo/
 F:	package/libgeotiff/
diff --git a/package/Config.in b/package/Config.in
index 352fd626e0..7f93f6568e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -109,6 +109,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/google-breakpad/Config.in"
 	source "package/hyperfine/Config.in"
 	source "package/iozone/Config.in"
+	source "package/k3conf/Config.in"
 	source "package/kexec/Config.in"
 	source "package/kexec-lite/Config.in"
 	source "package/kmemd/Config.in"
diff --git a/package/k3conf/Config.in b/package/k3conf/Config.in
new file mode 100644
index 0000000000..0db3a720de
--- /dev/null
+++ b/package/k3conf/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_K3CONF
+	bool "k3conf"
+	depends on BR2_aarch64
+	help
+	  k3conf is a Linux user-space standalone application designed
+	  to provide a quick'n easy way to dynamically diagnose Texas
+	  Instruments' K3 architecture based processors.
+
+	  k3conf currently supports Texas Instruments AM654, J721E,
+	  J7200, AM64x, AM62x, J721S2, J784S4, J722S, AM62Ax, AM62Px,
+	  and AM62Lx devices. Along with the BeagleBoard variants of
+	  the above mentioned TI SOC's.
+
+	  https://git.ti.com/cgit/k3conf/k3conf
diff --git a/package/k3conf/k3conf.hash b/package/k3conf/k3conf.hash
new file mode 100644
index 0000000000..2c8d4ef664
--- /dev/null
+++ b/package/k3conf/k3conf.hash
@@ -0,0 +1,3 @@
+# Locally calculated sha256sum
+sha256  a3459f80e7af5672da6b41bc0814114690dd549aac4cf81ba4e5dc84d42ab9c6  k3conf-v0.4-git4.tar.gz
+sha256  f962a0a4912aeae2d6f2f6e07bc3f79f7f1df9d4bf1abfb5c421b9b14352bfaf  LICENSE
diff --git a/package/k3conf/k3conf.mk b/package/k3conf/k3conf.mk
new file mode 100644
index 0000000000..79acac7afd
--- /dev/null
+++ b/package/k3conf/k3conf.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# k3conf
+#
+################################################################################
+
+K3CONF_VERSION = v0.4
+K3CONF_SITE = https://git.ti.com/git/k3conf/k3conf.git
+K3CONF_SITE_METHOD = git
+K3CONF_LICENSE = BSD-3-Clause
+K3CONF_LICENSE_FILES = LICENSE
+
+define K3CONF_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVMEM)
+endef
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
