Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A32AC61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 17:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E0D080EA0;
	Sun, 15 Jun 2025 17:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id doJIRxwiTWKO; Sun, 15 Jun 2025 17:36:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D323980E7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D323980E7A;
	Sun, 15 Jun 2025 17:36:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00FCE231
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 17:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA6914052F
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 17:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIVGlRba0G7s for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 17:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A18C6404BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A18C6404BD
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 17:36:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C2C583A20; Sun, 15 Jun 2025 17:36:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jun 2025 19:19:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cae9a45e55b47dc08eb17e0610340cbb30903cf5
X-Git-Newrev: 286d85d7c45e078ec8df3c1e48ee08cd6a472f1a
X-Patchwork-Hint: ignore
Message-Id: <20250615173603.9C2C583A20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.22.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=286d85d7c45e078ec8df3c1e48ee08cd6a472f1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.samba.org/samba/history/samba-4.22.2.html
https://www.samba.org/samba/history/samba-4.22.1.html
https://www.samba.org/samba/history/samba-4.22.0.html

Rebased patch 0001 due to upstream commit
https://github.com/samba-team/samba/commit/4dbbfcb00401d7a797154c812587bfe2dda0aea1

An import of the host-python ssl module was added to wscript with commit
https://github.com/samba-team/samba/commit/549f67a9e655149b1ede7e2858836cb7811cc78c
Select BR2_PACKAGE_HOST_PYTHON3_SSL to provide the new dependency.

Note: the 4.22.2 release note mention a security fix
for CVE-2025-0620. This commit is not marked as a security bump
because this CVE was addressed in a previous Buildroot commit
updating samba4 to version 4.21.6, which also contain this fix.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien:
 - add a note explaining why this commit is not a security bump
 - add "select BR2_PACKAGE_HOST_PYTHON3" in Config.in
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch | 8 ++++----
 package/samba4/Config.in                                          | 2 ++
 package/samba4/samba4.hash                                        | 4 ++--
 package/samba4/samba4.mk                                          | 2 +-
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch b/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
index eb0ea099b7..8d223e38a0 100644
--- a/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
+++ b/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
@@ -33,7 +33,7 @@ BUG: https://bugzilla.samba.org/show_bug.cgi?id=14164
 
 Signed-off-by: Uri Simchoni <uri@samba.org>
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[Bernd: rebased for version 4.11.13, 4.17.7 & 4.20.3]
+[Bernd: rebased for version 4.11.13, 4.17.7, 4.20.3 & 4.22.1]
 ---
  wscript_configure_embedded_heimdal | 11 +++++++++++
  wscript_configure_system_heimdal   | 11 -----------
@@ -43,10 +43,10 @@ diff --git a/wscript_configure_embedded_heimdal b/wscript_configure_embedded_hei
 index 8c55ae2..4fdae80 100644
 --- a/wscript_configure_embedded_heimdal
 +++ b/wscript_configure_embedded_heimdal
-@@ -13,3 +13,14 @@
- # when this will be available also in
- # system libraries...
+@@ -15,3 +15,14 @@
  conf.define('HAVE_CLIENT_GSS_C_CHANNEL_BOUND_FLAG', 1)
+ 
+ conf.define('HAVE_KRB5_INIT_CREDS_STEP', 1)
 +
 +def check_system_heimdal_binary(name):
 +    if conf.LIB_MAY_BE_BUNDLED(name):
diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 6aff82bb3d..e1d3dd9bf7 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -15,6 +15,8 @@ config BR2_PACKAGE_SAMBA4
 	select BR2_PACKAGE_CMOCKA
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 6c4205853e..e80ad7a87d 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.21.6.tar.asc
-sha256  681bad60f57959436350751bc89e893b8c106ac882cc7420f93f419e1d188688  samba-4.21.6.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.22.2.tar.asc
+sha256  d9ac8e224a200159e62c651cf42307dc162212ec25d04eb6800b9a7ccfbcc3c1  samba-4.22.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 7ba0aa3346..e94ff1d441 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.21.6
+SAMBA4_VERSION = 4.22.2
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
