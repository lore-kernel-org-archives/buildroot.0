Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFBBD0EE1C
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 20:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DCE741094;
	Tue, 25 Nov 2025 20:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeBogDTxgL1n; Tue, 25 Nov 2025 20:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2654D41097
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2654D41097;
	Tue, 25 Nov 2025 20:48:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 147B823F
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F25E6400B7
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dw75RsvKX76F for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 20:48:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4100E4003D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4100E4003D
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:48:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B62D85ED0; Tue, 25 Nov 2025 20:48:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Nov 2025 21:47:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59479ae646767f22914335301dcec6fbeb313755
X-Git-Newrev: 559bb4dd7b9533344e7aca8cb6c8311c87d36d5c
X-Patchwork-Hint: ignore
Message-Id: <20251125204827.1B62D85ED0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{neard, sdbusplus,
 thermald}: typo fixes
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

commit: https://git.buildroot.net/buildroot/commit/?id=559bb4dd7b9533344e7aca8cb6c8311c87d36d5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/neard/neard.mk         | 2 +-
 package/sdbusplus/sdbusplus.mk | 2 +-
 package/thermald/thermald.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index c1804c48a2..e79ed278b4 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -16,7 +16,7 @@ NEARD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
 NEARD_CONF_OPTS = --disable-traces
 
 # Autoreconf is missing the m4/ directory, which might actually be missing
-# iff it was the first argument, but unfortunately we are overriding the
+# if it was the first argument, but unfortunately we are overriding the
 # first include directory above. Thus we need that hook here.
 define NEARD_CREATE_M4
 	mkdir -p $(@D)/m4
diff --git a/package/sdbusplus/sdbusplus.mk b/package/sdbusplus/sdbusplus.mk
index 498b835052..207243b14d 100644
--- a/package/sdbusplus/sdbusplus.mk
+++ b/package/sdbusplus/sdbusplus.mk
@@ -23,7 +23,7 @@ SDBUSPLUS_LICENSE = Apache-2.0
 SDBUSPLUS_LICENSE_FILES = LICENSE
 
 # Autoreconf is missing the m4/ directory, which might actually be missing
-# iff it was the first argument, but unfortunately we are overriding the
+# if it was the first argument, but unfortunately we are overriding the
 # first include directory above. Thus we need that hook here.
 define SDBUSPLUS_CREATE_M4
 	mkdir -p $(@D)/m4
diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
index 9faa47683b..4e3d897bf3 100644
--- a/package/thermald/thermald.mk
+++ b/package/thermald/thermald.mk
@@ -32,7 +32,7 @@ endef
 THERMALD_PRE_CONFIGURE_HOOKS += THERMALD_GTK_DOC_HOOK
 
 # Autoreconf is missing the m4/ directory, which might actually be missing
-# iff it was the first argument, but unfortunately we are overriding the
+# if it was the first argument, but unfortunately we are overriding the
 # first include directory above. Thus we need that hook here.
 define THERMALD_CREATE_M4
 	mkdir -p $(@D)/m4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
