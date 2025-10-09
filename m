Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CB3CCD187
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 09:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BBA261213;
	Thu,  9 Oct 2025 09:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ao9Xq0VHN6hz; Thu,  9 Oct 2025 09:55:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6A476124C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6A476124C;
	Thu,  9 Oct 2025 09:55:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F11521B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 213B240C50
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1g-RASE6bF9 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDDDB40F98
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDDDB40F98
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBD9986C36; Thu,  9 Oct 2025 09:55:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:30:31 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 3218502509bae9edd50d0d9a0a36f786f16d772a
X-Git-Newrev: 94ac670d5aafda4f7938022441fe17426b9f9be4
X-Patchwork-Hint: ignore
Message-Id: <20251009095539.DBD9986C36@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/libopenssl:
 security bump to version 3.5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=94ac670d5aafda4f7938022441fe17426b9f9be4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

fixes CVE-2025-9230, CVE-2025-9231, CVE-2025-9232
see https://github.com/openssl/openssl/releases/tag/openssl-3.5.4

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c983f967bdffdcf784174fd3ea7b08e39ac83d24)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch   | 2 +-
 package/libopenssl/0003-Revert-Fix-static-builds.patch                | 4 ++--
 .../0004-Serialize-install-process-to-avoid-multiple-make-dep.patch   | 2 +-
 package/libopenssl/libopenssl.hash                                    | 4 ++--
 package/libopenssl/libopenssl.mk                                      | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
index 2634d69f35..f74576beae 100644
--- a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
+++ b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
@@ -21,7 +21,7 @@ diff --git a/Configure b/Configure
 index 15054f9..ac3206e 100755
 --- a/Configure
 +++ b/Configure
-@@ -1685,6 +1685,10 @@ unless ($disabled{asm}) {
+@@ -1686,6 +1686,10 @@ unless ($disabled{asm}) {
      }
  }
  
diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0003-Revert-Fix-static-builds.patch
index e800b782ad..10ca97a240 100644
--- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
+++ b/package/libopenssl/0003-Revert-Fix-static-builds.patch
@@ -18,7 +18,7 @@ diff --git a/Configure b/Configure
 index ac3206e..764ef89 100755
 --- a/Configure
 +++ b/Configure
-@@ -1509,10 +1509,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
+@@ -1510,10 +1510,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
          unless file_name_is_absolute($config{prefix});
  }
  
@@ -29,7 +29,7 @@ index ac3206e..764ef89 100755
  # Allow overriding the build file name
  $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
  
-@@ -1807,6 +1803,10 @@ if ($strict_warnings)
+@@ -1808,6 +1804,10 @@ if ($strict_warnings)
                  }
          }
  
diff --git a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
index feb0e21ef7..344b8d07b7 100644
--- a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
+++ b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
@@ -26,7 +26,7 @@ diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tm
 index e85763ccf8..b671723813 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -650,7 +650,11 @@ depend: Makefile
+@@ -661,7 +661,11 @@ depend: Makefile
  # Install helper targets #############################################
  ##@ Installation
  
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index d0ca45d303..e78b664aa5 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.3/openssl-3.5.3.tar.gz.sha256
-sha256  c9489d2abcf943cdc8329a57092331c598a402938054dc3a22218aea8a8ec3bf  openssl-3.5.3.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.4/openssl-3.5.4.tar.gz.sha256
+sha256  967311f84955316969bdb1d8d4b983718ef42338639c621ec4c34fddef355e99  openssl-3.5.4.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index b892d4e236..2f844fd44a 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.3
+LIBOPENSSL_VERSION = 3.5.4
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
