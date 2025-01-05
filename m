Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79016C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2291F4F003;
	Fri, 28 Feb 2025 16:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ftkK5NKviVN; Fri, 28 Feb 2025 16:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB5514F17D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB5514F17D;
	Fri, 28 Feb 2025 16:51:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16E8E1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87F4F42F08
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxt-BOnFeWlo for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64D684297D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64D684297D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5891484C4E; Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Jan 2025 17:10:07 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 717f1fdaeb460c71f673a6ad6e82d16af878c188
X-Git-Newrev: 04a5fa5ff797de55d85db97d4dd58a73ed8c5a35
X-Patchwork-Hint: ignore
Message-Id: <20250228162958.5891484C4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/parsec: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=04a5fa5ff797de55d85db97d4dd58a73ed8c5a35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Hardware/platform abstraction service for TPMs, HSMs, and Root of Trust

https://github.com/parallaxsecond/parsec.git

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
[Julien: add upstream patch to fix build]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...0001-Fix-unnecessary-qualifications-error.patch | 48 ++++++++++++++++++++++
 package/parsec/Config.in                           | 15 +++++++
 package/parsec/parsec.hash                         |  3 ++
 package/parsec/parsec.mk                           | 12 ++++++
 6 files changed, 80 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index dd496db795..16b72eee08 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2907,6 +2907,7 @@ F:	package/biosdevname/
 N:	Saeed Kazemi <kazemi.ms@gmail.com>
 F:	package/eza/
 F:	package/fd/
+F:	package/parsec/
 F:	package/parsec-tool/
 F:	package/procs/
 F:	package/mxt-app/
diff --git a/package/Config.in b/package/Config.in
index 17f458eee8..400183516e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1624,6 +1624,7 @@ menu "Crypto"
 	source "package/nettle/Config.in"
 	source "package/oath-toolkit/Config.in"
 	source "package/openssl/Config.in"
+	source "package/parsec/Config.in"
 	source "package/parsec-tool/Config.in"
 	source "package/pkcs11-helper/Config.in"
 	source "package/rhash/Config.in"
diff --git a/package/parsec/0001-Fix-unnecessary-qualifications-error.patch b/package/parsec/0001-Fix-unnecessary-qualifications-error.patch
new file mode 100644
index 0000000000..597c9c9f2c
--- /dev/null
+++ b/package/parsec/0001-Fix-unnecessary-qualifications-error.patch
@@ -0,0 +1,48 @@
+From b76bebf839169fc831712b8a80db1e6ff7535dfd Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Thu, 29 Aug 2024 17:10:06 +0100
+Subject: [PATCH] Fix unnecessary qualifications error
+
+Upstream: https://github.com/parallaxsecond/parsec/commit/86d4d2ca2f1e873a29f9f4d4bba99fedee19a144
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ src/front/domain_socket.rs | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/src/front/domain_socket.rs b/src/front/domain_socket.rs
+index 9fb8a0c..a0effa5 100644
+--- a/src/front/domain_socket.rs
++++ b/src/front/domain_socket.rs
+@@ -239,15 +239,16 @@ pub mod peer_credentials {
+     pub mod impl_linux {
+         use super::UCred;
+         use libc::{c_void, getsockopt, socklen_t, ucred, SOL_SOCKET, SO_PEERCRED};
++        use std::io;
++        use std::mem::size_of;
+         use std::os::unix::io::AsRawFd;
+         use std::os::unix::net::UnixStream;
+-        use std::{io, mem};
+ 
+         pub fn peer_cred(socket: &UnixStream) -> io::Result<UCred> {
+-            let ucred_size = mem::size_of::<ucred>();
++            let ucred_size = size_of::<ucred>();
+ 
+             // Trivial sanity checks.
+-            assert!(mem::size_of::<u32>() <= mem::size_of::<usize>());
++            assert!(size_of::<u32>() <= size_of::<usize>());
+             assert!(ucred_size <= u32::MAX as usize);
+ 
+             let mut ucred_size = ucred_size as socklen_t;
+@@ -266,7 +267,7 @@ pub mod peer_credentials {
+                     &mut ucred_size,
+                 );
+ 
+-                if ret == 0 && ucred_size as usize == mem::size_of::<ucred>() {
++                if ret == 0 && ucred_size as usize == size_of::<ucred>() {
+                     Ok(UCred {
+                         uid: ucred.uid,
+                         gid: ucred.gid,
+-- 
+2.47.1
+
diff --git a/package/parsec/Config.in b/package/parsec/Config.in
new file mode 100644
index 0000000000..378e8b58b4
--- /dev/null
+++ b/package/parsec/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PARSEC
+	bool "parsec"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  Hardware/platform abstraction service for TPMs, HSMs, and
+	  Root of Trust
+	  PARSEC is the Platform AbstRaction for SECurity, an
+	  open-source initiative to provide a common API to hardware
+	  security and cryptographic services in a platform-agnostic
+	  way. This abstraction layer keeps workloads decoupled from
+	  physical platform details, enabling cloud-native delivery
+	  flows within the data center and at the edge.
+
+	  https://github.com/parallaxsecond/parsec.git
diff --git a/package/parsec/parsec.hash b/package/parsec/parsec.hash
new file mode 100644
index 0000000000..e1d7b4fbc9
--- /dev/null
+++ b/package/parsec/parsec.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  0b69c30c7e40c65e3c74450e0baf1e3f821ffa624a6dc7aa49f5aa976c42fda0  parsec-1.4.1-cargo2.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/parsec/parsec.mk b/package/parsec/parsec.mk
new file mode 100644
index 0000000000..eec9f4d7a3
--- /dev/null
+++ b/package/parsec/parsec.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# parsec
+#
+################################################################################
+
+PARSEC_VERSION = 1.4.1
+PARSEC_SITE = $(call github,parallaxsecond,parsec,$(PARSEC_VERSION))
+PARSEC_LICENSE = Apache-2.0
+PARSEC_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
