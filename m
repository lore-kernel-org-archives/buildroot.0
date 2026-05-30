Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD71CD6E55
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 15:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 965E86F5B5;
	Sat, 30 May 2026 15:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GgMpibvvhKKy; Sat, 30 May 2026 15:37:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F8C36F5A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780155465;
	bh=s+FSaIfE7Vi1yfNNs982r0Qq22VQuFzjNRXr29fH8Q0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bxhjKdztGOnsgDGZ0dsukinFf2283TWo6lIEyipe/655tGyfmG/m3MwJD3S2SEARI
	 APzKat9YIhmoezuXGCQA11Ihu9tDLvkWCX03xLnwC2iAhicT2SBiO/uiDoATOLJUXO
	 H6Oh/isdsvzpmUQB9RAlwOyTpaqlXEzjhJfVBvUkECE5AhiMu5lf/DAY1ods6jspZX
	 N+dKrdr1tMDrWnU+XBiKF5RfZ6N7nRZaI1MFEi3ICxYcJrlFm6nGVfe5luJbNws0aq
	 mU7QcmNXdMjLsoKOCmKWALyn604VANyKTxSguauu4qcfsgAYF6NAJOE9m+HwhAeatc
	 NYFulJrft9jZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F8C36F5A8;
	Sat, 30 May 2026 15:37:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 728B1D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58D2C6F5A1
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYUzluP8sqrX for <buildroot@buildroot.org>;
 Sat, 30 May 2026 15:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DD8E6F5A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DD8E6F5A4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:37:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE3B787528; Sat, 30 May 2026 15:37:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 17:34:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e2df83809ee200d1134f9a7a54fe7fe79b49cf9
X-Git-Newrev: 28f9f29b5e4b79e9a7061066b3d22656bfd9bbc3
X-Patchwork-Hint: ignore
Message-Id: <20260530153725.EE3B787528@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ca-certificates: enable host
 package variant
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/28f9f29b5e4b79e9a7061066b3d22656bfd9bbc3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The host ca-certificates is needed to download the SPDX schema on
CycloneDX's GitHub when using Buildroot's host Python, see
urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH) in
utils/generate-cyclonedx.

Note that unlike the target package which uses a _TARGET_FINALIZE_HOOKS
since commit 2bc8e72bafed ("package/ca-certificates: create the bundle
as target-finalize hook"), the host package doesn't have this option as
there's no such hook for host packages. Therefore, the target's
CA_CERTIFICATES_INSTALL_TARGET_CMDS and CA_CERTIFICATES_GEN_BUNDLE are
merged and adapted into HOST_CA_CERTIFICATES_INSTALL_CMDS.
This of course has the same shortcomings as the target package had
before commit 2bc8e72bafed ("package/ca-certificates: create the bundle
as target-finalize hook").
The adaptations were:
- replaced $(TARGET_MAKE_ENV) with $(HOST_MAKE_ENV)
- replaced $(TARGET_DIR) to $(HOST_DIR)
- replaced $(HOST_DIR)/usr with $(HOST_DIR)
- replaced find usr/share/ca-certificates with find share/ca-certificates
  (since it's done from within $(HOST_DIR)

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/Config.in.host                     |  1 +
 package/ca-certificates/Config.in.host     | 12 ++++++++++++
 package/ca-certificates/ca-certificates.mk | 30 ++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index bb6732a639..df57cc0c17 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -14,6 +14,7 @@ menu "Host utilities"
 	source "package/bmap-writer/Config.in.host"
 	source "package/bootgen/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
+	source "package/ca-certificates/Config.in.host"
 	source "package/casync-nano/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
diff --git a/package/ca-certificates/Config.in.host b/package/ca-certificates/Config.in.host
new file mode 100644
index 0000000000..950f5854dc
--- /dev/null
+++ b/package/ca-certificates/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_CA_CERTIFICATES
+	bool "Host CA Certificates"
+	help
+	  This package includes PEM files of CA certificates to allow
+	  SSL-based applications to check for the authenticity of SSL
+	  connections on the host.
+
+	  It includes, among others, certificate authorities used by the
+	  Debian infrastructure and those shipped with Mozilla's
+	  browsers.
+
+	  https://salsa.debian.org/debian/ca-certificates
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 1f3f192d4a..f5675b754d 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -8,6 +8,7 @@ CA_CERTIFICATES_VERSION = 20260223
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
 CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20260223T202245Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
+HOST_CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
 CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
 
@@ -43,4 +44,33 @@ define CA_CERTIFICATES_GEN_BUNDLE
 endef
 CA_CERTIFICATES_TARGET_FINALIZE_HOOKS += CA_CERTIFICATES_GEN_BUNDLE
 
+define HOST_CA_CERTIFICATES_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) clean all
+endef
+
+define HOST_CA_CERTIFICATES_INSTALL_CMDS
+	$(INSTALL) -d -m 0755 $(HOST_DIR)/share/ca-certificates
+	$(INSTALL) -d -m 0755 $(HOST_DIR)/etc/ssl/certs
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(HOST_DIR)
+	rm -f $(HOST_DIR)/sbin/update-ca-certificates
+	# Remove any existing certificates under /etc/ssl/certs
+	rm -f $(HOST_DIR)/etc/ssl/certs/*
+
+	# Create symlinks to certificates under /etc/ssl/certs
+	# and generate the bundle
+	cd $(HOST_DIR) ;\
+	for i in `find share/ca-certificates -name "*.crt" | LC_COLLATE=C sort` ; do \
+		ln -sf ../../../$$i etc/ssl/certs/`basename $${i} .crt`.pem ;\
+		cat $$i ;\
+	done >$(BUILD_DIR)/ca-certificates.crt
+
+	# Create symlinks to the certificates by their hash values
+	$(HOST_DIR)/bin/c_rehash $(HOST_DIR)/etc/ssl/certs
+
+	# Install the certificates bundle
+	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
+		$(HOST_DIR)/etc/ssl/certs/ca-certificates.crt
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
