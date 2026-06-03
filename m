Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A90CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C679B40EB3;
	Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdN0D5XcR40E; Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8BC540E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663049;
	bh=cv1V+orltgYFYZEzHaZENki6CdahhAkuaR46mhVi2e4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=srdQry2bWQ913qZAy1YzAvO7Pxx85fnwXdTZlTzL2FJ5x+YXw38/zs2rbzNybz5co
	 sIkH2gwRMIo0rGw/gkZujeuZz9Wkw3Q9POUSzq/7ZrZnX2jvCCgnf/4/u5HPCBReFF
	 O6gNCPhQgaKegwr9I2uySQdYP0neLpP630PkR047dQM+sr9TwHJnnlfXIdGyNq+mPG
	 6tGoGdlHq61HB0zVEV1D0p/3EaDThx5A1C5fNR8kCHOVryz/4RQiorDYAlLEJiRFBX
	 WkGguXN2LAm7qiu6j4/Gm6vIJDLTY8AJIW6GRCCkvzkWOnp+aEj06LpIQOsOzd1QKO
	 GX4cqGJDs9TeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8BC540E66;
	Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69D483B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BF4C403A5
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADRBIYg6sr9k for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24B8440334
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24B8440334
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CE3887B41; Fri,  5 Jun 2026 12:37:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 14:01:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e3def894fc941da0039cd654869eeba21b69b6a4
X-Git-Newrev: 2c8bcb90fe22d2d00a4cccd9bc0c74f5ee0eb99b
X-Patchwork-Hint: ignore
Message-Id: <20260605123710.4CE3887B41@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/samba4: security
 bump version to 4.22.10
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2c8bcb90fe22d2d00a4cccd9bc0c74f5ee0eb99b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
- https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.22
- https://www.samba.org/samba/history/samba-4.22.10.html
- https://www.samba.org/samba/history/samba-4.22.9.html
- https://www.samba.org/samba/history/samba-4.22.8.html
- https://www.samba.org/samba/history/samba-4.22.7.html
- https://www.samba.org/samba/history/samba-4.22.6.html
- https://www.samba.org/samba/history/samba-4.22.5.html
- https://www.samba.org/samba/history/samba-4.22.4.html
- https://www.samba.org/samba/history/samba-4.22.3.html
- https://www.samba.org/samba/history/samba-4.22.2.html
- https://www.samba.org/samba/history/samba-4.22.1.html
- https://www.samba.org/samba/history/samba-4.22.0.html

Samba 4.21 is EOL [1] and thus moving to 4.22.
Cherry picked [2] and bumped to latest release for this version.

Fixes the following vulnerabilities:

- CVE-2026-1933 (Missing access checks on reparse point operations.)
- CVE-2026-2340 (WORM vfs module does not block overwrites.)
- CVE-2026-3012 (auto-enrolment GPO installing CA certificate over http without verification.)
- CVE-2026-3238 (Denial of service against AD DC WINS server.)
- CVE-2026-4408 (Unauthenticated Remote Code Execution in Samba DCE/RPC SAMR server.)
- CVE-2026-4480 (Unauthenticated Remote Code Execution in Samba printing subsystem.)

[1] https://wiki.samba.org/index.php/Samba_Release_Planning
[2] 286d85d7c4 package/samba4: bump version to 4.22.2

(cherry picked from commit 46a4dcd0e1bfcb1be3c8ee5580476c3aa5dbd2e6)
Tested-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
index ae37e497cc..1875343d11 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.21.9.tar.asc
-sha256  9d60206efb450c08700a85504ec2b63257be7c6e1c393627da54e047b4e9ea75  samba-4.21.9.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.22.10.tar.asc
+sha256  e601437cde4845a42e7818379cd0ad5fc4fa518a7cf5284cc0a2657e79b30c34  samba-4.22.10.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index c2886d9ea7..e96e86b5f3 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.21.9
+SAMBA4_VERSION = 4.22.10
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
