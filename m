Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C4ACCFA18
	for <buildroot@archiver.kernel.org>; Sat,  8 Nov 2025 10:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15DD760774;
	Sat,  8 Nov 2025 10:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qV-eZlQIkWnu; Sat,  8 Nov 2025 10:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36A236076B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36A236076B;
	Sat,  8 Nov 2025 10:29:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68D311CD
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 664AB407F8
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eg8XA_bBoEIK for <buildroot@buildroot.org>;
 Sat,  8 Nov 2025 10:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77A69407F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77A69407F6
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:29:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71D5683F50; Sat,  8 Nov 2025 10:29:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Nov 2025 11:26:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62185b79350ae825849853fcb4baf0923ff89fdd
X-Git-Newrev: 582ee9c2fdcc864a86e8726c0594b27791e52b6a
X-Patchwork-Hint: ignore
Message-Id: <20251108102917.71D5683F50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnvme: bump version to 1.16.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=582ee9c2fdcc864a86e8726c0594b27791e52b6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/linux-nvme/libnvme/releases/tag/v1.16.1

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...reaking-cross-builds-with-OpenSSL-enabled.patch | 31 ----------------------
 package/libnvme/libnvme.hash                       |  2 +-
 package/libnvme/libnvme.mk                         |  2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/package/libnvme/0001-build-avoid-breaking-cross-builds-with-OpenSSL-enabled.patch b/package/libnvme/0001-build-avoid-breaking-cross-builds-with-OpenSSL-enabled.patch
deleted file mode 100644
index 7cf91fd98e..0000000000
--- a/package/libnvme/0001-build-avoid-breaking-cross-builds-with-OpenSSL-enabled.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 82066e5f46d743e7a7cf396be7f95e577084b93e Mon Sep 17 00:00:00 2001
-From: Daniel Wagner <wagi@kernel.org>
-Date: Thu, 6 Nov 2025 08:10:27 +0100
-Subject: [PATCH] build: avoid breaking cross builds with OpenSSL enabled
-
-The OpenSSL sanity check wants to be executed, thus we should only try
-this if it's possible. Since this is just a warning, we can just skip it
-if it is not possible.
-
-Signed-off-by: Daniel Wagner <wagi@kernel.org>
-
-Upstream: https://github.com/linux-nvme/libnvme/pull/1090
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index dce5c68e..6d1f5204 100644
---- a/meson.build
-+++ b/meson.build
-@@ -252,7 +252,7 @@ else
-   conf.set('fallthrough', 'do {} while (0) /* fallthrough */')
- endif
- 
--if openssl_dep.found()
-+if openssl_dep.found() and meson.can_run_host_binaries()
-   if openssl_dep.type_name() != 'internal'
-     # Check for a bug in the EVP_PKEY_CTX_add1_hkdf_info implementation
-     res = cc.run(
diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index 66dedbbe8f..29071da1bf 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  5bb24139a113f350708fe54073e799f454d509218758060c398144b91811d176  libnvme-1.16.tar.gz
+sha256  ce1d9d393feb84c4e82ca096db2bdb7dd4a5fd1997d711cc1904796944f2c579  libnvme-1.16.1.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index 238b7041da..f9bc0be371 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.16
+LIBNVME_VERSION = 1.16.1
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
