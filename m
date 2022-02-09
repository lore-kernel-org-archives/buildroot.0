Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D841DC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 16:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 548744090B;
	Wed,  9 Feb 2022 16:09:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_QSKhU4MV4v; Wed,  9 Feb 2022 16:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80172415B4;
	Wed,  9 Feb 2022 16:09:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C79A71BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B485660B05
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:08:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y0iSd9rQD8wc for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:08:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C82BC60A6F
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:08:56 +0000 (UTC)
Received: from opfednr03.francetelecom.fr (unknown [xx.xx.xx.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr27.francetelecom.fr (ESMTP service) with ESMTPS id 4Jv4Yy32Xyz4wps; 
 Wed,  9 Feb 2022 17:08:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1644422934;
 bh=CR7D12wvvAfRevskK/4yRl36vZKTAVVGe+1pnnmgUII=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=tVmAASdzv3GHmO+pP902cYmKFZXqP6tY0FkyKyd9itZqOrBPjDbMJ/oSww9qS7sAd
 fKX6L2UdPuJgR1gBX9Am9n1FgiQ3SdIeo+SshrTVpdlxpU/A/Xk0O5EWWEWJ4ZeGey
 zzcdZpoDvXMbvECOGtBH6fzuUnBhBLWIUJexXRmqrYc4g459TPIBRp3iq6/xN+8JP0
 RlhYIIQpLVCj2ix3QzIHqKRVAejrlwLf9TzBYDM19htoiYTzzl3xnE0sz4sI4hDw4k
 oCdebmtTHZFi0kvwz+xv+hS5CCxrzALQifI8PVUfdaqz5Z/Ku/1carj28fmeHK5JOJ
 jFW13hCeYZRfg==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Wed, 09 Feb 2022 17:08:50 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Wed, 9 Feb 2022 17:08:44 +0100
Message-ID: <20175_1644422934_6203E716_20175_175_1_fea7d1545892211e01cb6660dc5fba16b0851c47.1644422916.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644422916.git.yann.morin@orange.com>
References: <cover.1644422916.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX306.corporate.adroot.infra.ftgroup
 (10.115.27.11) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH 2/5 v2] package/pkg-cargo: allow building in a
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
when vendoring the package, unless the package took extra precautions
to specify an alternate location.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Changes v1 -> v2:
  - fix conditional (inverted logic)
  - fix syntax in conditional (missing comma)
---
 package/pkg-cargo.mk | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 66bea513e0..e1d81197b5 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -71,6 +71,14 @@ $(2)_DOWNLOAD_DEPENDENCIES += host-rustc
 $(2)_DOWNLOAD_POST_PROCESS = cargo
 $(2)_DL_ENV += CARGO_HOME=$$(HOST_DIR)/share/cargo
 
+# If building in a sub directory, use that to find the Cargo.toml, unless
+# the package already provided its location.
+ifneq ($$($(2)_SUBDIR),)
+ifeq ($$(filter BR_CARGO_MANIFEST_PATH=%,$$($(2)_DL_ENV)),)
+$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_SUBDIR)/Cargo.toml
+endif
+endif
+
 # Due to vendoring, it is pretty likely that not all licenses are
 # listed in <pkg>_LICENSE.
 $(2)_LICENSE += , vendored dependencies licenses probably not listed
@@ -97,7 +105,7 @@ $(2)_LICENSE += , vendored dependencies licenses probably not listed
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_MAKE_ENV) \
 		$$(TARGET_CONFIGURE_OPTS) \
 		$$(PKG_CARGO_ENV) \
@@ -111,7 +119,7 @@ define $(2)_BUILD_CMDS
 endef
 else # ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(HOST_MAKE_ENV) \
 		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
 		$$(HOST_CONFIGURE_OPTS) \
@@ -133,7 +141,7 @@ endif # ifndef $(2)_BUILD_CMDS
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_MAKE_ENV) \
 		$$(TARGET_CONFIGURE_OPTS) \
 		$$(PKG_CARGO_ENV) \
@@ -152,7 +160,7 @@ endif
 
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
