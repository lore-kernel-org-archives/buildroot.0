Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A41C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 13:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 593C8608B4;
	Fri, 12 Apr 2024 13:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Mylo5n1VSn1; Fri, 12 Apr 2024 13:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A80B1608C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A80B1608C5;
	Fri, 12 Apr 2024 13:27:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51AF21BF3A9
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 13:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E74142069
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 13:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tj8o-bAalZG9 for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 13:27:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F28E42064
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F28E42064
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F28E42064
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 13:27:43 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-34339f01cd2so679721f8f.2
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 06:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712928461; x=1713533261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gYRCctnbwWcxt+nwpuvOzZR9QIFtvunYpq28rn29f0U=;
 b=SdXtbTCsDMpjQmHLtz9EAfhC0Wfx125PnQn+92mSs14x45+n51GOXqxxg4PxO9xVsd
 rL81/7SxlK5RTq8OtzSYY9eVQ+INaZuzZlXYZLSRvIdTu1DOfz0DZ4zrFgJiQZDzHlEo
 pKEZ0CXoqcWMPGGM8yZBxKd0SCnUavu/lX37udbEjKLpmW8+pHFBky6PVH4BjCkesEck
 eIsfAsu+ehhJFIxlfdlKzS+aoSAOl9hFAS1L41RaZfarg4XrGC2Rzpb1t8hQWA8gPd6N
 GuN/IERKsmrVaOWEF95+9MU7tauWAzMJh/Usua+pj2h5t4OGiy5hfAfRicw1+jAr3VBu
 hEmg==
X-Gm-Message-State: AOJu0YwLBOIxyXDymbJmxUHtoS5DuKPKBT5dwN9c+1EiafhoCLhvxDOE
 OnIsyYC2EmpXc4SW3iEV8BYZTu/piApJ82hr+RhKoLpLK6fPWZdD59bhcUW6GzzX6opEO7/6Wff
 zdDs=
X-Google-Smtp-Source: AGHT+IGtbfbpQZLJjjj0zpFpddL+aaRgAsA2w4mdb+6/Cya/PNep0RCTDOC9DhXs2aVfn2kiZVo5zg==
X-Received: by 2002:a05:6000:1ac5:b0:343:6f87:fe33 with SMTP id
 i5-20020a0560001ac500b003436f87fe33mr1994400wry.7.1712928460931; 
 Fri, 12 Apr 2024 06:27:40 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a5d6a84000000b00343a66f6be4sm4288163wru.24.2024.04.12.06.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 06:27:40 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 15:26:56 +0200
Message-ID: <20240412132659.1168317-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412132659.1168317-1-thomas.perale@mind.be>
References: <20240412132659.1168317-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1712928461; x=1713533261; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gYRCctnbwWcxt+nwpuvOzZR9QIFtvunYpq28rn29f0U=;
 b=PpoNujGfxyVEElSgfZG/EGXBLgGdY1G5rBqX3KgTT1CdnDUNmynrMoDT82AWky5+Sl
 HDqyc2o7Lc11+4MCEqEvQe7KWenYqPcDnTS8hm99wQN8Vv0NNcuY5vitwoylBVM9FxSF
 TStrQMQzHj06Q1U6XZUKEFI5DlmCzpvCjEW2Sy5c0L7HSUtUf2OFolidnqq5qQTi9EPP
 HIGVzpJJgybLySh+d8Cd3l8FSmGhYcDxOBygB2IYlELhYPP+LGNVdtBnYi6EbbxA3Z8+
 wb2losHTeZMCPlZeGyjjQuUyRzR337wQmBqDiQEk1uz16/JDvFjhpjbxn9+++8QONIcS
 h0Iw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=PpoNujGf
Subject: [Buildroot] [PATCH 4/6] package/pkg-golang: select go compiler
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Christian Stewart <christian@aperture.us>,
 Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Thomas Perale <thomas.perale@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Select the 'go' virtual package in every package built by the Go
compiler. This maintains the correct dependencies in 'menuconfig'.
The same pattern is currently used for Rust packages.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/balena-engine/Config.in        | 1 +
 package/cni-plugins/Config.in          | 1 +
 package/containerd/Config.in           | 1 +
 package/crucible/Config.in             | 1 +
 package/delve/Config.in                | 1 +
 package/delve/Config.in.host           | 1 +
 package/docker-cli/Config.in           | 1 +
 package/docker-compose/Config.in       | 1 +
 package/docker-engine/Config.in        | 1 +
 package/embiggen-disk/Config.in        | 1 +
 package/flannel/Config.in              | 1 +
 package/gitlab-runner/Config.in        | 1 +
 package/gocryptfs/Config.in            | 1 +
 package/mender-artifact/Config.in.host | 1 +
 package/mender-connect/Config.in       | 1 +
 package/mender/Config.in               | 1 +
 package/moby-buildkit/Config.in        | 1 +
 package/moby-buildkit/Config.in.host   | 1 +
 package/nerdctl/Config.in              | 1 +
 package/runc/Config.in                 | 1 +
 package/runc/Config.in.host            | 1 +
 package/tinifier/Config.in             | 1 +
 package/wtfutil/Config.in              | 1 +
 23 files changed, 23 insertions(+)

diff --git a/package/balena-engine/Config.in b/package/balena-engine/Config.in
index 02f694515e..5966b33f58 100644
--- a/package/balena-engine/Config.in
+++ b/package/balena-engine/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_BALENA_ENGINE
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
 	depends on BR2_USE_MMU # util-linux
 	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime
+	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_IPTABLES # runtime
 	select BR2_PACKAGE_UTIL_LINUX # runtime
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES # runtime
diff --git a/package/cni-plugins/Config.in b/package/cni-plugins/Config.in
index 25e6ff534d..6d4ca0a5b4 100644
--- a/package/cni-plugins/Config.in
+++ b/package/cni-plugins/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_CNI_PLUGINS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
 	depends on BR2_USE_MMU
+	select BR2_PACKAGE_HOST_GO
 	help
 	  Container Networking Interface plugins.
 
diff --git a/package/containerd/Config.in b/package/containerd/Config.in
index 2dd04b109c..f014c56e10 100644
--- a/package/containerd/Config.in
+++ b/package/containerd/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_CONTAINERD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc
 	depends on BR2_USE_MMU # util-linux
+	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN # runtime dependency
 	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES
diff --git a/package/crucible/Config.in b/package/crucible/Config.in
index b27eb31ae5..1e1b29c3df 100644
--- a/package/crucible/Config.in
+++ b/package/crucible/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CRUCIBLE
 	bool "crucible"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  Crucible is a One-Time-Programmable (OTP) fusing tool for the
 	  i.MX family.
diff --git a/package/delve/Config.in b/package/delve/Config.in
index 9428e4016a..288dc1ea15 100644
--- a/package/delve/Config.in
+++ b/package/delve/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_DELVE_ARCH_SUPPORTS
 	default y if BR2_x86_64
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 
 config BR2_PACKAGE_DELVE
 	bool "delve"
diff --git a/package/delve/Config.in.host b/package/delve/Config.in.host
index dab5ca8914..0938ab0659 100644
--- a/package/delve/Config.in.host
+++ b/package/delve/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_DELVE
 	bool "host delve"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  Delve is a debugger for the Go programming language.
 
diff --git a/package/docker-cli/Config.in b/package/docker-cli/Config.in
index 6f187c9d22..52e7f7c871 100644
--- a/package/docker-cli/Config.in
+++ b/package/docker-cli/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DOCKER_CLI
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  Docker is a platform to build, ship,
 	  and run applications as lightweight containers.
diff --git a/package/docker-compose/Config.in b/package/docker-compose/Config.in
index 59128f7a19..f3560e402b 100644
--- a/package/docker-compose/Config.in
+++ b/package/docker-compose/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_DOCKER_COMPOSE
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_DOCKER_CLI
+	select BR2_PACKAGE_HOST_GO
 	help
 	  Multi-container applications with the Docker CLI.
 
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index d48ffe6484..49a002a647 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
 	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
 	select BR2_PACKAGE_CONTAINERD # runtime dependency
+	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_IPTABLES # runtime dependency
 	select BR2_PACKAGE_LIBSECCOMP
 	help
diff --git a/package/embiggen-disk/Config.in b/package/embiggen-disk/Config.in
index 667d71c86e..c323fb1b6d 100644
--- a/package/embiggen-disk/Config.in
+++ b/package/embiggen-disk/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_EMBIGGEN_DISK
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
 	depends on BR2_USE_MMU # util-linux
+	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_UTIL_LINUX # sfdisk
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES # sfdisk
 	help
diff --git a/package/flannel/Config.in b/package/flannel/Config.in
index eb8d798f48..f37cfaa9cc 100644
--- a/package/flannel/Config.in
+++ b/package/flannel/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_FLANNEL
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  Flannel is a virtual network that gives a subnet to each
 	  host for use with container runtimes.
diff --git a/package/gitlab-runner/Config.in b/package/gitlab-runner/Config.in
index 4289613ab9..cfe8c941bc 100644
--- a/package/gitlab-runner/Config.in
+++ b/package/gitlab-runner/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_GITLAB_RUNNER
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_CA_CERTIFICATES # runtime
 	select BR2_PACKAGE_GIT # runtime
+	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_LIBCURL # runtime
 	select BR2_PACKAGE_LIBCURL_CURL # runtime
 	select BR2_PACKAGE_LIBCURL_FORCE_TLS # runtime
diff --git a/package/gocryptfs/Config.in b/package/gocryptfs/Config.in
index 2630cafdcf..2c70b9b21b 100644
--- a/package/gocryptfs/Config.in
+++ b/package/gocryptfs/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GOCRYPTFS
 	bool "gocryptfs"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  gocryptfs is an encrypted FUSE overlay filesystem.
 
diff --git a/package/mender-artifact/Config.in.host b/package/mender-artifact/Config.in.host
index c7be0ed261..39353b23e7 100644
--- a/package/mender-artifact/Config.in.host
+++ b/package/mender-artifact/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_MENDER_ARTIFACT
 	bool "host mender-artifact"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  The mender-artifact tool is a CLI implementation of the
 	  Mender artifacts library.
diff --git a/package/mender-connect/Config.in b/package/mender-connect/Config.in
index 0845910880..d478e468c2 100644
--- a/package/mender-connect/Config.in
+++ b/package/mender-connect/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_MENDER_CONNECT
 	depends on BR2_USE_WCHAR # libglib2 -> gettext
 	depends on BR2_USE_MMU # dbus -> fork()
 	select BR2_PACKAGE_DBUS # runtime
+	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_MENDER # runtime
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/mender/Config.in b/package/mender/Config.in
index 7d768cebec..4831548f76 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
diff --git a/package/moby-buildkit/Config.in b/package/moby-buildkit/Config.in
index 93c852bcdb..1a0b599097 100644
--- a/package/moby-buildkit/Config.in
+++ b/package/moby-buildkit/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_MOBY_BUILDKIT
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
+	select BR2_PACKAGE_HOST_GO
 	help
 	  BuildKit is a toolkit for converting source code to build
 	  artifacts in an efficient, expressive and repeatable manner.
diff --git a/package/moby-buildkit/Config.in.host b/package/moby-buildkit/Config.in.host
index a3b18548f8..d4eb0d74c3 100644
--- a/package/moby-buildkit/Config.in.host
+++ b/package/moby-buildkit/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_MOBY_BUILDKIT
 	bool "host moby-buildkit"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  BuildKit is a toolkit for converting source code to build
 	  artifacts in an efficient expressive and repeatable manner.
diff --git a/package/nerdctl/Config.in b/package/nerdctl/Config.in
index 969b9bb40e..062b36ab85 100644
--- a/package/nerdctl/Config.in
+++ b/package/nerdctl/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_NERDCTL
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd
 	depends on BR2_USE_MMU # util-linux
 	select BR2_PACKAGE_CONTAINERD # runtime
+	select BR2_PACKAGE_HOST_GO
 	help
 	  Docker-compatible CLI for containerd, controlling runc.
 
diff --git a/package/runc/Config.in b/package/runc/Config.in
index fe527b1954..73eac72527 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_RUNC
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	select BR2_PACKAGE_HOST_GO
 	help
 	  runC is a CLI tool for spawning and running containers
 	  according to the OCI specification.
diff --git a/package/runc/Config.in.host b/package/runc/Config.in.host
index 4b2555e029..78193cb499 100644
--- a/package/runc/Config.in.host
+++ b/package/runc/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_RUNC
 	bool "host runc"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  runC is a CLI tool for spawning and running containers
 	  according to the OCI specification.
diff --git a/package/tinifier/Config.in b/package/tinifier/Config.in
index fbadfe6bd9..eae8b8f499 100644
--- a/package/tinifier/Config.in
+++ b/package/tinifier/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TINIFIER
 	bool "tinifier"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  CLI tool for images compressing
 
diff --git a/package/wtfutil/Config.in b/package/wtfutil/Config.in
index 8c3efcea5d..3fd8c41bab 100644
--- a/package/wtfutil/Config.in
+++ b/package/wtfutil/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_WTFUTIL
 	bool "wtfutil"
 	depends on BR2_USE_MMU  # fork()
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  WTF is the personal information dashboard for your terminal.
 
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
