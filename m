Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D541CAC5B8
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 21:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA01F41930;
	Mon,  6 Oct 2025 21:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1TTgYE39kZ8; Mon,  6 Oct 2025 21:04:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3F9441949
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3F9441949;
	Mon,  6 Oct 2025 21:04:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37BE1272
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 21:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2949E41949
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 21:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYeroX8hY5LJ for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 21:04:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F02B41930
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F02B41930
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 21:04:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 598A3869C4; Mon,  6 Oct 2025 21:04:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Oct 2025 22:59:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1c77090efa4c712d1332c1786f27faf1f4d1708
X-Git-Newrev: fa6edbb3e2006272cdbf8606978587113eb84151
X-Patchwork-Hint: ignore
Message-Id: <20251006210426.598A3869C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdecor: bump version to 0.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa6edbb3e2006272cdbf8606978587113eb84151
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added optional support for gtk3 which was added upstream:
https://gitlab.freedesktop.org/libdecor/libdecor/-/commit/e87dcfdaf83f332fa83b43c804fcf93c151ff0f5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libdecor/libdecor.hash | 2 +-
 package/libdecor/libdecor.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/libdecor/libdecor.hash b/package/libdecor/libdecor.hash
index 9e51e90593..7572663466 100644
--- a/package/libdecor/libdecor.hash
+++ b/package/libdecor/libdecor.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  82adece5baeb6194292b0d1a91b4b3d10da41115f352a5e6c5844b20b88a0512  libdecor-0.1.1.tar.gz
+sha256  21a471e3f48088d3fd8ecc5999c45258a32198782c0157482f7ebe82de42f79c  libdecor-0.2.3.tar.gz
 sha256  508a77d2e7b51d98adeed32648ad124b7b30241a8e70b2e72c99f92d8e5874d1  LICENSE
diff --git a/package/libdecor/libdecor.mk b/package/libdecor/libdecor.mk
index b965726292..d064c9e9ef 100644
--- a/package/libdecor/libdecor.mk
+++ b/package/libdecor/libdecor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDECOR_VERSION = 0.1.1
+LIBDECOR_VERSION = 0.2.3
 LIBDECOR_SITE = https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/$(LIBDECOR_VERSION)
 LIBDECOR_LICENSE = MIT
 LIBDECOR_LICENSE_FILES = LICENSE
@@ -19,4 +19,11 @@ else
 LIBDECOR_CONF_OPTS += -Ddbus=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+LIBDECOR_CONF_OPTS += -Dgtk=enabled
+LIBDECOR_DEPENDENCIES += libgtk3
+else
+LIBDECOR_CONF_OPTS += -Dgtk=disabled
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
