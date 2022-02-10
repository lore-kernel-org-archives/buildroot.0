Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4736C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 15:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BA7F403CA;
	Thu, 10 Feb 2022 15:29:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQqmPEwD6eSU; Thu, 10 Feb 2022 15:29:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99D57402DC;
	Thu, 10 Feb 2022 15:29:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C29291BF3DB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B001A60BA8
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mMToB2iaeQfK for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 15:29:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C569060B79
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 15:29:33 +0000 (UTC)
Received: from opfednr01.francetelecom.fr (unknown [xx.xx.xx.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr27.francetelecom.fr (ESMTP service) with ESMTPS id 4Jvgf405Czz4wkL; 
 Thu, 10 Feb 2022 16:29:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1644506972;
 bh=cHyDtrODRt/xSrHcUq69NZSPyvPdTgBtWVTCtYbNkCY=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=GlNKHQnkWsZOhCeq31DB0PEzR4qmRh6BQ0Sq1fh8aQBfuozrwRjNQmnirfbLc+f3+
 OsKJWIti511rT5wVniK5GJN5pO/WZXhQxtFgB30JeSlzcZ0gB0YiAUmEASb6gJauuU
 kxPXaJiydtDQ0tUj2cZM9NMKUecmmBsqLF8R7QcFNAk7M/rBy0/mjGVzsSY2/JtBmu
 33GHpXqp4fg1EDhqjkNqdxwcUihZoK6Uh34z4HMgEOmvBJm/urwAog2Ucr31RQJkF1
 lzezob5LHktI5a88XEJiYdonwimkyRHdOk3LtvbA4VIQJPF9fiG7Q1s+4py3QoiNYf
 zPdKhXddbUYWQ==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Thu, 10 Feb 2022 16:29:30 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 10 Feb 2022 16:29:25 +0100
Message-ID: <11477_1644506971_62052F5B_11477_140_26_81fca21f2b24da16bb9e6d3af5add173f382f242.1644506959.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644506959.git.yann.morin@orange.com>
References: <cover.1644506959.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX403.corporate.adroot.infra.ftgroup
 (10.115.26.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH 2/5 v3] package/pkg-cargo: allow building in a
 sub-directory
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Some packages have their rust sources as a sub-directory, rather
than at the root of the source tree.

Do like we do for autotools-package, and use the package's _SRCDIR
rather than the top-level directory $(@D).

Additionally, in such a situation, it is more than probable that
the Cargo.toml is also present in that sub-directory, so use that
when vendoring the package.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Changes v2 -> v3:
  - always consider Cargo.toml to be in _SUBDIR  (Thomas)
  - add _SUBDIR to the manual  (Thomas)

Changes v1 -> v2:
  - fix conditional (inverted logic)
  - fix syntax in conditional (missing comma)
---
 docs/manual/adding-packages-cargo.txt |  5 +++++
 package/pkg-cargo.mk                  | 13 +++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index 5343fbd4e6..e18fd9ce23 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -73,6 +73,11 @@ A few additional variables, specific to the Cargo infrastructure, can
 also be defined. Many of them are only useful in very specific cases,
 typical packages will therefore only use a few of them.
 
+* +FOO_SUBDIR+ may contain the name of a subdirectory inside the package
+  that contains the Cargo.toml file. This is useful, if for example, it
+  is not at the root of the tree extracted by the tarball. If
+  +HOST_FOO_SUBDIR+ is not specified, it defaults to +FOO_SUBDIR+.
+
 * +FOO_CARGO_ENV+ can be used to pass additional variables in the
   environment of +cargo+ invocations. It used at both build and
   installation time
diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 66bea513e0..8b246abfed 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -71,6 +71,11 @@ $(2)_DOWNLOAD_DEPENDENCIES += host-rustc
 $(2)_DOWNLOAD_POST_PROCESS = cargo
 $(2)_DL_ENV += CARGO_HOME=$$(HOST_DIR)/share/cargo
 
+# If building in a sub directory, use that to find the Cargo.toml
+ifneq ($$($(2)_SUBDIR),)
+$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_SUBDIR)/Cargo.toml
+endif
+
 # Due to vendoring, it is pretty likely that not all licenses are
 # listed in <pkg>_LICENSE.
 $(2)_LICENSE += , vendored dependencies licenses probably not listed
@@ -97,7 +102,7 @@ $(2)_LICENSE += , vendored dependencies licenses probably not listed
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_MAKE_ENV) \
 		$$(TARGET_CONFIGURE_OPTS) \
 		$$(PKG_CARGO_ENV) \
@@ -111,7 +116,7 @@ define $(2)_BUILD_CMDS
 endef
 else # ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(HOST_MAKE_ENV) \
 		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
 		$$(HOST_CONFIGURE_OPTS) \
@@ -133,7 +138,7 @@ endif # ifndef $(2)_BUILD_CMDS
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_MAKE_ENV) \
 		$$(TARGET_CONFIGURE_OPTS) \
 		$$(PKG_CARGO_ENV) \
@@ -152,7 +157,7 @@ endif
 
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(HOST_MAKE_ENV) \
 		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
 		$$(HOST_CONFIGURE_OPTS) \
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
