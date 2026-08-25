Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5D7C61DBD
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 20:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED03780CA8;
	Tue, 25 Aug 2026 20:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3BLXzFwVPPm; Tue, 25 Aug 2026 20:47:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787690865;
	bh=Yvob9CscE0gTneEQteq2H1xwWZjwU9tM9vo5GVjPyRQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PeuROq3lnUwOVieRMR5IUswACksI/LVFKi8sIYq5XwVpMC2Pk79oAwny4mKw87RAs
	 tJTkcm4AL7nlplOHhU2Efj2Paz3Otqi0MjNhoRCEKVkq7hEPf6colmev4cAYBuj+9n
	 0mK0l8nKSP37ef842qUS9CAertjjrvvlOkC9xhxNHIq+lU+aJiiAxu7tILmrcd1fmQ
	 ji8oYRVAh+3/ayXdDIvSxhsyhNlDSXnjD/3Ivyso40KjWHWxaa9P73a/ch2xuoH3Po
	 BSDPYelR9GNydFBN/n2s3lYLHmsOXitDU+M03pUGrMWOFxEV2tBkNepoTgfAgsnmfI
	 I951cv9SgkHxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F41C80CCE;
	Tue, 25 Aug 2026 20:47:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 845172FD
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 761EA60603
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6KwlIaku53N for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 20:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C579D605F4
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:47:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18BDF91D88; Tue, 25 Aug 2026 20:46:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 22:44:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a8dd506faabc65d3cd678141f4303a8d88968894
X-Git-Newrev: 009d34015b44075e15c632a514511bdd27074aea
X-Patchwork-Hint: ignore
Message-Id: <20260825204647.18BDF91D88@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libpsl: bump to
 version 0.23.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/009d34015b44075e15c632a514511bdd27074aea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

The most relevant change is included in 0.23.0, which fixed handling
of trailing dots (so e.g. "co.uk" and "co.uk." are treated as the same
suffix). Otherwise, it's mostly cleanups and support for non-Linux
platforms:

  https://github.com/rockdaboot/libpsl/releases/tag/0.22.0
  https://github.com/rockdaboot/libpsl/releases/tag/0.23.0
  https://github.com/rockdaboot/libpsl/releases/tag/0.23.2
  https://github.com/rockdaboot/libpsl/releases/tag/0.23.3

The COPYING license file was changed to a symlink to LICENSE.
The changed hash for the license file does not imply a license change:
it is unchanged, but the copyright year was removed in favor of a note
telling to check the Git history. See:
https://github.com/rockdaboot/libpsl/commit/da5479661839e25783ee482e0180efc3d28f2428

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[Julien:
 - rename COPYING license file to LICENSE
 - add extra info in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libpsl/libpsl.hash | 4 ++--
 package/libpsl/libpsl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpsl/libpsl.hash b/package/libpsl/libpsl.hash
index caf760c496..5446aa891e 100644
--- a/package/libpsl/libpsl.hash
+++ b/package/libpsl/libpsl.hash
@@ -1,6 +1,6 @@
 # Locally generated
-sha256  1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208  libpsl-0.21.5.tar.gz
+sha256  93941f85a1e7bd593fa94f299233cb5dfc91cd144fd9a78a6ceb75001c5b03be  libpsl-0.23.3.tar.gz
 
 # Hashes for license files:
-sha256  322392e6001b2b3b0fca705dc9f11f26e12441188ecde50eb1d22909980b2925  COPYING
+sha256  e7c9f0d8498d28a360a7e8293ea70fd7bd952955b636938322c13d60a03b5a45  LICENSE
 sha256  1d7f52747a9169751cdf2641a8299c0098e9ecdf9429296ffd55bdb14c9ed5b3  src/LICENSE.chromium
diff --git a/package/libpsl/libpsl.mk b/package/libpsl/libpsl.mk
index d1a12f864c..95b7d38e6b 100644
--- a/package/libpsl/libpsl.mk
+++ b/package/libpsl/libpsl.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBPSL_VERSION = 0.21.5
+LIBPSL_VERSION = 0.23.3
 LIBPSL_SITE = https://github.com/rockdaboot/libpsl/releases/download/$(LIBPSL_VERSION)
 LIBPSL_LICENSE = MIT, BSD-3-Clause
-LIBPSL_LICENSE_FILES = COPYING src/LICENSE.chromium
+LIBPSL_LICENSE_FILES = LICENSE src/LICENSE.chromium
 LIBPSL_CONF_OPTS = -Dbuiltin=true
 LIBPSL_DEPENDENCIES = host-pkgconf
 LIBPSL_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
