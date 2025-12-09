Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7916D4337D
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93ADE8447C;
	Fri, 12 Dec 2025 07:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zi5T0GqeEKj; Fri, 12 Dec 2025 07:59:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9E3384424
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526354;
	bh=P6SO4iKteX6kwS9lbcN+io3Q5katT0NIZBy0ZgC/8+k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ava5pUCulwUBzn6bO2t/RBq7gCULGD2zout6r9s4IIA8E08WksIc5TbSD7I95AHYY
	 l6CBE21+gvttpNnn7j3OjIn/ywSQVcatY0bdaRysoPYzC+GVHx+YwxINtQVYA7m2+T
	 LLPvmOiSyUCcdWvVsjXdq6hDbKH1UIvfUd59mgPuE7yMkkesT+6gAs/ec/XiD8WhCR
	 3s2NspIavJpiftP2Rfo1D4QweKZ9NTr6OW1EaBrDecCEE2ZoQXAf79Nx1+ioFX2Pys
	 HA1XRDQ2OF3SciIZkO0Rx4qg9k9UcWwFm5QKCAYBiocqyZS5N4o95MDZFDXNxQJEy2
	 6kgzOvd6uAEYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9E3384424;
	Fri, 12 Dec 2025 07:59:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB964E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 968D141167
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VflPo_NrfKt for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E74A4119C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E74A4119C
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D760869E8; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 22:58:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f9600c2f97039b4ad6eb66087a7654805536a76
X-Git-Newrev: c621515d839b94f2013286683aaf6329e855b08b
X-Patchwork-Hint: ignore
Message-Id: <20251212075539.3D760869E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sigsum-go: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c621515d839b94f2013286683aaf6329e855b08b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the reference command line tools for interacting with Sigsum
signature transparency logs.

Signed-off-by: Florian Larysch <fl@n621.de>
[Julien:
 - select sigsum-verify if all other tools are deselected
 - split and sort HOST_SIGSUM_GO_BUILD_TARGETS
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/Config.in.host           |  1 +
 package/sigsum-go/Config.in      | 32 ++++++++++++++++++++++++++++++
 package/sigsum-go/Config.in.host |  8 ++++++++
 package/sigsum-go/sigsum-go.hash |  3 +++
 package/sigsum-go/sigsum-go.mk   | 43 ++++++++++++++++++++++++++++++++++++++++
 7 files changed, 89 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7434f41838..749cfa6e42 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1132,6 +1132,7 @@ F:	package/cpulimit/
 
 N:	Florian Larysch <fl@n621.de>
 F:	package/casync-nano/
+F:	package/sigsum-go/
 
 N:	Floris Bos <bos@je-eigen-domein.nl>
 F:	package/ipmitool/
diff --git a/package/Config.in b/package/Config.in
index a083f43a64..433bd4f6e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2793,6 +2793,7 @@ comment "Utilities"
 	source "package/screen/Config.in"
 	source "package/screenfetch/Config.in"
 	source "package/sexpect/Config.in"
+	source "package/sigsum-go/Config.in"
 	source "package/sudo/Config.in"
 	source "package/terminology/Config.in"
 	source "package/time/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index d0088364d0..606a825d44 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -110,6 +110,7 @@ menu "Host utilities"
 	source "package/sdbus-cpp/Config.in.host"
 	source "package/sdbusplus/Config.in.host"
 	source "package/sentry-cli/Config.in.host"
+	source "package/sigsum-go/Config.in.host"
 	source "package/skopeo/Config.in.host"
 	source "package/sloci-image/Config.in.host"
 	source "package/snagboot/Config.in.host"
diff --git a/package/sigsum-go/Config.in b/package/sigsum-go/Config.in
new file mode 100644
index 0000000000..15a0c27223
--- /dev/null
+++ b/package/sigsum-go/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_SIGSUM_GO
+	bool "sigsum-go"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	select BR2_PACKAGE_SIGSUM_GO_VERIFY if \
+		!BR2_PACKAGE_SIGSUM_GO_KEY && \
+		!BR2_PACKAGE_SIGSUM_GO_POLICY && \
+		!BR2_PACKAGE_SIGSUM_GO_SUBMIT && \
+		!BR2_PACKAGE_SIGSUM_GO_TOKEN
+	help
+	  Command-line utilities for interacting with Sigsum logs.
+
+	  https://git.glasklar.is/sigsum/core/sigsum-go/
+
+if BR2_PACKAGE_SIGSUM_GO
+
+config BR2_PACKAGE_SIGSUM_GO_KEY
+	bool "sigsum-key"
+
+config BR2_PACKAGE_SIGSUM_GO_POLICY
+	bool "sigsum-policy"
+
+config BR2_PACKAGE_SIGSUM_GO_SUBMIT
+	bool "sigsum-submit"
+
+config BR2_PACKAGE_SIGSUM_GO_TOKEN
+	bool "sigsum-token"
+
+config BR2_PACKAGE_SIGSUM_GO_VERIFY
+	bool "sigsum-verify"
+
+endif
diff --git a/package/sigsum-go/Config.in.host b/package/sigsum-go/Config.in.host
new file mode 100644
index 0000000000..5bc876603f
--- /dev/null
+++ b/package/sigsum-go/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_SIGSUM_GO
+	bool "host sigsum-go"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  Command-line utilities for interacting with Sigsum logs.
+
+	  https://git.glasklar.is/sigsum/core/sigsum-go/
diff --git a/package/sigsum-go/sigsum-go.hash b/package/sigsum-go/sigsum-go.hash
new file mode 100644
index 0000000000..b032e1839d
--- /dev/null
+++ b/package/sigsum-go/sigsum-go.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  9056406413868fe68a3fcc6415dff5a0045b35baa2242a17fea7a697b1c68e3d  sigsum-go-v0.13.1-git4-go2.tar.gz
+sha256  6a1e3378dcd18baade08ac30ec4ba33b72d1b1697c00226ef85b9c9cefdb4e65  LICENSE
diff --git a/package/sigsum-go/sigsum-go.mk b/package/sigsum-go/sigsum-go.mk
new file mode 100644
index 0000000000..4f01be56a5
--- /dev/null
+++ b/package/sigsum-go/sigsum-go.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# sigsum-go
+#
+################################################################################
+
+SIGSUM_GO_VERSION = v0.13.1
+SIGSUM_GO_SITE = https://git.glasklar.is/sigsum/core/sigsum-go
+SIGSUM_GO_SITE_METHOD = git
+SIGSUM_GO_LICENSE = BSD-2-Clause
+SIGSUM_GO_LICENSE_FILES = LICENSE
+
+SIGSUM_GO_GOMOD = sigsum.org/sigsum-go
+
+ifeq ($(BR2_PACKAGE_SIGSUM_GO_KEY),y)
+SIGSUM_GO_BUILD_TARGETS += cmd/sigsum-key
+endif
+
+ifeq ($(BR2_PACKAGE_SIGSUM_GO_POLICY),y)
+SIGSUM_GO_BUILD_TARGETS += cmd/sigsum-policy
+endif
+
+ifeq ($(BR2_PACKAGE_SIGSUM_GO_SUBMIT),y)
+SIGSUM_GO_BUILD_TARGETS += cmd/sigsum-submit
+endif
+
+ifeq ($(BR2_PACKAGE_SIGSUM_GO_TOKEN),y)
+SIGSUM_GO_BUILD_TARGETS += cmd/sigsum-token
+endif
+
+ifeq ($(BR2_PACKAGE_SIGSUM_GO_VERIFY),y)
+SIGSUM_GO_BUILD_TARGETS += cmd/sigsum-verify
+endif
+
+HOST_SIGSUM_GO_GOMOD = sigsum.org/sigsum-go
+HOST_SIGSUM_GO_BUILD_TARGETS = \
+	cmd/sigsum-key \
+	cmd/sigsum-submit \
+	cmd/sigsum-token \
+	cmd/sigsum-verify
+
+$(eval $(golang-package))
+$(eval $(host-golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
