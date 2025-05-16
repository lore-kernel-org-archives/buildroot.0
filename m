Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E12C54754
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C307E83A38;
	Fri, 16 May 2025 14:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zESSVh20ss1a; Fri, 16 May 2025 14:13:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD95983A51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD95983A51;
	Fri, 16 May 2025 14:13:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 303E1185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1260B61237
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id In5YYVR-aAOJ for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:13:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 257466089B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 257466089B
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:13:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FE1386ABA; Fri, 16 May 2025 14:13:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 15:45:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22cd2e0bc4545d46d92936e5bb5c98f1e22d58f8
X-Git-Newrev: 9868ca6ec98afa28a94aea50cc940db7df860396
X-Patchwork-Hint: ignore
Message-Id: <20250516141350.1FE1386ABA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: bump version to 3.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9868ca6ec98afa28a94aea50cc940db7df860396
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/openssl/openssl/releases/tag/openssl-3.5.0

Changelog:
https://github.com/openssl/openssl/blob/master/CHANGES.md#openssl-35

Rebased patches for the new version.

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 4 ++--
 package/libopenssl/0003-Revert-Fix-static-builds.patch              | 6 +++---
 package/libopenssl/libopenssl.hash                                  | 4 ++--
 package/libopenssl/libopenssl.mk                                    | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
index 629d9c26ce..2634d69f35 100644
--- a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
+++ b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
@@ -18,10 +18,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  1 file changed, 4 insertions(+)
 
 diff --git a/Configure b/Configure
-index 5a699836f3..f9152b1702 100755
+index 15054f9..ac3206e 100755
 --- a/Configure
 +++ b/Configure
-@@ -1549,6 +1549,10 @@ unless ($disabled{asm}) {
+@@ -1685,6 +1685,10 @@ unless ($disabled{asm}) {
      }
  }
  
diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0003-Revert-Fix-static-builds.patch
index b4b78c97fc..e800b782ad 100644
--- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
+++ b/package/libopenssl/0003-Revert-Fix-static-builds.patch
@@ -15,10 +15,10 @@ Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Configure b/Configure
-index 2a5e58805c3b..0e8c1ce5cc74 100755
+index ac3206e..764ef89 100755
 --- a/Configure
 +++ b/Configure
-@@ -1466,10 +1466,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
+@@ -1509,10 +1509,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
          unless file_name_is_absolute($config{prefix});
  }
  
@@ -29,7 +29,7 @@ index 2a5e58805c3b..0e8c1ce5cc74 100755
  # Allow overriding the build file name
  $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
  
-@@ -1764,6 +1760,10 @@ if ($strict_warnings)
+@@ -1807,6 +1803,10 @@ if ($strict_warnings)
                  }
          }
  
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 5924c5d46a..9f8b23005a 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.4.1/openssl-3.4.1.tar.gz.sha256
-sha256  002a2d6b30b58bf4bea46c43bdd96365aaf8daa6c428782aa4feee06da197df3  openssl-3.4.1.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.0/openssl-3.5.0.tar.gz.sha256
+sha256  344d0a79f1a9b08029b0744e2cc401a43f9c90acd1044d09a530b4885a8e9fc0  openssl-3.5.0.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index c1c5b818d7..5e785e1bf0 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.4.1
+LIBOPENSSL_VERSION = 3.5.0
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
