Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE446C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 08:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CF3D40A0C;
	Tue, 23 Jul 2024 08:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFGcAn74nLuI; Tue, 23 Jul 2024 08:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3D3240AAB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3D3240AAB;
	Tue, 23 Jul 2024 08:55:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F8D11BF29D
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FE0640A11
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZEPkluhCqKF for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 08:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F34340452
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F34340452
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:55:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22FCB87188; Tue, 23 Jul 2024 08:55:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 10:54:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eed618fc76e59bc99680d193f5d4cb94e44a693f
X-Git-Newrev: 618aaf07af50bdf302c88716a8ff15d3aec3f024
X-Patchwork-Hint: ignore
Message-Id: <20240723085505.22FCB87188@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: bump to version 3.1.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=618aaf07af50bdf302c88716a8ff15d3aec3f024
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Rebase second patch
- This bump will fix the following build failure with gcc >= 14 thanks to
  https://github.com/fluent/fluent-bit/commit/1f8a672dbd8121ff5fbbd955dfbdda7cf4357fd7:

  In file included from /home/autobuild/autobuild/instance-12/output-1/build/fluent-bit-3.0.4/src/tls/flb_tls.c:24:
  /home/autobuild/autobuild/instance-12/output-1/build/fluent-bit-3.0.4/src/tls/openssl.c: In function 'tls_context_server_alpn_select_callback':
  /home/autobuild/autobuild/instance-12/output-1/build/fluent-bit-3.0.4/src/tls/openssl.c:220:40: error: passing argument 1 of 'SSL_select_next_proto' from incompatible pointer type [-Wincompatible-pointer-types]
    220 |         result = SSL_select_next_proto(out,
        |                                        ^~~
        |                                        |
        |                                        const unsigned char **

https://fluentbit.io/announcements/v3.1.3/
https://fluentbit.io/announcements/v3.1.2/
https://fluentbit.io/announcements/v3.1.1/
https://fluentbit.io/announcements/v3.1.0/
https://fluentbit.io/announcements/v3.0.7/
https://fluentbit.io/announcements/v3.0.6/
https://fluentbit.io/announcements/v3.0.5/

Fixes:
 - http://autobuild.buildroot.org/results/8f9fcc0ec9c915a40fe402d7c643fa83f7f6a261

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-librdkafka-CMakeLists.txt-allow-compilation-with.patch | 14 ++++++++------
 package/fluent-bit/fluent-bit.hash                         |  2 +-
 package/fluent-bit/fluent-bit.mk                           |  2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch b/package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
index bcfe3ea859..fd3d9ce722 100644
--- a/package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
+++ b/package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
@@ -9,15 +9,17 @@ e.g. fluent-bit is a c-only library, so allow compilation without cxx
 Upstream: https://github.com/confluentinc/librdkafka/pull/4366
 Upstream: https://github.com/fluent/fluent-bit/pull/7765
 Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+[Fabrice: update for 3.1.3]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  lib/librdkafka-2.3.0/CMakeLists.txt          | 18 ++++++++++--
  lib/librdkafka-2.3.0/examples/CMakeLists.txt | 31 +++++++++++++-------
  2 files changed, 35 insertions(+), 14 deletions(-)
 
-diff --git a/lib/librdkafka-2.3.0/CMakeLists.txt b/lib/librdkafka-2.3.0/CMakeLists.txt
+diff --git a/lib/librdkafka-2.4.0/CMakeLists.txt b/lib/librdkafka-2.4.0/CMakeLists.txt
 index 7f3dd0fc6..c1ee93062 100644
---- a/lib/librdkafka-2.3.0/CMakeLists.txt
-+++ b/lib/librdkafka-2.3.0/CMakeLists.txt
+--- a/lib/librdkafka-2.4.0/CMakeLists.txt
++++ b/lib/librdkafka-2.4.0/CMakeLists.txt
 @@ -3,7 +3,12 @@ cmake_minimum_required(VERSION 3.2)
  include("packaging/cmake/parseversion.cmake")
  parseversion("src/rdkafka.h")
@@ -57,10 +59,10 @@ index 7f3dd0fc6..c1ee93062 100644
  
  if(RDKAFKA_BUILD_EXAMPLES)
    add_subdirectory(examples)
-diff --git a/lib/librdkafka-2.3.0/examples/CMakeLists.txt b/lib/librdkafka-2.3.0/examples/CMakeLists.txt
+diff --git a/lib/librdkafka-2.4.0/examples/CMakeLists.txt b/lib/librdkafka-2.4.0/examples/CMakeLists.txt
 index 8c0079abe..c9336b729 100644
---- a/lib/librdkafka-2.3.0/examples/CMakeLists.txt
-+++ b/lib/librdkafka-2.3.0/examples/CMakeLists.txt
+--- a/lib/librdkafka-2.4.0/examples/CMakeLists.txt
++++ b/lib/librdkafka-2.4.0/examples/CMakeLists.txt
 @@ -5,8 +5,10 @@ endif(WIN32)
  add_executable(producer producer.c ${win32_sources})
  target_link_libraries(producer PUBLIC rdkafka)
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index 6fcf4fac3e..a3dbf5f544 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b439f89e879e538849e9106fe450bcf58da5034dfc316af4d2a837423786ed11  fluent-bit-3.0.4.tar.gz
+sha256  4c745066223811047e3911c19db118eadec579ca62ef833a1b1fb573acd8cb85  fluent-bit-3.1.3.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 13bd4ddecb..5463682e45 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 3.0.4
+FLUENT_BIT_VERSION = 3.1.3
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
