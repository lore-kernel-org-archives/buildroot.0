Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9FED4978C
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 21:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 523A085068;
	Sun,  1 Dec 2024 21:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ttbrihPXkPNq; Sun,  1 Dec 2024 21:03:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DC9F8506B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DC9F8506B;
	Sun,  1 Dec 2024 21:03:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3D35976
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 21:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D553B60845
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 21:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rc1reBPEtZdK for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 21:03:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C17786068F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C17786068F
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 21:03:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B531F86180; Sun,  1 Dec 2024 21:03:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Dec 2024 20:20:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 139be85362f0047d0c06a033b83201f4fe54bbb5
X-Git-Newrev: bd94801092f6cdce71f78423abb602b0b72f6bec
X-Patchwork-Hint: ignore
Message-Id: <20241201210345.B531F86180@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libpam-radius-auth:
 bump to version 3.0.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bd94801092f6cdce71f78423abb602b0b72f6bec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log, see [1].

Buildroot commit [2] changed _SITE from using the ftp site to a
github download. This github generated archive has a different hash
compare to release files, due to a different directory name in the
archive. This does not allow to check the published PGP signatures.
This new 3.0.0 version is published as a github release asset. This
commit updates _SITE and _SOURCE to use those release files. The
archive is switched to bz2 archive which is smaller. Finally, this
commit adds a comment in the hash file, with the signature link and
the pgp key used for the signature.

[1] https://github.com/FreeRADIUS/pam_radius/blob/release_3_0_0/Changelog
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/860b1b958797bd16bfe7666bb308a5ea026b1b46

Signed-off-by: Vincent Jardin <vjardin@free.fr>
[Julien: change to use the release archive so the PGP
  signature can be checked]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libpam-radius-auth/libpam-radius-auth.hash | 6 ++++--
 package/libpam-radius-auth/libpam-radius-auth.mk   | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/libpam-radius-auth/libpam-radius-auth.hash b/package/libpam-radius-auth/libpam-radius-auth.hash
index 63f3f1e45e..383576f568 100644
--- a/package/libpam-radius-auth/libpam-radius-auth.hash
+++ b/package/libpam-radius-auth/libpam-radius-auth.hash
@@ -1,5 +1,7 @@
-# Locally calculated after checking PGP signature
-sha256  798dc358e7a143163e103bd38c4101645b2e93d82aa0ec63d32c0cb929d9c65c  libpam-radius-auth-2.0.0.tar.gz
+# Locally calculated after checking PGP signature from
+# https://github.com/FreeRADIUS/pam_radius/releases/download/release_3_0_0/pam_radius-3.0.0.tar.bz2.sig
+# with key: BF2384EC6938B9744B03E2A620E37C25995B4F85
+sha256  fa622eef903fdcc8b3f64bd1d6437ccc1f160758ce65f947ceba951770071143  pam_radius-3.0.0.tar.bz2
 
 # Hash for license file:
 sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  LICENSE
diff --git a/package/libpam-radius-auth/libpam-radius-auth.mk b/package/libpam-radius-auth/libpam-radius-auth.mk
index 9519aad750..772456ceae 100644
--- a/package/libpam-radius-auth/libpam-radius-auth.mk
+++ b/package/libpam-radius-auth/libpam-radius-auth.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBPAM_RADIUS_AUTH_VERSION = 2.0.0
-LIBPAM_RADIUS_AUTH_SITE = $(call github,FreeRADIUS,pam_radius,release_$(subst .,_,$(LIBPAM_RADIUS_AUTH_VERSION)))
+LIBPAM_RADIUS_AUTH_VERSION = 3.0.0
+LIBPAM_RADIUS_AUTH_SITE = https://github.com/FreeRADIUS/pam_radius/releases/download/release_$(subst .,_,$(LIBPAM_RADIUS_AUTH_VERSION))
+LIBPAM_RADIUS_AUTH_SOURCE = pam_radius-$(LIBPAM_RADIUS_AUTH_VERSION).tar.bz2
 LIBPAM_RADIUS_AUTH_DEPENDENCIES = linux-pam
 LIBPAM_RADIUS_AUTH_INSTALL_STAGING = YES
 LIBPAM_RADIUS_AUTH_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
