Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9391D606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 18:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XjyFt4dH
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39754810D9;
	Fri, 30 Oct 2026 18:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8tWpGU9mEok; Fri, 30 Oct 2026 18:50:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6316781004
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793386214;
	b=l2rn7eFbXuK06xkpAiX9mKvR88nYh63Pse0EaF2xiygXxbb8bWXTIJiFCwpomAKlFGnP
	 fjSl3Tyjcn58fmuSDMVWzBzL0+1FuM/Y9uIZ/mtPC3ElJRgUvZ8lKwSHVtGyDzdbZL/7k
	 raUAim8APONez5SaCv10H/zydoycd+B9C5VmjvzFnFMq7+m0w4OEwUXCZ9H1hTOwydevf
	 z2v39yJpWYNw8Ec2kHClLzMKm/vLAO/Jq7SxVhKWg7P3DKRlH3mBVwgQqXO28E8l70nzy
	 uUSfeXyGHYJcnIdeHnBAUiL39ZIEnd3XbPQHBGlS1TA7+hGkDHXs5lATP6Qy97A5S4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793386214;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H58oxZuoLs+aQTnL8hQaXFjVkrUoVPScGrC1tTqWLiA=;
	b=qBSz9VGh3Bgyd7gX0yltyV4doaRGBmzG1Q+bharnwhgCqsgrkjIWBKtRgz0qgPz7wgzm
	 Nqi9WV3u3Ng9Ug/FKpGWg5chrWjLfRFfOOCTjSIi7Oe91+H2qZEt/TQk1djUWSiVofABs
	 /DYcikOjJ3r9UOfn4BI4fw67ofVayc4/QFDlANImMf65pQwrBjJPfP+k0TnPs+9gthd1D
	 KhH6oPlX7PIaVeog7T6JjhqKrr5DPq6o6EYAAMJCKn3xD+V9Vf9gs5PghXFTJszcIQb35
	 s3aUEdz6jfYhR0c8ZddpVU+jZK9BENnTBXCHzObkpyoyfYSKcMoZyuuTCI3WQIvSeCw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793386214;
	bh=H58oxZuoLs+aQTnL8hQaXFjVkrUoVPScGrC1tTqWLiA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XjyFt4dHglyzyVrEyJpgE9drQnNOrTqDykqw/Xp9hH/LEYMVFzj6XqbAQdQfscFKc
	 beWo9Q+dP4IXqiSCdLFqhdaP3Tpr2ay7p+Wt8NFRgUiNuINlX0wGpxIgVFCpwQRGrw
	 BKp2hhoKxcGPoQNrBoo/70/uCV50tYmNaJtQLZF7aPJPeO/QA02j0eZITGrhf0Gtd2
	 zF/5P3rbVzysprUSRmw3oJEY3wS50rrpSeT+PbIZh4ljI4OQDPw51+2WWIwkJ5zsuR
	 55qf9fU5dXOkQpva+glRkteU+X4gisiTL9HYW2vCTnYfq/Y153dwXNjgBdJq3mQ7lu
	 SSRwgrY9rRUUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6316781004;
	Fri, 30 Oct 2026 18:50:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD9A3712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 18:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9B2781004
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 18:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_jpvqClTHLz for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 18:50:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AF8C980FFF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793386211;
 b=GYDqxpphxbJ2YHVGqbzHFtJ2OlQDH85q40uCGP4CWer2NpTOJo9tUmvxjw2yiwux84v5
 HV5YneidzXDO3C7MLVGkXZcdARBB8jbmleo+wpMk01wG3AMAwuTh2sELa4Z9IVJu+qJmQ
 +MB5Q9gMj0LcbE5MWpRtMenFouTmTSTbYwWZK6o8VDnnKHEehC+6+Zkvyeiz9N98FtH0G
 k5mqCKEgsXaFIZgWzGkaZ6z47mHf4jVsE39ReJDGjooIRs9UnnojYuEEUef1wMogRot9F
 DRNKLDYJLznscX8xDFjQZNUKWGOM7u79y6VjsELs0EydqypThS7OAmRWUpPtOjMtN4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793386211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qd9APD14S7ulLu5qZrEHFpWY74X3mzlmj5lj7emMeck=;
 b=RSPa6U4YaQoOIojatJ7OOVJnvp56m52FP3q0mNLv3T1VpeCpOZ9mpfuGUD4K+uTfqnIy
 ZXlhpcOqUue8bBa8N7pD3CvhQTnzLPUWV1sVUvxQdWh9I7LpVFrwPqujMeP64nlu2/HK8
 SkUekuNIWlcB/b8XjfvR39Fd42PhAC5BeoWWC8h57VW8wysk4ZIrdRmxEcmGonyoPxPcY
 3AZ9u6P/+qas47grFySs8i8UtP6zfp0f1nqXBEekkTTd9gkk+gKpI5SbBEl/9OrpwIVY4
 w+1OLeP9rhGe1B1zcHDWhS7uhdJAjtIa02ZuTMhNkHoTp2HiGPK6ZL7Vhv9NImcAldQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF8C980FFF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 18:50:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 613309D3BC; Fri, 30 Oct 2026 18:48:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 30 Oct 2026 19:49:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3571ec6fb095c68bdeb867ffeb39bc2cee0a2fec
X-Git-Newrev: 6d1d3cc564e84180ca03696267efad068977c6b9
X-Patchwork-Hint: ignore
Message-Id: <20261030184843.613309D3BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netbird: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d1d3cc564e84180ca03696267efad068977c6b9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                            |  1 +
 package/Config.in                     |  1 +
 package/netbird/Config.in             | 10 ++++++
 package/netbird/netbird-networkd.conf |  4 +++
 package/netbird/netbird-tmpfiles.conf |  1 +
 package/netbird/netbird.hash          |  3 ++
 package/netbird/netbird.mk            | 58 +++++++++++++++++++++++++++++++++++
 package/netbird/netbird.service       | 17 ++++++++++
 8 files changed, 95 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b4ada4e1f9..02834f1438 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1560,6 +1560,7 @@ F:	package/libucontext/
 F:	package/lilv/
 F:	package/lv2/
 F:	package/neon-2-sse/
+F:	package/netbird/
 F:	package/pipewire/
 F:	package/python*
 F:	package/rtl8192eu/
diff --git a/package/Config.in b/package/Config.in
index 796c4f1ad6..933b072ae0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2572,6 +2572,7 @@ endif
 	source "package/net-tools/Config.in"
 	source "package/netatalk/Config.in"
 	source "package/netavark/Config.in"
+	source "package/netbird/Config.in"
 	source "package/netcalc/Config.in"
 	source "package/netcat/Config.in"
 	source "package/netcat-openbsd/Config.in"
diff --git a/package/netbird/Config.in b/package/netbird/Config.in
new file mode 100644
index 0000000000..b2e1eb6fd5
--- /dev/null
+++ b/package/netbird/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_NETBIRD
+	bool "netbird"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  Connect your devices into a secure WireGuard-based
+	  overlay network with SSO, MFA and granular access
+	  controls.
+
+	  https://github.com/netbirdio/netbird
diff --git a/package/netbird/netbird-networkd.conf b/package/netbird/netbird-networkd.conf
new file mode 100644
index 0000000000..e6cb4edc94
--- /dev/null
+++ b/package/netbird/netbird-networkd.conf
@@ -0,0 +1,4 @@
+# Preserve routes and policy rules managed by NetBird.
+[Network]
+ManageForeignRoutes=no
+ManageForeignRoutingPolicyRules=no
diff --git a/package/netbird/netbird-tmpfiles.conf b/package/netbird/netbird-tmpfiles.conf
new file mode 100644
index 0000000000..c13afb0c9d
--- /dev/null
+++ b/package/netbird/netbird-tmpfiles.conf
@@ -0,0 +1 @@
+d /var/lib/netbird 0750 root root -
diff --git a/package/netbird/netbird.hash b/package/netbird/netbird.hash
new file mode 100644
index 0000000000..c4ad00b989
--- /dev/null
+++ b/package/netbird/netbird.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  114286d923290df13fbcec88b5f9b7762f5e573d268af80a6b221ec825e128bd  netbird-0.81.5-go2.tar.gz
+sha256  8343fe949e32a30e2261c4f0967365271d08c4644e879dec5b998d1af666fdb3  LICENSE
diff --git a/package/netbird/netbird.mk b/package/netbird/netbird.mk
new file mode 100644
index 0000000000..e0925ed11c
--- /dev/null
+++ b/package/netbird/netbird.mk
@@ -0,0 +1,58 @@
+################################################################################
+#
+# netbird
+#
+################################################################################
+
+NETBIRD_VERSION = 0.81.5
+NETBIRD_SITE = $(call github,netbirdio,netbird,v$(NETBIRD_VERSION))
+NETBIRD_LICENSE = BSD-3-Clause
+NETBIRD_LICENSE_FILES = LICENSE
+NETBIRD_BUILD_TARGETS = client
+NETBIRD_BIN_NAME = netbird
+NETBIRD_LDFLAGS = \
+	-X github.com/netbirdio/netbird/version.version=$(NETBIRD_VERSION)
+
+define NETBIRD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(NETBIRD_PKGDIR)/netbird.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/netbird.service
+	$(INSTALL) -D -m 0644 $(NETBIRD_PKGDIR)/netbird-tmpfiles.conf \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/netbird.conf
+	$(if $(BR2_PACKAGE_SYSTEMD_NETWORKD), \
+		$(INSTALL) -D -m 0644 $(NETBIRD_PKGDIR)/netbird-networkd.conf \
+			$(TARGET_DIR)/usr/lib/systemd/networkd.conf.d/99-netbird.conf)
+endef
+
+define NETBIRD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6_MULTIPLE_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_ADVANCED_ROUTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MULTIPLE_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETDEVICES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_COUNTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_MASQ)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_EVENTS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_NETLINK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PACKET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_SYSCTL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TTY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_UNIX)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_UNIX98_PTYS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIREGUARD)
+endef
+
+$(eval $(golang-package))
diff --git a/package/netbird/netbird.service b/package/netbird/netbird.service
new file mode 100644
index 0000000000..4542e0210e
--- /dev/null
+++ b/package/netbird/netbird.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=NetBird mesh network client
+ConditionFileIsExecutable=/usr/bin/netbird
+After=network.target syslog.target
+
+[Service]
+StartLimitInterval=5
+StartLimitBurst=10
+ExecStart=/usr/bin/netbird service run --log-file console
+StandardOutput=journal
+StandardError=journal
+Restart=always
+RestartSec=120
+EnvironmentFile=-/etc/sysconfig/netbird
+
+[Install]
+WantedBy=multi-user.target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
